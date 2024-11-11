--�����䷽
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

tHaoXiaRecipe = {
	[30799] = {{"Vi�m Linh B�", {2, 1, 30676, 10}}, {"Linh Thi�t", {2, 1, 30681, 20}},	{"H�o Hi�p L�nh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30800] = {{"Ma Lang Gi�p", {2, 1, 30677, 10}}, {"Linh Thi�t", {2, 1, 30681, 20}},	{"H�o Hi�p L�nh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30801] = {{"��a Long Gi�p", {2, 1, 30678, 10}}, {"Linh Thi�t", {2, 1, 30681, 20}},	{"H�o Hi�p L�nh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30802] = {{"Huy�n Vi�m C��ng", {2, 1, 30675, 10}}, {"Linh Thi�t", {2, 1, 30681, 20}},	{"H�o Hi�p L�nh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30878] = {{"L�u Li Kim", {2, 1, 30684, 10}}, {"Linh Thi�t", {2, 1, 30681, 20}},	{"H�o Hi�p L�nh", {2, 95, 2084, 200}},	{" Kim ", 100}},		
};

function ComposeCap(szItem)
	gf_AddItemEx2({0, 103, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 103, 30568), "Gh�p trang b� H�o Hi�p", szItem, 0, 1);
end

function ComposeCloth(szItem)
	gf_AddItemEx2({0, 100, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 100, 30568), "Gh�p trang b� H�o Hi�p", szItem, 0, 1);
end

function ComposeShoe(szItem)
	gf_AddItemEx2({0, 101, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 101, 30568), "Gh�p trang b� H�o Hi�p", szItem, 0, 1);
end

function _TryCostRecipe(nItem)
	local detail = GetItemParticular(nItem);
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end	
	local tRecipeList = tHaoXiaRecipe[detail];
	for _, v in tRecipeList do
		if type(v[2]) == "table" then
			if DelItem(gf_UnPack(v[2])) ~= 1 then
				return 0;
			end
		else
			if Pay(v[2]*10000) ~= 1 then
				return 0;
			end
		end
	end
	return 1;
end

function ComposeWeapon(nItem, nIndex)
	local tWeapon = {
		[2]  = {"H�o Hi�p �ao", {0,  3,  30724, 1, 1, -1, -1, -1, -1, -1, -1}},
		[3]  = {"H�o Hi�p Tr��ng", {0,  8,  30725, 1, 1, -1, -1, -1, -1, -1, -1}},
		[4]  = {"H�o Hi�p Th�", {0,  0,  30726, 1, 1, -1, -1, -1, -1, -1, -1}},
		[6]  = {"H�o Hi�p Ch�m", {0,  1,  30727, 1, 1, -1, -1, -1, -1, -1, -1}},
		[8]  = {"H�o Hi�p Ki�m", {0,  2,  30728, 1, 1, -1, -1, -1, -1, -1, -1}},
		[9]  = {"H�o Hi�p C�m", {0, 10,  30729, 1, 1, -1, -1, -1, -1, -1, -1}},
		[11] = {"H�o Hi�p Th�", {0,  0,  30730, 1, 1, -1, -1, -1, -1, -1, -1}},
		[12] = {"H�o Hi�p C�n", {0,  5,  30731, 1, 1, -1, -1, -1, -1, -1, -1}},
		[14] = {"H�o Hi�p Ki�m", {0,  2,  30732, 1, 1, -1, -1, -1, -1, -1, -1}},
		[15] = {"H�o Hi�p B�t", {0,  9,  30733, 1, 1, -1, -1, -1, -1, -1, -1}},
		[17] = {"H�o Hi�p Th��ng", {0,  6,  30734, 1, 1, -1, -1, -1, -1, -1, -1}},
		[18] = {"H�o Hi�p Cung", {0,  4,  30735, 1, 1, -1, -1, -1, -1, -1, -1}},
		[20] = {"H�o Hi�p Song �ao", {0,  7,  30736, 1, 1, -1, -1, -1, -1, -1, -1}},
		[21] = {"H�o Hi�p Tr�o", {0,  11,  30737, 1, 1, -1, -1, -1, -1, -1, -1}},
		[23] = {"H�o Hi�p Ki�m", {0, 2,  30738, 1, 1, -1, -1, -1, -1, -1, -1}},
		[25] = {"H�o Hi�p �ao", {0,  3,  30739, 1, 1, -1, -1, -1, -1, -1, -1}},
		[26] = {"H�o Hi�p B�t", {0,  9,  30740, 1, 1, -1, -1, -1, -1, -1, -1}},
		[27] = {"H�o Hi�p Tr�o", {0, 11,  30741, 1, 1, -1, -1, -1, -1, -1, -1}},
		[29] = {"H�o Hi�p Phi�n", {0, 13,  30742, 1, 1, -1, -1, -1, -1, -1, -1}},
		[30] = {"H�o Hi�p ��ch", {0, 12,  30743, 1, 1, -1, -1, -1, -1, -1, -1}},
		[31] = {"H�o Hi�p Ch�y", {0, 14,  32162, 1, 1, -1, -1, -1, -1, -1, -1}},
		[32] = {"H�o Hi�p Ki�m", {0, 2,  32190, 1, 1, -1, -1, -1, -1, -1, -1}},
	}
	if not nIndex then
		local tbSay = {};
		tbSay.msg = "H�y ch�n lo�i v� kh� c�a l�u ph�i t��ng �ng:";
		tbSay.sel = {};			
		for k, v in tWeapon do
			local content = gf_GetRouteName(k)
			if GetPlayerRoute() == k then
				content = content.." *"
			end
			tinsert(tbSay.sel, {content, format("#ComposeWeapon(%d, %d)", nItem, k)});
		end
		tinsert(tbSay.sel, {"\n r�t lui", "nothing"});
		temp_Talk(tbSay);
		return 0;
	end
	if not tWeapon[nIndex] then return 0; end
	if _TryCostRecipe(nItem) ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tWeapon[nIndex][2], tWeapon[nIndex][1], "Gh�p trang b� H�o Hi�p", GetItemName(nItem), 0, 1);
	AddRuntimeStat(29, 10, 0, 1);
end

function ComposeRing(nItem, nIndex)
	local tRing = {
		[1] = {"H�o Hi�p Gi�i", {0, 102, 31126, 1, 1, -1, -1, -1, -1, -1, -1}},
		[2] = {"H�o Hi�p B�i", {0, 102, 31127, 1, 1, -1, -1, -1, -1, -1, -1}},
	}
	if not nIndex then
		local tSay = {};
		for k, v in tRing do
			tinsert(tSay, format("\nGh�p %s/#ComposeRing(%d, %d)", v[1], nItem, k))
		end
		tinsert(tSay, "\n r�t lui/nothing");
		Say("H�y ch�n trang s�c c�n ��i:", getn(tSay), tSay);
		return 0;
	end
	if not tRing[nIndex] then return 0; end
	if _TryCostRecipe(nItem) ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tRing[nIndex][2], tRing[nIndex][1], "Gh�p trang b� H�o Hi�p", GetItemName(nItem), 0, 1);
	AddRuntimeStat(29, 10, 0, 1);
end
		
function OnUseItem(nItem)
	if _TryCostRecipe(nItem) ~= 1 then
		return 0;
	end
	local detail = GetItemParticular(nItem);
	local szItem = GetItemName(nItem);
	local tName2Func = {
		[30799] = ComposeCap,
		[30800] = ComposeCloth,
		[30801] = ComposeShoe,
	}
	tName2Func[detail](szItem);
	AddRuntimeStat(29, 10, 0, 1);
end

function OnUse(nItem)
	local detail = GetItemParticular(nItem);
	local szItem = GetItemName(nItem)
	local tRecipeList = tHaoXiaRecipe[detail];
	local msg = "";
	local bCan = 1;
	local nCount = 1;
	for _, v in tRecipeList do
		local nType = type(v[2]);
		if nType == "table" then
			local nNeed = v[2][4];
			local nHave = GetItemCount(v[2][1], v[2][2], v[2][3]);
			if nHave >= v[2][4] then
				msg = msg..format("<color=green> %d. %sx%d<color>", nCount, v[1], v[2][4]);
			else
				msg = msg..format("<color=red> %d. %s#%d (Thi�u %d c�i)<color>", nCount, v[1], v[2][4], v[2][4] - nHave);
				bCan = nil;
			end
			nCount = nCount + 1;
		elseif nType == "number" then
			if GetCash()/10000 >= v[2] then
				msg = msg..format("<color=green> %d. %d%s<color>", nCount, v[2], v[1]);
			else
				msg = msg..format("<color=red> %d. %d%s (V�ng kh�ng ��)<color>", nCount, v[2], v[1]);
				bCan = nil;
			end
			nCount = nCount + 1;
		end
		msg = msg.."\n";
	end
	local tSection = {
		[30799] = "��ng �/#OnUseItem(%d)",
		[30800] = "��ng �/#OnUseItem(%d)",
		[30801] = "��ng �/#OnUseItem(%d)",
		[30802] = "��ng �/#ComposeWeapon(%d)",
		[30878] = "��ng �/#ComposeRing(%d)",
	}
	local tSay = {};
	if bCan then
		tinsert(tSay, format(tSection[detail], nItem));
	end
	tinsert(tSay, "\n h�y b�/nothing");
	Say(format("S� d�ng <color=gold>%s<color> �� gh�p c�n ti�u hao nguy�n li�u b�n d��i:\n\t%s ��ng � gh�p kh�ng?", szItem, msg), getn(tSay), tSay);	
end