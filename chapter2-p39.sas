proc format;
picture pft low-high="0,000,000"(prefix="гд");
picture pro low-high="09.99%";
run;
data profit;
input profit prop;
format profit pft. prop pro.;
cards;
298630 16.72
365800 21.30
;
proc print ;
run;
