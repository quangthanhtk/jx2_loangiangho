--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:55:16
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")

function refresh_boss(  )
	local tname = tb_boss_npc["tmp_name"]
	local name = tb_boss_npc["name"]
	for i=1,getn(tb_boss_npc) do
		local npc = tb_boss_npc[i];
		local Npcidx = CreateNpc(tname,name,npc[1],npc[2],npc[3]);
		SetNpcDeathScript(Npcidx,"\\script\\isolate\\online_activites\\spring_festival\\2016_01\\npc\\msdd_ondeath.lua")
	end
	Msg2Global("M� Th�c ��i ��o �� xu�t hi�n � b�n �� d� ngo�i xung quanh Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, m�i c�c ��i hi�p nhanh ch�ng �i ��nh b�i ch�ng.")
end

