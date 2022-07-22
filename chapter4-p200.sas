proc means data=bmi nway;
class gender bd;
var bmi;
output out=bmi1 n=count;
proc print data=bmi1;
run;


