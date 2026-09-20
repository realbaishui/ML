# =============================================================================
# 1. MARGINAL SCREENING  -- test conditions ON TOP of an existing rule base
#
# =============================================================================

SENTINELS = SENTINELS


def base_stats(base: pd.DataFrame, idx: "AcctIndex | None" = None) -> dict:
    idx = idx or AcctIndex(base)
    n, m = idx.n_accounts, idx.total_tests
    return {"accounts": n, "tests": m,
            "fraud_rate": round(m / n * 100, 2) if n else 0.0,
            "fp_ratio": round((n - m) / m, 2) if m else np.nan}


def _threshold_grid(s: pd.Series, n=11) -> list:
    """Quantile grid with sentinels removed, so fills don't create fake cutpoints."""
    v = s.replace(list(SENTINELS), np.nan).dropna()
    if v.nunique() < 3:
        return sorted(v.unique().tolist())
    q = v.quantile(np.linspace(0.05, 0.95, n))
    return sorted(pd.unique(np.round(q.values, 6)))


def screen_marginal(base: pd.DataFrame, candidates: list[str],
                    min_accounts=MIN_ALERTED_ACCOUNTS, min_capture=70.0,
                    min_exchange=3.0) -> pd.DataFrame:
    """
    Every (variable, threshold, direction) as ONE extra condition on `base`.

    exchange_rate is the headline: good accounts removed per test given up.
    30:1 is a strong tightening condition; 3:1 is usually not worth the rule line.
    """
    idx = AcctIndex(base)
    b = base_stats(base, idx)
    rows = []

    for var in candidates:
        if var not in base.columns or base[var].nunique() < 2:
            continue
        col = base[var].values
        for thr in _threshold_grid(base[var]):
            for op in ("<=", ">="):
                mask = col <= thr if op == "<=" else col >= thr
                if not mask.any():
                    continue
                a, m = idx.counts(mask)
                if a == 0 or m == 0:
                    continue
                if a == b["accounts"]:
                    continue                      # no-op: selects the whole base
                tests_lost = b["tests"] - m
                goods_removed = (b["accounts"] - a) - tests_lost
                rows.append({
                    "variable": var,
                    "direction": op,
                    "threshold": round(float(thr), 4),
                    "accounts": a,
                    "tests": m,
                    "tests_lost": tests_lost,
                    "goods_removed": goods_removed,
                    "exchange_rate": (round(goods_removed / tests_lost, 1)
                                      if tests_lost > 0 else np.inf),
                    "capture_%": round(m / b["tests"] * 100, 2),
                    "fraud_rate_%": round(m / a * 100, 2),
                    "lift": round((m / a) / (b["tests"] / b["accounts"]), 2),
                    "fp_ratio": round((a - m) / m, 2),
                    "fp_reduction": round(b["fp_ratio"] - (a - m) / m, 2),
                })

    out = pd.DataFrame(rows)
    if out.empty:
        return out
    out = out[(out["accounts"] >= min_accounts) &
              (out["capture_%"] >= min_capture) &
              (out["exchange_rate"] >= min_exchange)]
    # Conditions that lose zero tests all score exchange_rate = inf, so they tie.
    # Break the tie on how many good accounts they actually remove -- otherwise a
    # condition that drops 5 goods outranks one that drops 37 for the same price.
    return out.sort_values(["exchange_rate", "goods_removed"],
                           ascending=[False, False]).reset_index(drop=True)


def screen_binary(df: pd.DataFrame, min_accounts=MIN_ALERTED_ACCOUNTS,
                  exclude=None) -> pd.DataFrame:
    """
    Every 0/1 column, BOTH values, ranked on lift rather than capture.

    """
    exclude = set(exclude or []) | {TARGET}
    binary = [c for c in df.columns
              if c not in exclude and set(df[c].dropna().unique()) <= {0, 1}]
    idx = AcctIndex(df)
    b = base_stats(df, idx)
    rows = []

    for var in binary:
        col = df[var].values
        for val in (1, 0):
            inm = col == val
            if not inm.any() or inm.all():
                continue
            a, m = idx.counts(inm)
            ao, mo = idx.counts(~inm)
            if a < min_accounts or m == 0:
                continue
            rate_in, rate_out = m / a, (mo / ao if ao else np.nan)
            rows.append({
                "variable": var,
                "value": val,
                "accounts": a,
                "tests": m,
                "capture_%": round(m / b["tests"] * 100, 2),
                "fraud_rate_%": round(rate_in * 100, 2),
                "rate_outside_%": round(rate_out * 100, 2),
                "lift": round(rate_in / rate_out, 2) if rate_out else np.nan,
                "lift_vs_base": round(rate_in / (b["tests"] / b["accounts"]), 2),
                "fp_ratio": round((a - m) / m, 2),
            })

    out = pd.DataFrame(rows)
    return (out.sort_values("lift", ascending=False).reset_index(drop=True)
            if not out.empty else out)


def greedy_tighten(base: pd.DataFrame, candidates: list[str], max_conditions=4,
                   min_capture=85.0, min_exchange=8.0, verbose=True):
    """
    Add one condition at a time, RE-SCREENING the survivors each round.

    This is what single-pass screening cannot do. If variables all remove the same accounts, the second and third will show
    a poor exchange rate once the first is applied, and the loop will skip them.

    min_capture is measured against the ORIGINAL base, so the floor holds across
    the whole chain rather than being re-based each round.
    """
    b0 = base_stats(base)
    cur = base.copy()
    chosen = []

    for step in range(1, max_conditions + 1):
        s = screen_marginal(cur, candidates, min_capture=0, min_exchange=min_exchange)
        if s.empty:
            break
        # capture floor against the ORIGINAL base
        s["capture_vs_orig_%"] = (s["tests"] / b0["tests"] * 100).round(2)
        s = s[s["capture_vs_orig_%"] >= min_capture]
        if s.empty:
            break

        pick = s.iloc[0]
        cond = (pick["variable"], pick["direction"], pick["threshold"])
        chosen.append(cond)
        cur = cur[cur[pick["variable"]] <= pick["threshold"]] if pick["direction"] == "<=" \
            else cur[cur[pick["variable"]] >= pick["threshold"]]

        if verbose:
            st = base_stats(cur)
            print(f"[step {step}] + {cond[0]} {cond[1]} {cond[2]}  "
                  f"exchange={pick['exchange_rate']}:1  "
                  f"accts {b0['accounts']}->{st['accounts']}  "
                  f"tests {b0['tests']}->{st['tests']}  "
                  f"fraud {b0['fraud_rate']}%->{st['fraud_rate']}%  "
                  f"FP {b0['fp_ratio']}->{st['fp_ratio']}")

        candidates = [c for c in candidates if c != pick["variable"]]

    return chosen, cur


def condition_overlap(base: pd.DataFrame, conds: list[tuple]) -> pd.DataFrame:
    """
    Jaccard overlap of the ACC SETS each condition removes. Anything above
    ~0.6 is the same condition wearing a different name -- keep one.
    """
    idx = AcctIndex(base)
    sets = {}
    for var, op, thr in conds:
        col = base[var].values
        keep = col <= thr if op == "<=" else col >= thr
        kept = np.zeros(idx.n_accounts, dtype=bool)
        kept[idx.codes[keep]] = True
        sets[f"{var} {op} {thr}"] = set(np.flatnonzero(~kept))

    keys = list(sets)
    mat = pd.DataFrame(index=keys, columns=keys, dtype=float)
    for i in keys:
        for j in keys:
            u = len(sets[i] | sets[j])
            mat.loc[i, j] = round(len(sets[i] & sets[j]) / u, 2) if u else 0.0
    return mat


def screen_train_holdout(train, test, candidates, **kw) -> pd.DataFrame:
    """
    Run the screen on train, then re-measure the SAME cutpoints on the holdout.

    With ~126 tests, picking the best of a few hundred variable x threshold
    combinations will find noise. Rows where the holdout exchange rate collapses
    are the ones that were noise.
    """
    tr = screen_marginal(train, candidates, **kw)
    if tr.empty:
        return tr
    ix = AcctIndex(test)
    bt = base_stats(test, ix)
    rec = []
    for _, r in tr.iterrows():
        col = test[r["variable"]].values
        m_ = (col <= r["threshold"]) if r["direction"] == "<=" else (col >= r["threshold"])
        a, m = ix.counts(m_)
        lost = bt["tests"] - m
        rec.append({
            "holdout_accounts": a,
            "holdout_capture_%": round(m / bt["tests"] * 100, 2) if bt["tests"] else np.nan,
            "holdout_exchange": (round(((bt["accounts"] - a) - lost) / lost, 1)
                                 if lost > 0 else np.inf),
            "holdout_fraud_rate_%": round(m / a * 100, 2) if a else np.nan,
        })
    return pd.concat([tr, pd.DataFrame(rec, index=tr.index)], axis=1)


# =============================================================================
# 7. MODELS  -- only as a variable-finder, with honest validation
# =============================================================================

def model_features(df: pd.DataFrame) -> list[str]:
    drop = set(MODEL_DROP + [TARGET])
    return [c for c in df.select_dtypes(include=["number"]).columns if c not in drop]


def fit_and_score(train, test, features, model=None, label=""):
    # `model or Default()` breaks here: sklearn ensembles define __len__, and an
    # unfitted one raises AttributeError on truthiness. Test for None explicitly.
    if model is None:
        model = RandomForestClassifier(
            n_estimators=200, min_samples_leaf=20,
            class_weight="balanced_subsample", random_state=SEED, n_jobs=-1,
        )
    model.fit(train[features], train[TARGET])
    p = model.predict_proba(test[features])[:, 1]
    yhat = (p >= 0.5).astype(int)

    print(f"\n=== {label or type(model).__name__} (group-split holdout) ===")
    print(f"ROC AUC : {roc_auc_score(test[TARGET], p):.3f}")
    print(f"PR  AUC : {average_precision_score(test[TARGET], p):.3f}  "
          f"(base rate {test[TARGET].mean():.3f})")
    print(confusion_matrix(test[TARGET], yhat))
    print(classification_report(test[TARGET], yhat, digits=3))
    return model, p


def perm_importance(model, test, features, n_repeats=5, top_k=30):
    """
    Replaces feature_importances_. Impurity importance inflates continuous,
    high-cardinality columns (balances, day-diffs) over binary flags regardless
    of real signal -- which is exactly the mistake to avoid when the output
    feeds a rule.

    Cost is (features x n_repeats) model evaluations, so with ~80 dummy columns
    this was the single slowest step in the pipeline. Impurity importance is a
    bad ranking but a fine *filter*, so it is used to drop the dead columns
    first and permutation is run properly on the survivors. Set top_k=None to
    permute everything.
    """
    feats = list(features)
    if top_k and len(feats) > top_k and hasattr(model, "feature_importances_"):
        imp = pd.Series(model.feature_importances_, index=feats)
        feats = imp.sort_values(ascending=False).head(top_k).index.tolist()

    r = permutation_importance(
        model, test[feats], test[TARGET],
        n_repeats=n_repeats, random_state=SEED, n_jobs=-1,
        scoring="average_precision",
    )
    return (pd.DataFrame({"feature": feats,
                          "importance": r.importances_mean,
                          "std": r.importances_std})
            .sort_values("importance", ascending=False)
            .reset_index(drop=True))


# =============================================================================
# 8. DRIVER
# =============================================================================

def run_all(d100: pd.DataFrame, min_detection=None, fast=True):
    """fast=True trims the permutation-importance budget; set False for a final run."""
    _t0 = time.perf_counter()
    df = prep_base(d100)
    df = add_velocity(df)          # before dummies, needs PAYEE_ID / TRAN_DT
    df = add_composite_ato(df)
    df = handle_missing(df)
    df = make_dummies(df)

    print(f"\n[shape] {df.shape}")
    pop = df.groupby(ACCT)[TARGET].max()
    print(f"[base ] {len(pop):,} accounts, {int(pop.sum()):,} tests "
          f"({pop.mean()*100:.2f}%), {len(df):,} transactions")

    train, test = group_split(df)
    # Swap in for the real answer once you have enough history:
    # train, test = oot_split(df)

    feats = model_features(train)
    rf, _ = fit_and_score(train, test, feats, label="RandomForest")
    gb, _ = fit_and_score(
        train, test, feats,
        GradientBoostingClassifier(random_state=SEED), "GradientBoosting")

    imp = perm_importance(rf, test, feats, n_repeats=3 if fast else 10,
                          top_k=30 if fast else None)
    print("\n=== permutation importance (top 25) ===")
    print(imp.head(25).to_string(index=False))

    shortlist = [f for f in imp.head(20)["feature"] if f in df.columns]
    print("\n=== IV ranking (shortlist) ===")
    print(rank_variables(train, shortlist).to_string(index=False))

    print("\n=== depth-3 tree, candidate cutpoints ===")
    candidate_tree(train, shortlist)

    print("\n=== rule grid (train) ===")
    grid_tr = grid_search_rules(train, min_detection=min_detection)
    print(grid_tr.head(20).to_string(index=False))

    print("\n=== same rules on holdout ===")
    grid_te = grid_search_rules(test, min_detection=min_detection)
    print(grid_te.head(20).to_string(index=False))

    print(f"\n[time ] total {time.perf_counter() - _t0:.1f}s")

    return {"df": df, "train": train, "test": test, "features": feats,
            "rf": rf, "gb": gb, "perm_importance": imp,
            "grid_train": grid_tr, "grid_test": grid_te}


def apply_base(df: pd.DataFrame, conds=None) -> pd.DataFrame:
    conds = conds or RULE2_BASE
    mask = pd.Series(True, index=df.index)
    for var, (op, val) in conds.items():
        if var not in df.columns:
            print(f"[base] missing {var}, condition skipped")
            continue
        s = df[var]
        mask &= {"<=": s <= val, ">=": s >= val, ">": s > val, "<": s < val}[op]
    return df[mask].copy()


def run_screening(df: pd.DataFrame, train=None, test=None):
    base = apply_base(df)
    b = base_stats(base)
    print(f"[base ] {b['accounts']} accounts, {b['tests']} tests, "
          f"{b['fraud_rate']}% fraud rate, FP ratio {b['fp_ratio']}")

    cands = [c for c in SCREEN_VARS if c in base.columns]

    print("\n=== continuous screen (ranked by exchange rate) ===")
    s = screen_marginal(base, cands)
    print(s.head(25).to_string(index=False) if not s.empty else "nothing cleared the floors")

    print("\n=== binary screen, same base (ranked by lift) ===")
    bs = screen_binary(base, exclude=[ACC, PAY])
    print(bs.head(25).to_string(index=False) if not bs.empty else "no binary columns")

    print("\n=== greedy tightening ===")
    chosen, tightened = greedy_tighten(base, cands)

    if chosen:
        print("\n=== overlap of chosen conditions ===")
        print(condition_overlap(base, chosen).to_string())

    if train is not None and test is not None:
        print("\n=== train screen re-measured on holdout ===")
        ho = screen_train_holdout(apply_base(train), apply_base(test), cands)
        cols = ["variable", "direction", "threshold", "exchange_rate",
                "holdout_exchange", "capture_%", "holdout_capture_%"]
        print(ho[cols].head(25).to_string(index=False) if not ho.empty else "empty")

    return {"base": base, "screen": s, "binary": bs,
            "chosen": chosen, "tightened": tightened}


if __name__ == "__main__":
    print(__doc__)
    print("Import run_all and pass your d100 from pd.read_sql.")
