proc sgplot data=sasuser.price;
vbar year/response=price dataskin=matte legendlabel="房价";
vbar year/response=salary dataskin=matte legendlabel="工资" barwidth=0.5;
xaxis label="年份";
yaxis values=(0 to 20000 by 2000) label="房价与工资";
keylegend/ location=inside;
where city="北京";
run;
