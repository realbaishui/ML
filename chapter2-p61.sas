data lx;
input id lx$;
lx1=tranwrd(lx,"显效","有效");      /*将lx变量中的显效替换为有效*/
lx1=tranwrd(lx1,"痊愈","有效");     /*将lx1变量中的痊愈替换为有效*/
cards;
1 显效
2 有效
3 无效
4 痊愈
;
proc print;
run;
