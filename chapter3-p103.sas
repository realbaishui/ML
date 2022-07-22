proc sort data=sasuser.xb nouniquekey out=rep;
by name gender age;
proc print data=rep;
run;
