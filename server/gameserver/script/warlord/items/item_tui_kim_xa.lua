----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m¶nh mËt tÞch cao cÊp ®æi ra mËt tÞch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Tói Kim Xµ<color>: ";

m_tbItemList = {
    [PackItemId(2, 1, 40123)] = 7,
};

function OnUse(nItemIdx)
    if WLib:CheckInv(10, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbItemList[nPackItemtId] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end
    
    --- Give award
    local nKimXaLevel = m_tbItemList[nPackItemtId] or 0;

    if nKimXaLevel == 0 then
        return WEnv.RETCODE_ERROR;
    end

    if WItem:DelByIndex(nItemIdx, 1) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Thu håi tói kim xµ thÊt b¹i, h·y liªn hÖ admin ®Ô ®­îc hç trî!");
        return WEnv.RETCODE_CONSUMEERROR;
    end

    KsgAward:AddKimXa(nKimXaLevel, 0, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_tui_kim_xa", ITEMFEED_12);
    KsgAward:AddKimXa(nKimXaLevel, 0, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_tui_kim_xa", ITEMFEED_12);
    KsgAward:AddKimXa(nKimXaLevel, 0, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_tui_kim_xa", ITEMFEED_12);
end
