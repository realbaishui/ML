data bjprice;
set sasuser.price;
if city="北京";
dp=dif(price);                        /*利用dif函数产生每年之间的差值*/
if dp=. then dp=price;                  /*将dp的第一个值设置为第一年的值*/
if dp<0 then type="跌";
else type="涨";                       /*产生变量type，表示涨跌情况*/
run;
proc sgplot data=bjprice;
vbar year/response=dp dataskin=sheen group=type datalabel;
keylegend/location=inside; 
xaxis label="年份";
yaxis values=(-1000 to 6000 by 1000) label="房价涨幅";
run;

