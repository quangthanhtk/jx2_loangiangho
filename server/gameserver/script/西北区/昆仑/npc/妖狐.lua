Include("\\script\\task\\huofengtask\\npc_enter_wanlingtai.lua")
TB_FOX_DIALOG = {
	"<color=green>H� Y�u<color>: L� ai l�m, ta s� kh�ng tha!",
	"<color=green>H� Y�u<color>: Tr�n ph�p n�y ng�y c�ng m�nh, ta kh�ng th� c� ��ng!",
	"<color=green>H� Y�u<color>: Ai t�i c�u ta! Ta...ki�t s�c r�i...",
}
function main()
--	if tGtTask:check_task_isfinish(270) ~= 1 then
--		Talk(1,"",TB_FOX_DIALOG[random(getn(TB_FOX_DIALOG))])
--	else
		npc_talk_main()
--	end
end
