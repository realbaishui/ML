data aa;
input age@@;
gage=round(age-5,10);
cards;
29 31 39 40 55 60 64
; 
proc print;
run;
