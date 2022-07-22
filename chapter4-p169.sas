proc sgplot data=sasuser.price;
band upper=price lower=0 x=year/legendlabel="����"; /*ָ����һ����״ͼ*/
band upper=salary lower=0 x=year/legendlabel="����"; /*ָ���ڶ�����״ͼ*/
keylegend/ location=inside; /*ָ��ͼ����ʾ��ͼ�ڣ�Ĭ��λ������*/
xaxis type=discrete label="���"; /*ָ��x��ı�ǩ����ʾ����*/
yaxis label="���ۺ͹���ˮƽ" values=(0 to 20000 by 2000);
/*ָ��y��ı�ǩ����ָ���̶�ֵ��Χ�Ǵ�0��20000����ÿ2000����*/
where city="����"; /*����where���ֻ���õ���������*/
run;
