data ab2;
set sasuser.a2(in=a) sasuser.b2(in=b);
a2=a; /*把临时变量a的值赋值给变量a2*/
b2=b; /*把临时变量b的值赋值给变量b2*/
proc print;
run;
