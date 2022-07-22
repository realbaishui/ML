proc sgplot data=sasuser.fbg;
histogram fbg; /*指定用于绘制直方图的变量*/
density fbg; /*指定用于绘制分布图的变量*/
inset "正态性检验" "P=0.16"/textattrs=(size=12) position=topright;
xaxis valueattrs=(size=12) labelattrs=(size=12); /*设定x轴刻度和标签字体大小*/
yaxis valueattrs=(size=12) labelattrs=(size=12); /*设定y轴刻度和标签字体大小*/
run;
