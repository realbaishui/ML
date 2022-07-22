proc format;
picture pct low-high="000.00%";   /*指定pct为带%、两位小数点的显示样式*/
run;
proc tabulate;
class gender age bd;                  
table (gender="" all)*age="",(bd="体型" all)*(n*f=5.1 rowpctn*f=pct)/ box="性别 年龄" misstext="ND";
keylabel n="例数" rowpctn="比例";
run;
