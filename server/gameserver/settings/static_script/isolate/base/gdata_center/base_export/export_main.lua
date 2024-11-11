--这个isolate全是导出的

t_isolate_batch_export_gdata = {} --在这之后Include的所有包含export_base.lua的文件导出的符号将作为导出对象

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 9999,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "exportGdata",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}


Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_class.lua")
