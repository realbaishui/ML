proc sgpanel data=sasuser.price;
panelby city/columns=1;
band upper=price lower=0 x=year/legendlabel="����"; /*ָ����һ����״ͼ*/
band upper=salary lower=0 x=year/legendlabel="����"; /*ָ���ڶ�����״ͼ*/
colaxis type=discrete label="���"; /*ָ��x��ı�ǩ����ʾ����*/
rowaxis label="���ۺ͹���ˮƽ" values=(0 to 20000 by 4000);
/*ָ��y��ı�ǩ����ָ���̶�ֵ��Χ�Ǵ�0��20000����ÿ4000����*/
run;
