--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: event����ע�����������Ѿ���isolatebase��װ���ˣ�Ӧ�ò����л���ֱ��ʹ��
--related files: 
--=============================================

--�¼�ϵͳͳһע�����ϵͳ
--֧���Զ����¼��Զ�ע��ͻص�����
--��ϵͳ��ע���¼��ͻص���Ҫ�Ĳ��� ��ͳһ����������� �ṩһ��ͳһ��ע��ͻص��ӿ�

Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")

BatchWatchListMgr = {
	max_list_len = 2,
	list = {} --BatchWatchList
}
function BatchWatchListMgr:add(tBatchWatchList)
	local tRet = nil
	if tBatchWatchList then
		assert(getn(self.list) < self.max_list_len)
		tinsert(self.list, tBatchWatchList)
		tBatchWatchList.nId = getn(self.list)
		tRet = tBatchWatchList
	end
	return tRet
end
function BatchWatchListMgr:clear()
	for i=1,getn(self.list) do
		local v = self.list[i]
		v:unwatch_all_events()
	end
	self.list = {}
end
function BatchWatchListMgr:batch_watch_list_handler(nId, data, para)
	local t = self.list[nId]
	if t then
		t:handle(data, para)
	end
end
function _batch_watch_list_handler_1(data, para) return BatchWatchListMgr:batch_watch_list_handler(1, data, para) end
function _batch_watch_list_handler_2(data, para) return BatchWatchListMgr:batch_watch_list_handler(2, data, para) end
--function _batch_watch_list_handler_3(data, para) return BatchWatchListMgr:batch_watch_list_handler(3, data, para) end
--function _batch_watch_list_handler_4(data, para) return BatchWatchListMgr:batch_watch_list_handler(4, data, para) end
--function _batch_watch_list_handler_5(data, para) return BatchWatchListMgr:batch_watch_list_handler(5, data, para) end

BatchWatchList = {
	has_add_watch = 0,
	nId = 0,
	name = "",
	list = {},             --{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}
}

function BatchWatchList:new(name)
	local _t = _inherit(self)
	_t.has_add_watch = 0
	_t.name = name
	_t.list = nil
	local tRet = BatchWatchListMgr:add(_t)
	return tRet
end

function BatchWatchList:unwatch_all_events()
	if self.has_add_watch == 1 then
		for i = 1, getn(self.list) do
			local v = self.list[i]
			local szEventId, para = unpack(v)
			UnWatchEvent(szEventId, szScript, "")
		end
		self.nId = 0
		self.list = nil
	end
end
function BatchWatchList:batch_watch_event(szScript, tBatchList)
	if self.has_add_watch == 0 and szScript and tBatchList then
		self.list = tBatchList
		for i = 1, getn(self.list) do
			local v = self.list[i]
    		local szEventId, para, fn = unpack(v)
    		
    		if not fn or type(fn) ~= "function" then error(format("handle_func is nil or not function at elem %d(%s)", i, szEventId)) end
    		
    		--����֧�������¼����� ��Ҫ�����⻯
    		--if GetPlayerEventSwitchId(szEventId) <= 0 then --û��ע��PlayerEventSwitch
    			tinsert(para, i) --������ע���ȥ �ص���ʱ��������
    			local s_batch_watch_list_handler = self:get_handle_func_name()
    			WatchEvent(szEventId, szScript, s_batch_watch_list_handler, unpack(para))
--    		else
--    			error(format("[%s] has defined PlayerEventSwitch, do not support in batch_watch_list"))
--    		end
    	end
    	self.has_add_watch = 1
	else
		error("BatchWatchList:batch_watch_event error")
	end
end
function BatchWatchList:get_handle_func_name()
	local s_batch_watch_list_handler = format("_batch_watch_list_handler_%d", self.nId)
	return s_batch_watch_list_handler
end

function BatchWatchList:handle(data, para)
	local nListIndex = para[getn(para)] --���һ�����������¼��б��е�����
	local tEvent = self.list[nListIndex]
--	if gDebug:is_debug() == 1 then
--		gDebug:show_msg("BatchWatchList:handle", nListIndex, gVal2String(data), gVal2String(para), gVal2String(tEvent))
--	end
	if tEvent then
		local fn = tEvent[3] --������������elem�¼��ص�����
		return fn(tEvent, data, para)
	else
		error(format("BatchWatchList [%d] not found", nListIndex))
	end
end


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
