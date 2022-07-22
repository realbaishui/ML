data iden;
input iden: $18.;                     
if length(iden)=18 then gen=substrn(iden,17,1);
else gen=substrn(iden,15,1);          
if mod(gen,2)=1 then gender="ÄĞ";
else gender="Å®";
cards;
36053319720613591x
360533801215792
360533198208254533
360533851009226
;
proc print;
run;
