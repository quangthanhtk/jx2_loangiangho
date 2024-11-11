Include("\\script\\missions\\wantedboss\\mission.lua")

function main()
    local szTitle = format("<color=green>%s<color>: MÙc ti™u cÒa Truy S∏t L÷nh r t nguy hi”m, c∏c hi÷p s‹ ph∂i c»n thÀn.",WB_NPC_NAME)
    local tbSay = {}
    local m,_,_ = GetWorldPos()
    tinsert(tbSay , format("ß≠a ta rÍi kh·i Æ©y/#Exit(%d)", m))
    tinsert(tbSay , "HÒy b·/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function Exit(nMap)
    if GetWorldPos() ~= nMap then
        return 
    end
    OnLeave(PlayerIndex)
end