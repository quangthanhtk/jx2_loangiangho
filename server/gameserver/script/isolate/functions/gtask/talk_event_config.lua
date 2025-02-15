Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--所有的任务npc或item对话都在这里配置了

t_npc_or_item_talk = {
	--nTaskId,szTaskName,tRegPara,fn,tfnPara
	{433, "M筩 Чi kh萵 c莡", {"H祅 Thi誸 Kho竛g", 315}, fn_award_items, {1,100,{{"H祅 Thi誸 Tr╩ N╩",{2,1,31099,1,4},1,100}, }}	},
	{436, "箃 l筰 B骯", {200131101}, fn_use_at_pos,{ {"Lng S琻 B筩",208,1490,3114,16,1}, fn_call_npcs, {{"jz_ymdxt","T猲 tr閙 b� 萵",-1, 0, 0}} }  },--镀了金的铁块
	{445, "Л頲 ph竝 kh� (Mua ph竝 kh�)", {"V﹏ Du Чo Nh﹏", 200}, fn_confirm, {{"Mu鑞 ti猽 100 V祅g mua K輓h Chi誹 Y猽?","ng","Sai"}, fn_vmoney_buy, {{"V祅g",1, 1000000, 100}, {1,100,{ {"K輓h Chi誹 Y猽",{2,1,31105,1,4}} },} } } },
	--{446, "击败厉鬼", {200131105}, fn_use_at_pos, {{"江津村", 306,1453,2860,8,1}, fn_call_npcs,  {{"jz_lg", "厉鬼",-1,0,0},}} },--召唤厉鬼
	{453, "U鑞g 3 ly", {200131110}, fn_use_at_pos, {{"Tng Dng",350,1519,3007,16,1},fn_award_items, {1,100,{{"Ly Ru R鏽g",{2,1,31125,1,4},3,100}, }}} },
	{460, "L藀 trng Minh gi竜", {"H莡 Йn", 152}, fn_confirm, {{"Ch祇 trng l穙, t玦 do gi竜 ch� 駓 th竎, mu鑞 h醝 b竎 v� � ki課 gia nh藀 Li猲 Qu﹏.", "Ch髇g t玦 駈g h� l鵤 ch鋘 c馻 gi竜 ch�."}, fn_award_items, {1,100,{{"Th� C馻 Trng L穙",{2,1,31126,1,4},1,100}, }}} },
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
			local szTitle = format("<color=green>%s:<color>%s", szKey, "m阨 ch鋘 nhi謒 v�")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Ra kh醝"))
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
			local szTitle = format("<color=green>%s:<color>%s", szName, "m阨 ch鋘 nhi謒 v�")
			local tSay = {}
			for i,v in t do
				local szTaskName = v[2]
				tinsert(tSay, format("%s/#handle_npc_talk(%d,%d)", szTaskName, nIndex, nTalkIndex))
			end
			tinsert(tSay, format("%s/nothing", "Ra kh醝"))
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
		Talk(1,"","Чi hi謕 ch璦 nh薾 nhi謒 v� n祔.")
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