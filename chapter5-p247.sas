proc tabulate formchar=" ----------" noseps;
class gender bd;       
var fbg;              
table fbg*(n mean std) bd*(n colpctn),gender/ misstext="--";
label fbg="血糖" gender="性别" bd="体型";                
keylabel n="例数" mean="均数" std="标准差" colpctn="百分比(%)";     
run;
