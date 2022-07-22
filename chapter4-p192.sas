proc sgplot noborder data=forest;       /*noborder表示不显示图形边框*/
scatter y=study1 x=or /markerattrs=(size=12 symbol=diamondfilled color=black);  
/*这一句是绘制overall的点，显示为黑色菱形，大小为12*/
highlow y=study2 high=x2 low=x1/lineattrs=(thickness=10 color=black);
/*这一句是绘制10项研究的点，显示为不同的宽度，厚度均为10，颜色为黑色*/
highlow y=study high=ucl low=lcl/lineattrs=(thickness=2 color=black);
/*这一句是绘制10项研究和overall的置信区间线段宽度，颜色为黑色*/
refline 1 / axis=x;       
/*这一句是在x=1的位置绘制一条竖直的参考线*/
scatter y=study x=ciname / markerchar=ci x2axis markercharattrs=(size=12);  
/*这一句是在图中显示变量ci的值，按第二个x轴的设置来显示*/
xaxis type=log min=0.01 max=10 minor offsetmax=0.3 offsetmin=0 display=(nolabel) valueattrs=(size=12);    
/*这一句是设置x轴，将它设置为log尺度，因为OR值是指数计算的；offsetmax选项的作用是把x轴右侧空出30%的位置，用于显示变量ci*/
x2axis offsetmin=0.85 display=none;    
/*这一句是设置第二个x轴，左边空出85%的位置，用来显示森林图*/
yaxis display=(noticks nolabel) discreteorder=data valueattrs=(size=12) reverse;  
/*这一句是设置y轴，不显示坐标轴的刻度和标签*/
run;


