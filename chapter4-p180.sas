proc sgplot data=bjprice;
waterfall category=year response=dp/datalabel dataskin=pressed colorgroup=type;
keylegend /location=inside;    /*ѡ��location����ͼ����ʾ��ͼ�ڣ�Ĭ�����Ͻ�*/
yaxis label="price change";   /*ѡ��label�������������Ϊ��price change��*/
run;
