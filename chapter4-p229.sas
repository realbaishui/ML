legend1 label=("人均GDP(元)");
proc gmap map=sdcity data=sdpgdp;     
id name;                   /*指定id变量为name */
area pgdp /legend=legend1;   /*指定平面图按GDP的不同水平显示不同颜色*/
block pgdp /legend=legend1;  /*指定不同地区GDP值显示不同柱子高度和颜色*/
run;
