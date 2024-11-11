Include("\\script\\isolate\\functions\\tong_title\\head.lua")

--function OnUse(nIdx)
--	do_use(nIdx, 0)
--end

function handle_use_item_taofaling(nIdx)
	return _handle_use_item_taofaling(nIdx, nil)
end

function _handle_use_item_taofaling(nIdx, bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local szTitle = format("Sau khi s� d�ng Th�o Ph�t c� th� t�ng nh�n ���c t�i �a Hi�p Ngh�a Chi Ch�ng ng�y �� :%d, c� hi�u l�c trong ng�y.", MAX_DAILY_DROP_XYZZ_EXT)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_handle_use_item_taofaling(%d, 1)", "��ng � d�ng", nIdx))
        tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
        
        Say(szTitle, getn(tbSay), tbSay)
        return 0
	end
	
	if GetTongName() == "" then
		Talk(1, "", "Gia nh�p bang h�i m�i c� th� s� d�ng")
		return 0
	end
	
	if get_ext_drop() ~= 0 then
		Talk(1, "", "H�m nay �� s� d�ng Th�o Ph�t L�nh")
		return 0
	end
	
	local g,d,p,name= 2,1,30915,"Th�o Ph�t L�nh "
	if DelItem(g,d,p, 1) == 1 then
		set_ext_drop(1)
		local szMsg = format("Ch�c m�ng s� d�ng th�nh c�ng Th�o Ph�t L�nh, h�m nay nh�n ���c Hi�p Ngh�a Chi Ch�ng t�ng t�i �a %d", MAX_DAILY_DROP_XYZZ_EXT)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		return 1
	else
		Talk(1, "", "Th�o Ph�t L�nh kh�ng ��.")
	end
	return 0
end