----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc n�ng c�p trang b�
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Th� r�n L�u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_thorenluu.lua";

function _w_NpcMain(nNpcIdx)
    local tbSay = { "<npcname>: Nh�n s� v� l�m t�m ��n ta gi�p r�n luy�n binh kh� nhi�u kh�ng k� h�t ���c, <sex> c�n ta gi�p g� c� n�i!", };
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENCUONG], EQUIP_SHOP_EXCHANGE_CHIENCUONG));
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
    else
    end
    tinsert(tbSay, "\nKhi kh�c s� quay l�i");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end
