proc report nowd data=bmi headline;
column gender bd height weight;           /*ָ�������ʾ��4������*/
define gender/group width=10;             /*ָ��gender����ʾ��ʽΪgroup*/
define bd/group width=10 order=internal;    /*ָ��bd����ʾ��ʽΪgroup*/
define height/analysis mean format=6.2;     /*ָ��height��ʾ��ʽΪanalysis*/
define weight/ analysis mean format=6.2;    /*ָ��weight��ʾ��ʽΪanalysis*/
run;

