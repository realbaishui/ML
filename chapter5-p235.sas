proc tabulate;
class gender age bd; /*指定三个变量均为分类变量*/
table gender*age,bd*(n rowpctn); /*指定三个变量和关键词的布局*/
run;
