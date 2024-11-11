----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item më ra shop uÈn linh
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_tbPackItemList = {
    [PackItemId(2, 1, 40122)] = EQUIP_SHOP_EXCHANGE_UANLINH8,
};

function OnUse(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbPackItemList[nPackItemtId] ~= WEnv.NULL then
        WLib:OpenEquipShop(m_tbPackItemList[nPackItemtId]);
    end
end
