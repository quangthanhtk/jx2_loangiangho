Import("\\script\\ksgvn\\lib.lua")

function OnUse(nItemIndex)
    local nRoute = KsgPlayer:GetRoute();
    if not g_tbYeuQuyet_Basic[nRoute] then
        return KsgNpc:Talk("C¸c h¹ ch­a gia nhËp m«n ph¸i, kh«ng thÓ më r­¬ng yÕu quyÕt nµy!");
    end

    local tbJueCfg = g_tbYeuQuyet_Basic[nRoute];
    local nFromId = tbJueCfg[1];
    local nToId = tbJueCfg[2];
    local nNeedRoom = nToId - nFromId + 1;
    local nStatus = 4;
    if GetItemSpecialAttr(nItemIndex,"BIND") == 0 then
        nStatus = 1;
    end

    if not KsgLib:HasEnoughBagRoom(nNeedRoom, nNeedRoom) then
        return 0;
    end

    if 1 == KsgItem:DeleteByIndex(nItemIndex) then
        local tbAward = {};
        for i = nFromId, nToId do
            tinsert(tbAward, { tbProp = { GENRE_ITEM_OTHER, ITEM_OD_ADDENDA, i }, nStatus = nStatus });
        end
        KsgAward:Give(tbAward);
    end
end