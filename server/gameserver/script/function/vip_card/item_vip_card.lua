Include("\\script\\function\\vip_card\\config.lua")

function OnUse(nItemIndex)
	return on_use_real(nItemIndex)
end

function on_use_real(nItemIndex, bConfirm)
	if IsActivatedVipCard(CUR_VIP_CARD_INDEX) ~= 1 then
		Talk(1,"",format("%s", "Danh ph�n ��i Hi�p t�m ch�a m�"))
		return 0
	end
	
	local szCardName = GetVipCardName(CUR_VIP_CARD_INDEX)
	local g,d,p,time = GetVipCardTime(CUR_VIP_CARD_INDEX)
	local nG, nD, nP = GetItemInfoByIndex(nItemIndex)
	local szMsg = ""
	local szTime = ""
	local name = GetItemName(nItemIndex)
	if 1==is_in_valid_date(0) then
		szTime = format(" %s: <color=yellow>%s<color>\n %s: T� <color=yellow>%s ��n %s<color>\n %s"
			, "Th� danh ph�n VIP", szCardName, "H�n d�ng k�ch ho�t", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE), "Sau khi d�ng T�n Th� L�nh ho�c C�m Nang ��i S� Ki�n k�ch ho�t s� nh�n ���c1 th�ng danh ph�n ��i Hi�p")
	end
	if nG==g and nD==d and nP==p and szTime ~= "" then
		szMsg = format("<color=green>%s:<color>\n%s.",name, szTime)
	else
		szMsg = format("<color=green>%s:<color>%s\n\n%s.",name, "Th� danh ph�n kh�ng h�p l�", szTime)
	end
	Talk(1, "", szMsg)
	return 1
end