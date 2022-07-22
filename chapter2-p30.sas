data wt;
input num cost prop;
format num 5.2 cost comma12.1 prop percent8.2;
cards;
50 10205600 0.1236
45 9580000 0.0361
;
proc print;
run;
