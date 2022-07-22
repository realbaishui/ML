proc report nowd data=bmi headline;
column gender bd fbg,(mean std median qrange); 
define gender/group width=6; 
define bd/group width=8 order=internal;
define fbg/analysis format=6.2;
break after gender/summarize ul suppress;    /*ul��ʾ��ʾ������*/
rbreak after/summarize dul;                /*dul��ʾ��ʾ˫����*/
run;
