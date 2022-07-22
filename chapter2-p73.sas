data dt;
input dt: ymddttm30.;           /*ָ��dtΪymddttmw.��ʽ */
date=datepart(dt);              /*��ȡdt�����ڲ��� */
time=timepart(dt);              /*��ȡdt��ʱ�䲿�� */
month=month(date);            /*��ȡdate���� */
hour=hour(time);               /*��ȡtime��Сʱ */
format dt datetime30.;           /*ָ��dt�������ʽΪdatetime30. */
format date yymmdd10.;         /*ָ��date�������ʽΪyymmdd10. */
format time time12.;            /*ָ��time�������ʽΪtime12. */
cards;
2009/6/26:11:20:00
2009/5/5:19:30:00
2009/9/12:13:20:00
;
proc print;
run; 
