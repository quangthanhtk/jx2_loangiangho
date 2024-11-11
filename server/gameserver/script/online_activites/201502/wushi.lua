Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

WS_TASK_GROUP = TaskManager:Create(2, 19);
WS_TASK_GROUP.DaySeq = 1;
WS_TASK_GROUP.Number = 2; --���ɵ���
WS_TASK_GROUP.Recursive = 3; --�ݹ����
WS_TASK_GROUP.SuccTimes = 4; --��ȭʤ������
WS_TASK_GROUP.IbTimes = 5; --��������
WS_TASK_GROUP.GetAward = 6; --�ǹ���ȡ��ȭ����
WS_TASK_GROUP.IbTag = 7 --IBtag

function Ws_RelayCallNpc(nRandomSeed)
	-- if gf_CheckEventDateEx(148) ~= 1 then
		-- return 0;
	-- end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20150211 then
		return 0
	end
	local tMapPos = {
		{{200,1385,2890}, "Bi�n Kinh (173,180)"},
		{{150,1688,3127}, "D��ng Ch�u (211,195)"},
		{{350,1440,2999}, "T��ng D��ng (180,187)"},
		{{100,1447,2977}, "Tuy�n Ch�u (180,185)"},
		{{400,1480,3028}, "��i L� (185,189)"},
		{{300,1764,3540}, "Th�nh �� (220,221)"},
		{{500,1740,3152}, "Ph�ng T��ng (217,196)"},
	}
	local nSize = getn(tMapPos);
	local nIndex = mod(nRandomSeed, nSize) + 1;
	
	Msg2Global(format("L�n S� xu�t hi�n � %s, mau �i t�m L�n S� �� nh�n Bao L� X� May M�n", tMapPos[nIndex][2]));
	AddLocalNews(format("L�n S� xu�t hi�n � %s, mau �i t�m L�n S� �� nh�n Bao L� X� May M�n", tMapPos[nIndex][2]));
	
	local nHour = tonumber(date("%H"));
	if SubWorldID2Idx(tMapPos[nIndex][1][1]) ~= -1 then
		local npcIndex = CreateNpc("Wushi_NPC", "L�n S�", tMapPos[nIndex][1][1], tMapPos[nIndex][1][2], tMapPos[nIndex][1][3]);
		if npcIndex > 0 then
			if nHour >= 12 and nHour <= 13 then
				SetNpcLifeTime(npcIndex, 60*60);
			elseif nHour >= 19 and nHour <= 22 then
				SetNpcLifeTime(npcIndex, 3*60*60);
			else
				SetNpcLifeTime(npcIndex, 0);
			end
			SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\wushi.lua");
		end
		npcIndex = CreateNpc("Datouwawa", " ", tMapPos[nIndex][1][1], tMapPos[nIndex][1][2]+3, tMapPos[nIndex][1][3]+3);
		if npcIndex > 0 then
			if npcIndex > 0 then
				if nHour >= 12 and nHour <= 13 then
					SetNpcLifeTime(npcIndex, 60*60);
				elseif nHour >= 19 and nHour <= 22 then
					SetNpcLifeTime(npcIndex, 3*60*60);
				else
					SetNpcLifeTime(npcIndex, 0);
				end
				SetNpcScript(npcIndex, "\\script\\online_activites\\201502\\wushi.lua");
			end
		end
	end
end

function main()
	local tSay = {
		"B�i Qu� ��u N�m/ws_zhangua",
		"May M�n ��u N�m/ws_guess",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>L�n S�:<color> N�m m�i ph�t t�i!", getn(tSay), tSay);
end

--��������Ϸ
function ws_zhangua()
	ws_daily_reset();
	local tSay = {
		"B�t ��u ch�i/ws_guess_number",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>L�n S�:<color> N�m m�i ng��i c� mu�n ta b�i cho ng��i 1 qu� ��u n�m kh�ng, ch� c�n 10 ti�n l� th�i?", getn(tSay), tSay);
end

function ws_guess_number()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�n L�", 10));
		return 0;
	end
	
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nTimes >= 5 then
		Talk(1,"","H�m nay �� tham gia r�i, ng�y mai h�y quay l�i!")
		return 0;
	end
	
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number) == 111 then
		Talk(1,"","H�m nay �� tham gia r�i, ng�y mai h�y quay l�i!");
		return 0;
	end
	--��Ϸ��ʼ������Ŀ����
	local nTarget = random(1,100);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, nTarget);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, 0);
	if DelItem(2,1,30778,10) ~= 1 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�n L�", 10));
		return 0;
	end
	ws_guess_number_input();
end

function ws_guess_number_input()
	-- if DelItem(2,1,30778,10) ~= 1 then
		-- Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�n L�", 10));
		-- return 0;
	-- end
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive)+1);
	AskClientForNumber("ws_guess_number_input_do",1,100,"Nh�p ch� s� c�c h� �o�n tr�ng");
end

function ws_guess_number_input_do(nNum)
	local nTarget = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Number);
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.Recursive);
	if nNum == nTarget then
		Talk(1,"",format("Ch�c m�ng c�c h� �� �o�n tr�ng r�i!!!  \n Ch� s� may m�n c�a c�c h� l�<color=green>%d<color>, s� l�n �o�n l�<color=green>%d<color>",nTarget,nTimes));
		--������
		local tAward = {
			{10000000, {2,1,30786,3}, "Bao l� x� may m�n"},
			{6000000, {2,1,30786,1}, "Bao l� x� may m�n"},
			{4000000, {2,1,30783,3}, "Sung"},
			{2000000, {2,1,30783,2}, "Sung"},
			{1000000, {2,1,30783,1}, "Sung"},
		}
		if not tAward[nTimes] then
			return 0;
		end
		if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
			return 0;
		end
		gf_ModifyExp(tAward[nTimes][1]);
		gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "M�ng Xu�n �t M�i", "B�i Qu� ��u N�m", 0, 1)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, 111);
	else
		if nTimes >= 5 then
			Talk(1,"",format("S� l�n �o�n s� �� v��t qu� <color=green>%d<color> l�n, <color=red>�o�n s� th�t b�i<color>, ng�y mai h�y quay l�i! Con s� may m�n c�a b�n l� <color=red>%d<color>.",5,nTarget));
			gf_ModifyExp(1000000);
			return 0;
		end
		if nNum > nTarget then
			Talk(1,"ws_guess_number_input",format("Ch� s� �o�n l�n %d c�a c�c h� l�<color=red>%d<color>, qu� l�n r�i, h�y �o�n s� nh� h�n t�.",nTimes,nNum));
		else
			Talk(1,"ws_guess_number_input",format("Ch� s� �o�n l�n %d c�a c�c h� l�<color=red>%d<color>, qu� nh� r�i, h�y �o�n s� l�n h�n t�.",nTimes,nNum));
		end
	end
end

function ws_guess()
	ws_daily_reset();
	local tSay = {
		"B�t ��u ch�i/ws_guess_finger",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>L�n S�:<color> N�m m�i t�t ��n ng��i c� mu�n c�ng ta l�m v�i v�n may m�n kh�ng, c�n 10 ti�n l� l� c� th� tham gia v�i ta.", getn(tSay), tSay);
end

function ws_guess_finger()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H�m nay �� tham gia r�i, ng�y mai h�y quay l�i!")
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTag) ~= 0 then
		ws_guess_finger_ib();
		return 0;
	end
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tSay = {}
	local msg = "";
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M�m Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m�n"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m�n"},
	}
	
	if GetItemCount(2,1,30778) < 10 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�n L�", 10))
		return 0;
	end
	if DelItem(2,1,30778,10) ~= 1 then
		return 0;
	end
	
	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra B�a/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra K�o/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPh�n th��ng t�ch l�y hi�n t�i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh�ng mu�n ch�i n�a! Nh�n th��ng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say("H�y ch�n c�ch o�n t� t�:"..msg, getn(tSay), tSay);
end

function ws_guess_finger2()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.GetAward) ~= 0 then
		Talk(1,"","H�m nay �� tham gia r�i, ng�y mai h�y quay l�i!")
		return 0;
	end
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTag) ~= 0 then
		ws_guess_finger_ib();
		return 0;
	end
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tSay = {}
	local msg = "";
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M�m Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m�n"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m�n"},
	}

	if nTimes >= 0 and nTimes < getn(tAward) then
		tinsert(tSay, format("Ra B�a/#ws_guess_finger_jugde(1)"))
		tinsert(tSay, format("Ra K�o/#ws_guess_finger_jugde(2)"))
		tinsert(tSay, format("Ra Bao/#ws_guess_finger_jugde(3)"))
	end
	if nTimes > 0 and nTimes <= getn(tAward) then
		msg = msg..format("\nPh�n th��ng t�ch l�y hi�n t�i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4]);
		tinsert(tSay, "\nTa kh�ng mu�n ch�i n�a! Nh�n th��ng/ws_guess_finger_getaward");
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say("H�y ch�n c�ch o�n t� t�:"..msg, getn(tSay), tSay);
end

function ws_guess_finger_jugde(nValue)

	local tListCmp = {
		--{����䣬���Ӯ}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ws_guess_finger2","B�n v� L�n S� h�a nhau!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
		if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) > 0 then
			WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes) + 1)
			Talk(1,"ws_guess_finger_ib","B�n <color=red>thua<color> r�i, L�n S� gi�nh chi�n th�ng!");
		else
			Talk(1,"nothing","B�n <color=red>thua<color> r�i, L�n S� gi�nh chi�n th�ng!");
		end
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.SuccTimes, WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes) + 1)
		Talk(1,"ws_guess_finger2","B�n <color=green>th�ng<color> r�i, L�n S� th�t b�i!");
	end
end

function ws_guess_finger_ib()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M�m Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m�n"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m�n"},
	}
	local msg = format("\nPh�n th��ng t�ch l�y hi�n t�i %d EXP, %s*%d", tAward[nTimes][1], tAward[nTimes][3], tAward[nTimes][2][4])
	local nIbTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.IbTimes);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 1);
	local tCost = {2, 4, 8, 16, 32};
	local tSay = {}
	if nIbTimes > 0 and nIbTimes <= getn(tCost) then
		tinsert(tSay, format("\nTi�u hao %d Ti�n L�, ch�ng ta ti�p t�c n�o/#ws_guess_finger_ib_ensure(%d)", tCost[nIbTimes], tCost[nIbTimes]))
	end
	tinsert(tSay, "\nTa kh�ng mu�n ch�i n�a! Nh�n th��ng/ws_guess_finger_getaward");	
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(msg, getn(tSay), tSay);
end

function ws_guess_finger_ib_ensure(nCost)
	if DelItem(2,1,30778,nCost) == 1 then
		Msg2Player(format("B�n �� ti�u hao %d %s", nCost, "Ti�n L�"));
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 0);
		ws_guess_finger2();
	else
		Talk(1,"nothing","Trong t�i kh�ng c� Ti�n L�!");
	end
end

function ws_guess_finger_getaward()
	local nTimes = WS_TASK_GROUP:GetTask(WS_TASK_GROUP.SuccTimes);
	local tAward = {
		{600000, {2,1,30783,1}, "Sung"},
		{1000000, {2,1,30783,2}, "Sung"},
		{2000000, {2,1,30783,3}, "Sung"},
		{4000000, {2,1,30784,1}, "M�m Ng� Qu�"},
		{6000000, {2,1,30786,1}, "Bao l� x� may m�n"},
		{10000000, {2,1,30786,3}, "Bao l� x� may m�n"},
	}
	if nTimes <= 0 or nTimes > getn(tAward) then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	gf_ModifyExp(tAward[nTimes][1]);
	gf_AddItemEx2(tAward[nTimes][2], tAward[nTimes][3], "M�ng Xu�n �t M�i", "May M�n ��u N�m", 0, 1);
	WS_TASK_GROUP:SetTask(WS_TASK_GROUP.GetAward, 1);
end

function ws_daily_reset()
	if WS_TASK_GROUP:GetTask(WS_TASK_GROUP.DaySeq) ~= gf_TodayDate() then
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.DaySeq, gf_TodayDate())
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Number, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.Recursive, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.SuccTimes, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTimes, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.GetAward, 0)
		WS_TASK_GROUP:SetTask(WS_TASK_GROUP.IbTag, 0)
	end
end