Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")

function main()
    local szTitle = format("<color=green>%s<color>: Ch�c m�i ng��i n�m m�i vui v�!.","Qu�n gia Bang h�i")
    local tbSay = {}
    tinsert(tbSay , "R�i ti�c/Exit")
    tinsert(tbSay , "M�ng ��n Xu�n T��i/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function Exit()
    OnLeave(PlayerIndex)
end