proc sort data=ab1;
by id; /*按id变量对ab1进行升序排序*/
proc sort data=ab2;
by id;
run;
data ab;
merge ab1 ab2;
by id;
proc print;
run;
