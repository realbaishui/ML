libname fgs “g:\excel”; /*调用之前仍需先用libname建立关联*/
proc print data=fgs.first;
run;
