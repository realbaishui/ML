data age30;
set newxb;
if age<30;
proc print;
run;
data age30;
set newxb;
where age<30;
proc print;
run;
data age30;
set newxb(where=(age<30));
proc print;
run;

