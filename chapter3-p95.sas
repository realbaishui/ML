data ab;
merge ab1(in=d1) ab2(in=d2); /*产生标识两个数据集的临时变量ab1和ab2*/
by id;                        /*以id为索引进行合并*/
if d1=1 and d2=1;             /*保留ab1和ab2都为1的记录*/
proc print;
run;
