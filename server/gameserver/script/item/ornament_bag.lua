----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-15
--- Description: item tói/r­¬ng më ra c¸nh theo kiÓu h×nh
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_tbPackItemList = {
    [PackItemId(2,1,31558)] = { szName = "C¸n Khª Sa", nStartId = 303 },
    [PackItemId(2,1,31578)] = { szName = "Ph¸ TrËn Tö", nStartId = 415 },
    [PackItemId(2,1,31559)] = { szName = "L©m Giang Tiªn", nStartId1 = 311, nStartId2 = 315, nStartId3 = 311 },
    [PackItemId(2,1,31573)] = { szName = "Gi¸ C« Tiªn", nStartId = 403 },
    [PackItemId(2,1,31553)] = { szName = "S­¬ng Thiªn HiÓu Gi¸c", nStartId = 271 },
}

function OnUse(nItemIdx)
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbPackItemList[nPackItemtId] ~= WEnv.NULL then
        if WItem:DelByIndex(nItemIdx, 1) == WEnv.RETCODE_SUCCESS then
            if m_tbPackItemList[nPackItemtId].nStartId ~= WEnv.NULL then
                KsgItem:AddOrnByBody(m_tbPackItemList[nPackItemtId].nStartId, m_tbPackItemList[nPackItemtId].nStatus or ITEMSTATUS_LOCK, 0, m_tbPackItemList[nPackItemtId].szName);
            else
                KsgItem:AddOnceByBody(m_tbPackItemList[nPackItemtId].nStartId1, m_tbPackItemList[nPackItemtId].nStatus or ITEMSTATUS_LOCK, 0, 119, m_tbPackItemList[nPackItemtId].szName)
                KsgItem:AddOnceByBody(m_tbPackItemList[nPackItemtId].nStartId2, m_tbPackItemList[nPackItemtId].nStatus or ITEMSTATUS_LOCK, 0, 120, m_tbPackItemList[nPackItemtId].szName)
                KsgItem:AddOnceByBody(m_tbPackItemList[nPackItemtId].nStartId3, m_tbPackItemList[nPackItemtId].nStatus or ITEMSTATUS_LOCK, 0, 121, m_tbPackItemList[nPackItemtId].szName)
            end
            return WEnv.RETCODE_SUCCESS;
        else
            WNpc:Talk("Thu håi thÊt b¹i.", 1);
            return WEnv.RETCODE_CONSUMEERROR;
        end
    else
        WNpc:Talk("Bªn trong trèng rçng, kh«ng thu ®­îc g×.", 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
