data lx;
input id lx$;
if lx="无效" then lx2="无效";  
else lx2="有效+显效+痊愈";
cards;
1 显效
2 有效
3 无效
4 痊愈
;
proc print;
run;
data lx;
input id lx$;
length lx2 $16.;
if lx="无效" then lx2="无效";  
else lx2="有效+显效+痊愈";
cards;
1 显效
2 有效
3 无效
4 痊愈
;
proc print;
run;

