proc tabulate;
class gender age bd;                  
table gender="性别"*age="年龄",bd="体型"*(n="例数" rowpctn="比例");
run;
