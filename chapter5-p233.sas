proc format;
value bdfmt 0="偏瘦" 1="正常" 2="偏胖" 3="肥胖" 4="重度肥胖";
run;
data bmi;
set sasuser.fbg;
bmi=weight/(height/100)**2;       /*根据weight和height产生新变量bmi*/
if bmi<18.5 then bd=0;
else if bmi<24 then bd=1;
else if bmi<27 then bd=2;
else if bmi<30 then bd=3;
else bd=4;                       /*根据bmi值产生分类变量bd*/
format bd bdfmt.;                /*将变量bd与格式变量bdfmt关联起来*/
run;
