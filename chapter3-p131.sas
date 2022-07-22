data xbfemale;
set newxb;
keep id y1-y5;
if gender=2; 
proc print;
run;
data xbfemale(keep= id y1-y5); 
set newxb;
if gender=2;         
proc print;
run;
data xbfemale;    
set newxb(keep= id y1-y5);
if gender=2;         
proc print;
run;



