-- �������ΰ�
-- �ܿ�������ĺ�������
-- ������	{0, 102, 31126},
-- ������	{0, 102, 31127},
Import("\\script\\lib\\globalfunctions.lua")

local tRings = {
    {0, 102, 31126, 1, 4, "H�o Hi�p Gi�i"},
    {0, 102, 31127, 1, 4, "H�o Hi�p B�i"},
}

function OnUse(nItemIdx)
    if gf_JudgeRoomWeight(1,10,"") == 0 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0;
    end;
    local randIdx = random(1,getn(%tRings))
    local t = %tRings[randIdx]
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_AddItemEx({t[1],t[2],t[3],t[4],t[5]}, t[6]);
	end;
end;