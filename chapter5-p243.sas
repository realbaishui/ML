proc tabulate;
class gender;
var height weight bmi fbg; 
table (height weight bmi fbg)*gender="",(n mean median std qrange);
label height="身高" weight="体重" bmi="BMI" fbg="血糖" gender="性别";
keylabel n="例数" mean="均数" std="标准差" median="中位数" qrange="四分位数间距";                          
run; 
