data fsh;
input amount;
retain year 2000             /*��year����ʼֵΪ2000*/
year+1;                    /*���ۼ����ָ��year����*/
total+amount;              /*���ۼ����ָ��total����*/
cards;
100
200
300
;
proc print;
run;
