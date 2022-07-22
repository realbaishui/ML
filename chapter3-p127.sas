data aa;
input id x@@;
cards;
1 10 2 20 3 30
;
data bb;
set aa;
rename x=x1;
y=x+5;
run;

data aa;
input id x@@;
cards;
1 10 2 20 3 30
;
data bb(rename=(x=x1));
set aa;
y=x+5;
run;

data aa;
input id x@@;
cards;
1 10 2 20 3 30
;
data bb;
set aa(rename=(x=x1));
y=x+5;
run;
