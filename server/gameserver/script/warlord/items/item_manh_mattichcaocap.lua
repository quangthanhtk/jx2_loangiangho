----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item m�nh m�t t�ch cao c�p ��i ra m�t t�ch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>M�nh M�t T�ch Cao C�p<color>: ";

function OnUse(nItemIdx)
    WLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_ROUTEBOOK_SUPER);
end
