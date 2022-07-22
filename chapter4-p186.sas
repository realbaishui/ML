data fbg;
set sasuser.fbg;
height=height/100;        /*将身高单位转为m，以便跟bmi数据集中的一致*/
run;
data sample ;
merge bmi fbg;           /*将fbg和bmi横向合并，放到一个数据集中*/
run;
proc sgplot data=sample; 
band x=wt upper=upper_ht lower=lower_ht /group=category; 
scatter x=weight y=height/group=gender markerattrs=(symbol=circlefilled);
xaxis values=(40 to 100 by 10) label="体重(kg)";    /*指定x轴的刻度值和标题*/
yaxis values=(1.5 to 2 by 0.1) label="身高(m)";     /*指定y轴的刻度值和标题*/
keylegend /location=outside;
run; 
