data a1;
input wt ht;
bmi=wt/(ht/100)**2;
obesity=(bmi>=28);
city="±±¾©";
date="02apr2013"d;
format date yymmdd10.;
cards;
60 170
55 166
73 161
;
proc print;
run;
