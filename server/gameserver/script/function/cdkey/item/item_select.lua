Import("\\script\\lib\\globalfunctions.lua")

S_ITS_LOG_TITLE = "ItemSelect"

T_AWARD_COSET_INFO =
{	
	--��ѡ4��������
	[gf_PackItemGDP(2,1,31516)] = {
		[1] = {
			[1] = {
				[1] = "B� V�n Du",
				[2] = {
					{"�o Cho�ng V�n Du", {0, 152, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Huy Ch��ng V�n Du", {0, 153, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"V�n Du Ngoa", {0, 154, 28, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[2] = {
				[1] = "B� Thi�t Huy�t",
				[2] = {
					{"Huy Ch��ng Thi�t Huy�t", {0, 153, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Thi�t Huy�t Ngoa", {0, 154, 27, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[3] = {
				[1] = "B� Du Hi�p",
				[2] = {
					{"Huy Ch��ng Du Hi�p", {0, 153, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"�o Cho�ng Du Hi�p", {0, 152, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Chi�n H�i Du Hi�p", {0, 154, 26, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
		},
	},
	--��ѡ5��������
	[gf_PackItemGDP(2,1,31517)] = {
		[1] = {
			[1] = {
				[1] = "B� ��ng V�n",
				[2] = {
					{"�o kho�c ��ng V�n", {0, 152, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Huy ch��ng ��ng V�n", {0, 153, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"��ng V�n Ngoa", {0, 154, 31, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[2] = {
				[1] = "B� Hi�p C�t",
				[2] = {
					{"Huy ch��ng Hi�p C�t", {0, 153, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"�o kho�c Hi�p C�t", {0, 152, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Hi�p C�t Ngoa", {0, 154, 29, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
			[3] = {
				[1] = "B� Qu� Ph�",
				[2] = {
					{"Huy ch��ng Q�y Ph�", {0, 153, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"�o kho�c Q�y Ph�", {0, 152, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
					{"Q�y Ph� Chi�n Ngoa", {0, 154, 30, 1, 4,-1,-1,-1,-1,-1,-1,-1,9}},
				},
			},
		},
	},

	--�任�̰������ͷ��
	[gf_PackItemGDP(2,1,31518)] = {
		[1] = {
			[1] = {
				[1] = "Kh�c B�n Ho�n M� C�p 3 (��u)",
				[2] = {
					{"Kh�c B�n Ho�n M� C�p 3 (��u)", {2, 1, 31261, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thi�n M�n Kim L�nh",	{2,1,30370,1}},
			{"Thi�n Cang L�nh",	{2,95,204,1}},
		},
	},
	--�任�̰��������װ��
	[gf_PackItemGDP(2,1,31519)] = {
		[1] = {
			[1] = {
				[1] = "Kh�c B�n Ho�n M� C�p 3 (�o)",
				[2] = {
					{"Kh�c B�n Ho�n M� C�p 3 (��u)", {2, 1, 31262, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thi�n M�n Kim L�nh",	{2,1,30370,2}},
			{"Thi�n Cang L�nh",	{2,95,204,2}},
		},
	},
	--�任�̰��������װ��
	[gf_PackItemGDP(2,1,31520)] = {
		[1] = {
			[1] = {
				[1] = "Kh�c B�n Ho�n M� C�p 3 (Qu�n)",
				[2] = {
					{"Kh�c B�n Ho�n M� C�p 3 (��u)", {2, 1, 31263, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thi�n M�n Kim L�nh",	{2,1,30370,3}},
			{"Thi�n Cang L�nh",	{2,95,204,3}},
		},
	},
	--�任�̰��������ָ��
	[gf_PackItemGDP(2,1,31521)] = {
		[1] = {
			[1] = {
				[1] = "Kh�c B�n Ho�n M� C�p 3 (Nh�n)",
				[2] = {
					{"Kh�c B�n Ho�n M� C�p 3 (Nh�n)", {2, 1, 31264, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thi�n M�n Kim L�nh",	{2,1,30370,3}},
			{"Thi�n Cang L�nh",	{2,95,204,3}},
		},
	},
	--�任�̰��������׹��
	[gf_PackItemGDP(2,1,31522)] = {
		[1] = {
			[1] = {
				[1] = "Kh�c B�n Ho�n M� C�p 3 (Ng�c B�i)",
				[2] = {
					{"Kh�c B�n Ho�n M� C�p 3 (Ng�c B�i)", {2, 1, 31265, 1, 4}},
				},
			},
		},
		--cost
		[2] = {
			{"Thi�n M�n Kim L�nh",	{2,1,30370,2}},
			{"Thi�n Cang L�nh",	{2,95,204,2}},
		},
		--�����ռ��ж�
		--[3] = 1,
	},

}

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx)
	local nGDP = gf_PackItemGDP(nG, nD, nP)

	if not T_AWARD_COSET_INFO[nGDP] then
		print(format("\n [Error] Missing Config in %s", [[\script\function\cdkey\item\Item_select.lua]]) )
		return 0
	end
	
	local tExchangeInfo = T_AWARD_COSET_INFO[nGDP]
	local szItemName = GetItemName(nItemIdx);
	local szSay = format("%s: H�y ch�n lo�i mu�n ��i:\n", szItemName)
	local tSay = {}

	local tCostInfo = tExchangeInfo[2]
	if tCostInfo and getn(tCostInfo) > 0 then
		szSay = format("��i %s c�n t�n th�m:\n<color=red>", szSay)
		for i=1, getn(tCostInfo) do
			szSay = format("%s%s * %d\n", 
				szSay,
				GetItemName(tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3]),
				tCostInfo[i][2][4])
		end
		szSay = format("%s<color>", szSay)
	end

	local tAwardInfo = tExchangeInfo[1]
	for i=1, getn(tAwardInfo) do
		tinsert(tSay, format("%s/#do_select(%d, %d, %d)", tAwardInfo[i][1], nItemIdx, nGDP, i) )
	end
	tinsert(tSay,"tr� l�i/nothing");

	Say(szSay, getn(tSay), tSay)
end

function do_select(nItemIdx, nGDP, nIndex)
	local tExchangeInfo = T_AWARD_COSET_INFO[nGDP]
	if not tExchangeInfo then
		return
	end

	local tAwardInfo = tExchangeInfo[1]
	if not tAwardInfo or not tAwardInfo[nIndex] then
		return
	end
	local tSelectAwardList = tAwardInfo[nIndex][2]

	if gf_JudgeRoomWeight(tExchangeInfo[3] or getn(tSelectAwardList), 0, "") ~= 1 then return end	

	gf_SetLogCaption(S_ITS_LOG_TITLE)
	local tCostInfo = tExchangeInfo[2]
	if tCostInfo and getn(tCostInfo) > 0 then
		--�ȼ������
		for i=1, getn(tCostInfo) do
			local g,d,p,n = tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3],tCostInfo[i][2][4]
			if GetItemCount(g,d,p) < n then
				Talk(1,"", format("%s: <color=red> %s trong t�i kh�ng �� %d<color>", GetItemName(nItemIdx), GetItemName(g,d,p), n))
				gf_SetLogCaption("")
				return
			end
		end
		--��ɾ������
		for i=1, getn(tCostInfo) do
			local g,d,p,n = tCostInfo[i][2][1],tCostInfo[i][2][2],tCostInfo[i][2][3],tCostInfo[i][2][4]
			if gf_DelItem(g,d,p,n) ~= 1 then
				Talk(1,"", format("%s: <color=red> %s trong t�i kh�ng �� %d<color>", GetItemName(nItemIdx), GetItemName(g,d,p), n))
				gf_SetLogCaption("")
				return
			end
		end
	end

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		gf_SetLogCaption("")
		return
	end

	--������
	for i=1, getn(tSelectAwardList) do
		gf_AddItemEx(tSelectAwardList[i][2])
	end

	gf_SetLogCaption("")
end