proc tabulate;
class gender bd; 
var fbg; 
table (gender="" all="�ϼ�")*bd="",(fbg="Ѫ��")*(n mean median std qrange)
/printmiss misstext="NV";      /*��ʾȱʧ����𣬲���ȱʧֵ��ʾΪNV*/
keylabel n="����" mean="����" std="��׼��" median="��λ��" qrange="�ķ�λ�����";                          /*ָ��5��ͳ��������ʾ��*/
run; 

