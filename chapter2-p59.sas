data book;
input book:& $100.;
sas=find(book,"sas","i");      /*�ڱ���book�в���������sas�����Դ�Сд*/
if sas>0 then class="SAS��";   
else class="����";
cards;
Survival Analysis Using SAS
Matlab�������
SPSS���ݷ���
SASӦ�÷���
The Little SAS Book
;
proc print;
run;
