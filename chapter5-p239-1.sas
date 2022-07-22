proc tabulate;
class gender age bd;                  
table (gender="" all)*age="",(bd="体型" all)*(n rowpctn)/ box="性别 年龄"
misstext="ND";
keylabel n="例数" rowpctn="比例";
run;
