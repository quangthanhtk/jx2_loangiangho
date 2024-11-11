Include("\\script\\online_activites\\201502\\spring_decorate.lua")

WPG_DIALOG = {
	"Ta mu�n n�p M�m Ng� Qu� (Ti�u hao 01 M�m Ng� Qu� v� 01 Ti�u Dao Ng�c)/wpg_handup",
	"Ta mu�n d�ng Bao L� X� May M�n �� ��i th��ng/wpg_use_lucky",
	"R�i Kh�i/nothing",
}

function wpg_handup()
	if gf_CheckEventDateEx(147) ~= 1 then
		return 0;
	end
	sd_DailyReset();
	local nCount = SD_TASK_GROUP:GetTask(SD_TASK_GROUP.WpgCount);
	if nCount >= 200 then
		Talk(1,"",format("M�i ng�y ng��i ch�i ch� ���c nh�n th��ng t�i �a %d l�n", 200));
		return 0;
	end
	if GetItemCount(2,1,30784) < 1 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "M�m ng� qu�", 1));
		return 0;
	end
	if GetItemCount(2,1,30603) < 1 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�u Dao Ng�c", 1));
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if DelItem(2,1,30784,1) ~= 1 or DelItem(2,1,30603,1) ~= 1 then
		return 0;
	end
	SD_TASK_GROUP:SetTask(SD_TASK_GROUP.WpgCount, nCount + 1);
	gf_ModifyExp(789000);
	local tAward = {
		{4, 10000, 20, 1},
		{5, 10000, 20, 1},	
		{32, 10000, 100, 1},	
		{1, 7000, "B�nh B�t v�ng", {1, 1, 15, 1}, 0},
		{1, 7000, "Minh Nguy�t D�", {1, 1, 17, 1}, 0},
		{1, 7000, "T�y B�c V�ng", {1, 1, 19, 1}, 0},
		{1, 8000, "L�i Vi�m Th�ch", {2, 1, 30683, 1}, 0},
		{28, 9000, 10, 1},	
		{1, 8739, "B�ng Tinh Th�ch", {2, 1, 30554, 1}, 0},
		{1, 2000, "B� Ng�n To�n", {2, 1, 30538, 1}, 0},
		{1, 2000, "B� Ng�n Ch�y", {2, 1, 30539, 1}, 0},
		{31, 1000, "wpg_rand_gem1()", 1},	
		{1, 1000, "L�i H� Tinh Ph�ch", {2, 1, 30614, 1}, 0},
		{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
		{1, 2000, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 1000, "M�nh Thi�n M�n", {2, 1, 30410, 1}, 0},
		{1, 250, "T�ng R��ng", {2, 1, 30341, 1}, 0},
		{1, 1, "H�a Th� B�ch", {2, 1, 1001, 1}, 0},
		{1, 10000, "V� T� Kinh Th�", {2, 1, 30785, 1}, 0},
		{1, 2000, "Bao l� x� may m�n", {2, 1, 30786, 1}, 0},	
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "M�m Ng� Qu� 02/2015", "M�m ng� qu�")
	Say("<color=green>La Sa<color>: N�m m�i vui v�!!",getn(WPG_DIALOG),WPG_DIALOG)
end

function wpg_rand_gem1()
	local tAward = {
		{1, 25, "Huy�tTr�chTh�ch Lv1", {2,22,101,1}, 0},
		{1, 25, "Nguy�tB�chTh�ch Lv1", {2,22,201,1}, 0},
		{1, 25, "H� Ph�ch Th�ch C�p 1", {2,22,301,1}, 0},
		{1, 25, "H�c Di�u Th�ch C�p 1", {2,22,401,1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "M�m Ng� Qu� 02/2015", "�� qu� c�p 1")
end

WPG_EXCHANGE_TABLE = {
	{1, "T�i Thi�n Th�ch Tinh Th�ch", {2,1,3356,1}, 390, 14},
	{1, "Bao M�nh Thi�n Th�ch", {2,1,1049,1}, 290, 14},
	{1, "Th�n T�i B�o R��ng", {2,1,30344,1}, 390, 14},
	{1, "Ma �ao Th�ch c�p 1", {2,1,30428,1}, 9, 14},
	{1, "Ma ��o Th�ch c�p 2", {2,1,30429,1}, 19, 14},
	{1, "Ma �ao Th�ch c�p 3", {2,1,30430,1}, 29, 14},
	{1, "C��ng h�a quy�n 12", {2,1,30424,1}, 69, 14},
	{1, "C��ng h�a quy�n 13",  {2,1,30425,1}, 149, 14},
	{1, "C��ng h�a quy�n 14", {2,1,30426,1}, 249, 14},
	{1, "C��ng h�a quy�n 15", {2,1,30427,1}, 299, 14},
	{1, "B�o �en B�o B�o", {0,105,30045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "B�o V�ng B�o B�o", {0,105,30046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "L�n S�", {0,105,30044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 2015, 0},
	{1, "b�nh �t B�c B�o", {2,1,1125,10,4}, 66, 0},
	{2, "999999000EXP", 999999000, 450},
	{3, "99000 �i�m c�ng tr�ng", 99000, 450},
}

function wpg_use_lucky()
	if gf_CheckEventDateEx(147) ~= 1 then
		return 0;
	end
	local tSay = {}
	for i = 1, getn(WPG_EXCHANGE_TABLE) do
		tinsert(tSay, format("%s (Ti�u hao %d Bao L� X� May M�n)/#wpg_use_lucky_do(%d)", WPG_EXCHANGE_TABLE[i][2], WPG_EXCHANGE_TABLE[i][4], i));		
	end
	tinsert(tSay,"R�i Kh�i/nothing")
	Say("<color=green>La Sa<color>: N�m m�i vui v�!!", getn(tSay), tSay)
end

function wpg_use_lucky_do(nIndex)
	local tAward = WPG_EXCHANGE_TABLE[nIndex];
	if not tAward then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if tAward[1] == 1 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Bao l� x� may m�n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_AddItemEx2(tAward[3], tAward[2], "M�m Ng� Qu� 02/2015", "Bao l� x� may m�n", tAward[5]*24*3600, 1)
	elseif tAward[1] == 2 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Bao l� x� may m�n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_ModifyExp(tAward[3])
	elseif tAward[1] == 3 then
		if GetItemCount(2, 1, 30786) < tAward[4] then
			Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Bao l� x� may m�n", tAward[4]));
			return 0;
		end
		if DelItem(2, 1, 30786, tAward[4]) ~= 1 then
			return 0;
		end
		gf_EventGiveCustomAward(31, tAward[3], 1)
	end
end

function _wpg_playerlogin()
	if gf_CheckEventDateEx(147) ~= 1 then
		if GetTrigger(1373*2) > 0 then
			RemoveTrigger(1373*2);
		end
		return 0;
	end
	if GetTrigger(1373*2) <= 0 then
		local nTrigger = CreateTrigger(0, 1373, 1373*2);
		if nTrigger > 0 then
			Msg2Player("Gi�i thi�u ho�t ��ng: Ng��i ch�i c� th� ��n Quang Minh ��nh, Sa M�c M� Cung, Thi�n T�m Th�p t�ng 3, T�n L�ng, Qu� M�n H�i Lang, V��ng M�u ��ng t�ng 3, Thi�n S� B� C�nh ��nh qu�i �� thu th�p c�c lo�i tr�i c�y: M�ng C�u, Xo�i, �u ��, D�a H�u, Sung!");
		end
	end
end

function wpg_OnTrigger()
	-- if GetTeamSize() > 1 then
		-- Msg2Player("Tr�ng th�i t� ��i kh�ng th� nh�n ���c tr�i c�y!");
		-- return 0;
	-- end
	if gf_CheckEventDateEx(147) ~= 1 then
		if GetTrigger(1373*2) > 0 then
			RemoveTrigger(1373*2);
		end
		return 0;
	end
	local nMapID = GetWorldPos();
	if nMapID ~= 508 and nMapID ~= 506 and nMapID ~= 411 and 
		nMapID ~= 503 and nMapID ~= 328 and nMapID ~= 116 and
		nMapID ~= 329 then
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10) ~= 1 then
		return 0;
	end
	local tDrop = {}
	local nNpcIdx,sMoban,sName,bIsNpc,bIsBlueBoss = GetTriggeringUnit();
	if sName ~= "Gian T� Minh gi�o" and sName ~= "�� T� Minh gi�o" and sName ~= "Sa M�c H�nh Nh�n" and 
		sName ~= "��at B�o Nh�n" and sName ~= "Ma Ni T�ng" and	sName ~= "�� La Ni T�ng" and 
		sName ~= "Nh�t Ph�m ���ng �m S�y S�" and sName ~= "K� ��o m�" and sName ~= "Ti�u Lam �ao Qu�" and
		sName ~= "Ti�u Lam Xoa Qu�" and	sName ~= "��ch ti�n T�" and sName ~= "Ki�m ti�n T�" and sName ~= "Huy�t C� L�u" then
		bIsBlueBoss = 0;
	end
	if bIsBlueBoss ~= 0 then
		gf_AddItemEx2({2, 1, 30784, 1}, "M�m Ng� Qu�", "M�m Ng� Qu� 02/2015", "Gh�p M�m Ng� Qu�", 0, 1)
	end
	if nMapID == 508 then
		tinsert(tDrop, {1, 10, "M�ng c�u", {2, 1, 30779, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 506 then
		tinsert(tDrop, {1, 10, "Xo�i", {2, 1, 30780, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 411 then
		tinsert(tDrop, {1, 10, "�u ��", {2, 1, 30781, 1}, 0})
		tinsert(tDrop, {31, 90, "nothing()", 1});
	end
	if nMapID == 503 then
		tinsert(tDrop, {1, 5, "D�a h�u", {2, 1, 30782, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 328 then
		tinsert(tDrop, {1, 5, "D�a h�u", {2, 1, 30782, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 116 then
		tinsert(tDrop, {1, 5, "Sung", {2, 1, 30783, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	if nMapID == 329 then
		tinsert(tDrop, {1, 5, "Sung", {2, 1, 30783, 1}, 0})
		tinsert(tDrop, {31, 95, "nothing()", 1});
	end
	gf_EventGiveRandAward(tDrop, gf_SumRandBase(tDrop), 1);
end


function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng");
		return 0;
	end
	Say(format("Ti�u hao %d M�ng C�u + %d Xo�i + %d �u �� + %d D�a H�u + %d Sung + %d V�ng c� t� l� gh�p th�nh M�m Ng� Qu�, c� mu�n gh�p kh�ng?", 1, 1, 1, 1, 1, 3), 2, "H�p th�nh/wpg_Compose", "T�i h� ch� xem qua th�i/nothing");
end

function wpg_Compose()
	local nNum1 = GetItemCount(2, 1, 30779);
	local nNum2 = GetItemCount(2, 1, 30780);
	local nNum3 = GetItemCount(2, 1, 30781);
	local nNum4 = GetItemCount(2, 1, 30782);
	local nNum5 = GetItemCount(2, 1, 30783);
	local nNum6 = GetCash() / 30000;
	AskClientForNumber("wpg_Compose_do", 0, min(min(min(nNum1, nNum2), min(nNum3, nNum4)), min(nNum5, nNum6)),"H�y nh�p s� l��ng gh�p:","");
end

function wpg_Compose_do(nNum)
	if nNum <= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30779, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30780, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30781, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30782, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30783, nNum) ~= 1 then
		return 0;
	end
	if Pay(nNum*30000) ~= 1 then
		return 0; 
	end
	for i = 1, nNum do
		local nRand = random(100);
		if nRand <= 50 then
			local nP = {30779, 30780, 30781, 30782, 30783};
			local nIndex = mod(nRand, getn(nP)) + 1;
			for i = 1, getn(nP) do
				if i ~= nIndex then
					AddItem(2, 1, nP[i], 1);
				end
			end
		else
			gf_AddItemEx2({2,1,30784,1}, "M�m Ng� Qu�", "M�m Ng� Qu� 02/2015", "Gh�p M�m Ng� Qu�", 0, 1);
		end
	end
end