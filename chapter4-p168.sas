proc sgplot data=sasuser.fbg;
histogram fbg; /*ָ�����ڻ���ֱ��ͼ�ı���*/
density fbg; /*ָ�����ڻ��Ʒֲ�ͼ�ı���*/
inset "��̬�Լ���" "P=0.16"/textattrs=(size=12) position=topright;
xaxis valueattrs=(size=12) labelattrs=(size=12); /*�趨x��̶Ⱥͱ�ǩ�����С*/
yaxis valueattrs=(size=12) labelattrs=(size=12); /*�趨y��̶Ⱥͱ�ǩ�����С*/
run;
