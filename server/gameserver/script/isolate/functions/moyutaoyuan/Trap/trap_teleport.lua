Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")

function main()
    local tPos = TaoYuan_MapInfo[3].teleport_pos
    local rand = random(1,getn(tPos))
    SetPos(tPos[rand][1],tPos[rand][2])
    Msg2Player("Ng��i �� k�ch ho�t 1 B�y, b� chuy�n ��n n�i kh�c trong khu v�c.")
end