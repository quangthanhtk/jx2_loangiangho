Include("\\script\\function\\vip_card\\config.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end

function on_use_real(nItemIndex, bConfirm)
	do return Talk(1,"", "Th� th�ng �� ng�ng ho�t ��ng. H�y mua ��i Hi�p L�nh t�i Ng� C�c") end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	local szCardName = GetVipCardName(CUR_VIP_CARD_INDEX)
	if IsActivatedVipCard(CUR_VIP_CARD_INDEX) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "T�nh n�ng t�m ��ng"))
		return 0
	end
	local g,d,p,time = GetVipCardTime(CUR_VIP_CARD_INDEX)
	if BigGetItemCount(g,d,p) > 0 then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "�� c� Th� VIP n�y, kh�ng th� m� l�i"))
		return 0
	end
	
	if GetVipCardIndex() == CUR_VIP_CARD_INDEX then
		Talk(1,"",format("<color=green>%s:<color>%s", szCardName, "�� k�ch ho�t Th� VIP n�y, kh�ng th� m� ti�p"))
		return 0
	end
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 100) or GetFreeItemRoom() < 1 then
		Say("Kho�ng tr�ng trong t�i h�nh trang kh�ng ��", 0)
		return 0
	end
	
	local nExpritedays = 30
	if not bConfirm then
		local name = GetItemName(nItemIndex)
		local szMsg = format("M� %s s� nh�n ���c %d <color=yellow>%s (%d ng�y)<color>. Mu�n m�?", name, 1, szCardName, nExpritedays)
		Say(szMsg,
			2,
			format("%s/#on_use_real(%d, 1)","M�", nItemIndex),
			format("%s/nothing","Ra kh�i"))
		return 0
	end
	if time > 0 then
		if DelItemByIndex(nItemIndex, 1) == 1 then
			local nRet, nIndex = AddItem(g,d,p,1,100*nExpritedays*24*3600+1)
			return 1
		end
	end
	return 0
end
