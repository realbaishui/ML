data sasuser.xb;
set ab;
if id=4 then time="16Jun2012"d;
proc print;
run;
