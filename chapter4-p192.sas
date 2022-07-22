proc sgplot noborder data=forest;       /*noborder��ʾ����ʾͼ�α߿�*/
scatter y=study1 x=or /markerattrs=(size=12 symbol=diamondfilled color=black);  
/*��һ���ǻ���overall�ĵ㣬��ʾΪ��ɫ���Σ���СΪ12*/
highlow y=study2 high=x2 low=x1/lineattrs=(thickness=10 color=black);
/*��һ���ǻ���10���о��ĵ㣬��ʾΪ��ͬ�Ŀ�ȣ���Ⱦ�Ϊ10����ɫΪ��ɫ*/
highlow y=study high=ucl low=lcl/lineattrs=(thickness=2 color=black);
/*��һ���ǻ���10���о���overall�����������߶ο�ȣ���ɫΪ��ɫ*/
refline 1 / axis=x;       
/*��һ������x=1��λ�û���һ����ֱ�Ĳο���*/
scatter y=study x=ciname / markerchar=ci x2axis markercharattrs=(size=12);  
/*��һ������ͼ����ʾ����ci��ֵ�����ڶ���x�����������ʾ*/
xaxis type=log min=0.01 max=10 minor offsetmax=0.3 offsetmin=0 display=(nolabel) valueattrs=(size=12);    
/*��һ��������x�ᣬ��������Ϊlog�߶ȣ���ΪORֵ��ָ������ģ�offsetmaxѡ��������ǰ�x���Ҳ�ճ�30%��λ�ã�������ʾ����ci*/
x2axis offsetmin=0.85 display=none;    
/*��һ�������õڶ���x�ᣬ��߿ճ�85%��λ�ã�������ʾɭ��ͼ*/
yaxis display=(noticks nolabel) discreteorder=data valueattrs=(size=12) reverse;  
/*��һ��������y�ᣬ����ʾ������Ŀ̶Ⱥͱ�ǩ*/
run;


