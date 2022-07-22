data finance;
input item:$50. index class:$20.;
cards;
净资产收益率	0.18	行业标准
总资产收益率	0.1	行业标准
主营业务收益率	0.2	行业标准
资产负债比率	1	行业标准
流动比率	1	行业标准
速动比率	1	行业标准
总资产周转率	1.5	行业标准
主营业务收入增长率	0.68	行业标准
净资产增长率	0.27	行业标准
净资产收益率	0.15	A公司指标
总资产收益率	0.09	A公司指标
主营业务收益率	0.19	A公司指标
资产负债比率	0.48	A公司指标
流动比率	0.9	A公司指标
速动比率	0.9	A公司指标
总资产周转率	1.8	A公司指标
主营业务收入增长率	0.45	A公司指标
净资产增长率	0.23	A公司指标
;
proc gradar data=finance;
chart item/ sumvar=index noframe starfill=solid cstarfill=orange;
where class="A公司指标";        /*仅选择A公司的数据绘图*/
run;
