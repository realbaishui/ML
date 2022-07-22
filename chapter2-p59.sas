data book;
input book:& $100.;
sas=find(book,"sas","i");      /*在变量book中查找完整的sas，忽略大小写*/
if sas>0 then class="SAS书";   
else class="其它";
cards;
Survival Analysis Using SAS
Matlab程序设计
SPSS数据分析
SAS应用分析
The Little SAS Book
;
proc print;
run;
