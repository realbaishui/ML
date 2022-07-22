data patients;
input id gender age time yymmdd10. sbp;
format time yymmdd10.;
cards;
1 1 51 2010/01/12 150
1 1 51 2010/02/12 147
1 1 51 2010/03/14 142
2 2 59 2010/01/09 163
2 2 59 2010/02/10 162
2 2 59 2010/03/17 160
2 2 59 2010/04/16 151
;
proc sort;      
by id time;                   /*��id��time�������� */
run;
data patients;
set patients;
by id;
retain firstsbp;               /*����retain�����firstsbp�����ϸ��۲�ֵ */
if first.id then firstsbp=sbp;    /*��ÿ���˵ĵ�һ���۲⣬��sbpֵ����firstsbp */
difsbp=sbp-firstsbp;          /*����ÿ�β���ֵ���״β���ֵ�Ĳ�ֵ */
proc print;
run;
