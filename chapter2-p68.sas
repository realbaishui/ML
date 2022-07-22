data baseline;
input id gender$ age;
mgender=missing(gender);        /*≈–∂œgender «∑Ò”–»± ß */
mage=missing(age);              /*≈–∂œage «∑Ò”–»± ß */
cards;
1 f 60
2 m 59
3 f .
4 . 48
;
proc print;
run;
