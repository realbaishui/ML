proc mapimport datafile="G:\map\dishi.shp" out=chinacity;
rename "经度"=long "纬度"=lat;      /*将地图文件中的中文名改为英文*/
run;
proc import datafile="G:\map\gdp.xlsx" out=gdp;
range="gdp$";      /*指定Excel中含gdp数据的sheet名，注意后面加个$*/
run;
