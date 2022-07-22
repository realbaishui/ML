data ab;
merge ab1 ab2;
by id; /*指定按id变量连接两个数据集*/
drop a2 b2; /*删除变量a2和b2*/
proc print;
run;
