proc tabulate;
class gender bd; 
var fbg; 
table (gender="" all="�ϼ�")*bd="",(fbg="Ѫ��")*(n mean median std qrange);
keylabel n="����" mean="����" std="��׼��" median="��λ��" qrange="�ķ�λ�����";                       /*ָ��5��ͳ��������ʾ��*/
run;

