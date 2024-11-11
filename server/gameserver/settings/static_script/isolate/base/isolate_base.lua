--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: 这是isolate系统CRT实现，所有子模块Include该文件就ok了
--related files: 
--=============================================

--isolate的排他检测
if IsolateBase then --avoid multi include
	error("script with isolate base can never be included more than one time")
	return
end

--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_base_cfg = { --这是一个必填配置项
--    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
--    szEngName 			= "",
--    szViewName 			= "",
--    nTalkBeginDate		= 0,
--    nBeginDate 			= 0,
--    nEndDate 			= 0,
--}
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate上线后第一次登录时的清理

Include("\\settings\\static_script\\isolate\\base\\event_center\\batch_watch_list.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\isolate_task_mgr.lua")

--实现模块独立化 预定义事件处理函数自动注册
IsolateBase = {
	nId = -1,
	szAccessCode = "",
	eng_name = "", 
	view_name = "",
	talk_begin_date = -1,
	begin_date = -1, 
	end_date = -1, 
	main_script_file = "",
	load_date = -1,--加载日期
	user_batch_handle_func_name = "",
	
	--这两个对象直接使用不到 不用再保存起来了
	--user_batch_watch_list = nil,	--用户自定义事件列表注册
	--sys_batch_watch_list = nil,		--系统预定义事件列表注册
}

--以下这些函数经常会用到 原则上禁止直接使用CApi
----------------------------------------------------------------------------------------------------------------------------------
--获取模块的中文名字
function isolate_view_name()
	return IsolateBase.view_name or ""
end

--获取模块id
function isolate_id()
	return IsolateBase.nId or -1
end

--获取模块专有密码
function isolate_access_code()
	return IsolateBase.szAccessCode or ""
end

--获取模块英文名
function isolate_eng_name()
	return IsolateBase.eng_name or ""
end
--获取模块时间配置
function isolate_get_dates()
	return IsolateBase.talk_begin_date, IsolateBase.begin_date,  IsolateBase.end_date
end
--获取模块mainVM
function isolate_main_script()
	return IsolateBase.main_script_file or ""
end

--t_isolate_user_batch_watch_list的入口函数名
function isolate_user_batch_handle_func_name()
	return IsolateBase.user_batch_handle_func_name or ""
end

--WatchEvent封装
function isolate_watch_event(szEventId, szHandleFunc, ...)
	return WatchEvent(szEventId, isolate_main_script(), szHandleFunc, unpack(arg))
end

function isolate_unwatch_event(szEventId, szHandleFunc)
	return UnWatchEvent(szEventId, isolate_main_script(), szHandleFunc)
end

function isolate_watch_npc_talk(szName, nMap, szHandleFunc)
	return WatchEvent("event_npc_talk", isolate_main_script(), szHandleFunc, szName, nMap, isolate_view_name())
end

function isolate_watch_kill_npc(szName, nMap, szHandleFunc)
	return WatchEvent("event_kill_npc", isolate_main_script(), szHandleFunc, szName, nMap)
end

function isolate_watch_item_talk(g, d, p, szHandleFunc)
	return WatchEvent("event_item_talk", isolate_main_script(), szHandleFunc, PackItemId(g, d, p), isolate_view_name())
end

function isolate_watch_gdata_change(szGdataName)
	return isolate_watch_event("event_gdata_change", "_handle_event_gdata_change", szGdataName)
end

--enable watch级别的event开关
function isolate_enable_player_event_watch(szEventId, szFunc, nBatchIdx)
	return EnablePlayerEventWatchDispatch(szEventId, isolate_main_script(), szFunc, nBatchIdx)
end

--disable watch级别的event开关
function isolate_disable_player_event_watch(szEventId, szFunc, nBatchIdx)
	return DisablePlayerEventWatchDispatch(szEventId, isolate_main_script(), szFunc, nBatchIdx)
end

--enable isolate级别的event开关
function isolate_enable_event_dispatch(player_index)
	EnableIsolateEventDispatch(isolate_main_script(), player_index)
end

--disable isolate级别的event开关
function isolate_disable_event_dispatch(player_index)
	DisableIsolateEventDispatch(isolate_main_script(), player_index)
end

function isolate_set_gdata(szGdataName, data, bNeedSync)
	local szData = gVal2String(data)
	local szCode = format("%s=%s", szGdataName, szData)
	ExecuteScript(szCode) --先执行脚本把本地的改了
	return SetGdata(szGdataName, szData, isolate_access_code(), bNeedSync)
end

function isolate_get_gdata(szGdataName)
	return GetGdata(szGdataName, isolate_main_script())
end

function isolate_batch_export(tBatch)
	if tBatch then
		for k,v in tBatch do
			SetGdataAccessCode(k, isolate_access_code(), "")
			SetGdata(k, gVal2String(v), isolate_access_code(), 1)
		end
	end
end
function isolate_batch_import(tBatch)
	if tBatch then
		for i=1,getn(tBatch) do
			local v = tBatch[i]
			isolate_get_gdata(v)
			isolate_watch_gdata_change(v)
		end
	end
end

--是否在活动npc会话时间内 today=nil表示当前日期 bOnlyInTalkDate=1表示排除正式开放日期
function isolate_in_talk_date(today, bOnlyInTalkDate)
	local _today = today
	if not _today then
		_today = tonumber(date("%Y%m%d"))
	end
	if IsolateBase.talk_begin_date < 0 or IsolateBase.begin_date < 0 or IsolateBase.end_date < 0 then
		return 0
	elseif IsolateBase.talk_begin_date > 0 and _today < IsolateBase.talk_begin_date then
		return 0
	elseif IsolateBase.talk_begin_date == 0 and IsolateBase.begin_date > 0 and _today < IsolateBase.begin_date then
		return 0
	end
	if IsolateBase.end_date > 0 and _today > IsolateBase.end_date then
		return 0
	end
	if bOnlyInTalkDate and bOnlyInTalkDate == 1 then
		if IsolateBase.begin_date == 0 or _today >= IsolateBase.begin_date then --活动时间已经正式开始
			return 0
		end
	end
	return 1
end
--是否在活动正式开放周期内
function isolate_in_date(today)
	local _today = today
	if not _today then
		_today = tonumber(date("%Y%m%d"))
	end
	if IsolateBase.begin_date < 0 or IsolateBase.end_date < 0 then
		return 0
	elseif IsolateBase.begin_date > 0 and _today < IsolateBase.begin_date then
		return 0
	elseif IsolateBase.end_date > 0 and _today > IsolateBase.end_date then
		if not today then
			__on_isolate_uninit()--模块过期了 自动卸载吧
		end
		return 0
	end
	return 1
end

--获取string表示的日期
function isolate_get_str_date(nDate)
	local v = nDate
	local d = mod(v, 100)
	v = floor(v/100)
	local m = mod(v, 100)
	v = floor(v/100)
	local y = mod(v, 10000)
	local s = format("%02d/%02d/%d",d, m, y) --dd/mm/yyyy
	return s
end


--------------------------------------------------------------------------------------------------------------------
--以下是系统函数外部不会用到

--用户自定义事件列表注册
function IsolateBase:_init_user_batch_watch_list()
	if t_isolate_user_batch_watch_list then
		local _user_batch_watch_list = BatchWatchList:new("user_batch_watch_list")
		_user_batch_watch_list:batch_watch_event(isolate_main_script(), t_isolate_user_batch_watch_list)
		self.user_batch_handle_func_name = _user_batch_watch_list:get_handle_func_name()
		t_isolate_user_batch_watch_list = nil --隐藏isolate_user_batch_watch_list防止再度被修改
	end
end

--系统预定义事件列表注册
function _isolate_sys_batch_watch_list_elem_handler(tEvent, data, para)
	local fn = tEvent[4]
	return fn(unpack(data)) --预定义回调函数直接把事件参数传过去 省得用的时候还要去转换
end
function IsolateBase:_init_sys_batch_watch_list()--自动注册预定义事件回调函数
	local _sys_event_mapping = {
		{"event_server_start", 	on_event_server_start},
		{"event_player_login", 	on_event_player_login},
		{"event_player_logout",	on_event_player_logout},
		{"event_daily_clear", 	on_event_daily_clear},
		{"event_weekly_clear",	on_event_weekly_clear},
		{"event_monthly_clear",	on_event_monthly_clear},
	}
	
	local _tSysEventMaping = {}
	for i = 1, getn(_sys_event_mapping) do
		local v = _sys_event_mapping[i]
		local szEventId,fn = unpack(v)
		if fn then
			tinsert(_tSysEventMaping, {szEventId, {}, _isolate_sys_batch_watch_list_elem_handler, fn})
		end
	end
	
	if getn(_tSysEventMaping) > 0 then
		local _batch_watch_list = BatchWatchList:new("sys_batch_watch_list")
		_batch_watch_list:batch_watch_event(isolate_main_script(), _tSysEventMaping)
	end
end

function _handle_event_gdata_change(data,para)
	local szGdataName = unpack(data)
	return _on_gdata_change(szGdataName)
end
function _on_gdata_change(szGdataName)
	isolate_get_gdata(szGdataName)
	if on_event_gdata_change then
		on_event_gdata_change(szGdataName, szData)
	end
end

function _isolate_process_batch_export_gdata()
	isolate_batch_export(t_isolate_batch_export_gdata)
	t_isolate_batch_export_gdata = nil
end
function _isolate_process_batch_import_gdata()
	isolate_batch_import(t_isolate_batch_import_gdata)
	t_isolate_batch_import_gdata = nil
end

--孤立模块初始化函数
function IsolateBase:__on_isolate_init(nId, eng_name, view_name, talk_begin_date, begin_date, end_date, main_script_file)
	self.eng_name = eng_name
	self.view_name = view_name
	self.talk_begin_date = talk_begin_date
	self.begin_date = begin_date
	self.end_date = end_date
	self.main_script_file = main_script_file
	self.nId = nId
	self.szAccessCode = tostring(String2Hash(tostring(nId)))
	if on_init then --回调初始化函数
		on_init()
	end
	if not AcivityBase then
		IsolateTaskManager:init(t_isolate_task_list)--初始化任务变量访问模块
		t_isolate_task_list = nil
	end
end
function IsolateBase:__on_isolate_step_init(nStep, nMaxStep)
	if 1 == nStep then --先把所有模块符号导出
		_isolate_process_batch_export_gdata()
		if on_export_gdata then
			on_export_gdata()
		end
	elseif 2 == nStep then --再把所有模块符号导入
		_isolate_process_batch_import_gdata()
		isolate_get_gdata("gDebug")--导入debug试试
		if on_import_gdata then
			on_import_gdata()
		end
	elseif 3 == nStep then
		self:_init_sys_batch_watch_list()
		self:_init_user_batch_watch_list()
		if on_add_watches then
			on_add_watches()
		end
	end
--	if on_init_step then --回调初始化函数
--		on_init_step(nStep, nMaxStep)
--	end
	if nStep == nMaxStep then
		if isolate_in_talk_date(nil, 1) == 1 then--模块尚未正式开始,那就先阻止该isolate的所有event dispatch
			WriteGsLog(6, format("[Isolate] {%s} loaded but will pause until open date: %d", isolate_main_script(), self.begin_date), 1)
			isolate_disable_event_dispatch(-1)
		else
			UpdateIsolateOpenTime(self.main_script_file, self.begin_date) --更新isolate的上线时间
			WriteGsLog(6, format("[Isolate] {%d:%s} init ok", isolate_id(), isolate_main_script()), 0)
		end
		if on_init_ok then --后调用on_init_ok允许用户重新激活被暂停的isolate
			on_init_ok()
		end
	end
end

function _check_date(today, talk_begin_date, begin_date, end_date)
	if talk_begin_date < 0 or begin_date < 0 or end_date < 0 then
		error(format("talk_begin_date(%d) begin_date(%d) end_date(%d) must >= 0, error", talk_begin_date, begin_date, end_date))
		return 0
	end
	if (begin_date > 0 and talk_begin_date > begin_date) or (end_date > 0 and (talk_begin_date > end_date or begin_date > end_date)) then
		error(format("talk_begin_date(%d) begin_date(%d) end_date(%d) not in order, error", talk_begin_date, begin_date, end_date))
		return 0
	end
	if talk_begin_date > 0 and today < talk_begin_date then
		return 0
	end
	if talk_begin_date <= 0 and begin_date > 0 and today < begin_date then
		return 0
	end
	if end_date > 0 and today > end_date then
		return 0
	end
	return 1
end

function _verify_isolate_register_base(szMainVMScript)
	if not t_isolate_base_cfg then
		error(format("{%s} need t_isolate_base_cfg", szMainVMScript))
		return 0
	end
	local szCurVM = gsub(CALL_SCRIPT_NAME or "","/","\\") --统一window和linux路径分隔符
	if szMainVMScript ~= szCurVM then
		error(format("cannot redister from {%s} must from {%s}", szCurVM, szMainVMScript))
		return 0
	end
	local t = t_isolate_base_cfg
	t.nPriority = t.nPriority or 1
	assert(t.szEngName and t.szViewName and t.nTalkBeginDate and t.nBeginDate and t.nEndDate)
	local today = tonumber(date("%Y%m%d"))
	if t.nPriority > 0 and _check_date(today, t.nTalkBeginDate, t.nBeginDate, t.nEndDate) == 1 then
		return 1
	else
		WriteGsLog(6, format("[info][Isolate]{%s} is out of date{%d %d, %d, %d}", szMainVMScript, t.nPriority, t.nTalkBeginDate, t.nBeginDate, t.nEndDate), 0)
	end
	return 0
end

----------------------------------------------------------------------------------------------------------------------------------

function isolate_register_self(szMainVMScript)
	local t = t_isolate_base_cfg
	if _verify_isolate_register_base(szMainVMScript) == 1 then
		RegIsolate(t.nPriority, t.szEngName, t.szViewName, t.nTalkBeginDate, t.nBeginDate, t.nEndDate, szMainVMScript, 0, 0)
	end
end
function __on_isolate_init(nId, eng_name, view_name, talk_begin_date, begin_date, end_date, main_script_file)
	return IsolateBase:__on_isolate_init(nId, eng_name, view_name, talk_begin_date, begin_date, end_date, main_script_file)
end
function __on_isolate_step_init(nStep, nMaxStep)
	return IsolateBase:__on_isolate_step_init(nStep, nMaxStep)
end

function __on_isolate_uninit() --模块过期卸载
	--Unwatch所有Event
	WriteGsLog(6, format("[info][Isolate] [%s] is out of date, uninit", isolate_main_script()), 1)
	isolate_enable_event_dispatch(-1)
	UnWatchEvent("", isolate_main_script(), "")
	BatchWatchListMgr:clear()
	if on_uninit then
		on_uninit()
	end
end

function __isolate_on_new_day(today)
	local _today = today
	if not _today then
		_today = tonumber(date("%Y%m%d"))
	end
	if isolate_in_talk_date(_today, 0) ~= 1 then --模块过期卸载
		__on_isolate_uninit()
	else
		if isolate_in_date(_today) == 1 then--模块正式开始，开启之前可能设置的dispatch黑名单
			UpdateIsolateOpenTime(IsolateBase.main_script_file, IsolateBase.begin_date) --更新isolate的上线时间
			isolate_enable_event_dispatch(-1)
		end
	end
	if on_new_day then
		on_new_day(_today)
	end
end

