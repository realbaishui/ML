data ques;
input id (y1-y10) ($);      /*�������y1-y10����Ϊ�ַ��ͣ�ͳһ����$���� */
y=cats(of y1-y10);        /*��y1-y10�ϲ�Ϊһ������y */
cy=count(y,"y","i");      /*ͳ�Ʊ���y�еġ�y���ĸ��������Դ�Сд */
cn=count(y,"n","i");      /*ͳ�Ʊ���y�еġ�n���ĸ��������Դ�Сд */
cards;
1 y y n Y n y n Y n n
2 y n y Y n y y Y n y
3 n y N y y y n Y y n
4 n n Y y y y N Y n y
;
proc print;
run;
