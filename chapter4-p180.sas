proc sgplot data=bjprice;
waterfall category=year response=dp/datalabel dataskin=pressed colorgroup=type;
keylegend /location=inside;    /*选项location设置图例显示在图内，默认左上角*/
yaxis label="price change";   /*选项label设置纵坐标标题为“price change”*/
run;
