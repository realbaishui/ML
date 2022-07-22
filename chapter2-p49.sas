data eva;
length bonus $5.;
input id g bonus$;
if g<70 then eva="合格";else eva="不合格";
eva=bonus;
cards;
1 67 100000
2 80 110000
3 89 110000
;
proc print;
run;
