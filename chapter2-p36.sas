proc format;
invalue fage low-<40=30 40-<50=40 50-<60=50 60-high=60;
data age;
input id age fage.; /*�ڱ���age������Զ���������ʽfage�������˼ӵ��*/
cards;
1 36
2 43
3 51
4 60
5 59
;
proc print ;
run;
