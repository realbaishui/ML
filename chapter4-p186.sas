data fbg;
set sasuser.fbg;
height=height/100;        /*����ߵ�λתΪm���Ա��bmi���ݼ��е�һ��*/
run;
data sample ;
merge bmi fbg;           /*��fbg��bmi����ϲ����ŵ�һ�����ݼ���*/
run;
proc sgplot data=sample; 
band x=wt upper=upper_ht lower=lower_ht /group=category; 
scatter x=weight y=height/group=gender markerattrs=(symbol=circlefilled);
xaxis values=(40 to 100 by 10) label="����(kg)";    /*ָ��x��Ŀ̶�ֵ�ͱ���*/
yaxis values=(1.5 to 2 by 0.1) label="���(m)";     /*ָ��y��Ŀ̶�ֵ�ͱ���*/
keylegend /location=outside;
run; 
