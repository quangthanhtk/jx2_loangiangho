----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-11-06
--- Description: c�c h�m callback dowait, � ��y ��ng �� t�n h�m qu� d�i
--- Include v�o file \\script\\global\\action_bar_callback.lua
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
--LongDaiKa: th�m t�nh n�ng n�ng c�p
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
