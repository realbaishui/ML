proc sgplot data=sasuser.price;
vbar year/response=price dataskin=sheen legendlabel="����"; /*price����״ͼ*/
vbar year/response=salary dataskin=sheen legendlabel="����"; /*salary����״ͼ*/
xaxis label="���";
yaxis values=(0 to 20000 by 2000) label="�����빤��";
keylegend/ location=inside;
where city="����";
run;
