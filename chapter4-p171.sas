proc sgplot data=sasuser.pop;
vline age/response=pop_m legendlabel="����������"; /*���Ƶ�һ����ͼ*/
vline age/response=mor_m legendlabel="���Է�����" ; /*���Ƶڶ�����ͼ*/
keylegend /location=inside down=2; /*ָ��ͼ����ʾ��ͼ�ڣ���������ʾ*/
run;
