data height;
set sasuser.xb;
where (height not between 150 and 200) and (height is not missing);
proc print;
run;

data name;
set sasuser.xb;
where name like "Z___";
proc print;
run;   

data name;
set sasuser.xb;
where name contains "Z";
proc print;
run;

data outliney5;
set sasuser.xb;
proc print;
where y5 not in(1,2,3,4,5,.);
run;

proc compare base=ab compare=cd; 
by id;
where gender=1;
run;
