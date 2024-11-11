--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: 这是isolate脚本系统唯一主数据虚拟机
--related files: 
--=============================================

--script_data_center
--所有需要存储在脚本中的数据都放在这个虚拟机中，所以这个文件只Include一些有存储需求的脚本没有实际实现代码

if not __script_date_center__ then
	__script_date_center__ = 1
	Include("\\settings\\static_script\\isolate\\base\\gdata_center\\gdata_impl.lua")		--GdataImpl
	Include("\\settings\\static_script\\isolate\\base\\event_center\\event_impl.lua")		--EventImpl
	Include("\\settings\\static_script\\isolate\\base\\isolate_center_impl.lua")	--IsolateCenterImpl
	
	function script_data_center_init()
		print("init script_data_center.lua begin====")
		GdataImpl:_init()			--跨VM的数据存取服务
        EventImpl:_init()			--基础事件系统服务
        IsolateCenterImpl:_init()	--Isolate注册和加载服务
        print("init script_data_center.lua end====")
	end
	
	--script_data_center_init();--在C++ g_InitScriptEngine 函数中调用
end