proc tabulate;
class gender age bd;                    /*ָ���������*/
var height weight bmi fbg;              /*ָ����������*/
table (height weight bmi fbg)*(n mean std) (age bd)*(n colpctn),gender/nocellmerge misstext="--";
label height="���" weight="����" bmi="BMI" fbg="Ѫ��" gender="�Ա�" age="����" bd="����";                
keylabel n="����" mean="����" std="��׼��" colpctn="�ٷֱ�(%)";     
run;
