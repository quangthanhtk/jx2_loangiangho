--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- 活动的字符串表
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function refresh_taoshu()     																		-- 在服务开始时创建桃花树NPC
	for i=1,getn(tb_taoshu_refresh) do
		local pos = tb_taoshu_refresh[i];
		local npcid = CreateNpc("Уo Hoa th�","Nh竛h Уo C竧 Tng",pos[1],pos[2],pos[3]);
	end
end

function handle_on_npc_talk_jxts()   -- 与桃花说对话
	local mainStr = format("M閠 nh竛h o tr猲  n� y hoa o th琺.") 
	local tb_list={};
	local already = get_task("id_caiji_count")
	tinsert(tb_list,format("H竔 1 Nh竛h Уo Ti (%d/10)/#do_get_taohua(%d)",already,already))
	tinsert(tb_list,"Kh玭g c� g�/nothing")
	Say(mainStr,getn(tb_list),tb_list)
end

function do_get_taohua( in_cnt )     --采集桃花枝
	if in_cnt >= CAIJI_LIMIT then 
		Talk(1,"","H玬 nay b筺  h竔 r蕋 nhi襲 nh竛h o r錳, kh玭g th� h竔 ti誴, h穣 b秓 v� th鵦 v藅.")
		return 0;
	end
	local cd = get_task("id_caiji_cd")-GetTime();
	if cd > 0 then 
		Talk(1,"",format("T莕 su蕋 h竔 qu� nhanh, %d gi﹜ sau h穣 th� l筰.",cd))
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
