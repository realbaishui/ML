proc format;
invalue $grade 1="Freshman" 2="Sophomore" 3="Junior" 4="Senior";
value fscore low-<60="不及格" 60-<80="及格" 80-high="优秀";
data grade;
input id grade: $grade20. score; /*在变量grade后加上自定义的输入格式grade */
format score fscore.;
cards;
1 1 60
2 4 59
3 3 80
4 2 79
;
proc print ;
run;
