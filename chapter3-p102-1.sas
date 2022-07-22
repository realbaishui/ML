proc sort data=sasuser.xb nouniquekey out=rep;
by name gender;
proc print data=rep;
run;
