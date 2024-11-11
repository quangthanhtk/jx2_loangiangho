----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc n©ng cÊp trang bÞ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Thî rÌn L­u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_thorenluu.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: Nh©n sÜ vâ l©m t×m ®Õn ta gióp rÌn luyÖn binh khÝ nhiÒu kh«ng kÓ hÕt ®­îc, <sex> cÇn ta gióp g× cø nãi!", };
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENCUONG], EQUIP_SHOP_EXCHANGE_CHIENCUONG));
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
    else
    end
    tinsert(tbSay, "\nKhi kh¸c sÏ quay l¹i");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end
