--脚本功能：少林售卖NPC对应脚本
--功能开发：武当
--开发时间：2011-4-2
--修改记录：
Import("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(2)
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end
