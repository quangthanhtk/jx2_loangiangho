Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\class\\clause3.lua")
Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")

msg = "Ch�c m�ng $n m� B�o R��ng ��a Huy�n Cung  nh�n ���c $i";

--��Ӣ����
tClause1 = {
    {{"�o Cho�ng T�o B�", {0,152,1,1}}, 1000},
    {{"�o Cho�ng C�m �o�n", {0,152,2,1}}, 1000},
	{{"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2,1,538,1}, nil, {15*24*3600}}, 1500},
	{{"�o kho�c Hi�p C�t",{0,152,29,1},nil},30},
	{{"�o kho�c Q�y Ph�",{0,152,30,1},nil},30},
	{{"�o kho�c ��ng V�n",{0,152,31,1},nil},30},
	{{"Phi�u ��i Ngo�i Trang",{2,1,31233,1}},500},
	{{"B�ch Kim ��i H�ng Bao (kh�ng)", {2,1,30228,1}, nil, {15*24*3600}}, 100},
	{{"Nh�n S�m V�n N�m",{2,1,30071,5,1}},2300},
	{{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},468},
	{{"T�i �� Qu� C�p 2",{2,1,30999,1,1}},600},
	{{"T�i �� Qu� C�p 3",{2,1,31000,1,1},nil},440},
	
	{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil}, 500},
	{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil}, 500},
	{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 5, 1}, nil, nil}, 500},
	{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil}, 500},
}

--���챦��
tClause2 = {
	{{"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1, 1}, nil,  {1296000}}, 1000},
	{{"B�ch Kim ��i H�ng Bao (kh�ng)", {2, 1, 30228, 1, 1}, nil,  {1296000}}, 100},
	{{"�o Cho�ng Du Hi�p", {0, 152, 26, 1, 1}, nil, nil}, 200},
	{{"�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 1}, nil, nil}, 200},
	{{"�o Cho�ng V�n Du", {0, 152, 28, 1, 1}, nil, nil}, 200},
	{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil, nil}, 30},
	{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil, nil}, 30},
	{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil, nil}, 30},
	{{"Phi�u ��i Ngo�i Trang", {2, 1, 31233, 1, 1}, nil, nil}, 1000},
	{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 1, 1}, msg, nil}, 1},
	{{"Nh�n S�m V�n N�m", {2, 1, 30071, 10, 1}, nil, nil}, 2500},
	{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil, nil}, 1100},
	{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil, nil}, 1100},
	{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil, nil}, 504},

	{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil}, 500},
	{{"M�nh Th� C��i", {2, 1, 31386, 1, 1}, nil, nil}, 500},
	{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 5, 1}, nil, nil}, 488},
	{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 1, 1}, nil, nil}, 500},
	{{"Hoan L�ng Phi Phong", {0, 152, 32, 1, 1}, msg, nil}, 1},
	{{"��ng Giao Phi Phong", {0, 152, 33, 1, 1}, msg, nil}, 1},
	{{"Kh�i Ph��ng Phi Phong", {0, 152, 34, 1, 1}, msg, nil}, 1},
}

--���ñ���
tClause3 = {
    {{"C�y B�t Nh� nh�", {2, 0, 504, 1, 1}, nil,  {604800}}, 500},
	{{"C�y B�t Nh�", {2, 0, 398, 1, 1}, nil,  {604800}}, 200},
	{{"C�y T� Linh", {2, 1, 30269, 1, 1}, nil,  {604800}}, 500},
	{{"B�ch C�u Ho�n", {2, 1, 270, 1, 1}, nil,  {604800}}, 500},
	{{"��i B�ch C�u ho�n", {2, 1, 1007, 1, 1}, nil,  {604800}}, 500},
	{{"B�ch C�u Ti�n ��n", {2, 1, 1008, 1, 1}, nil,  {604800}}, 500},
	{{"��i Nh�n s�m", {2, 0, 553, 1, 1}, nil,  {604800}}, 500},
	--{{"Ӣ��ѫ��", {2, 1, 30499, 1, 4}, nil, nil}, 800},
	{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 2, 1}, nil, nil}, 600},
	{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 4, 1}, nil, nil}, 200},
	{{"Hu�n ch��ng anh h�ng", {2, 1, 30499, 10, 1}, nil, nil}, 50},
	{{"M�nh Thi�n M�n", {2, 1, 30410, 2, 1}, nil, nil}, 400},
	{{"M�nh Thi�n M�n", {2, 1, 30410, 4, 1}, nil, nil}, 100},
	{{"M�nh Thi�n M�n", {2, 1, 30410, 20, 1}, nil, nil}, 20},
	{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 1, 1}, msg, nil}, 1},
	-- {{"��������", {0, 152, 26, 1, 1}, msg, nil}, 50},
	-- {{"��Ѫ����", {0, 152, 27, 1, 1}, msg, nil}, 50},
	-- {{"���ι���", {0, 152, 28, 1, 1}, msg, nil}, 50},
	{{"Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1, 1}, nil,  {1296000}}, 500},
	{{"B�ch Kim ��i H�ng Bao (kh�ng)", {2, 1, 30228, 1, 1}, nil,  {1296000}}, 100},
	{{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 1}, nil, nil}, 10},
	{{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 1}, nil, nil}, 10},
	{{"�o kho�c ��ng V�n", {0, 152, 31, 1, 1}, nil, nil}, 10},
	{{"Phi�u ��i Ngo�i Trang", {2, 1, 31233, 1, 1}, nil, nil}, 500},
	{{"Nh�n S�m V�n N�m", {2, 1, 30071, 10, 1}, nil, nil}, 1041},
	{{"T�i �� Qu� C�p 1", {2, 1, 30998, 1, 1}, nil, nil}, 100},
	{{"T�i �� Qu� C�p 2", {2, 1, 30999, 1, 1}, nil, nil}, 200},
	{{"T�i �� Qu� C�p 3", {2, 1, 31000, 1, 1}, nil, nil}, 800},

	{{"Kinh M�ch Ng�n Nh�n", {2, 1, 30731, 1, 1}, nil, nil}, 500},
	{{"M�nh Th� C��i", {2, 1, 31386, 10, 1}, nil, nil}, 500},
	{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 1},
	{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 10, 1}, nil, nil}, 626},
	{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 5, 1}, nil, nil}, 500},
	{{"Hoan L�ng Phi Phong", {0, 152, 32, 1, 1}, msg, nil}, 1},
	{{"��ng Giao Phi Phong", {0, 152, 33, 1, 1}, msg, nil}, 1},
	{{"Kh�i Ph��ng Phi Phong", {0, 152, 34, 1, 1}, msg, nil}, 1},
}

--���±���
tClause4 = {
    {{"Thi�n M�n Kim L�nh", {2, 1, 30370, 1, 1}, msg, nil}, 5865},
	{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 2, 1}, msg, nil}, 600},
	{{"Thi�n M�n Kim L�nh", {2, 1, 30370, 3, 1}, msg, nil}, 200},
	-- {{"���ǹ���", {0, 152, 29, 1, 1}, msg, nil}, 1000},
	-- {{"������", {0, 152, 30, 1, 1}, msg, nil}, 1000},
	-- {{"���ƹ���", {0, 152, 31, 1, 1}, msg, nil}, 1000},

	{{"M�nh Th� C��i", {2, 1, 31386, 50, 1}, nil, nil}, 500},
	{{"Linh Ngh�", 	 {0, 105, 201, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 10},
	{{"Phong S��ng Ki�m", {0, 105, 209, 1, 1,-1,-1,-1,-1,-1,-1}, msg, nil}, 10},
	{{"M�nh Phi Phong Kim X� Lv6", {2, 1, 31385, 100, 1}, nil, nil}, 1500},
	{{"M�nh Phi Phong Kim X� Lv7", {2, 1, 31399, 10, 1}, nil, nil}, 1000},

	{{"Hoan L�ng Phi Phong", {0, 152, 32, 1, 1}, nil, nil}, 100},
	{{"��ng Giao Phi Phong", {0, 152, 33, 1, 1}, nil, nil}, 100},
	{{"Kh�i Ph��ng Phi Phong", {0, 152, 34, 1, 1}, nil, nil}, 100},
	{{"Phi Phong S�t Lang", {0, 152, 35, 1, 1}, msg, nil}, 5},
	{{"Phi Phong Nhu� Nha", {0, 152, 36, 1, 1}, msg, nil}, 5},
	{{"Phi Phong M�ng S�t", {0, 152, 37, 1, 1}, msg, nil}, 5},
}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	tClause4,
}

function main()
	local tItem = getLootItem();
	if not tItem then return end

	local Daye = GetMissionV(MV_SP_DAYE)
	local tSel = {"K�t th�c ��i tho�i/nothing"}
	if PlayerIndex == Daye then
		tSel = {
			format("Thu th�p v�t ph�m/#lootAwardOther(%d, %d)",PlayerIndex, GetTargetNpc()),
			format("Ph�n chia cho t� ��i/#giveOther(%d)",GetTargetNpc()),
			"K�t th�c ��i tho�i/nothing",
		}
	end
	local msg = format("Trong b�o r��ng c� [%s *%d]",tItem[1], tItem[2][4]);
	Say(msg, getn(tSel), tSel);
end

function getRandItem(tClause)
	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i, tClause[i][1];
		end
	end
	print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
	assert();
end

function getLootItem()
	local lv = GetMissionV(MV_SP_BOX_LV);
	local nBoxLv = GetMissionV(MV_SP_BOSS_LV)

	if lv == 0 then
		lv = nBoxLv;
		SetMissionV(MV_SP_BOX_LV, lv);
	end

	-- if lv ~= nBoxLv then
	-- 	return nil
	-- end

	local clause = tClause[lv];
	if not clause then return end;

	local sp = GetMissionV(MV_SP_LOOT_ID);
	if sp == 0 then
		sp = getRandItem(clause)
		SetMissionV(MV_SP_LOOT_ID, sp);
		local tItem = clause[sp][1];
		WriteLog(format("[dixuangong:lootItem2] [Role:%s Acc:%s] [bossLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), lv, sp, tItem[1], tItem[2][4]));
		--����ͳ��
		if tItem[1] == "Thi�n M�n Kim L�nh" then
			AddRuntimeStat(1,14,0,tItem[2][4]);
		elseif tItem[1] == "C�p 3 Luy�n L� Thi�t" then
			AddRuntimeStat(1,16,0,tItem[2][4]);
		elseif tItem[1] == "C�p 3 T�y T�m Th�ch" then
			AddRuntimeStat(1,17,0,tItem[2][4]);
		elseif tItem[1] == "B� Ng�n To�n" then
			AddRuntimeStat(1,18,0,tItem[2][4]);
		elseif tItem[1] == "B� Ng�n Ch�y" then
			AddRuntimeStat(1,19,0,tItem[2][4]);
		end
		--2Xu
		--open_dxg_tyjyx_award();
	end
	local tItem = clause[sp][1];
	return tItem;
end

function giveOther(npcId)
	local oldPidx = PlayerIndex;
	local tSel = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if oldPidx ~= PlayerIndex then
			local player_name = GetName();
			player_name = gsub(player_name,"/","-");
			player_name = gsub(player_name,"|","-");
			player_name = gsub(player_name,":","-");
			tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho   "..player_name.."/#lootAwardOther("..PlayerIndex..","..npcId..")");
		end
	end
	tinsert(tSel, "K�t th�c ��i tho�i/nothing");
	PlayerIndex = oldPidx;
	local tLootItem = getLootItem();
	if not tLootItem then
		return
	end
	local nCount = (tLootItem[2] and tLootItem[2][4]) or 1;
	local msg = format("<color=yellow>[%s]x%d<color>",tLootItem[1], nCount);
	Say("<color=green>B�o r��ng<color>: � ��y c�"..msg, getn(tSel), tSel);
end

function lootAwardOther(pidx, npcId)
	local oldPidx = PlayerIndex;
	PlayerIndex = pidx;
	local name = GetName();
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Msg2Player("Kh�ng gian ho�c s�c n�ng c�a ng��i kh�ng ��, kh�ng th� nh�n v�t ph�m");
		if pidx ~= oldPidx then
			PlayerIndex = oldPidx;
			Msg2Player(format("%s kh�ng gian ho�c s�c n�ng kh�ng ��, kh�ng th� nh�n v�t ph�m", name));
		end
		return
	end
	giveAward(npcId);
	PlayerIndex = oldPidx;
end

function giveAward(npcId)
	local tItem = getLootItem();
	if not tItem then return end

	local nBossLv = GetMissionV(MV_SP_BOSS_LV)
	local nBoxLv = GetMissionV(MV_SP_BOX_LV)
	if nBossLv ~= nBoxLv then
		--Talk(1,"","Award Expired");
		WriteLog(format("[Error][dixuangong:InvalidAward] [Role:%s Acc:%s] [bossLv=%d, boxLv=%d, lootId=%d, itemName=%sx%d]",
			GetName(), GetAccount(), nBossLv, nBoxLv, GetMissionV(MV_SP_LOOT_ID), tItem[1], tItem[2][4]));
		-- SetMissionV(MV_SP_BOX_LV, 0);
		-- SetMissionV(MV_SP_LOOT_ID, 0);
		-- return
	end

	SetMissionV(MV_SP_BOX_LV, 0);
	SetMissionV(MV_SP_LOOT_ID, 0);
	SetMissionV(MV_SP_DAYE, 0);
	SetNpcScript(npcId, "");
	SetNpcLifeTime(npcId, 0);

	gf_SetLogCaption("dixuangong:ibbox2");
	Clause3.giveClause(tItem);
	gf_SetLogCaption("");
end
