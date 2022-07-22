proc sgplot data=sasuser.price;
band upper=price lower=0 x=year/legendlabel="房价"; /*指定第一个带状图*/
band upper=salary lower=0 x=year/legendlabel="工资"; /*指定第二个带状图*/
keylegend/ location=inside; /*指定图例显示在图内，默认位置左上*/
xaxis type=discrete label="年份"; /*指定x轴的标签和显示类型*/
yaxis label="房价和工资水平" values=(0 to 20000 by 2000);
/*指定y轴的标签，并指定刻度值范围是从0到20000，按每2000递增*/
where city="北京"; /*利用where语句只利用到北京数据*/
run;
