--�ű����ܣ���������NPC��Ӧ�ű�
--���ܿ������䵱
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
Import("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(2)
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end
