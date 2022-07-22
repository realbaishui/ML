proc sgplot data=sasuser.pop;
vline age/response=pop_m legendlabel="男性总人数" lineattrs=(color=green pattern=2 thickness=10); /*绘制第一条线图*/
vline age/response=mor_m legendlabel="男性发病数" lineattrs=(color=orange pattern=34
thickness=10) y2axis; /*绘制第二条线图*/
xaxis discreteorder=data label="年龄段";
yaxis values=(0 to 65000 by 5000) label="男性总人数"; /*指定左边y轴刻度和标签*/
y2axis values=(0 to 200 by 20) label="男性发病数"; /*指定右边y轴刻度和标签*/
keylegend /location=inside down=2 position=top;
/*指定图例显示在图内，位置是正上方，分两行显示*/
run;
