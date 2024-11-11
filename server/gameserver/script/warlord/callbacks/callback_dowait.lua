----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-11-06
--- Description: c¸c hµm callback dowait, ë ®©y ®õng ®Ó tªn hµm qu¸ dµi
--- Include vµo file \\script\\global\\action_bar_callback.lua
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
--LongDaiKa: thªm tÝnh n¨ng n©ng cÊp
function _w_ItemUpgrade_OnComplete()
    SendScript2VM('\\script\\warlord\\npcs\\npc_hoctro_thorenluu.lua', '_w_DoWaitComplete()');
end
function _w_ItemUpgrade_OnAbort()
    SendScript2VM('\\script\\warlord\\npcs\\npc_hoctro_thorenluu.lua', '_w_DoWaitAbort()');
end

function _w_RuongQuyMao_OpenSuccess()
    SendScript2VM("\\script\\warlord\\online_activities\\ruong_quy_mao\\npc_baoruong.lua", "WRUONGQUYMAO:GiveAward()");
end

function _w_RuongQuyMao_OpenFail()
end
