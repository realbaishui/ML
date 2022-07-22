proc sgplot data=sasuser.price;
bubble x=year y=price size=salary/ group=city dataskin=sheen;
series x=year y=price/ group=city;
keylegend / location=inside down=6;
xaxis type=discrete;
yaxis values=(0 to 20000 by 2000);
run;
