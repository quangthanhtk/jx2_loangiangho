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


--����������Ʒ�ű�
--��������	2,1,31403
function OnUse(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: %s gi�p m� kh�a trang b� kh�ng th� giao d�ch.",
		GetItemName(nItemIdx), GetItemName(nItemIdx))
	szTitle = format("%s\n%s",szTitle, "Xin ch� �:<color=red>gi�i kh�a trang b� s� x�a �� qu� kh�m tr�n trang b�.<color>")
	tinsert(tbSay, format("Ta mu�n gi�i kh�a/#_OnUse_confirm(%d)", nItemIdx))
	tinsert(tbSay, format("Tra xem trang b� c� th� gi�i kh�a/#_view_detail(%d)", nItemIdx))
	tinsert(tbSay, "Ra kh�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _view_detail(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s: gi�i kh�a trang b� kh�c nhau c�n ti�u hao v�ng v� s� l��ng v�t ph�m kh�c nhau. Hi�n t�i c�c trang b� sau c� th� gi�i kh�a: \nB� trang b� s� m�n 4, B� trang b� s� m�n 5, Trang b� Tinh Kh�c, \nTrang b� Thi�n Ngh�a, Trang b� H�o Nguy�t, Trang b� C�u Ch�u, \nTrang b� Di�u D��ng, trang b� V� L�m Minh Ch�, Thi�n ��a Nh�t Nguy�t gi�i ch�.",
		GetItemName(nItemIdx))

	tinsert(tbSay, format("tr� l�i/#OnUse(%d)", nItemIdx))
	tinsert(tbSay, "Ra kh�i/no")
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
		Talk(1, "", "V�t ph�m ch�a th� m� kh�a b�ng c�ch n�y");  
		return 0
	end

	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(nG, nD, nP);
	local tInfo = T_SUPER_JIEBANG_SUPPORT_EQUIP[nGDP] or nil;

	if not tInfo then
		Talk(1, "", "V�t ph�m ch�a th� m� kh�a b�ng c�ch n�y");  
		return 0
	end

	local nMoneyCost = tInfo[1] or 0;
	local tItemCost = tInfo[2] or nil;
	local szTitleHead = format("M� kh�a <color=yellow>%s<color> c�n t�n:", GetItemName(nItemIdx));
	local szTitle = "";

	if nMoneyCost and nMoneyCost > 0 then
		szTitle = format("\n<color=yellow>%d V�ng<color>", nMoneyCost);
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
		szTitle = format("Mu�n m� kh�a <color=yellow>%s<color> ch�?", GetItemName(nItemIdx));
	end

	Say(szTitle, 2, format("��ng �/#_UnBind_confirm(%d)", nItemIdx), "H�y b�/nothing");

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
			Talk(1, "", format("C�c h� mang theo kh�ng �� %d v�ng", nMoneyCost)); 
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
					Talk(1,"",format("%s kh�ng �� %d", GetItemName(g, d, p) or "", n))
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
					Talk(1,"","S� li�u b�o l�i, xin li�n h� nh� cung c�p!");
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
		Talk(1,"","S� li�u b�o l�i, xin li�n h� nh� cung c�p!");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][CostMoney][Faild][nMoney: %d(gold)]",
					GetName(), GetAccount(), nMoneyCost ));
		return 0
	end
	
	SetItemStatus(nItemIdx, 5, 1);	--//����װ���������
	SetItemStatus(nItemIdx, 1, 0);	--//ȥ��������
	ClearGemSocket(nItemIdx);		--//���װ���ϵı�ʯ
	SyncItem2Client(nItemIdx);

	local bEquipBind = GetItemStatus(nItemIdx, 5);
	local bBind = GetItemStatus(nItemIdx, 1);
	if bEquipBind == 1 and bBind == 0 then
		Talk(1,"","Thao t�c th�nh c�ng");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Success][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 1;
	else
		Talk(1,"","Thao t�c th�t b�i, vui l�ng li�n h� CSKH");
		WriteLog(format("[Role:%s (acc:%s)][SuperUnBind][Result][Faild][bEquipBind=%d, bBind=%d]",
					GetName(), GetAccount(), bEquipBind, bBind ));
		return 0;
	end
end

function no()
end