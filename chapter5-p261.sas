proc report nowd data=bmi headline;
column gender bd fbg,(mean std median qrange);
define gender/group width=6;
define bd/group width=8 order=internal;
define fbg/analysis format=6.2;
compute after gender;                /*在gender下方插入两行文字*/
line @1 gender$ "的均值和标准差分别为" fbg.mean 6.2 "和" fbg.std 6.2;
line @2 gender$ "的中位数和四分位数间距分别为" fbg.median 6.2 "和" 
fbg.qrange 6.2;
endcomp;
run;
