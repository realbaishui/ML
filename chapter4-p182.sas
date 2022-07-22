proc sgplot data=sasuser.price;
bubble x=year y=price size=salary/ group=city dataskin=gloss;
keylegend / location=inside;
xaxis type=discrete;
run;

