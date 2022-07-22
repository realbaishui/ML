proc sgplot data=sasuser.price;
vbar year/response=price dataskin=gloss legendlabel="����" barwidth=0.6
fillattrs=(color=green transparency=0.5);
vbar year/response=salary dataskin=gloss legendlabel="����" barwidth=0.6
fillattrs=(color=red transparency=0.5) discreteoffset=0.2;
xaxis label="���";
yaxis values=(0 to 20000 by 2000) label="�����빤��";
keylegend/ location=inside;
where city="����";
run;
