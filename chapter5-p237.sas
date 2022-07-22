proc tabulate;
class gender age bd;                  
table gender=""*age="",bd="体型"*(n rowpctn)/ box="性别 年龄";
keylabel n="例数" rowpctn="比例";
run;
