data xb_revised;
set sasuser.xb;
if id=6 then y3=1;
if id=7 then y5=5;
if id=9 then weight=56;
if id=10 then height=162;
proc print;
run;
