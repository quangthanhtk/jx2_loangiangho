--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: ����isolateϵͳȫ�ֺ������event_centerʵ�� ��C++��һ����Ч��event_center��֮�����ս
--related files: 
--=============================================

EventImpl = { --�ȶ���table ����Include��ͷ�ļ�Ҫ��
	thisVM = "\\settings\\static_script\\isolate\\base\\event_center\\event_impl.lua",
	szVM = "\\settings\\static_script\\isolate\\base\\script_data_center.lua",
	events = {}, --�¼�������
	events_with_player_event_switch = {}, --��PlayerEventSwitch��EventIds
	events_handler_hash_map = {},--�¼����Ӻ���hash_map
	start_time_stamp = 0,
	hijack_cnt = 0,
	trigger_cnt = 0,
	exec_cnt = 0,
	fire_cnt = 0,
	fire_none_talk_cnt = 0,
	dispatch_cnt = 0,
	talk_cnt = 0,
	any_key = "#any#", --Ĭ�ϵ�key
	any_key_string = "",
	any_key_number = -1,
	max_keys = 4, --���֧�ֵ�key����
	max_watches = 30, --���֧�ֵĹ۲��߸���
	
	today_date = 0, --��������� Format: 20160223
	
	OBJ_NPC = 1,
	OBJ_ITEM = 2,
	
	player_event_switch_none = 0,
	player_event_switch_event_level = 1,
	team_event_prefix = "TEAM_",
	team_event_prefix_len = 5,
	
	dispatch_black_list = { --fire_event�ɷ���������������ֹһЩ��δ��Ч��isolate���¼�����
		--���¿���δ�����������߿���Ӹ���Һ����������¿�ģ��������¼����������Player�ɷ�
		--[file] = {player_list}
	},
	freq_event = {--���ڵ��õ��¼���para�ǵ���Ƶ�ʶ�����ʵ�ʵ�key
		event_server_tick 					= 1,
		event_server_tick_minute 			= 1,
		event_server_tick_hour 				= 1,
		event_player_tick 					= 1,
		event_player_tick_minute 			= 1,
		event_player_tick_hour 				= 1,
		event_player_daily_online_minute	= 1,
	},
	talk_event = {--�Ự�¼� ��Щ�������Ҫ���⴦��
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

--��ȡ�Ƿ�����Ը�isolate��dispatch black list
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

--nFilterKeys��ʾ���ڹ��˵�Key���� ��npc����¼�����name��map�������˵�key
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
	if player_event_switch_type and player_event_switch_type > self.player_event_switch_none then --��Switch��PlayerEvent
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
		self.events_with_player_event_switch[k] = DefPlayerEventSwitch(k) --����PlayerEventSwitch
	end
end
function EventImpl:_reset_all_event_watch_count()
	for k,tEvent in self.events do
		SetEventWatchCount(k, tEvent:_watch_vcount())
	end
end

--�������TEAM_ǰ׺��Ҫ�����,�Ǹ�����event_id��һ����
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


--�̳�
function _inherit(base)	--����һ���̳к���
	local derive = {}
	local foo = function(t,i)	--����"index"����
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
_EventWatch = { --һ���¼�����
	file = "",
	func = "",
	para = nil,
	hash_key = "", 
	trigger_by_team =  0,
	dispatch_black_list = nil, --{PlayerIndex}��ֹ��Watch�����ɷ���player
}
function _EventWatch:new(szScriptFile, szFunc, para, trigger_by_team)
	local t=_inherit(self)
	t.file = szScriptFile
	t.func = szFunc
	t.para = para or {}
	t.hash_key = ""
	t.trigger_by_team = trigger_by_team
	t.dispatch_black_list = nil--Ĭ�ϳ�ʼ��Ϊnil,�к����������ٹ���table
	return t
end

function _EventWatch:trigger(tEvent, data, trigger_by_team)
	EventImpl.trigger_cnt = EventImpl.trigger_cnt + 1
	
	--ͨ������������ �۲��ߺ������Ի�õ���ע�������ʱ���ṩ��һЩ���� ���̫������
	local szCode = format("%s(%s, %s)", self.func, gVal2String(data), gVal2String(self.para))
	
	local bByTeam = 0
	local nRet = 0
	local nTeamSize = GetTeamSize()
	if nTeamSize > 1 and (trigger_by_team == 1 or tEvent.trigger_by_team == 1 or self.trigger_by_team == 1) then --��team����
		bByTeam = 1
		local oldPlayerIndex = PlayerIndex;
		local nMasterMap = GetWorldPos()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nMap = GetWorldPos()
			if nMap == nMasterMap then--ֻ����ͬһ��ͼ�Ķ�Ա�Ŵ����¼�
				if self:script_level_dispatch_hijack(1) == 0 then --script-level dispatch hijack
					SendScript2VM(self.file, szCode)
					nRet = nRet + 1
				end
			end
		end
		PlayerIndex = oldPlayerIndex
	else--�Ը��˴���
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
		if EventImpl:isolate_dispatch_hijack(self.file) == 1 then --isolate�����dispatch����
    		EventImpl.hijack_cnt = 	EventImpl.hijack_cnt + 1--ͳ��
    		return 1
    	end
	end
	if self.dispatch_black_list and self.dispatch_black_list[PlayerIndex] then --Watch�����PlayerEventSwitch
		EventImpl.hijack_cnt = 	EventImpl.hijack_cnt + 1--ͳ��
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
    	if nVCount == 0 and EventImpl.talk_event[self.id] then --TalkEventһ�����ܱ�C++�ػ����Դ��������ܳ�ʼ����0
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
		if g ~= 2 then--ֻ֧��item_other�ĶԻ����
			gDebug:show_msg(format("[error][Event] watch [%s, %s, %s, %s] only support item_other(g=2)", self.id, szScriptFile, szFunc, gVal2String(para)))
			return 0
		end
	end
	
	local nParaCnt = getn(para)
	local szPrefix = "_batch_watch_list_handler_"
	if strsub(szFunc, 1, strlen(szPrefix)) == szPrefix then
		nParaCnt = nParaCnt - 1 --����ע������һ����������key
	end
	
	if nParaCnt < need_keys then
		gDebug:show_msg(format("[error][Event] watch need at least[%d] keys, [%s, %s, %s, %s]", need_keys, self.id, szScriptFile, szFunc, gVal2String(para)))
		return 0
	end
	
	local tTail = self.handler
	local strAllKey = ""
	for i=1,self.nkey do
		local key = para[i] or EventImpl.any_key
		if key == EventImpl.any_key_string or key == EventImpl.any_key_number then --Ĭ�ϵ����ܲ���
			key = EventImpl.any_key
		end
		
		if EventImpl.talk_event[self.id] then--�����Ի��¼���������any_key�¼�
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
		tWatch.hash_key = tostring(String2Hash(strForHash)) --���ַ�����hash_key ��ֹnumber���
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
--						DecPlayerEventWatch(self.id) --��Щwatch�Ѿ�ɾ���� ��Щ��ҵ�event switchҲ�ø�����
--					end
--					PalyerIndex = nOldPlayerIndex
--				end
				if v.hash_key ~= "" then--ɾ��hashӳ��
					EventImpl.events_handler_hash_map[v.hash_key] = nil
				end
				tremove(tHandler, i) --ɾ����һ���±꣬ע��Ա���table��ѭ����Ӱ��
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
			--�ű�Ĭ�Ͽ����Ǵ򿪵ģ�����C++����Ĭ���ǹرյ� �������C++����Ϊ0 ���ҷ��ֽű��Ǵ򿪵� ��˵����Ҫͬ��һ��״̬
			if 1 == bOldSwitch and 0 == nPlayerEventSwitch then
				nPlayerEventSwitch = -1
				for i=1,self.nwatch do
					IncPlayerEventSwitch(self.id)
				end
			end
			if (szScriptFile == "" or tWatch.file == szScriptFile) and (szFunc == "" or tWatch.func == szFunc) then
				local nWatchBatchIdx = tWatch.para[getn(tWatch.para)] or 0 --���������ע�� ���һ�������������б��е�Index
				if nBatchIdx == 0 or nBatchIdx == nWatchBatchIdx then
    				if bOldSwitch ~= bEnable then--Ҫ���һ��ԭ����״̬
    					local t = tWatch.dispatch_black_list or {}
    					if bEnable and bEnable == 1 then
    						t[PlayerIndex] = nil
        				else
        					t[PlayerIndex] = 1
        				end
            			if nPlayerEventSwitchId > 0 then--����ж���PlayerEventSwitch ����C++��Ӧ�Ŀ���
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
	local d = self.data_convert_func(data) --�Զ�ת�������ĸ�ʽ
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
	if nKeyIdx <= self.nkey then --��Ҫͨ���ؼ��ֽ������²����
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
    		elseif EventImpl.talk_event[self.id] then --û�˹�ע���talk�¼�����Ҳ��Ҫ����ԭʼ�Ự�ű�
    			local n = self:_trigger(nil, self.nkey, szEventId, data)--ֱ����nil����
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
    		while i <= getn(tHandler) do --����tHandler�е����к���
    			local tWatch = tHandler[i]
    			if tWatch then
    				nRet = nRet + tWatch:trigger(self, data, trigger_by_team)
    			else--lua���������bug����������i����Խ��
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
--			local szTitle = format("<color=gold>%s:<color>%s", "ϵͳ", "�µ�һ�쵽�ˣ�Ϊ����ʿ������Ϸ��ϵͳ�������µ�¼��")
--			local tSay = {}
--			tinsert(tSay, format("%s/ExitGame", "���µ�¼"))
--        	tinsert(tSay, format("%s/nothing", "�Ժ�"))
--        	Say(szTitle, getn(tSay), tSay)
        	FireEvent("event_player_new_day_check", EventImpl.today_date, nPlayerDate)
        	bt_SetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR, 1)
			return 0
		end
	end
	return 0
end

function _trigger_npc_talk_event(tList, data)
	
	--�������µ�¼ѡ��
	if 1 == _check_new_date() then return 0	end
	
	local nIndex = data[3]
	if tList and getn(tList) > 0 then
		local szTitle = format("<color=gold>%s:<color>%s", GetNpcName(nIndex), "C�c h� c� vi�c g� kh�ng?")
		local tSay = {}
		if getn(tList) == 1 and _get_obj_script(nIndex, EventImpl.OBJ_NPC) == "" then
			local v = tList[1]
			_trigger_by_hash(v.hash_key, nIndex)
		else
			for i=1,getn(tList) do
        		local tWatch = tList[i]
        		if tWatch:script_level_dispatch_hijack(0) ~= 1 then --watch-level dispatch hijack
        			local szWords = tWatch.para[3] or "Ho�t ��ng"
        			tinsert(tSay, format("%s/#_trigger_by_hash(%s,%d)", szWords, gVal2String(tWatch.hash_key), nIndex))
        		end
        	end
        	tinsert(tSay, format("%s/#_npc_talk_main(%d)", "Ta c�n x� l� nh�ng vi�c kh�c", nIndex))
        	tinsert(tSay, format("%s/nothing", "Ra kh�i"))
        	Say(szTitle, getn(tSay), tSay)
		end
	else
		_npc_talk_main(nIndex)
	end
	return 1
end
function _trigger_item_talk_event(tList, data)
	
	--�������µ�¼ѡ��
	if 1 == _check_new_date() then return 0	end
	
	local nIndex = data[2]
	if tList and getn(tList) > 0 then
		local szTitle = format("<color=gold>%s:<color>%s", GetItemName(nIndex), "C�c h� c� vi�c g� kh�ng?")
		local tSay = {}
		if getn(tList) == 1 and _get_obj_script(nIndex, EventImpl.OBJ_ITEM) == "" then
			local v = tList[1]
			_trigger_by_hash(v.hash_key, nIndex)
		else
			for i=1,getn(tList) do
        		local tWatch = tList[i]
        		if tWatch:script_level_dispatch_hijack(0) ~= 1 then --watch-level dispatch hijack
        			local szWords = tWatch.para[2] or "Ho�t ��ng"
        			tinsert(tSay, format("%s/#_trigger_by_hash(%s,%d)", szWords, gVal2String(tWatch.hash_key), nIndex))
        		end
        	end
        	tinsert(tSay, format("%s/#_item_talk_main(%d)", "Ta c�n x� l� nh�ng vi�c kh�c", nIndex))
        	tinsert(tSay, format("%s/nothing", "Ra kh�i"))
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
	--û�취���ٽ�һ��
	local bRet = TriggerMisEvent("event_talk_npc", GetNpcName(nIndex), nIndex, "C� vi�c g� kh�ng?");
	if bRet and bRet > 0 then
		return
	end
	
	local script = _get_obj_script(nIndex, EventImpl.OBJ_NPC)
	if not script or script == "" then		
		local szTitle = format("<color=gold>%s<color>: %s", GetNpcName(nIndex), "L�c kh�ng c� vi�c g� l�m th�t l� ch�n m� ~~")
		Talk(1, "", szTitle)
		return
	end
	
	SetPlayerScript(script)
	SendScript2VM(script,format("main()")) --missionbase����Ҫ��main(id=nil)����Talk ����Զ��� ����nIndex���ܴ���ȥ
end
function _item_talk_main(nIndex)	
	--û�취���ٽ�һ��
	local bRet = TriggerMisEvent("event_use_item", format("%d%d%d", GetItemGenre(nIndex), GetItemDetail(nIndex), GetItemParticular(nIndex)), nIndex, "");
	if bRet and bRet > 0 then
		return
	end
	
	local script = _get_obj_script(nIndex, EventImpl.OBJ_ITEM)
	if not script or script == "" then
		--Talk(1, "", "�����İ�")
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
	
	self:define_all_events_ks()					--�ڽű���C++�ж������е�event�ַ���������
	--self:define_all_events_vng()
	self:_define_all_player_event_switches() 	--��C++�������е�PlayerEventSwitch
	self:_reset_all_event_watch_count()			--��C++�г�ʼ�����еļ����߼�����,ע��˳������ŵ����
	
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

--watch�����dispatch_black_list����
--���Զ�����event���κ�watch��ֹ�ɷ�
--���hijack��talk_eventͬ����Ч
function enable_player_event_watch_dispatch(szEventId, szScriptFile, szFunc, nBatchIdx, bEnable)
	return EventImpl:enable_player_event_watch_dispatch(szEventId or "", szScriptFile or "", szFunc or "", nBatchIdx or 0, bEnable or 0)
end

--isolate�����event���أ�������ֹһЩ��δ��Ч��isolate��һ��event�ɷ�����
--Ҳ������ض������ֹĳ��isolate��event�����ɷ������¿�event����Ҫ��δ�����¿���player���ϴ���
--������ض�talk_event��Ч
function enable_isolate_event_dispatch(szScriptFile, player_index, bEnable)
	return EventImpl:enable_isolate_event_dispatch(szScriptFile or "", player_index or -1, bEnable or 0)
end
