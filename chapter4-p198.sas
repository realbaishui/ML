data bmi;
set sasuser.fbg;
bmi=weight/(height/100)**2;       /*根据weight和height产生新变量bmi*/
length bd $8.;                    /*指定新变量bd的长度为8*/
if bmi<18.5 then bd="偏瘦";
else if bmi<24 then bd="正常";
else if bmi<27 then bd="偏胖";
else if bmi<30 then bd="肥胖";
else bd="重度肥胖";              /*根据bmi值产生分类变量bd*/
run;
proc template;            /*调用模板制图过程*/
define statgraph pie;       /*指定建立的模板名字为bar*/
begingraph;              /*固定语句，表示开始绘图*/
layout region;             /*layout指定显示方式为region*/
piechart category=bd/group=gender start=90 dataskin=crisp stat=pct;
endlayout;              /*固定语句，结束layout，与前面的layout对应*/
endgraph;              /*固定语句，结束graph，与前面的begingraph对应*/
end;                   /*固定语句，结束绘图*/
run;
proc sgrender data=bmi template=pie; 
run;


