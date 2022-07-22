data fsh;
input id age;
cards;
1 23 2 29 3 49 4 36
;
proc print;
run;
data fsh;
input id age@@;
cards;
1 23 2 29 3 49 4 36
;
proc print;
run;
