Include("\\script\\missions\\wantedboss\\mission.lua")

function main()
    local szTitle = format("<color=green>%s<color>: M�c ti�u c�a Truy S�t L�nh r�t nguy hi�m, c�c hi�p s� ph�i c�n th�n.",WB_NPC_NAME)
    local tbSay = {}
    local m,_,_ = GetWorldPos()
    tinsert(tbSay , format("��a ta r�i kh�i ��y/#Exit(%d)", m))
    tinsert(tbSay , "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function Exit(nMap)
    if GetWorldPos() ~= nMap then
        return 
    end
    OnLeave(PlayerIndex)
end