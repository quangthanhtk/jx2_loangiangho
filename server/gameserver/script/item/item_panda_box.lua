-- ÐÜÃ¨³èÎïºÐ×Ó
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function OnUse(nItemIndex)
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Hµnh trang kh«ng ®ñ chç, kh«ng thÓ më!")
        return 
    end
    local nP = GetItemParticular(nItemIndex)
    local nTime = 604800

    local tbhorde2024={
        [1]=30044,
        [2]=120,
        [3]=30000,
        [4]=30056,
        [5]=205,
    }
    if DelItemByIndex(nItemIndex , 1) == 1 then
        local ih=random(1,5);
        local cnt,idx = AddItem(0, 105, tbhorde2024[ih], 1, 3, -1, -1, -1, -1, -1, -1)
        if nTime ~= -1 then
            SetItemExpireTime(idx, nTime)
        end
    end
end