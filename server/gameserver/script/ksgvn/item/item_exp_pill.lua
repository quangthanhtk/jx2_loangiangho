Import("\\script\\ksgvn\\lib.lua")

function OnUse(nItemIdx)
    local tSay = {
        "S� d�ng <color=green>Kinh Nghi�m T�o H�a �an<color> s� <color=yellow>tr�c ti�p t�ng 1 c�p<color> ��i hi�p x�c ��nh mu�n s� d�ng sao?<enter><color=gray>N�u �� ��t chuy�n sinh 10 c�p 99 th� s� t�ng 1 c�p H�a C�nh<color>",
        format("��ng v�y/#_ConfirmUse(%d)", nItemIdx),
        "T�m th�i ch�a mu�n d�ng/no"
    }
    KsgNpc:SayDialog(tSay)
end

function _ConfirmUse(nItemIdx)
    if KsgPlayer:GetBigLevel() == 1099 then
        return KsgNpc:Talk("�� ��t ��ng c�p t�i �a, kh�ng th� s� d�ng v�t ph�m n�y.")
    end
    if 1 == KsgItem:DeleteByIndex(nItemIdx) then
        AddLevelUp(1)
        Msg2Player("Th�ng c�p th�nh c�ng!")
        PlaySound("\\sound\\sound_i016.wav")
    end
end
