legend1 label=("利润(万)");        /*将图例显示为“利润(万)”而不是变量名*/
proc gmap map=maps.china data=profit density=2;
/* density设置边界紧密程度为2，即较为分散*/
id id;                 
prism profit/legend=legend1 midpoints=150 250 350 range; 
where id in (1,2,3,4,7,23,25);       /*利用where语句选择六省一市的id号*/
run;

