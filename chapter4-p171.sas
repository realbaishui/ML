proc sgplot data=sasuser.pop;
vline age/response=pop_m legendlabel="男性总人数"; /*绘制第一条线图*/
vline age/response=mor_m legendlabel="男性发病数" ; /*绘制第二条线图*/
keylegend /location=inside down=2; /*指定图例显示在图内，分两行显示*/
run;
