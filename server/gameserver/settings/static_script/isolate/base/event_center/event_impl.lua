--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: 这是isolate系统全局核心组件event_center实现 在C++有一个高效的event_center与之配合作战
--related files: 
--=============================================

EventImpl = { --先定义table 后面Include的头文件要用
	thisVM = "\\settings\\static_script\\isolate\\base\\event_center\\event_impl.lua",
	szVM = "\\settings\\static_script\\isolate\\base\\script_data_center.lua",
	events = {}, --事件监视器
	events_with_player_event_switch = {}, --有PlayerEventSwitch的EventIds
	events_handler_hash_map = {},--事件监视函数hash_map
	start_time_stamp = 0,
	hijack_cnt = 0,
	trigger_cnt = 0,
	exec_cnt = 0,
	fire_cnt = 0,
	fire_none_talk_cnt = 0,
	dispatch_cnt = 0,
	talk_cnt = 0,
	any_key = "#any#", --默认的key
	any_key_string = "",
	any_key_number = -1,
	max_keys = 4, --最大支持的key个数
	max_watches = 30, --最大支持的观察者个数
	
	today_date = 0, --今天的日期 Format: 20160223
	
	OBJ_NPC = 1,
	OBJ_ITEM = 2,
	
	player_event_switch_none = 0,
	player_event_switch_event_level = 1,
	team_event_prefix = "TEAM_",
	team_event_prefix_len = 5,
	
	dispatch_black_list = { --fire_event派发黑名单，用于阻止一些还未生效的isolate的事件触发
		--如月卡尚未激活的玩家上线可添加该玩家黑名单，则月卡模块的所有事件都不会向该Player派发
		--[file] = {player_list}
	},
	freq_event = {--周期调用的事件，para是调用频率而不是实际的key
		event_server_tick 					= 1,
		event_server_tick_minute 			= 1,
		event_server_tick_hour 				= 1,
		event_player_tick 					= 1,
		event_player_tick_minute 			= 1,
		event_player_tick_hour 				= 1,
		event_player_daily_online_minute	= 1,
	},
	talk_event = {--会话事件 有些情况下需要特殊处理
		event_npc_talk 	= 1,
		event_item_talk = 1,
	},
}

Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")

Include("\\settings\\static_script\\isolate\\base\\event_center\\event_def_ks.lua")
--Include("\\script\\ks2vng\\isolate\\base\\event_center\\event_def_vng.lua")

Include("\\settings\\static_script\\global\\bit_task_support.lua")

--function EventImpl:new()
--	local t=_inherit(self)
--	t.events = {}
--	t.events_with_player_event_switch = {}
--	t.hijack_cnt = 0
--	t.trigger_cnt = 0
--	t:_init()
--	return t
--end

--获取是否有针对该isolate的dispatch black list
function EventImpl:isolate_dispatch_hijack(szScriptFile)
	local t = self.dispatch_black_list[szScriptFile]
	if t then
		if t[self.any_key_number] or t[PlayerIndex] then
			return 1
		end
	end
	return 0
end
function EventImpl:enable_isolate_event_dispatch(szScriptFile, player_index, bEnable)
	if not player_index or player_index <= 0 then player_index = self.any_key_number end
	bEnable = bEnable or 0
	if "" == szScriptFile and bEnable == 1 then
		for k,_ in self.dispatch_black_list do
			if k ~= "" then
				self:enable_isolate_event_dispatch(k, player_index, bEnable)
			end
		end
		return
	end
	
	if szScriptFile ~= "" then
		local bOldSwitch = 1
		if self.dispatch_black_list and self.dispatch_black_list[szScriptFile] then
			bOldSwitch = 1 - (self.dispatch_black_list[szScriptFile][player_index] or 0)
		end
		if bOldSwitch ~= bEnable then
			local t = self.dispatch_black_list[szScriptFile] or {}
    		if bEnable == 1 then
    			t[player_index] = nil
    		else
    			t[player_index] = 1
    		end
    		self.dispatch_black_list[szScriptFile] = t
    		if player_index > 0 then
        		local nOldPlayerIndex = PlayerIndex
        		PlayerIndex = player_index
        		WriteGsLog(6, format("[EventCenter] event_dispatch player{%s} isolate{%s} enable=%d", GetName(), szScriptFile, bEnable), 0)
        		PlayerIndex = nOldPlayerIndex
        	else
        		WriteGsLog(6, format("[EventCenter] event_dispatch isolate{%s} enable=%d", szScriptFile, bEnable), 0)
        	end
		end
	else
		print("EventImpl:enable_isolate_event_dispatch : need szScriptFile para")
	end
end

--nFilterKeys表示用于过滤的Key个数 如npc相关事件包含name和map两个过滤的key
function EventImpl:define_event(szEventId, szHelp, nFilterKeyNum, data_convert_func, player_event_switch_type)
	local szRealEventId,bTeamEvent = self:_split_event_id(szEventId)
	if szRealEventId == "" or self.events[szRealEventId] then
		gDebug:show_msg(format("[error][EventImpl] define_event(%s) redefined or lack id", szRealEventId))
		return 0
	end
	szHelp = szHelp or ""
	nFilterKeyNum = nFilterKeyNum or 0
--	if gDebug:is_debug() == 1 then
--		gDebug:show_debug_msg(format("[debug][Event] define_event [%s][%s][%d]",szRealEventId, szHelp, nFilterKeyNum))
--	end
	self.events[szRealEventId] = _EventHandlerMgr:new(szRealEventId, szHelp, nFilterKeyNum, data_convert_func, player_event_switch_type, bTeamEvent)
	if player_event_switch_type and player_event_switch_type > self.player_event_switch_none then --有Switch的PlayerEvent
		self.events_with_player_event_switch[szRealEventId] = 0
	end
	return 1
end

--return id
function EventImpl:watch_event(szEventId, szScriptFile, szFunc, para)
	local szRealEventId,bTeamEvent = self:_split_event_id(szEventId)
	if not szEventId or not szScriptFile or not szFunc then
		gDebug:show_msg(format("[error][EventImpl] watch_event(%s, %s, %s) Para error", szRealEventId, szScriptFile, szFunc))
		return 0
	end
	local tEvent = self.events[szRealEventId]
	if not tEvent then
		gDebug:show_msg(format("[error][EventImpl] watch_event(%s, %s, %s) undefined event", szRealEventId, szScriptFile, szFunc))
		return 0
	end
	
	return tEvent:add(szScriptFile, szFunc, para, bTeamEvent)
end

function EventImpl:unwatch_event(szEventId, szScriptFile, szFunc)
	szEventId = szEventId or ""
	local szRealEventId,bTeamEvent = self:_split_event_id(szEventId)
	local nRet = 0
	if szRealEventId == "" then
		for k,v in self.events do
			nRet = nRet + v:remove(szScriptFile, szFunc)
		end
	else
		local tEvent = self.events[szRealEventId]
    	if not tEvent then
    		gDebug:show_msg(format("[error][EventImpl] unwatch_event(%s, %s, %s) undefined event", szRealEventId, szScriptFile, szFunc))
    		return 0
    	end
    	nRet = tEvent:remove(szScriptFile, szFunc)
	end
	return nRet
end

function EventImpl:enable_player_event_watch_dispatch(szEventId, szScriptFile, szFunc, nBatchIdx, bEnable)
	local nRet = 0
--	if not PlayerIndex or  PlayerIndex <= 0 then
--		gDebug:show_msg(format("[error][Event] enable_player_event_watch_dispatch(%s, %s, %s, %d) must trigger on player object", szEventId, szScriptFile, szFunc, bEnable))
--		return 0
--	end
	if 0 == bEnable and ("" == szEventId or "" == szScriptFile) then
		gDebug:show_msg(format("[error][Event] enable_player_event_watch_dispatch(%s, %s, %s, %d) need para", szEventId, szScriptFile, szFunc, bEnable))
		return 0
	end
	if szEventId == "" then
		for k,tEvent in self.events do
			nRet = nRet + tEvent:enable_player_event_watch_dispatch(szScriptFile, szFunc, nBatchIdx, bEnable)
		end
	else
		local tEvent = self.events[szEventId]
    	if not tEvent then
    		gDebug:show_msg(format("[error][EventImpl] enable_player_event_watch_dispatch(%s, %s, %s, %d) undefined event", szEventId, szScriptFile, szFunc, bEnable))
    		return 0
    	end
    	nRet = tEvent:enable_player_event_watch_dispatch(szScriptFile, szFunc, nBatchIdx, bEnable)
	end
	return nRet
end

--trigger an event
function EventImpl:fire_event(szEventId, data, trigger_by_team)
--	if gDebug:is_debug() == 1 then
--		gDebug:show_debug_msg(format("[debug] fire_event(%s, %s)", szEventId, gVal2String(data)))
--	end
	local tEvent = self.events[szEventId]
	if not tEvent then
		gDebug:show_msg(format("[error][Event] fire_event(%s) undefined event", szEventId))
		return 0
	end
	if tEvent.player_event_switch_type > self.player_event_switch_none and (not PlayerIndex or  PlayerIndex <= 0) then
		gDebug:show_msg(format("[error][Event] fire_event(%s) event with player_event_switch must trigger on player object", szEventId))
		return 0
	end
	tEvent:trigger(szEventId, data, trigger_by_team)
end

function EventImpl:show_event(szEventId)
	if szEventId then
    	if szEventId == "" then
    		gDebug:show_msg(format("[Event] all event list begin=========="))
    		for k,v in self.events do
    			v:show()
    		end
    		gDebug:show_msg(format("[Event] all event list end=========="))
    	else
    		local tEvent = self.events[szEventId]
    		if tEvent then
    			tEvent:show()
    		else
    			gDebug:show_msg(format("[error][Event] show_event [%s] undefined", szEventId))
    		end
    	end
    end
    
    if not szEventId or szEventId == "" then
    	WriteGsLog(6, format("\n[EventCenter(Lua)] isolate hijack:"), 1)
    	local n = 0
    	for k,v in self.dispatch_black_list do
    		WriteGsLog(6, format("  [%s]=%s", k, _show_table_short(v)), 1)
    		n = n + 1
    	end
    	WriteGsLog(6, format("[EventCenter(Lua)] isolate hijack end, count = %d", n), 1)
    	
    	local time_stamp = GetTime()
    	local pass_time = time_stamp - self.start_time_stamp
    	WriteGsLog(6, format("[EventCenter(Lua)] runs {%s} from {%s} to {%s}", _get_pass_time(pass_time), _get_time_str(self.start_time_stamp), _get_time_str(time_stamp)), 1)
    	
    	local nDispatchTalkRate = 0
    	if self.fire_cnt  > 0 then
    		nDispatchTalkRate = self.talk_cnt * 100.0 / self.fire_cnt
    	end
    	WriteGsLog(6, format("[EventCenter(Lua)] %.0f/%.0f|%.0f (%.2f%s) talk_event dispatched", self.talk_cnt, self.fire_cnt, self.fire_none_talk_cnt, nDispatchTalkRate, "%%"), 1)
    	

    	local nDispatchNoneTalkRate = 0
    	if self.fire_none_talk_cnt  > 0 then
    		nDispatchNoneTalkRate = self.dispatch_cnt * 100.0 / self.fire_none_talk_cnt
    	end
    	WriteGsLog(6, format("[EventCenter(Lua)] %.0f/%.0f (%.2f%s) none-talk event dispatched", self.dispatch_cnt, self.fire_none_talk_cnt, nDispatchNoneTalkRate, "%%"), 1)
    	
    	local nHijackRate = 0
        if self.trigger_cnt > 0 then
        	nHijackRate = self.hijack_cnt * 100.0 / self.trigger_cnt
        end
        WriteGsLog(6, format("[EventCenter(Lua)] %.0f/%.0f|%.0f (%.2f%s) dispatch hijack by script-level switch", self.hijack_cnt, self.trigger_cnt, self.exec_cnt, nHijackRate, "%%"), 1)
    end
end

function _get_time_str(nTimeStamp)
	local y,m,d,h,min,s = GmTime(nTimeStamp)
	return format("%04d-%02d-%02d %02d:%02d:%02d", y,m,d,h,min,s)
end

function _get_pass_time(nTimePass)
	local sec = mod(nTimePass, 60)
	nTimePass = floor(nTimePass/60)
	local min = mod(nTimePass, 60)
	nTimePass = floor(nTimePass/60)
	local hour = mod(nTimePass, 24)
	nTimePass = floor(nTimePass/24)
	local day = nTimePass
	return format("%d-%02d:%02d:%02d", day, hour, min, sec)
end

function EventImpl:_define_all_player_event_switches()
	for k,v in self.events_with_player_event_switch do
		self.events_with_player_event_switch[k] = DefPlayerEventSwitch(k) --定义PlayerEventSwitch
	end
end
function EventImpl:_reset_all_event_watch_count()
	for k,tEvent in self.events do
		SetEventWatchCount(k, tEvent:_watch_vcount())
	end
end

--如果带有TEAM_前缀，要拆出来,那个不是event_id的一部分
function EventImpl:_split_event_id(szEventId)
	local szRealEventId, bTeamEvent = "", 0
	if szEventId and szEventId ~= "" then
		local szType = strsub(szEventId, 1, self.team_event_prefix_len)
		if szType == self.team_event_prefix then
			szRealEventId = strsub(szEventId, self.team_event_prefix_len+1)
			bTeamEvent = 1
		else
			szRealEventId = szEventId
		end
	end
	return szRealEventId, bTeamEvent
end


--继承
function _inherit(base)	--定义一个继承函数
	local derive = {}
	local foo = function(t,i)	--定义"index"方法
		return %base[i]
	end;
	settag(derive,newtag())
	settagmethod(tag(derive),"index",foo)
	for i,v in base do
		if type(v) == "table" then
			derive[i] = _inherit(v)
		end
	end
	return derive
end

function _show_table_short(t)
	local s = ""
	if t then
		for i=1,getn(t) do
			local v = t[i]
			s = format("%s,%s", s, tostring(v))
    	end
    	if s ~= "" then
    		s = strsub(s, 2)
    	end
    	s = format("{%s}",s)
	end
	return s
end

function _show_table_keys(t)
	local s = ""
	if t then
		for k,v in t do
			s = format("%s,%s", s, tostring(k))
    	end
    	if s ~= "" then
    		s = strsub(s, 2)
    	end
    	s = format("{%s}",s)
	end
	return s
end

--------------------------------------------------------------------------------------------
_EventWatch = { --一个事件监听
	file = "",
	func = "",
	para = nil,
	hash_key = "", 
	trigger_by_team =  0,
	dispatch_black_list = nil, --{PlayerIndex}阻止该Watch向其派发的player
}
function _EventWatch:new(szScriptFile, szFunc, para, trigger_by_team)
	local t=_inherit(self)
	t.file = szScriptFile
	t.func = szFunc
	t.para = para or {}
	t.hash_key = ""
	t.trigger_by_team = trigger_by_team
	t.dispatch_black_list = nil--默认初始化为nil,有黑名单进来再构造table
	return t
end

function _EventWatch:trigger(tEvent, data, trigger_by_team)
	EventImpl.trigger_cnt = EventImpl.trigger_cnt + 1
	
	--通过最后这个参数 观察者函数可以获得当初注册进来的时候提供的一些参数 这个太有用了
	local szCode = format("%s(%s, %s)", self.func, gVal2String(data), gVal2String(self.para))
	
	local bByTeam = 0
	local nRet = 0
	local nTeamSize = GetTeamSize()
	if nTeamSize > 1 and (trigger_by_team == 1 or tEvent.trigger_by_team == 1 or self.trigger_by_team == 1) then --对team触发
		bByTeam = 1
		local oldPlayerIndex = PlayerIndex;
		local nMasterMap = GetWorldPos()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nMap = GetWorldPos()
			if nMap == nMasterMap then--只有在同一地图的队员才触发事件
				if self:script_level_dispatch_hijack(1) == 0 then --script-level dispatch hijack
					SendScript2VM(self.file, szCode)
					nRet = nRet + 1
				end
			end
		end
		PlayerIndex = oldPlayerIndex
	else--对个人触发
		if self:script_level_dispatch_hijack(1) == 0 then --script-level dispatch hijack
			SendScript2VM(self.file, szCode)
    		nRet = nRet + 1
		end
    	
	end
	EventImpl.exec_cnt = EventImpl.exec_cnt + nRet
	if gDebug:is_debug() == 1 then
    	gDebug:show_debug_msg(format("[debug][Event] P%d trigger(%s, %s, %s, %s, %s,%d)=%d",PlayerIndex, tEvent.id, self.file, self.func, _show_table_short(data), _show_table_short(self.para), trigger_by_team, nRet))
    end
    return nRet
end

function _EventWatch:script_level_dispatch_hijack(bIncludeIsolateHijack)
	if bIncludeIsolateHijack and bIncludeIsolateHijack == 1 then
		if EventImpl:isolate_dispatch_hijack(self.file) == 1 then --isolate级别的dispatch拦截
    		EventImpl.hijack_cnt = 	EventImpl.hijack_cnt + 1--统计
    		return 1
    	end
	end
	if self.dispatch_black_list and self.dispatch_black_list[PlayerIndex] then --Watch级别的PlayerEventSwitch
		EventImpl.hijack_cnt = 	EventImpl.hijack_cnt + 1--统计
		return 1
	end
	return 0
end


--------------------------------------------------------------------------------------------
_EventHandlerMgr = { 
	id = "", 
	nid = 0, 
	help="",  
	nkey = 0, 
	nwatch = 0, 
	handler=nil, 
	data_convert_func = nil, 
	trigger_by_team = 0, 
	player_event_switch_type = 0
}
function _EventHandlerMgr:new(szEventId, szHelp, nFilterKeyNum, data_convert_func, player_event_switch_type, bTeamEvent)
	local t=_inherit(self)
	t.id = szEventId
	t.nid = DefineEvent(szEventId) --C++ Define
	t.help = szHelp or ""
	t.nkey = nFilterKeyNum or 0
	t.nkey = min(t.nkey, EventImpl.max_keys)
	t.nwatch = 0
	t.handler = {}
	t.data_convert_func = data_convert_func or data_convert_func_no_convert
	t.trigger_by_team = bTeamEvent or 0
	t.player_event_switch_type = player_event_switch_type or EventImpl.player_event_switch_none
	return t
end
function _EventHandlerMgr:_watch_vcount()
	local nVCount = self.nwatch
	if nVCount <= 0 then
		nVCount = 0
    	if nVCount == 0 and EventImpl.talk_event[self.id] then --TalkEvent一定不能被C++截获，所以打死都不能初始化成0
    		nVCount = 1
    	end
	end
	return nVCount
end
function _EventHandlerMgr:_watch_need_keys()
	local need_keys = self.nkey
	if EventImpl.talk_event[self.id] then
		need_keys = self.nkey + 1
	end
	return need_keys
end
function _EventHandlerMgr:add(szScriptFile, szFunc, para, bTeamEvent)
	szScriptFile = szScriptFile or ""
	szFunc = szFunc or ""
--	if gDebug:is_debug() == 1 then
--		gDebug:show_debug_msg(format("[debug][Event] watch [%s, %s, %s, %s]",self.id, szScriptFile, szFunc, gVal2String(para)))
--	end
	
	if szScriptFile == "" or szFunc == "" then
		gDebug:show_msg(format("[error][Event] watch [%s, %s, %s, %s] need szScriptFile or szFunc", self.id, szScriptFile, szFunc, gVal2String(para)))
		return 0
	end
	
	local need_keys = self:_watch_need_keys()
	if "event_item_talk" == self.id then
		local g,d,p = UnPackItemId(para[1])
		if g ~= 2 then--只支持item_other的对话监控
			gDebug:show_msg(format("[error][Event] watch [%s, %s, %s, %s] only support item_other(g=2)", self.id, szScriptFile, szFunc, gVal2String(para)))
			return 0
		end
	end
	
	local nParaCnt = getn(para)
	local szPrefix = "_batch_watch_list_handler_"
	if strsub(szFunc, 1, strlen(szPrefix)) == szPrefix then
		nParaCnt = nParaCnt - 1 --批量注册的最后一个参数不是key
	end
	
	if nParaCnt < need_keys then
		gDebug:show_msg(format("[error][Event] watch need at least[%d] keys, [%s, %s, %s, %s]", need_keys, self.id, szScriptFile, szFunc, gVal2String(para)))
		return 0
	end
	
	local tTail = self.handler
	local strAllKey = ""
	for i=1,self.nkey do
		local key = para[i] or EventImpl.any_key
		if key == EventImpl.any_key_string or key == EventImpl.any_key_number then --默认的万能参数
			key = EventImpl.any_key
		end
		
		if EventImpl.talk_event[self.id] then--两个对话事件不给触发any_key事件
			if key == EventImpl.any_key then
				gDebug:show_msg(format("[error][Event] watch [%s, %s, %s, %s] do not support any key option ", self.id, szScriptFile, szFunc, gVal2String(para)))
				return 0
			end
		end
		
		para[i] = key
		strAllKey = format("%s_%s", strAllKey, tostring(key))
		if not tTail[key] then
			tTail[key] = {}
		end
		tTail = tTail[key]
	end
	for i = 1,getn(tTail) do
		local v = tTail[i]
		if v.file == szScriptFile and v.func == szFunc then
			WriteGsLog(4, format("[error][Event] watch_event(%s, %s, %s, %s) [%s] repeat handler", self.id, szScriptFile, szFunc, _show_table_short(para), strAllKey))
			--return 0
		end
	end
	if getn(tTail) >= EventImpl.max_watches then
		gDebug:show_msg(format("[error][Event] watch_event(%s, %s, %s, %s) key[%s] has more than [%d] watches", self.id, szScriptFile, szFunc, gVal2String(para), strAllKey, EventImpl.max_watches))
		return 0
	end
	
	local tWatch = _EventWatch:new(szScriptFile, szFunc, para, bTeamEvent or 0)
	if tWatch.trigger_by_team == 1 and self.trigger_by_team == 1 then
		gDebug:show_msg(format("[error][Event] watch_event(%s, %s, %s, %s, %d) event is fire_by_team, cannot use watch_by_team option", self.id, szScriptFile, szFunc, gVal2String(para), tWatch.trigger_by_team))
		tWatch.trigger_by_team = 0;
	end
	if EventImpl.talk_event[self.id] then
		local strForHash = format("[%s][%s][%s][%s]", self.id, strAllKey, szScriptFile, szFunc)
		tWatch.hash_key = tostring(String2Hash(strForHash)) --用字符串做hash_key 防止number溢出
		if EventImpl.events_handler_hash_map[tWatch.hash_key] then
			gDebug:show_msg(format("[error][Event] watch_event hash key conflict [%s, %s]", tWatch.hash_key, strForHash))
			tWatch.hash_key = ""
		else
			EventImpl.events_handler_hash_map[tWatch.hash_key] = tWatch
		end
	end
	tinsert(tTail, tWatch)
	self.nwatch = self.nwatch + 1
	SetEventWatchCount(self.id, self:_watch_vcount())
	return 1
end
function _EventHandlerMgr:remove(szScriptFile, szFunc)
	if gDebug:is_debug() == 1 then
		gDebug:show_debug_msg(format("[debug][Event] unwatch [%s][%s:%s]",self.id, szScriptFile, szFunc))
	end
	return self:_remove(self.handler, 0, szScriptFile, szFunc)
end
function _EventHandlerMgr:_remove(tHandler, nDepth, szScriptFile, szFunc)
	szFunc = szFunc or ""
	local nRet = 0
	if nDepth < self.nkey then
		for k,v in tHandler do
			local n = self:_remove(v, nDepth+1, szScriptFile, szFunc)
			nRet = nRet + n
		end
	else
		local iMax = getn(tHandler)
		local i = 1
		while i <= iMax do
			local v = tHandler[i]
			if v.file == szScriptFile and (szFunc == "" or v.func == szFunc) then
--				if v.dispatch_black_list then
--					local nOldPlayerIndex = PalyerIndex
--					for k,_ in v.dispatch_black_list do
--						DecPlayerEventWatch(self.id) --这些watch已经删除了 这些玩家的event switch也该更新了
--					end
--					PalyerIndex = nOldPlayerIndex
--				end
				if v.hash_key ~= "" then--删除hash映射
					EventImpl.events_handler_hash_map[v.hash_key] = nil
				end
				tremove(tHandler, i) --删除了一个下标，注意对遍历table的循环的影响
				iMax = iMax - 1
				i = i - 1
				self.nwatch = self.nwatch - 1
				nRet = nRet + 1
			end
			i = i + 1
		end
		SetEventWatchCount(self.id, self:_watch_vcount())
	end
	return nRet
end
function _EventHandlerMgr:enable_player_event_watch_dispatch(szScriptFile, szFunc, nBatchIdx, bEnable)
	if gDebug:is_debug() == 1 then
		gDebug:show_debug_msg(format("[debug][Event] P%d enable_player_event_watch_dispatch [%s][%s:%s %d]", PlayerIndex, self.id, szScriptFile, szFunc, bEnable))
	end
	return self:_enable_player_event_watch_dispatch(self.handler, 0, szScriptFile, szFunc, nBatchIdx, bEnable)
end
function _EventHandlerMgr:_enable_player_event_watch_dispatch(tHandler, nDepth, szScriptFile, szFunc, nBatchIdx, bEnable)
	szFunc = szFunc or ""
	local nRet = 0
	
	if nDepth < self.nkey then
		for k,v in tHandler do
			local n = self:_enable_player_event_watch_dispatch(v, nDepth+1, szScriptFile, szFunc, nBatchIdx, bEnable)
			nRet = nRet + n
		end
	else
		local nPlayerEventSwitchId = GetPlayerEventSwitchId(self.id)
		local nPlayerEventSwitch = -1
    	if nPlayerEventSwitchId > 0 then
    		nPlayerEventSwitch = GetPlayerEventSwitch(self.id)
    	end
		for i = 1,getn(tHandler) do
			local tWatch = tHandler[i]
			local bOldSwitch = 1
			if tWatch.dispatch_black_list then
				bOldSwitch = 1 - (tWatch.dispatch_black_list[PlayerIndex] or 0)
			end
			--脚本默认开关是打开的，但是C++开关默认是关闭的 如果发现C++开关为0 并且发现脚本是打开的 就说明需要同步一下状态
			if 1 == bOldSwitch and 0 == nPlayerEventSwitch then
				nPlayerEventSwitch = -1
				for i=1,self.nwatch do
					IncPlayerEventSwitch(self.id)
				end
			end
			if (szScriptFile == "" or tWatch.file == szScriptFile) and (szFunc == "" or tWatch.func == szFunc) then
				local nWatchBatchIdx = tWatch.para[getn(tWatch.para)] or 0 --如果是批量注册 最后一个参数是批量列表中的Index
				if nBatchIdx == 0 or nBatchIdx == nWatchBatchIdx then
    				if bOldSwitch ~= bEnable then--要检查一下原来的状态
    					local t = tWatch.dispatch_black_list or {}
    					if bEnable and bEnable == 1 then
    						t[PlayerIndex] = nil
        				else
        					t[PlayerIndex] = 1
        				end
            			if nPlayerEventSwitchId > 0 then--如果有定义PlayerEventSwitch 更新C++对应的开关
        					if 1 == bEnable then
        						IncPlayerEventSwitch(self.id)
        					else
        						DecPlayerEventSwitch(self.id)
        					end
    					end
        				tWatch.dispatch_black_list = t
        				nRet = nRet + 1
        				gDebug:show_debug_msg(format("[EventCenter] {%s} player_event_watch_dispatch {%s|%s|%d} enable=%d", GetName(), szScriptFile, szFunc, nBatchIdx, bEnable))
    				end
				end
			end
		end
	end
	return nRet
end

function _EventHandlerMgr:show()
	local szMsg = format("Event(%s) Help(%s) Keys(%d) Watches(%d)", self.id, self.help, self.nkey, self.nwatch)
	gDebug:show_msg(szMsg)
	self:_show(self.handler, 0)
end
function _EventHandlerMgr:_show(tHandler, nDepth)
	if nDepth < self.nkey then
		for k,v in tHandler do
			self:_show(v, nDepth+1)
		end
	else
		for i=1,getn(tHandler) do
			local tWatch = tHandler[i]
			local szMsg = format("tar=%s:%s,team=%d,hash=%s,para=%s,hijack=%s"
				, tWatch.file, tWatch.func, tWatch.trigger_by_team, tWatch.hash_key, _show_table_short(tWatch.para), _show_table_keys(tWatch.dispatch_black_list))
			gDebug:show_msg(szMsg)
		end
	end
end
function _EventHandlerMgr:trigger(szEventId, data, trigger_by_team)
	local d = self.data_convert_func(data) --自动转换参数的格式
	local nRet = self:_trigger(self.handler, 0, szEventId, d, trigger_by_team)
	if gDebug:is_debug() == 1 then
    	gDebug:show_debug_msg(format("[debug][Event] P%d fire_event (%s, %s->%s, %d)=%d",PlayerIndex, szEventId, _show_table_short(data), _show_table_short(d), trigger_by_team, nRet))
    end
    EventImpl.fire_cnt = EventImpl.fire_cnt + 1
    if not EventImpl.talk_event[szEventId] then
    	EventImpl.fire_none_talk_cnt = EventImpl.fire_none_talk_cnt + 1
    	if nRet > 0 then
    		EventImpl.dispatch_cnt = EventImpl.dispatch_cnt + 1
    	end
    end
	return nRet
end
function _EventHandlerMgr:_trigger(tHandler, nDepth, szEventId, data, trigger_by_team)
	local nRet = 0
	local nKeyIdx = nDepth + 1
	if nKeyIdx <= self.nkey then --需要通过关键字接着往下层遍历
		local key = data[nKeyIdx]
		if EventImpl.freq_event[self.id] then
			if key then
				for k,t in tHandler do
					if k > 0 and mod(key, k) == 0 then
						local n = self:_trigger(t, nDepth+1, szEventId, data, trigger_by_team)
						nRet = nRet + n
					end
				end
			end
		else
			if key and tHandler[key] then
    			local n = self:_trigger(tHandler[key], nDepth+1, szEventId, data, trigger_by_team)
    			nRet = nRet + n
    		elseif EventImpl.talk_event[self.id] then --没人关注这个talk事件，那也需要调用原始会话脚本
    			local n = self:_trigger(nil, self.nkey, szEventId, data)--直接用nil触发
    			nRet = nRet + n
    		end
    		if tHandler[EventImpl.any_key] then
    			local n = self:_trigger(tHandler[EventImpl.any_key], nDepth+1, szEventId, data, trigger_by_team)
    			nRet = nRet + n
    		end
		end
	else
		if "event_npc_talk" == self.id then
			_trigger_npc_talk_event(tHandler,data)
			EventImpl.talk_cnt = EventImpl.talk_cnt + 1
		elseif "event_item_talk" == self.id then
			_trigger_item_talk_event(tHandler,data)
			EventImpl.talk_cnt = EventImpl.talk_cnt + 1
		else
			if not tHandler then return 0 end
			
			local i = 1
    		while i <= getn(tHandler) do --触发tHandler中的所有函数
    			local tWatch = tHandler[i]
    			if tWatch then
    				nRet = nRet + tWatch:trigger(self, data, trigger_by_team)
    			else--lua这个该死的bug，这样遍历i都会越界
    				WriteGsLog(6,format("lua bug: i=%d n=%d handle=%s", i,getn(tHandler), gVal2String(tHandler)),1)
    				--self:show()
    			end
    			i = i + 1
    		end
    	end
	end
	return nRet
end

function __event_center_on_new_day__(today)
	local _today = today
	if not _today then
		_today = tonumber(date("%Y%m%d"))
	end
	EventImpl.today_date = _today
end

function _check_new_date()
	if EventImpl.today_date > 0 then
		local nPlayerDate = GetTask(2913)
		if EventImpl.today_date > nPlayerDate then
--			local szTitle = format("<color=gold>%s:<color>%s", "系统", "新的一天到了，为了侠士更好游戏，系统建议重新登录。")
--			local tSay = {}
--			tinsert(tSay, format("%s/ExitGame", "重新登录"))
--        	tinsert(tSay, format("%s/nothing", "稍后"))
--        	Say(szTitle, getn(tSay), tSay)
        	FireEvent("event_player_new_day_check", EventImpl.today_date, nPlayerDate)
        	bt_SetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR, 1)
			return 0
		end
	end
	return 0
end

function _trigger_npc_talk_event(tList, data)
	
	--跨天重新登录选项
	if 1 == _check_new_date() then return 0	end
	
	local nIndex = data[3]
	if tList and getn(tList) > 0 then
		local szTitle = format("<color=gold>%s:<color>%s", GetNpcName(nIndex), "C竎 h� c� vi謈 g� kh玭g?")
		local tSay = {}
		if getn(tList) == 1 and _get_obj_script(nIndex, EventImpl.OBJ_NPC) == "" then
			local v = tList[1]
			_trigger_by_hash(v.hash_key, nIndex)
		else
			for i=1,getn(tList) do
        		local tWatch = tList[i]
        		if tWatch:script_level_dispatch_hijack(0) ~= 1 then --watch-level dispatch hijack
        			local szWords = tWatch.para[3] or "Ho箃 ng"
        			tinsert(tSay, format("%s/#_trigger_by_hash(%s,%d)", szWords, gVal2String(tWatch.hash_key), nIndex))
        		end
        	end
        	tinsert(tSay, format("%s/#_npc_talk_main(%d)", "Ta c莕 x� l� nh鱪g vi謈 kh竎", nIndex))
        	tinsert(tSay, format("%s/nothing", "Ra kh醝"))
        	Say(szTitle, getn(tSay), tSay)
		end
	else
		_npc_talk_main(nIndex)
	end
	return 1
end
function _trigger_item_talk_event(tList, data)
	
	--跨天重新登录选项
	if 1 == _check_new_date() then return 0	end
	
	local nIndex = data[2]
	if tList and getn(tList) > 0 then
		local szTitle = format("<color=gold>%s:<color>%s", GetItemName(nIndex), "C竎 h� c� vi謈 g� kh玭g?")
		local tSay = {}
		if getn(tList) == 1 and _get_obj_script(nIndex, EventImpl.OBJ_ITEM) == "" then
			local v = tList[1]
			_trigger_by_hash(v.hash_key, nIndex)
		else
			for i=1,getn(tList) do
        		local tWatch = tList[i]
        		if tWatch:script_level_dispatch_hijack(0) ~= 1 then --watch-level dispatch hijack
        			local szWords = tWatch.para[2] or "Ho箃 ng"
        			tinsert(tSay, format("%s/#_trigger_by_hash(%s,%d)", szWords, gVal2String(tWatch.hash_key), nIndex))
        		end
        	end
        	tinsert(tSay, format("%s/#_item_talk_main(%d)", "Ta c莕 x� l� nh鱪g vi謈 kh竎", nIndex))
        	tinsert(tSay, format("%s/nothing", "Ra kh醝"))
        	Say(szTitle, getn(tSay), tSay)
		end
	else
		_item_talk_main(nIndex)
	end
	return 1
end
function _trigger_by_hash(szHash, nIndex)
	if szHash == "" then
		error("hash error")
	end
	local t = EventImpl.events_handler_hash_map[szHash]
	if t then
		SetPlayerScript(t.file)
		SendScript2VM(t.file, format("%s(%d)", t.func, nIndex))
	end
end
function _get_obj_script(nIndex, nObjType)
	local szScript = ""
	if nObjType == EventImpl.OBJ_NPC then
		szScript = GetNpcScript(nIndex)
	elseif nObjType == EventImpl.OBJ_ITEM then
		szScript = GetItemScript(nIndex)
	end
	szScript = szScript or ""
	return szScript
end
function _npc_talk_main(nIndex)
	--没办法我再接一棒
	local bRet = TriggerMisEvent("event_talk_npc", GetNpcName(nIndex), nIndex, "C� vi謈 g� kh玭g?");
	if bRet and bRet > 0 then
		return
	end
	
	local script = _get_obj_script(nIndex, EventImpl.OBJ_NPC)
	if not script or script == "" then		
		local szTitle = format("<color=gold>%s<color>: %s", GetNpcName(nIndex), "L骳 kh玭g c� vi謈 g� l祄 th藅 l� ch竛 m� ~~")
		Talk(1, "", szTitle)
		return
	end
	
	SetPlayerScript(script)
	SendScript2VM(script,format("main()")) --missionbase里面要求main(id=nil)才是Talk 这个略恶心 所以nIndex不能传进去
end
function _item_talk_main(nIndex)	
	--没办法我再接一棒
	local bRet = TriggerMisEvent("event_use_item", format("%d%d%d", GetItemGenre(nIndex), GetItemDetail(nIndex), GetItemParticular(nIndex)), nIndex, "");
	if bRet and bRet > 0 then
		return
	end
	
	local script = _get_obj_script(nIndex, EventImpl.OBJ_ITEM)
	if not script or script == "" then
		--Talk(1, "", "好无聊啊")
		return
	end
	
	SetPlayerScript(script)
	SendScript2VM(script,format("OnUse(%d)", nIndex))
end
--------------------------------------------------------------------------------------------

function EventImpl:_init()
	self.events = {}
	self.events_with_player_event_switch = {}
	self.hijack_cnt = 0
	self.trigger_cnt = 0
	self.exec_cnt = 0
	self.start_time_stamp = GetTime()
	
	self:define_all_events_ks()					--在脚本和C++中定义所有的event字符串和属性
	--self:define_all_events_vng()
	self:_define_all_player_event_switches() 	--在C++定义所有的PlayerEventSwitch
	self:_reset_all_event_watch_count()			--在C++中初始化所有的监听者计数器,注意顺序，这个放到最后
	
end

--------------------------------------------------------------------global interface
function watch_event(szEventId, szScriptFile, szFunc, ...)
	return EventImpl:watch_event(szEventId or "", szScriptFile or "", szFunc or "", arg)
end

function unwatch_event(szEventId, szScriptFile, szFunc)
	return EventImpl:unwatch_event(szEventId or "", szScriptFile or "", szFunc or "")
end

function fire_event(szEventId, ...)
	return EventImpl:fire_event(szEventId or "", arg, 0)
end

function fire_event_team(szEventId, ...)
	return EventImpl:fire_event(szEventId or "", arg, 1)
end

function show_event(szEventId)
	return EventImpl:show_event(szEventId)
end

--watch级别的dispatch_black_list开关
--可以对所有event的任何watch阻止派发
--这个hijack对talk_event同样有效
function enable_player_event_watch_dispatch(szEventId, szScriptFile, szFunc, nBatchIdx, bEnable)
	return EventImpl:enable_player_event_watch_dispatch(szEventId or "", szScriptFile or "", szFunc or "", nBatchIdx or 0, bEnable or 0)
end

--isolate级别的event开关，可以阻止一些尚未生效的isolate的一切event派发动作
--也可针对特定玩家阻止某个isolate的event向其派发，如月卡event不需要在未激活月卡的player身上触发
--这个开关对talk_event无效
function enable_isolate_event_dispatch(szScriptFile, player_index, bEnable)
	return EventImpl:enable_isolate_event_dispatch(szScriptFile or "", player_index or -1, bEnable or 0)
end
