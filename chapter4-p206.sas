data sim;
do i=1 to 5000;
height=rand("normal",170,10);  /*生成正态分布的变量，均值为170，标准差为10*/
weight=rand("normal",70,5);    /*生成正态分布的变量，均值为70，标准差为5*/
height=round(height,1);         /*将变量四舍五入为整数*/
weight=round(weight,1);
output;
end;
run;


