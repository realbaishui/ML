data bmi;
input category$ upper_bmi lower_bmi wt;
lower_ht=(wt/lower_bmi)**.5;
upper_ht=(wt/upper_bmi)**.5;
cards;
ƫ�� 1 18.5 40
ƫ�� 1 18.5 60
ƫ�� 1 18.5 80
ƫ�� 1 18.5 100
���� 18.5 24.0 40
���� 18.5 24.0 60
���� 18.5 24.0 80
���� 18.5 24.0 100
ƫ�� 24.0 27.0 40
ƫ�� 24.0 27.0 60
ƫ�� 24.0 27.0 80
ƫ�� 24.0 27.0 100
���� 27.0 30.0 40
���� 27.0 30.0 60
���� 27.0 30.0 80
���� 27.0 30.0 100
�ضȷ��� 30.0 50.0 40
�ضȷ��� 30.0 50.0 60
�ضȷ��� 30.0 50.0 80
�ضȷ��� 30.0 50.0 100
;
proc sgplot data=bmi;
band x=wt upper=upper_ht lower=lower_ht /group=category;
xaxis values=(40 to 100 by 10) label="����(kg)"; /*ָ��x��Ŀ̶�ֵ�ͱ���*/
yaxis values=(1.5 to 2 by 0.1) label="���(m)"; /*ָ��y��Ŀ̶�ֵ�ͱ���*/
keylegend / position=right down=6; /*ָ��ͼ����ʾλ�ú�����*/
run;
