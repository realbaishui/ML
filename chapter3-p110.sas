proc sort data=missing out=missing2 nodupkey;
by id;
proc print;
run;
