Import("\\script\\lib\\globalfunctions.lua");

function main()
	local szTitle = format("<color=gold>%s<color>: N�u t�i n�i luy�n ��n thu�t c�a c�a t�i x�p h�ng th� hai thi kh�ng c� ng��i gi�m x�p h�ng th� nh�t ��y. T�i c� th� gi�p b�n luy�n th�n ��n, t�ng c�p tu v�.",GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"M�i b�n gi�p m�nh!/Exp2Item")
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
function Exp2Item()
    local nRebornLv  = gf_GetPlayerRebornCount()
    local nLv        = GetLevel()
    local nTotalLv   = nRebornLv * 100 + nLv;
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
    if nTotalLv < 1080 then
        Talk(1,"",format("<color=gold>%s<color>: sau khi ��i hi�p ��t 10 chuy�n 80 c�p l�i ��n ��y nh�.",GetTargetNpcName()))
        return
    end
    local szTitle = format("<color=gold>%s<color>: sau khi ��i hi�p ��t 10 chuy�n 80 c�p , mu�n n�ng c�o n�ng l�c c�a b�n th�n ti�p th� c�n ��n l�c l��ng l�n lo. Nh�ng m� trong ��n �i�n c�a ng��i ch� c� th� d� tr� n�ng l��ng c� h�n. N�u chuy�n h�a n�ng l��ng t�ch l�y h�ng ng�y luy�n th�nh ��n d��c, v� s� d�ng khi ��t ph� gi�i h�n b�n th�n m�nh th� l� c�ch kh�c ph�c t�t nh�t. Luy�n h�a m�t <color=red>Linh Ph�ch ��n<color> c�n <color=red>3 t�<color> kinh nghi�m. B�n mu�n luy�n h�a kh�ng?",GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"��ng/Exp2ItemConfirm")
    tinsert(tbSay,"Sai/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end
function Exp2ItemConfirm()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
    local m,_,_ = GetWorldPos()
    if m ~= 6300 then
        return
    end
    if CanModifyLargeExp(-3000000000) ~= 1 then
        Talk(1,"",format("<color=gold>%s<color>: Kinh nghi�m c�a ��i hi�p kh�ng ��, m�i �i l�ch luy�n th�m l�i ��n ��y.",GetTargetNpcName()))
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
        Talk(1,"",format("<color=gold>%s<color>: H�nh trang c�a b�n kh�ng �� ch�.",GetTargetNpcName()))
        return
	end
	if GetCash() < 1000000 then
		Talk(1,"",format("<color=gold>%s<color>: Luy�n ��n c�n 100 v�ng, m�i b�n chu�n b� �� v�ng tr�n ng��i.",GetTargetNpcName()))
        return
	end
    if GetTask(3472) < 6 then
        Talk(1,"",format("<color=gold>%s<color>: Luy�n ��n c�n 6 �i�m t�ch c�c bang h�i c� nh�n.",GetTargetNpcName()))
        return
    end
    for i = 1,5 do
        if ModifyExp(-600000000) == 0 then
            return
        end
    end
	SetTask(3472,GetTask(3472)-6)
    Pay(1000000)
    
    gf_AddItemEx({2,1,31239,1}, "Linh Ph�ch ��n");
    FireEvent("event_gain_item", 2, 1, 31239, 1)
end