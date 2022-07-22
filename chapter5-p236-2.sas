proc tabulate;
class gender age bd;                  
table gender*age,bd*(n  rowpctn);
label gender="性别" age="年龄" bd="体型";   /*指定变量名的标签*/
keylabel n="例数" rowpctn="比例";          /*指定关键词的标签*/
run;
