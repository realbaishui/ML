data dm;
input year profit;
plag=lag(profit);            /*����profit������ǰһ����¼ */
pdif=dif(profit);            /*����profit������ǰ��¼��ǰһ����¼�Ĳ�ֵ */
pratio=profit/plag;          /*����profit������ǰ��¼��ǰһ����¼�ı�ֵ */
cards;
2008 989
2009 1002
2010 1023
2011 1022
2012 1065
2013 1112
;
proc print;
run;
