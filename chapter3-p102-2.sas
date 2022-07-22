proc sort data=sasuser.xb nodupkey out=norep;
by name gender;
proc print data=norep;
run;
