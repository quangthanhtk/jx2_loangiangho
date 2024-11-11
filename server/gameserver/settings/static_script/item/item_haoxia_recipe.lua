--ºÀÏÀÅä·½
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

tHaoXiaRecipe = {
	[30799] = {{"Viªm Linh Bè", {2, 1, 30676, 10}}, {"Linh ThiÕt", {2, 1, 30681, 20}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30800] = {{"Ma Lang Gi¸p", {2, 1, 30677, 10}}, {"Linh ThiÕt", {2, 1, 30681, 20}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30801] = {{"§Þa Long Gi¸p", {2, 1, 30678, 10}}, {"Linh ThiÕt", {2, 1, 30681, 20}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30802] = {{"HuyÒn Viªm C­¬ng", {2, 1, 30675, 10}}, {"Linh ThiÕt", {2, 1, 30681, 20}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 200}},	{" Kim ", 100}},
	[30878] = {{"L­u Li Kim", {2, 1, 30684, 10}}, {"Linh ThiÕt", {2, 1, 30681, 20}},	{"Hµo HiÖp LÖnh", {2, 95, 2084, 200}},	{" Kim ", 100}},		
};

function ComposeCap(szItem)
	gf_AddItemEx2({0, 103, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 103, 30568), "GhÐp trang bÞ Hµo HiÖp", szItem, 0, 1);
end

function ComposeCloth(szItem)
	gf_AddItemEx2({0, 100, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 100, 30568), "GhÐp trang bÞ Hµo HiÖp", szItem, 0, 1);
end

function ComposeShoe(szItem)
	gf_AddItemEx2({0, 101, 30568, 1, 1, -1, -1, -1, -1, -1, -1}, GetItemName(0, 101, 30568), "GhÐp trang bÞ Hµo HiÖp", szItem, 0, 1);
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
		[2]  = {"Hµo HiÖp §ao", {0,  3,  30724, 1, 1, -1, -1, -1, -1, -1, -1}},
		[3]  = {"Hµo HiÖp Tr­îng", {0,  8,  30725, 1, 1, -1, -1, -1, -1, -1, -1}},
		[4]  = {"Hµo HiÖp Thñ", {0,  0,  30726, 1, 1, -1, -1, -1, -1, -1, -1}},
		[6]  = {"Hµo HiÖp Ch©m", {0,  1,  30727, 1, 1, -1, -1, -1, -1, -1, -1}},
		[8]  = {"Hµo HiÖp KiÕm", {0,  2,  30728, 1, 1, -1, -1, -1, -1, -1, -1}},
		[9]  = {"Hµo HiÖp CÇm", {0, 10,  30729, 1, 1, -1, -1, -1, -1, -1, -1}},
		[11] = {"Hµo HiÖp Thñ", {0,  0,  30730, 1, 1, -1, -1, -1, -1, -1, -1}},
		[12] = {"Hµo HiÖp C«n", {0,  5,  30731, 1, 1, -1, -1, -1, -1, -1, -1}},
		[14] = {"Hµo HiÖp KiÕm", {0,  2,  30732, 1, 1, -1, -1, -1, -1, -1, -1}},
		[15] = {"Hµo HiÖp Bót", {0,  9,  30733, 1, 1, -1, -1, -1, -1, -1, -1}},
		[17] = {"Hµo HiÖp Th­¬ng", {0,  6,  30734, 1, 1, -1, -1, -1, -1, -1, -1}},
		[18] = {"Hµo HiÖp Cung", {0,  4,  30735, 1, 1, -1, -1, -1, -1, -1, -1}},
		[20] = {"Hµo HiÖp Song §ao", {0,  7,  30736, 1, 1, -1, -1, -1, -1, -1, -1}},
		[21] = {"Hµo HiÖp Tr¶o", {0,  11,  30737, 1, 1, -1, -1, -1, -1, -1, -1}},
		[23] = {"Hµo HiÖp KiÕm", {0, 2,  30738, 1, 1, -1, -1, -1, -1, -1, -1}},
		[25] = {"Hµo HiÖp §ao", {0,  3,  30739, 1, 1, -1, -1, -1, -1, -1, -1}},
		[26] = {"Hµo HiÖp Bót", {0,  9,  30740, 1, 1, -1, -1, -1, -1, -1, -1}},
		[27] = {"Hµo HiÖp Tr¶o", {0, 11,  30741, 1, 1, -1, -1, -1, -1, -1, -1}},
		[29] = {"Hµo HiÖp PhiÕn", {0, 13,  30742, 1, 1, -1, -1, -1, -1, -1, -1}},
		[30] = {"Hµo HiÖp §Þch", {0, 12,  30743, 1, 1, -1, -1, -1, -1, -1, -1}},
		[31] = {"Hµo HiÖp Chñy", {0, 14,  32162, 1, 1, -1, -1, -1, -1, -1, -1}},
		[32] = {"Hµo HiÖp KiÕm", {0, 2,  32190, 1, 1, -1, -1, -1, -1, -1, -1}},
	}
	if not nIndex then
		local tbSay = {};
		tbSay.msg = "H·y chän lo¹i vò khÝ cña l­u ph¸i t­¬ng øng:";
		tbSay.sel = {};			
		for k, v in tWeapon do
			local content = gf_GetRouteName(k)
			if GetPlayerRoute() == k then
				content = content.." *"
			end
			tinsert(tbSay.sel, {content, format("#ComposeWeapon(%d, %d)", nItem, k)});
		end
		tinsert(tbSay.sel, {"\n rót lui", "nothing"});
		temp_Talk(tbSay);
		return 0;
	end
	if not tWeapon[nIndex] then return 0; end
	if _TryCostRecipe(nItem) ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tWeapon[nIndex][2], tWeapon[nIndex][1], "GhÐp trang bÞ Hµo HiÖp", GetItemName(nItem), 0, 1);
	AddRuntimeStat(29, 10, 0, 1);
end

function ComposeRing(nItem, nIndex)
	local tRing = {
		[1] = {"Hµo HiÖp Giíi", {0, 102, 31126, 1, 1, -1, -1, -1, -1, -1, -1}},
		[2] = {"Hµo HiÖp Béi", {0, 102, 31127, 1, 1, -1, -1, -1, -1, -1, -1}},
	}
	if not nIndex then
		local tSay = {};
		for k, v in tRing do
			tinsert(tSay, format("\nGhÐp %s/#ComposeRing(%d, %d)", v[1], nItem, k))
		end
		tinsert(tSay, "\n rót lui/nothing");
		Say("H·y chän trang søc cÇn ®æi:", getn(tSay), tSay);
		return 0;
	end
	if not tRing[nIndex] then return 0; end
	if _TryCostRecipe(nItem) ~= 1 then
		return 0;
	end
	gf_AddItemEx2(tRing[nIndex][2], tRing[nIndex][1], "GhÐp trang bÞ Hµo HiÖp", GetItemName(nItem), 0, 1);
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
				msg = msg..format("<color=red> %d. %s#%d (ThiÕu %d c¸i)<color>", nCount, v[1], v[2][4], v[2][4] - nHave);
				bCan = nil;
			end
			nCount = nCount + 1;
		elseif nType == "number" then
			if GetCash()/10000 >= v[2] then
				msg = msg..format("<color=green> %d. %d%s<color>", nCount, v[2], v[1]);
			else
				msg = msg..format("<color=red> %d. %d%s (Vµng kh«ng ®ñ)<color>", nCount, v[2], v[1]);
				bCan = nil;
			end
			nCount = nCount + 1;
		end
		msg = msg.."\n";
	end
	local tSection = {
		[30799] = "§ång ý/#OnUseItem(%d)",
		[30800] = "§ång ý/#OnUseItem(%d)",
		[30801] = "§ång ý/#OnUseItem(%d)",
		[30802] = "§ång ý/#ComposeWeapon(%d)",
		[30878] = "§ång ý/#ComposeRing(%d)",
	}
	local tSay = {};
	if bCan then
		tinsert(tSay, format(tSection[detail], nItem));
	end
	tinsert(tSay, "\n hñy bá/nothing");
	Say(format("Sö dông <color=gold>%s<color> ®Ó ghÐp cÇn tiªu hao nguyªn liÖu bªn d­íi:\n\t%s ®ång ý ghÐp kh«ng?", szItem, msg), getn(tSay), tSay);	
end