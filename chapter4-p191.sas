data forest;
input study: $100. or lcl ucl weight;      /*输入表4.5中的变量*/
x1=or/(10**(weight*0.01/2));     
x2=or*(10**(weight*0.01/2));
/*x1和x2变量用于确定森林图中OR值的点大小，可以让不同大小的OR值显示为大小不同的点*/
ci=cats(or,"(",lcl,"-",ucl,")");       
/*新产生ci变量，用cats函数将OR和95%置信区间合并起来*/
ciname="95%CI";                   /*产生一个具有固定值的新变量ciname*/
if lowcase(study)="overall" then study1=study;
else study2=study;
/*利用if语句将overall和其它研究分开，因为其它是单独结果，overall是综合结果*/
datalines;
Modano(1967) 0.590 0.096 3.634 4
Modano2(1969) 0.429 0.070 2.620 8
Leighton(1972) 0.394 0.076 2.055 8
Borodan(1981) 0.464 0.201 1.074 14
Novak(1992) 0.490 0.088 2.737 8
Stawer(1998) 1.250 0.479 3.261 12
Adams(1999) 0.143 0.082 0.250 16
Soloway(2000) 0.718 0.237 2.179 12
Truark(2002) 0.129 0.027 0.605 10
Fayney(2005) 0.313 0.054 1.805 8
Overall 0.328 0.233 0.462 .
;
run;

