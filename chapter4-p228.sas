proc mapimport datafile="G:\map\dishi.shp" out=chinacity;
rename "经度"=long "纬度"=lat;    /*将地图文件中的中文名改为英文*/
run;
data sdcity;                       /*新建数据集，仅保留山东的数据*/
set chinacity;
if substrn(zonecode,1,2)="37";       
/*利用函数筛选出zonecode变量前两位代码是37（山东的代码）的数据*/
run;
proc sort data=sdcity;               /*将sdcity按name排序*/
by name;
run;
data sdpgdp;        /*建立数据集sdpgdp，包含地市名和各市人均GDP数据*/
input name$ pgdp@@;
cards;
济南市	69899.93	 潍坊市	43826.31	 临沂市	27871.78
青岛市	83786.88	 济宁市	39463.12	 德州市	40058.91
淄博市	74525.99	 泰安市	46357.98	 聊城市	37058.5
枣庄市	46901.03	 威海市	83352.11	 滨州市	53027.34
东营市	147430.9	 日照市	48287.1	 菏泽市	21566.16
烟台市	75792.6	 莱芜市	48517.52		
;
proc sort data=sdpgdp;              /*将sdpgdp按name排序*/
by name;
run;
