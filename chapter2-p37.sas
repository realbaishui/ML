proc format;
invalue $grade 1="Freshman" 2="Sophomore" 3="Junior" 4="Senior";
value fscore low-<60="������" 60-<80="����" 80-high="����";
data grade;
input id grade: $grade20. score; /*�ڱ���grade������Զ���������ʽgrade */
format score fscore.;
cards;
1 1 60
2 4 59
3 3 80
4 2 79
;
proc print ;
run;
