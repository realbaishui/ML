data lx;
input id lx$;
lx1=lx in ("有效","显效","痊愈");
if lx in ("有效","显效","痊愈") then lx2="有效";else lx2="无效";
cards;
1 显效
2 有效
3 无效
4 痊愈
;
proc print;
run;
