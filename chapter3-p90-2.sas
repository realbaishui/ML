data ab2;
set sasuser.a2 sasuser.b2; /*纵向合并sasuser.a2和sasuser.b2*/
proc print;
run;
