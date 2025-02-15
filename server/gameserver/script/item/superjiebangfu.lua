Import("\\script\\lib\\globalfunctions.lua")


T_SUPER_JIEBANG_SUPPORT_EQUIP = {
	--[gf_PackItemGDP(g, d, p)] = {nMoneyCost(gold), {{nG1,nD1,nP1,nCount1}, {nG2,nD2,nP2,nCount2},...}, ...},
	[gf_PackItemGDP(0,152,35)] = {100,	{{2, 1, 31403, 1}, },	},
	[gf_PackItemGDP(0,153,35)] = {200,	{{2, 1, 31403, 2}, },	},
	[gf_PackItemGDP(0,154,35)] = {300,	{{2, 1, 31403, 3}, },	},
	[gf_PackItemGDP(0,152,34)] = {0,	{{2, 1, 31403, 3}, },	},
	[gf_PackItemGDP(0,153,34)] = {100,	{				   },	},
	[gf_PackItemGDP(0,154,34)] = {								},

}


--超级解绑符物品脚本
--超级解绑符	2,1,31403
function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: %s gi髉 m� kh鉧 trang b� kh玭g th� giao d辌h.",
		GetItemName(nItemIdx), GetItemName(nItemIdx))
	szTitle = format("%s\n%s",szTitle, "Xin ch� �:<color=red>gi秈 kh鉧 trang b� s� x鉧  qu� kh秏 tr猲 trang b�.<color>")
	tinsert(tbSay, format("Ta mu鑞 gi秈 kh鉧/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("Tra xem trang b� c� th� gi秈 kh鉧/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "Ra kh醝/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: gi秈 kh鉧 trang b� kh竎 nhau c莕 ti猽 hao v祅g v� s� lng v藅 ph萴 kh竎 nhau. Hi謓 t筰 c竎 trang b� sau c� th� gi秈 kh鉧: \nB� trang b� s� m玭 4, B� trang b� s� m玭 5, Trang b� Tinh Kh綾, \nTrang b� Thi猲 Ngh躠, Trang b� H筼 Nguy謙, Trang b� C鰑 Ch﹗, \nTrang b� Di謚 Dng, trang b� V� L﹎ Minh Ch�, Thi猲 мa Nh藅 Nguy謙 gi韎 ch�.",
		GetItemName(nItemIdx))

	tinsert(tbSay, format("tr� l筰/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "Ra kh醝/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUse_confirm(nItemIdx)
	SendScript2Client("Open([[CommonEnhanceItem]], 13);");
end

function UnBind(nItemIdx)
	if GetItemStatus(nItemIdx, 1) ~= 1 then
		return 0
	end

	if not T_SUPER_JIEBANG_SUPPORT_EQUIP then
		Talk(1, "", "V藅 ph萴 ch璦 th� m� kh鉧 b籲g c竎h n祔");  
		return 0
	end

	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nG, nD, nP);
	local tInfo = T_SUPER_JIEBANG_SUPPORT_EQUIP[nGDP] or nil;

	if not tInfo then
		Talk(1, "", "V藅 ph萴 ch璦 th� m� kh鉧 b籲g c竎h n祔");  
		return 0
	end

	local nMoneyCost = tInfo[1] or 0;
	local tItemCost = tInfo[2] or nil;
	local szTitleHead = format("M� kh鉧 <color=yellow>%s<color> c莕 t鑞:", GetItemName(nItemIdx));
	local szTitle = "";

	if nMoneyCost and nMoneyCost > 0 then
		szTitle = format("\n<color=yellow>%d V祅g<color>", nMoneyCost);
	end

	local tItem, g, d, p, n, szItemName;
	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				szItemName = GetItemName(g, d, p);
				szTitle = szTitle..format("\n<color=yellow>%s x%d<color>", szItemName, n);
			end
		end
	end
	if szTitle and szTitle ~= "" then
		szTitle = szTitleHead..szTitle;
	else
		szTitle = format("Mu鑞 m� kh鉧 <color=yellow>%s<color> ch�?", GetItemName(nItemIdx));
	end

	Say(szTitle, 2, format("уng �/#_UnBind_confirm(%d)", nItemIdx), "H駓 b�/nothing");

	return 1
end

function _UnBind_confirm(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nG, nD, nP);
	local tInfo = T_SUPER_JIEBANG_SUPPORT_EQUIP[nGDP] or nil;

	if not tInfo then
		return 0
	end

	local nMoneyCost = tInfo[1] or 0;
	local tItemCost = tInfo[2] or nil;

	if nMoneyCost and nMoneyCost > 0 then
		if (GetCash() or 0) < nMoneyCost*10000 then
			Talk(1, "", format("C竎 h� mang theo kh玭g  %d v祅g", nMoneyCost)); 
			return 0 
		end
	end

	local tItem, g, d, p, n, szItemName;

	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				if (GetItemCount(g, d, p) or 0) < n then
					Talk(1,"",format("%s kh玭g  %d", GetItemName(g, d, p) or "", n))
					return 0
				end
			end
		end
	end
	
	gf_SetLogCaption("SuperUnbindItem");
	if tItemCost and getn(tItemCost) > 0 then
		for i=1, getn(tItemCost) do
			tItem = tItemCost[i];
			g = tonumber(tItem[1]) or nil;
			d = tonumber(tItem[2]) or nil;
			p = tonumber(tItem[3]) or nil;
			n = tonumber(tItem[4]) or 0;
			if g >= 0 and d >= 0 and p>=0 and n > 0 then
				if gf_DelItem(g, d, p, n) ~= 1 then
					Talk(1,"","S� li謚 b竜 l鏸, xin li猲 h� nh� cung c蕄!");
					WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][CostItem][Faild][ItemName: %s(%d,%d,%d,%d) ]",
								GetName(), GetAccount(), GetItemName(g,d,p), g,d,p,n ));
					gf_SetLogCaption("");
					return 0
				end
			end
		end
	end
	gf_SetLogCaption("");


	if nMoneyCost > 0 and Pay(nMoneyCost*10000) ~= 1 then
		Talk(1,"","S� li謚 b竜 l鏸, xin li猲 h� nh� cung c蕄!");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][CostMoney][Faild][nMoney: %d(gold)]",
					GetName(), GetAccount(), nMoneyCost ));
		return 0
	end
	
	SetItemStatus(nItemIdx, 5, 1);	--//增加装备后绑定属性
	SetItemStatus(nItemIdx, 1, 0);	--//去除绑定属性
	ClearGemSocket(nItemIdx);		--//清除装备上的宝石
	SyncItem2Client(nItemIdx);

	local bEquipBind = GetItemStatus(nItemIdx, 5);
	local bBind = GetItemStatus(nItemIdx, 1);
	if bEquipBind == 1 and bBind == 0 then
		Talk(1,"","Thao t竎 th祅h c玭g");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Success][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 1;
	else
		Talk(1,"","Thao t竎 th蕋 b筰, vui l遪g li猲 h� CSKH");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Faild][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 0;
	end
end

function no()
end