data fs;
input x$ y$2.;
format x$2.;
x1=x+1;
y1=y+1;
cards;
1100 1100
;
proc print;
run;
