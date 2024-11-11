Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--���е�����npc��item�Ի���������������

t_npc_or_item_talk = {
	--nTaskId,szTaskName,tRegPara,fn,tfnPara
	{433, "M�c ��i kh�n c�u", {"H�n Thi�t Kho�ng", 315}, fn_award_items, {1,100,{{"H�n Thi�t Tr�m N�m",{2,1,31099,1,4},1,100}, }}	},
	{436, "�o�t l�i B�a", {200131101}, fn_use_at_pos,{ {"L��ng S�n B�c",208,1490,3114,16,1}, fn_call_npcs, {{"jz_ymdxt","T�n tr�m b� �n",-1, 0, 0}} }  },--���˽������
	{445, "���c ph�p kh� (Mua ph�p kh�)", {"V�n Du ��o Nh�n", 200}, fn_confirm, {{"Mu�n ti�u 100 V�ng mua K�nh Chi�u Y�u?","��ng","Sai"}, fn_vmoney_buy, {{"V�ng",1, 1000000, 100}, {1,100,{ {"K�nh Chi�u Y�u",{2,1,31105,1,4}} },} } } },
	--{446, "��������", {200131105}, fn_use_at_pos, {{"�����", 306,1453,2860,8,1}, fn_call_npcs,  {{"jz_lg", "����",-1,0,0},}} },--�ٻ�����
	{453, "U�ng 3 ly", {200131110}, fn_use_at_pos, {{"T��ng D��ng",350,1519,3007,16,1},fn_award_items, {1,100,{{"Ly R��u R�ng",{2,1,31125,1,4},3,100}, }}} },
	{460, "L�p tr��ng Minh gi�o", {"H�u ��n", 152}, fn_confirm, {{"Ch�o tr��ng l�o, t�i do gi�o ch� �y th�c, mu�n h�i b�c v� � ki�n gia nh�p Li�n Qu�n.", "Ch�ng t�i �ng h� l�a ch�n c�a gi�o ch�."}, fn_award_items, {1,100,{{"Th� C�a Tr��ng L�o",{2,1,31126,1,4},1,100}, }}} },
}











--never modify below
--talk events
-------------------------------------------
function handle_npc_talk(nIndex, nTalkIndex)
	local szKey = GetNpcName(nIndex)
	local t = tTalkEventMap[szKey]
	if t then
		if getn(t) == 1 then
			nTalkIndex = 1
		end
		if not nTalkIndex then
			local szTitle = format("<color=green>%s:<color>%s", szKey, "m�i ch�n nhi�m v�")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Ra kh�i"))
			Say(szTitle, getn(tSay), tSay)
		else
			return fn_process_talk_event(t[nTalkIndex])
		end
	end
	return 0
end

function handle_item_talk(nIndex, nTalkIndex)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nKey = PackItemId(g, d, p)
	local t = tTalkEventMap[nKey]
	if t then
		if getn(t) == 1 then
			nTalkIndex = 1
		end
		if not nTalkIndex then
			local szName = GetItemName(g, d, p)
			local szTitle = format("<color=green>%s:<color>%s", szName, "m�i ch�n nhi�m v�")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Ra kh�i"))
			Say(szTitle, getn(tSay), tSay)
		else
			return fn_process_talk_event(t[nTalkIndex])
		end
	end
	return 0
end

function fn_process_talk_event(tTalkCfg)
	local nTaskId, szTaskName, tPara, fn, fnPara = unpack(tTalkCfg)
	if _fn_task_dispatch(tTalkCfg) ~= 1 then
		Talk(1,"","��i hi�p ch�a nh�n nhi�m v� n�y.")
	end
	return 0
end

g_called_fn_reg_talk_events = nil
function fn_reg_talk_events()
	if g_called_fn_reg_talk_events then
		error("fn_reg_talk_events repeat call")
		return
	end
	tTalkEventMap = {}
	for i,t in t_npc_or_item_talk do
		local nTaskId, szTaskName, tPara, fn, fnPara = unpack(t)
		tinsert(tPara, szTaskName)
	
		local key = tPara[1]
		local szEventId,szFunc = "event_npc_talk", "handle_npc_talk"
		if type(key) == "number" then
			szEventId,szFunc = "event_item_talk", "handle_item_talk"
		end
		isolate_watch_event(szEventId,szFunc, unpack(tPara))
		
		local tCfg = tTalkEventMap[key] or {}
		tinsert(tCfg, t)
		tTalkEventMap[key] = tCfg
	end
	g_called_fn_reg_talk_events = 1
end