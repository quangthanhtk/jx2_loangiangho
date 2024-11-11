Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')
Import("\\script\\warlord\\preload.lua");

function OnUse(nItemIndex)
    --return Talk(1,"","Sù kiÖn ch­a më")
    local tbAward = {
        {
            { tbProp = { 2, 1, 40158 }, nStack = 1, nRate = 50.00 }, -- Sinh Tè
            { tbProp = { 2, 1, 40158 }, nStack = 2 , nRate = 30.00}, -- Sinh Tè
            { tbProp = { 2, 1, 40158 }, nStack = 3, nRate = 20.00 }, --Sinh Tè
        },
        {
            { tbProp = { 2, 1, 40159 }, nStack = 1, nRate = 50.00 }, -- Lóa M¹ch
            { tbProp = { 2, 1, 40159 }, nStack = 2 , nRate = 30.00}, -- Lóa M¹ch
            { tbProp = { 2, 1, 40159 }, nStack = 3, nRate = 20.00 }, --Lóa M¹ch
        },
        {
            { tbProp = { 2, 1, 40157 }, nStack = 1, nRate = 50.00 }, -- Men Bia
            { tbProp = { 2, 1, 40157 }, nStack = 2, nRate = 30.00}, -- Men Bia
            { tbProp = { 2, 1, 40157 }, nStack = 3, nRate = 20.00 }, --Men Bia
        },

    };
    if 1 == KsgItem:DeleteByIndex(nItemIndex) then
        WAward:Give(tbAward, "item_event_box");
    end
end