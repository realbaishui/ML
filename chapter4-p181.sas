proc sgplot data=bjprice;
waterfall category=year response=dp/datalabel dataskin=pressed colorgroup=type;
keylegend /location=inside down=2 valueattrs=(size=10);
xaxis label="年份" labelattrs=(size=10) valueattrs=(size=10);      
yaxis label="房价变化" values=(0 to 20000 by 2000) labelattrs=(size=10) 
valueattrs=(size=10);     
run;

