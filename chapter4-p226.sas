proc mapimport datafile="G:\map\dishi.shp" out=chinacity;
rename "����"=long "γ��"=lat;      /*����ͼ�ļ��е���������ΪӢ��*/
run;
proc import datafile="G:\map\gdp.xlsx" out=gdp;
range="gdp$";      /*ָ��Excel�к�gdp���ݵ�sheet����ע�����Ӹ�$*/
run;
