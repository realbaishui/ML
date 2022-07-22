proc format;                   /*自定义我们想要的输出格式gfmt*/
value gfmt 100-<200="100-199" 200-<300="200-299" 300-high=">=300";
run;
legend1 label=("利润(万)");      /*将图例显示为“利润(万)”而不是变量名*/
proc gmap map=maps.china data=profit density=2;
id id;                 
prism profit/legend=legend1 discrete;          
/*这里一定要加上discrete选项，将profit作为离散值显示 */
where id in (1,2,3,4,7,23,25);      /*利用where语句选择六省一市的id号*/
format profit gfmt.;             /*将profit与定义的gfmt格式关联起来*/
run;

