proc sort data=ab1;
by id; /*��id������ab1������������*/
proc sort data=ab2;
by id;
run;
data ab;
merge ab1 ab2;
by id;
proc print;
run;
