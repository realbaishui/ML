data aa;
input id@@;
if mod(id,2)=1 then group="A"; else group="B";
cards;
1 2 3 4 5 6 7 8 9 10
; 
proc print;
run;
