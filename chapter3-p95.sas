data ab;
merge ab1(in=d1) ab2(in=d2); /*������ʶ�������ݼ�����ʱ����ab1��ab2*/
by id;                        /*��idΪ�������кϲ�*/
if d1=1 and d2=1;             /*����ab1��ab2��Ϊ1�ļ�¼*/
proc print;
run;
