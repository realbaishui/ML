proc sgplot data=sasuser.price;
vbar year/response=price dataskin=gloss legendlabel="房价" barwidth=0.6
fillattrs=(color=green transparency=0.5);
vbar year/response=salary dataskin=gloss legendlabel="工资" barwidth=0.6
fillattrs=(color=red transparency=0.5) discreteoffset=0.2;
xaxis label="年份";
yaxis values=(0 to 20000 by 2000) label="房价与工资";
keylegend/ location=inside;
where city="北京";
run;
