--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: 这是isolate用于模块之间交换数据解除Include SendScript2VM等强耦合的核心组件
--related files: 
--=============================================

Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")

--跨vm的脚本全局数据管理器
--支持string number table function(string code, 注意要"@"打头)

GdataImpl = {
	thisVM = "\\settings\\static_script\\isolate\\base\\gdata_center\\gdata_impl.lua",
	szVM = "\\settings\\static_script\\isolate\\base\\script_data_center.lua",
	list = {}, --[name] = {name, str_data, help, access_code},
}

--function GdataImpl:new()
--	local t=_inherit(self)
--	t.list = {}
--	t:_init()
--	return t
--end

function GdataImpl:define_gdata(szGlobalName, szHelp)
	local szType = strsub(szGlobalName, 1, 1)
	if szType ~= "g" then
		gDebug:show_msg(format("[error][Gdata] define_gdata(%s) only support 'g' prefix name", szGlobalName))
		return 0
	end
	local tElem = self.list[szGlobalName]
	if tElem then
		gDebug:show_msg(format("[error][Gdata] define_data(%s) already exists", szGlobalName))
		return 0
	end
	self.list[szGlobalName] = {name=szGlobalName, str_data="nil", help=szHelp, access_code=""}
	return 1
end

function GdataImpl:get_gdata(szGlobalName, szCallBackScriptFile)
	szCallBackScriptFile = szCallBackScriptFile or ""
	if szCallBackScriptFile == "" then
		szCallBackScriptFile = CALL_SCRIPT_NAME or ""
		if szCallBackScriptFile == "" then
			gDebug:show_msg(format("[error][Gdata] get_data(%s, %s) szCallBackScriptFile not exists"
				, szGlobalName, szCallBackScriptFile))
		end
	end
	local tElem = self.list[szGlobalName]
	if not tElem then
		gDebug:show_msg(format("[error][Gdata] get_data(%s, %s) not exists"
			, szGlobalName, szCallBackScriptFile))
		return 0
	end
	local szCode = format("%s = %s", szGlobalName, tElem.str_data)
	SendScript2VM(szCallBackScriptFile, szCode)
	return 1
end

function GdataImpl:set_gdata_access_code(szGlobalName, szAccessCode, szOldAccessCode)
	local tElem = self.list[szGlobalName]
	if not tElem then
		gDebug:show_msg(format("[error][Gdata] set_access_code(%s, %s, %s, %s) not exists"
			, szGlobalName, gVal2String(data), szAccessCode, szOldAccessCode))
		return 0
	end
	local szNeedAccessCode = tElem.access_code
	if szNeedAccessCode and szOldAccessCode ~= szNeedAccessCode  then
		gDebug:show_msg(format("[error][Gdata] set_access_code(%s, %s, %s, %s) OldAccessCode error, need(%s)"
			, szGlobalName, gVal2String(data), szAccessCode, szOldAccessCode, szNeedAccessCode))
		return 0
	end
	tElem.access_code = szAccessCode
	return 1
end

function GdataImpl:set_gdata(szGlobalName, str_data, szAccessCode, bNeedSync)
	bNeedSync = bNeedSync or 1
	local tElem = self.list[szGlobalName]
	if not tElem then
		gDebug:show_msg(format("[error][Gdata] modify_data(%s, %s, %s) not exists"
			, szGlobalName, str_data, szAccessCode))
		return 0
	end
	local szNeedAccessCode = tElem.access_code or ""
	if szNeedAccessCode ~= "" and szAccessCode ~= szNeedAccessCode  then
		gDebug:show_msg(format("[error][Gdata] modify_data(%s, %s, %s) AccessCode error, need(%s)"
			, szGlobalName, str_data, szAccessCode, szNeedAccessCode))
		return 0
	end
	if gDebug:is_debug() == 1 then
		gDebug:show_debug_msg(format("[info][Gdata] modify_data(%s)", szGlobalName))
	end
	tElem.str_data = str_data
	FireEvent("event_gdata_change", szGlobalName)
	if bNeedSync ~= 0 then
		--Sync to other gs?
	end
	return 1
end

function GdataImpl:show_gdata(szGlobalName)
	szGlobalName = szGlobalName or ""
	if szGlobalName == "" then
		gDebug:show_msg(format("GdataImpl list begin========="))
		for k, v in self.list do
    		gDebug:show_msg(gVal2String(v))
    	end
    	gDebug:show_msg(format("GdataImpl list end========="))
	else
		local tElem = self.list[szGlobalName]
    	if tElem then
    		gDebug:show_msg(gVal2String(tElem))
    	else
    		gDebug:show_msg(format("[error][Gdata] show_gdata(%s) not exists"
    			, szGlobalName))
    		return 0
    	end
	end
end

Include("\\settings\\static_script\\isolate\\base\\gdata_center\\gdata_def_ks.lua")
function GdataImpl:_init()
	self:define_all_gdata_ks()
end

----继承
--function _inherit(base)	--定义一个继承函数
--	local derive = {}
--	local foo = function(t,i)	--定义"index"方法
--		return %base[i]
--	end;
--	settag(derive,newtag())
--	settagmethod(tag(derive),"index",foo)
--	for i,v in base do
--		if type(v) == "table" then
--			derive[i] = _inherit(v)
--		end
--	end
--	return derive
--end

--------------------------------------------------------------------global interface
function get_gdata(szGlobalName, szCallBackScriptFile)
	return GdataImpl:get_gdata(szGlobalName, szCallBackScriptFile)
end
function set_gdata(szGlobalName, str_data, szAccessCode, bNeedSync)
	return GdataImpl:set_gdata(szGlobalName, str_data, szAccessCode)
end
function set_gdata_access_code(szGlobalName, szAccessCode, szOldAccessCode)
	return GdataImpl:set_gdata_access_code(szGlobalName, szAccessCode, szOldAccessCode)
end
function show_gdata(szGlobalName)
	return GdataImpl:show_gdata(szGlobalName)
end
--------------------------------------------------------------------
