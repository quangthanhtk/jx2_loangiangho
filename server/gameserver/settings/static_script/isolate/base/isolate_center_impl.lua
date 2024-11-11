Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")

IsolateCenterImpl = {
	isolate_max_init_step = 3,
	has_finish_init = 0,
	thisVM = "\\settings\\static_script\\isolate\\base\\isolate_center_impl.lua",
	szVM = "\\settings\\static_script\\isolate\\base\\script_data_center.lua",
	list = {}, --{eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile}
	load_cnt = 0,
	init_cnt = 0,
	_script_map = {},
	today_date = 0,
}

function IsolateCenterImpl:add_isolate(nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion)
	nTaskGroup = nTaskGroup or 0
	nTaskGroupVersion = nTaskGroupVersion or 0
	local nRet = self:_add_isolate(nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion)
	--local szPara = format("%s, %s, %d, %d, %d, %s, %d, %d", eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion)
	--gDebug:show_msg(format("[info][IsolateCenter] add_isolate(%s) = %d", szPara, nRet))
	return nRet
end

function IsolateCenterImpl:show_isolate()
	gDebug:show_msg(format("IsolateCenterImpl list:"))
	for i = 1, getn(self.list) do
		local v = self.list[i]
		gDebug:show_msg(_show_table_short(v))
	end
	gDebug:show_msg(format("IsolateCenterImpl list end, count=%d", getn(self.list)))
end

--跨天的处理，到期的模块加载，过期的模块卸载
function IsolateCenterImpl:handle_on_new_date(nNewDate, nOldDate)
	if self.today_date == nNewDate then return end --本来就是今天启动gs的 就不用理会了

	self.has_finish_init = 0 --重新初始化
	self.today_date = 0
	self:_init()
end

function IsolateCenterImpl:_add_isolate(nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile , nTaskGroup, nTaskGroupVersion)
	if self.has_finish_init ~= 0 then
		error(format(" Isolate system has fihished init, cannot do RegIsolate for {%s}", szMainScriptFile))
		return 0
	end
	
	local today = self.today_date
	
	if self._script_map[szMainScriptFile] then
		--error(format("Isolate {%s} has been registered", szMainScriptFile))
		return 0
	end
	self._script_map[szMainScriptFile] = self.today_date
	
	if _check_date(today, talk_begin_date, begin_date, end_date) ~= 1 then
		return 0
	end
	
	local nId = 0
	tinsert(self.list, {nId, nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion, self.today_date})
	
	return nId
end

function _dec_order_insert(t, key, val)
	local len = getn(t) + 1
	for i = 1, len do
		local ti = t[i]
		if i >= len or key > ti[1] then
			tinsert(t, i, {key, val})
			return i
		end
	end
end

--按优先级排序 并执行初始化函数
function IsolateCenterImpl:_sort_and_init()
	local tSort = {}
	for i = 1, getn(self.list) do
		local nPriority = self.list[i][2]
    	_dec_order_insert(tSort, nPriority, i) --按优先级降序插入
	end
	
	local tOrderList = {}
	for i = 1,getn(tSort) do
		local nIndex = tSort[i][2]
		local t = self.list[nIndex]
		t[1] = i --nId
		tOrderList[getn(tOrderList)+1] = t
	end
	self.list = tOrderList
	
	local bNewDay = 0
	--为每个模块执行初始化函数
	for i = 1,getn(self.list) do
		local t = self.list[i]
		local nId, nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile,nTaskGroup, nTaskGroupVersion, nLoadDate = unpack(t)
		if nLoadDate == self.today_date then
    		local szPara = format("%d, %s, %s, %d, %d, %d, %s", nId, gVal2String(eng_name), gVal2String(view_name), talk_begin_date, begin_date, end_date, gVal2String(szMainScriptFile))
        	local sCall = format("__on_isolate_init(%s)", szPara)
        	SendScript2VM(szMainScriptFile, sCall)
        	if nTaskGroup > 0 and nTaskGroupVersion > 0 then
        		sCall = format("__on_activity_init(%d, %d)", nTaskGroup, nTaskGroupVersion);
        		SendScript2VM(szMainScriptFile, sCall)
        	end
        	self.init_cnt = self.init_cnt + 1
        else
        	--其他已加载模块 发送new_day信号，自己检查是否需要卸载
        	local sCall = format("__isolate_on_new_day(%d)", self.today_date)
    		SendScript2VM(szMainScriptFile, sCall)
    		bNewDay = 1
        end
	end
	if 1 == bNewDay then
		local sCall = format("__event_center_on_new_day__(%d)", self.today_date)
		SendScript2VM(self.szVM, sCall)
	end
	self:_step_init()
	--self._script_map = nil --重复检测表用不着了
	self.has_finish_init = 1
	return 1
end

function IsolateCenterImpl:_load_isolate_list(tList)
	for i = 1, getn(tList) do
		local t = tList[i]
		local enable, szMainScriptFile = unpack(t)
		if enable and enable > 0 and szMainScriptFile then
			self.load_cnt = self.load_cnt + 1
			local sCall = format("isolate_register_self(%s)", gVal2String(szMainScriptFile))
    		SendScript2VM(szMainScriptFile, sCall)
		end
	end
end

function _check_date(today, talk_begin_date, begin_date, end_date)
	if talk_begin_date < 0 or begin_date < 0 or end_date < 0 then
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

Include("\\script\\isolate\\function_list.lua")
Include("\\script\\isolate\\online_activity_list.lua")
Include("\\settings\\static_script\\isolate\\base\\base_isolate_list.lua")
Include("\\script\\ks2vng\\isolate\\isolate_list_vng.lua")
function IsolateCenterImpl:_init()
	if not self.today_date or 0 == self.today_date then
		self.today_date = tonumber(date("%Y%m%d"))
	end
	self.load_cnt = 0
	self.init_cnt = 0
	self:_load_isolate_list(tBaseIsolateList)
	self:_load_isolate_list(tIsolateFunctionList)
	self:_load_isolate_list(tIsolateOnlineActivityList)
	self:_load_isolate_list(tIsolateListVNG)
	self:_sort_and_init()
	gDebug:show_msg(format("[info][IsolateCenter] %d/%d/%d isolate loaded", self.init_cnt, getn(self.list), self.load_cnt))
end
--所有模块初始化完成后需要做的事 一步一步的完成Isolate初始化操作
function IsolateCenterImpl:_step_init()
	for step = 1, self.isolate_max_init_step do
		for i = 1, getn(self.list) do
            local v = self.list[i]
            local szMainScriptFile = v[8]
            local nLoadDate = v[11]
            if nLoadDate == self.today_date then
                local sCall = format("__on_isolate_step_init(%d, %d)", step, self.isolate_max_init_step)
                SendScript2VM(szMainScriptFile, sCall)
            end
        end
	end
--	if gDebug:is_debug()==1 then
--		ShowGdata()
--		ShowEvent()
--		ShowIsolate()
--	end
end

--------------------------------------------------------------------global interface
function add_isolate(nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion)
	nTaskGroup = nTaskGroup or 0
	nTaskGroupVersion = nTaskGroupVersion or 0
	return IsolateCenterImpl:add_isolate(nPriority, eng_name, view_name, talk_begin_date, begin_date, end_date, szMainScriptFile, nTaskGroup, nTaskGroupVersion)
end

function show_isolate()
	return IsolateCenterImpl:show_isolate()
end

function isolate_center_handle_on_new_day(nNewDate, nOldDate)
	return IsolateCenterImpl:handle_on_new_date(nNewDate, nOldDate)
end
--------------------------------------------------------------------
