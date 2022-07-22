proc template;
define style fgs;        /*建立一个名为fgs的模板，保存于sasuser.templat中*/
style header / backgroundcolor=white fontsize=12pt fontweight=bold; 
style table/frame=hsides rules=groups;
style data /textalign=center width=100 fontsize=12pt;
style systemtitle/ fontsize=12pt;        /*设置标题样式，设置字体为12*/
end;                               /*注意最后要用end结束*/
run;
