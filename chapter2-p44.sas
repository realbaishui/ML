data fh;
count=0;
count=count+1;
input count time;
cards;
23
29
49
;
proc print;
run;
data fh;
retain count 0;
count=count+1;
input time;
cards;
23
29
49
;
proc print;
run;
data fh;
count+1;
input time;
cards;
23
29
49
;
proc print;
run;
