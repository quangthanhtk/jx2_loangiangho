--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- ����ַ�����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function refresh_taoshu()     																		-- �ڷ���ʼʱ�����һ���NPC
	for i=1,getn(tb_taoshu_refresh) do
		local pos = tb_taoshu_refresh[i];
		local npcid = CreateNpc("��o Hoa th�","Nh�nh ��o C�t T��ng",pos[1],pos[2],pos[3]);
	end
end

function handle_on_npc_talk_jxts()   -- ���һ�˵�Ի�
	local mainStr = format("M�t nh�nh ��o tr�n �� n� ��y hoa ��o th�m.") 
	local tb_list={};
	local already = get_task("id_caiji_count")
	tinsert(tb_list,format("H�i 1 Nh�nh ��o T��i (%d/10)/#do_get_taohua(%d)",already,already))
	tinsert(tb_list,"Kh�ng c� g�/nothing")
	Say(mainStr,getn(tb_list),tb_list)
end

function do_get_taohua( in_cnt )     --�ɼ��һ�֦
	if in_cnt >= CAIJI_LIMIT then 
		Talk(1,"","H�m nay b�n �� h�i r�t nhi�u nh�nh ��o r�i, kh�ng th� h�i ti�p, h�y b�o v� th�c v�t.")
		return 0;
	end
	local cd = get_task("id_caiji_cd")-GetTime();
	if cd > 0 then 
		Talk(1,"",format("T�n su�t h�i qu� nhanh, %d gi�y sau h�y th� l�i.",cd))
		return 0;
	end
	 -- give item --
	 if gf_Judge_Room_Weight(1,100,"") ~= 1 then
	 	return 0;
	 end
	 AddItem(2,1,31005,1)
	 set_task("id_caiji_count",in_cnt+1)
	 set_task("id_caiji_cd",GetTime()+CAIJI_CD)
	 return 1;
end

function handle_use_jixiangtaozhi( Itemidx )
	handle_on_use_award( Itemidx )
end
