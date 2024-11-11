----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item m∂nh mÀt tﬁch cao c p ÆÊi ra mÀt tﬁch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>M∂nh MÀt Tﬁch Cao C p<color>: ";

function OnUse(nItemIdx)
    WLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_ROUTEBOOK_SUPER);
end
