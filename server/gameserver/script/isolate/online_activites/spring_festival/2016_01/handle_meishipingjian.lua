--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:46:11
--
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")


---------------------------美食品尝---------------------------

function refresh_material( h,m )
	for i=1,getn(tb_material_npc) do
		local nType, nTime, tNpc = unpack(tb_material_npc[i])
		if mod(m, nTime) == 0 then
			local tPos = tNpc[3]
			local p = 1
			if getn(tPos) > 1 then
				p = random(1,getn(tPos))
			end

			local tP = tPos[p]
			local nNum = tP[4]
			local num,Npcidx = 0,nil
			if nNum > 1 then
				num,Npcidx = CreateNpc(tNpc[2],tNpc[1],tP[1],tP[2],tP[3],-1,nNum,1,800)
			else
				local nIdx = CreateNpc(tNpc[2],tNpc[1],tP[1],tP[2],tP[3])
				if nIdx > 0 then
					num = 1
					Npcidx = {[0] = nIdx}
				end
			end
			
			if num > 0 then
				for j=0,getn(Npcidx) do
					SetNpcLifeTime(Npcidx[j],nTime*60-30)      --NPC生存时间，下次刷新前30秒
					SetNpcTempData(Npcidx[j], 0, i)	--npc typeid
					local scriptPath = "\\script\\isolate\\online_activites\\spring_festival\\2016_01\\npc\\npc_material.lua"
					if nType == 1 then
						SetNpcScript(Npcidx[j],scriptPath)
					else
						SetNpcDeathScript(Npcidx[j],scriptPath)
					end
				end
			end

		end
	end
	Msg2Global("Nguy猲 li謚 m鉵 ╪ c馻 L� H閕 耺 Th鵦  xu蕋 hi謓 � b秐  d� ngo筰 xung quanh Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗, m阨 c竎 i hi謕 nhanh ch鉵g 甶 thu th藀.")
end


function do_tast_food_activity( )
	local Str_Main = format("<color=gold>Nh蕋 Ph萴 Ng� Tr�<color>:")
	local tbSay = {}
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(1)",tb_tast_food_task[1]["name"], tb_tast_food_task[1]["limit"]-get_tsk_num(get_task("id_task_limit"),1)  ))
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(2)",tb_tast_food_task[2]["name"], tb_tast_food_task[2]["limit"]-get_tsk_num(get_task("id_task_limit"),2)  ))
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(3)",tb_tast_food_task[3]["name"], tb_tast_food_task[3]["limit"]-get_tsk_num(get_task("id_task_limit"),3)  ))
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(4)",tb_tast_food_task[4]["name"], tb_tast_food_task[4]["limit"]-get_tsk_num(get_task("id_task_limit"),4)  ))
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(5)",tb_tast_food_task[5]["name"], tb_tast_food_task[5]["limit"]-get_tsk_num(get_task("id_task_limit"),5)  ))
	tinsert(tbSay,format("L祄 1 %s (H玬 nay c遪 頲 l祄: %d l莕)/#give_food(6)",tb_tast_food_task[6]["name"], tb_tast_food_task[6]["limit"]-get_tsk_num(get_task("id_task_limit"),6)  ))
	tinsert(tbSay,"tr� l筰/handle_on_npc_talk_ypyc")
	Say(Str_Main,getn(tbSay),tbSay)
end

function give_food( Itemid )
	local limit_info = get_task("id_task_limit")
	local cur = get_tsk_num(limit_info,Itemid)
	if tb_tast_food_task[Itemid]["limit"] <= cur then
		Talk(1,"","H玬 nay  d飊g h誸 s� l莕 l祄, kh玭g th� l祄 ti誴.")
		return 0;
	end
	if gf_CheckLevel(t_level[1], t_level[2],1) ~= 1 then
		return 0
	end
	local SayStr = "<color=gold>Nh蕋 Ph萴 Ng� Tr�<color>:"..tb_tast_food_task[Itemid]["cost_str"];
	local tbSay = {}
	tinsert(tbSay,format("уng �/#give_food_award(%d)",Itemid))
	tinsert(tbSay,"tr� l筰/do_tast_food_activity")
	Say(SayStr,getn(tbSay),tbSay)
end

function give_food_award( ItemId )
	local met_cnt = tb_tast_food_task[ItemId]["item_cnt"] -- count the amount of materials
	local tb_met = {} 						 -- store materials what current itemid needed
	------------------ judge if items are enough ------------------
	for i=1,met_cnt do
		local tmp = {}
		tmp[1] = tb_tast_food_task[ItemId][i][2] -- id1 
		tmp[2] = tb_tast_food_task[ItemId][i][3] -- id2
		tmp[3] = tb_tast_food_task[ItemId][i][4] -- id3
		tmp[4] = tb_tast_food_task[ItemId][i][5] -- need cnt
		tmp[5] = tb_tast_food_task[ItemId][i][1] -- itme name (type:string)
		local cnt = GetItemCount(tmp[1],tmp[2],tmp[3])
		if cnt == nil or cnt < tmp[4] then
			Talk(1,"","Nguy猲 li謚 kh玭g , Nh蕋 Ph萴 Ng� Tr� kh玭g th� gi髉 b筺 l祄 m鉵 n祔.")
			return 0;
		end
		tb_met[i] = tmp;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then return 0 end
	------------------ del items ------------------
	for i=1,met_cnt do
		if DelItem( tb_met[i][1],tb_met[i][2],tb_met[i][3],tb_met[i][4] ) ~= 1 then
			WriteLog( format("\nDel item %s error!",tb_met[i][5]) )
			return 0
		end
	end 
	------------------ add task ------------------
	set_task( "id_task_limit" , add_tsk_num( get_task("id_task_limit"),ItemId ) )

	------------------ give award ------------------
	local tAward = tb_tast_food_task[ItemId]["award"]
	AddItem(tAward[2],tAward[3],tAward[4],tAward[5],4)
end

function get_tsk_num( Num,Pos )
	local pwr = 1;
	for i=2,Pos,1 do pwr=pwr*10 end
	Num = Num / pwr
	return floor(mod(Num,10))
end
function add_tsk_num( Num,Pos )
	local pwr = 1;
	for i=2,Pos,1 do pwr=pwr*10 end
	return Num+pwr;
end
---------------------------美食品尝---------------------------