proc tabulate;
class gender bd; 
var fbg; 
table (gender="" all="合计")*bd="",(fbg="血糖")*(n mean median std qrange);
keylabel n="例数" mean="均数" std="标准差" median="中位数" qrange="四分位数间距";                       /*指定5个统计量的显示名*/
run;

