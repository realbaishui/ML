proc sgplot data=sasuser.price;
vbar year/response=price dataskin=matte legendlabel="����";
vbar year/response=salary dataskin=matte legendlabel="����" barwidth=0.5;
xaxis label="���";
yaxis values=(0 to 20000 by 2000) label="�����빤��";
keylegend/ location=inside;
where city="����";
run;
