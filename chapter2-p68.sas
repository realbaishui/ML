data baseline;
input id gender$ age;
mgender=missing(gender);        /*�ж�gender�Ƿ���ȱʧ */
mage=missing(age);              /*�ж�age�Ƿ���ȱʧ */
cards;
1 f 60
2 m 59
3 f .
4 . 48
;
proc print;
run;
