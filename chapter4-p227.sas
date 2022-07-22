legend1 down=10 label=("GDP(万元)") position=(middle right outside);
proc gmap map=chinacity data=gdp;
id name;               /*指定id变量为name，这是地图文件中的id变量*/
choro gdp/legend=legend1 levels=10;          /*将图例的分10个类别显示*/  
run;
