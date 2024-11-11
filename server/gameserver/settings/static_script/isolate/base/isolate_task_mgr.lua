Include("\\settings\\static_script\\global\\bit_task_support.lua")
--为isolate定制的task manager
--为外部提供通过name或idx访问的任务变量提供接口
--模块上线之前离线的角色，上线自动重置所有任务变量

--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}


------------------------------------------------------------------------------
--以下接口Id，Byte，Word，Bit同时支持number和string类型，自动识别
function get_task(Id)
	return IsolateTaskManager:get_task(Id)
end
function set_task(Id, nValue)
	return IsolateTaskManager:set_task(Id, nValue)
end
function add_task(Id, nValue)
	return IsolateTaskManager:add_task(Id, nValue)
end
function get_task_byte(Id, Byte)
	return IsolateTaskManager:get_task_byte(Id, Byte)
end
function set_task_byte(Id, Byte, nValue)
	return IsolateTaskManager:set_task_byte(Id, Byte, nValue)
end
function add_task_byte(Id, Byte, nValue)
	return IsolateTaskManager:add_task_byte(Id, Byte, nValue)
end
function get_task_word(Id, Word)
	return IsolateTaskManager:get_task_word(Id, Word)
end
function set_task_word(Id, Word, nValue)
	return IsolateTaskManager:set_task_word(Id, Word, nValue)
end
function add_task_word(Id, Word, nValue)
	return IsolateTaskManager:add_task_word(Id, Word, nValue)
end
function get_task_bit(Id, Bit)
	return IsolateTaskManager:get_task_bit(Id, Bit)
end
function set_task_bit(Id, Bit, nValue)
	return IsolateTaskManager:set_task_bit(Id, Bit, nValue)
end
function get_task_id(Id)
	return IsolateTaskManager:get_task_id(Id)
end
function get_task_sub_id(Id,SubId)
	return IsolateTaskManager:get_task_sub_id(Id, SubId)
end
------------------------------------------------------------------------------
function _event_on_isolate_taskmanager_clear(data,para)
	local szType = para[1]
	--local nCurDate, nLastDate = unpack(data)
	return _isolate_taskmanager_clear(szType)
end
function _isolate_taskmanager_clear(szType)
	return IsolateTaskManager:clear(szType)
end

IsolateTaskManager = {
	container = nil,
}

function IsolateTaskManager:init(tList, tTaskGroup)
	WatchEvent("event_player_login", isolate_main_script(), "__event_on_player_login_tsk_mgr__")
	WatchEvent("event_player_new_day_check", isolate_main_script(), "__event_on_player_new_day_check_tsk_mgr__")
	if not tList then
		self.container = nil
		return
	end
	if tTaskGroup then
		tHandleTaskGroup.list = tList
		tHandleTaskGroup.group = tTaskGroup
		self.container = tHandleTaskGroup
	else
		tHandleTaskList.list = tList
		self.container = tHandleTaskList
	end
	--构建taskname和idx映射
	local tClear = {}
	local t = {}
	local tClearType = {daily="event_daily_clear", weekly="event_weekly_clear", monthly="event_monthly_clear", }
	for i=1,getn(tList)  do
		local v = tList[i]
		local name = v.id[1] or ""
		if name=="" or t[name] then
			return error(format("error task config:idx=%d name=%s", i, name))
		end
		if v.clear and tClearType[v.clear] then
			tClear[v.clear] = tClearType[v.clear]
		end
		--tClear["daily"] = tClearType["daily"] --只要有变量 每日清理必然执行
		t[name] = v
		
	end
	self.container.name_map = t
	--注册清理事件
	for k,v in tClear do
		WatchEvent(v, isolate_main_script(), "_event_on_isolate_taskmanager_clear", k)
	end
end
function __event_on_player_login_tsk_mgr__()
	__check_and_clear__(1)
	--bt_SetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR, 0)--重新登录过就把这个标志清0
end
function __event_on_player_new_day_check_tsk_mgr__()
	__check_and_clear__(0)
end
function __check_and_clear__(bLogin)
	local nLastLoginTime = GetLastLoginTime()
	local nIsolateOpenTime = GetIsolateOpenTime(isolate_main_script())
	--清理功能上线12小时后开启的isolate才执行清理
	local nMinFuncOnlineTime = GetIsolateOpenTime("\\settings\\static_script\\isolate\\base\\event_center\\base_handler\\main.lua") + 12*3600
	if nIsolateOpenTime > nMinFuncOnlineTime and --功能开启12小时后才执行清理
		nLastLoginTime > 0 and
		nLastLoginTime < nIsolateOpenTime then --如果在isolate上线之前离线，则清理所有任务变量
		if 1 == bLogin or 0 == bt_GetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR) then
			local szLog = format("[isolate] first_login_clear name=%s nLastLoginTime=%d nIsolateOpenTime=%d script=%s", GetName(), nLastLoginTime, nIsolateOpenTime, isolate_main_script())
			WriteGsLog(6, szLog)
			_isolate_taskmanager_clear("all")
			if on_first_login_clear then --回调函数
				local y,m,d,h,min,s = GmTime(nLastLoginTime)
				on_first_login_clear(y*10000+m*100+d)
			end
			local szViewName = isolate_view_name() or ""
			if szViewName ~= "" then
				local szMsg = format("[%s] ho箃 ng  頲 thi誸 l藀 l筰", szViewName)
				Msg2Player(szMsg)
			end
		end
	end
end
function IsolateTaskManager:clear(szType)--szType="all"|"daily"|"weekly"|"monthly"|"readonly"
	if not self.container then return end
	--if szType=="daily" and GetLastLogoutTime() < IsolateOnlineTime() then szType = "all" end --GetTime()
	local tType = {all=7, daily=1, weekly=2, monthly=4, }
	if not tType[szType] then return error("szType error") end
	
	for i=1,getn(self.container.list) do
		local t = self.container.list[i]
		if (szType == "all" and t.clear ~= "readonly") or t.clear == szType then
			self.container:set_task(i, 0)
		end
	end
end
function IsolateTaskManager:get_task(Id)
	return self.container:get_task(Id)
end
function IsolateTaskManager:set_task(Id, nValue)
	return self.container:set_task(Id, nValue)
end
function IsolateTaskManager:add_task(Id, nValue)
	local nOldVal = self:get_task(Id)
	local nNewVal = nOldVal + nValue
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:get_task_byte(Id, Byte)
	local nOldVal = self:get_task(Id)
	local nByte = _get_sub_unit(self.container, Id, Byte)
	assert(nByte>=1 and nByte <= 4)
	return SafeGetByte(nOldVal, nByte)
end
function IsolateTaskManager:set_task_byte(Id, Byte, nValue)
	local nOldVal = self:get_task(Id)
	local nByte = _get_sub_unit(self.container, Id, Byte)
	assert(nByte>=1 and nByte <= 4)
	local nNewVal = SafeSetByte(nOldVal, nByte, nValue)
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:add_task_byte(Id, Byte, nValue)
	local nOldVal = self:get_task(Id)
	local nByte = _get_sub_unit(self.container, Id, Byte)
	assert(nByte>=1 and nByte <= 4)
	local nByteNewVal = SafeGetByte(nOldVal, nByte) + nValue
	if nByteNewVal < 0 or  nByteNewVal > 255 then
		print("add_task_byte overflow:", Id, Byte, nValue, nByteNewVal)
    	if nByteNewVal < 0 then
    		nByteNewVal = 0
    	else
    		nByteNewVal = 255
    	end
	end
	local nNewVal = SafeSetByte(nOldVal, nByte, nByteNewVal)
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:get_task_word(Id, Word)
	local nOldVal = self:get_task(Id)
	local nWord = _get_sub_unit(self.container, Id, Word)
	return _getWord(nOldVal, nWord)
end
function IsolateTaskManager:set_task_word(Id, Word, nValue)
	local nOldVal = self:get_task(Id)
	local nWord = _get_sub_unit(self.container, Id, Word)
	local nNewVal = _setWord(nOldVal, nWord, nValue)
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:add_task_word(Id, Word, nValue)
	local nOldVal = self:get_task(Id)
	local nWord = _get_sub_unit(self.container, Id, Word)
	local nWordNewVal = _getWord(nOldVal, nWord) + nValue
	local nNewVal = _setWord(nOldVal, nWord, nValue)
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:get_task_bit(Id, Bit)
	local nOldVal = self:get_task(Id)
	local nBit = _get_sub_unit(self.container, Id, Bit)
	assert(nBit>=1 and nBit <= 32)
	return SafeGetBit(nOldVal, nBit)
end
function IsolateTaskManager:set_task_bit(Id, Bit, nValue)
	local nOldVal = self:get_task(Id)
	local nBit = _get_sub_unit(self.container, Id, Bit)
	assert(nBit>=1 and nBit <= 32)
	local nNewVal = SafeSetBit(nOldVal, nBit, nValue)
	return self:set_task(Id, nNewVal)
end
function IsolateTaskManager:get_task_id(Id)
	return self.container:get_task_id(Id)
end
function IsolateTaskManager:get_task_sub_id(Id,SubId)
	local nSubId = _get_sub_unit(self.container, Id, SubId)
	return nSubId
end

------------------------------------------------------------------------------
--底层数据容器，只提供基本的数据访问接口
tHandleTaskGroup = {list=nil, name_map=nil, group=nil}
function tHandleTaskGroup:get_task(Id)
	local tCfg = _get_task_cfg(self,Id)
	local idx = tCfg.id[2]
	return self.group:GetTask(idx)
end
function tHandleTaskGroup:set_task(Id, nValue)
	local tCfg = _get_task_cfg(self,Id)
	assert(tCfg.clear~="readonly")
	local idx = tCfg.id[2]
	return self.group:SetTask(idx, nValue)
end
function tHandleTaskGroup:get_task_id(Id)
	local tCfg = _get_task_cfg(self,Id)
	local idx = tCfg.id[2]
	return self.group:GetTaskId(idx)
end

---------------------------------------
tHandleTaskList = {list=nil, name_map=nil}
function tHandleTaskList:get_task(Id)
	local tCfg = _get_task_cfg(self,Id)
	local id = tCfg.id[2]
	return GetTask(id)
end
function tHandleTaskList:set_task(Id, nValue)
	local tCfg = _get_task_cfg(self,Id)
	assert(tCfg.clear~="readonly")
	local id,acc = tCfg.id[2],tCfg.id[3] or 0
	return SetTask(id, nValue, acc)
end
function tHandleTaskList:get_task_id(Id)
	local tCfg = _get_task_cfg(self,Id)
	local id = tCfg.id[2]
	return id
end

---------------------------------------
function _get_task_cfg(tContainer,Id)
	local ret = nil
	if type(Id) == "string" then
		ret = tContainer.name_map[Id]
		if not ret then
			error(format("not find task with name %s", Id))
		end
	else
		ret = tContainer.list[Id]
	end
	assert(ret)
	return ret
end
function _get_sub_unit(tContainer,TaskCfg, Id)
	local ret = Id
	if type(Id) == "string" then
		local tTaskCfg = TaskCfg
		if type(TaskCfg) ~= "table" then
			tTaskCfg = _get_task_cfg(tContainer,TaskCfg)
		end
		ret = tTaskCfg[Id]
		if not ret then
			error(format("not find task sub unit with name %s", Id))
		end
	end
	assert(ret)
	return ret
end

---------------------------------------
--nWordIdx = 1 or 2
function _getWord(nVal, nWordIdx)
	local nBytes = {SafeGetByte(nVal, 1), SafeGetByte(nVal, 2), SafeGetByte(nVal, 3), SafeGetByte(nVal, 4),}
	local nRet = 0
	if nWordIdx == 1 then
		nRet = nBytes[2] * 256 + nBytes[1]
	elseif nWordIdx == 2 then
		nRet = nBytes[4] * 256 + nBytes[3]
	else
		return error("invalid nWordIdx")
	end
	return nRet
end

function _setWord(nVal, nWordIdx, nWordVal)
	local nRet = nVal
	local nStartByte = 0
	if nWordIdx == 1 then
		nStartByte = 1
	elseif nWordIdx == 2 then
		nStartByte = 3
	else
		nStartByte = 0
		return error("invalid nWordIdx")
	end
	if nStartByte > 0 then
		if nWordVal < 0 or nWordVal > 65535 then
			print(format("isolate_task_mgr.lua setWord(nVal=%d, nWordIdx=%d, nWordVal=%d) nWordVal error", nVal, nWordIdx, nWordVal))
			if nWordVal < 0 then
				nWordVal = 0
			else
				nWordVal = 65535
			end
		end
		local nNewTaskValueTemp = SafeSetByte(nVal, nStartByte, SafeGetByte(nWordVal, 1))
		local nNewTaskValue = SafeSetByte(nNewTaskValueTemp, nStartByte + 1, SafeGetByte(nWordVal, 2))
		nRet = nNewTaskValue
	end
	return nRet
end
