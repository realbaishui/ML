data telephone;
p=cdf('poisson',1,5);     /*计算均值为5的Poisson分布中，出现次数≤1的概率*/
proc print;
run;
