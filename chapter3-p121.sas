data xb9;
set xb_revised;
if id=9 then delete; /*����if��deleteɾ��id=9�Ĺ۲�*/
run;
proc mi data=xb9 out=nomissing round=1 1 1 minimum=150 1 1 maximum=200 5 5;
mcmc;
var height y2 y4;
run;
proc print data=nomissing;
run;
