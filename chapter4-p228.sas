proc mapimport datafile="G:\map\dishi.shp" out=chinacity;
rename "����"=long "γ��"=lat;    /*����ͼ�ļ��е���������ΪӢ��*/
run;
data sdcity;                       /*�½����ݼ���������ɽ��������*/
set chinacity;
if substrn(zonecode,1,2)="37";       
/*���ú���ɸѡ��zonecode����ǰ��λ������37��ɽ���Ĵ��룩������*/
run;
proc sort data=sdcity;               /*��sdcity��name����*/
by name;
run;
data sdpgdp;        /*�������ݼ�sdpgdp�������������͸����˾�GDP����*/
input name$ pgdp@@;
cards;
������	69899.93	 Ϋ����	43826.31	 ������	27871.78
�ൺ��	83786.88	 ������	39463.12	 ������	40058.91
�Ͳ���	74525.99	 ̩����	46357.98	 �ĳ���	37058.5
��ׯ��	46901.03	 ������	83352.11	 ������	53027.34
��Ӫ��	147430.9	 ������	48287.1	 ������	21566.16
��̨��	75792.6	 ������	48517.52		
;
proc sort data=sdpgdp;              /*��sdpgdp��name����*/
by name;
run;
