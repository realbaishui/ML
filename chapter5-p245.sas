proc tabulate;
class gender age bd;                    /*指定分类变量*/
var height weight bmi fbg;              /*指定分析变量*/
table (height weight bmi fbg)*(n mean std) (age bd)*(n colpctn),gender/nocellmerge misstext="--";
label height="身高" weight="体重" bmi="BMI" fbg="血糖" gender="性别" age="年龄" bd="体型";                
keylabel n="例数" mean="均数" std="标准差" colpctn="百分比(%)";     
run;
