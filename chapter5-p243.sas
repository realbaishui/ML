proc tabulate;
class gender;
var height weight bmi fbg; 
table (height weight bmi fbg)*gender="",(n mean median std qrange);
label height="���" weight="����" bmi="BMI" fbg="Ѫ��" gender="�Ա�";
keylabel n="����" mean="����" std="��׼��" median="��λ��" qrange="�ķ�λ�����";                          
run; 
