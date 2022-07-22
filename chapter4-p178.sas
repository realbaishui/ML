data bjprice;
set sasuser.price;
if city="����";
dp=dif(price);                        /*����dif��������ÿ��֮��Ĳ�ֵ*/
if dp=. then dp=price;                  /*��dp�ĵ�һ��ֵ����Ϊ��һ���ֵ*/
if dp<0 then type="��";
else type="��";                       /*��������type����ʾ�ǵ����*/
run;
proc sgplot data=bjprice;
vbar year/response=dp dataskin=sheen group=type datalabel;
keylegend/location=inside; 
xaxis label="���";
yaxis values=(-1000 to 6000 by 1000) label="�����Ƿ�";
run;

