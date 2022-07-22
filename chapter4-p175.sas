proc sgplot data=sasuser.price;
vbar year/response=price dataskin=sheen legendlabel="房价"; /*price的柱状图*/
vbar year/response=salary dataskin=sheen legendlabel="工资"; /*salary的柱状图*/
xaxis label="年份";
yaxis values=(0 to 20000 by 2000) label="房价与工资";
keylegend/ location=inside;
where city="北京";
run;
