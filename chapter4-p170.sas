proc sgpanel data=sasuser.price;
panelby city/columns=1;
band upper=price lower=0 x=year/legendlabel="房价"; /*指定第一个带状图*/
band upper=salary lower=0 x=year/legendlabel="工资"; /*指定第二个带状图*/
colaxis type=discrete label="年份"; /*指定x轴的标签和显示类型*/
rowaxis label="房价和工资水平" values=(0 to 20000 by 4000);
/*指定y轴的标签，并指定刻度值范围是从0到20000，按每4000递增*/
run;
