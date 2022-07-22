data telephone;
p=cdf('normal',30,60,10);   /*均值为60、标准差为10的正态分布中，≤30的概率*/
proc print;
run;
