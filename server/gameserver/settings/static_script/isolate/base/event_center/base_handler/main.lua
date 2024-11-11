--base需要处理的一些事件用这个isolate实现

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "baseHandler",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

--跨天的处理，通知isolate center加载和卸载模块
function handle_event_new_day(data, para)
	local nNewDate = unpack(data)
	local szScriptFile = "\\settings\\static_script\\isolate\\base\\script_data_center.lua"
	local szCode = format("isolate_center_handle_on_new_day(%d)", nNewDate)
	SendScript2VM(szScriptFile, szCode)
end

--每天5点show一下Event系统的统计信息
function handle_event_5h(data, para)
	--ShowGdata()
	ShowEvent()
	ShowIsolate()
end

function on_event_player_login()
	--这个标志位用来控制跨过0点新加载isolate的角色数据自动重置
	--重新登录过就把这个标志清0
	bt_SetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR, 0)
end

function on_event_player_logout()
	if PlayerIndex and PlayerIndex > 0 then
		EnableIsolateEventDispatch("", PlayerIndex) --去掉所有与该玩家有关的event dispatch黑名单
		EnablePlayerEventWatchDispatch("", "", "", 0) --去掉该玩家的所有Watch-Level player_event_dispatch黑名单
	end
end

--每日清理，重置用于记录event_player_daily_online_minute的任务变量的值
function on_event_daily_clear(nCurDate, nLastDate)
	local TASK_ID_DAILY_ONLINE_MINUTE = 3379
	SetTask(TASK_ID_DAILY_ONLINE_MINUTE, 0, TASK_ACCESS_CODE_EVENT_CENTER)
end

function on_add_watches()
	isolate_watch_event("event_server_new_day", "handle_event_new_day", -1)
	isolate_watch_event("event_server_time", "handle_event_5h", 5, 0)
end
