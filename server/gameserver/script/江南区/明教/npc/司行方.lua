--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
NPC_NAME = "<color=green>T� H祅h Phng<color>:"
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\技能树操作.lua")
--技能列表
SKILLS={
--明教血人
--寒冰心法 (技能id=1131)
[1131]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={4,0,0,},
     --关键点（技能等级，玩家等级，消耗金钱，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--断骨爪 (技能id=1132)
[1132]={
     levelless={3,1,0,1131,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={8,24,0,0},
     },
--腐伤印 (技能id=1133)
[1133]={
     levelless={3,1,0,1131,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={7,22,0,0},
     },
--青翼步法 (技能id=1134)
[1134]={
     levelless={3,1,0,1132,1},
     [1]={1,10,8000,80},
     [2]={2,13,2500,80},
     [3]={5,22,0,80},
     },
--崩血印 (技能id=1135)
[1135]={
     levelless={4,1,0,1133,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={3,15,0,0},
     [4]={8,30,0,0},
     },
--吸血印 (技能id=1136)
[1136]={
     levelless={3,1,0,1135,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={6,30,0,80},
     },
--寒血印 (技能id=1137)
[1137]={
     levelless={3,1,0,1133,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--刺骨印 (技能id=1138)
[1138]={
     levelless={4,1,0,1137,1},
     [1]={1,20,27000,300},
     [2]={2,21,6000,300},
     [3]={3,23,0,300},
     [4]={7,31,0,300},
     },
--追魂印 (技能id=1139)
[1139]={
     levelless={3,1,0,1136,1},
     [1]={1,30,27000,300},
     [2]={2,32,6000,300},
     [3]={7,42,0,300},
     },
--弑颈爪 (技能id=1140)
[1140]={
     levelless={4,1,0,1134,1},
     [1]={1,30,90000,700},
     [2]={2,31,24000,700},
     [3]={3,33,0,700},
     [4]={8,43,0,700},
     },
--寒冰血障 (技能id=1141)
[1141]={
     levelless={3,2,0,1138,1,1139,1},
     [1]={1,40,27000,300},
     [2]={2,42,6000,300},
     [3]={8,54,0,300},
     },
--化血印 (技能id=1142)
[1142]={
     levelless={4,1,0,1141,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={7,51,0,700},
     },
--殒殇印 (技能id=1143)
[1143]={
     levelless={5,1,0,1141,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--寒冰绵掌 (技能id=1213)
[1213]={
     levelless={5,3,1,1140,8,1141,7,1142,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 4 and BigGetItemCount(2,0,783) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh玭g c� H醓 Chung l祄 sao l蕐 H醓 Ch駈g, h穣 t譵 <color=green>Phng Th蕋 Ph藅<color> (185/189) l蕐 H醓 Chung!")
		else
			Talk(3,"faction_task",
				NPC_NAME.."T譵 ta c� vi謈 g�, ta chu萵 b� 甶 ki誱 ch髏 th鴆 ╪.",
				PLAYER_NAME.."Gi竜 ch� b秓 ta n l蕐 H醓 Ch駈g, ngo礽 ra c遪 chu萵 b� cho ngi 1 ph莕 <color=yellow>G� Quay<color>.",
				NPC_NAME.."Gi竜 ch� th藅 c� l遪g. Ngi h穣 l蕐 <color=yellow>H醓 Chung<color>  ng Чi L鵦 H醓 Ch駈g."
				)

		end
		return
     elseif GetTask(1018) == 5 then
          Talk(1,"",NPC_NAME.."Kh玭g ph秈 b秓 ngi 甶 l蕐 <color=yellow>Tr� Tu� H醓 Ch駈g<color> sao? Sao c遪 � y, <color=green>Quang Minh Ph竝 Vng L� Thi猲 Nhu薾<color> (175/191) 產ng � g莕 y, h穣 mau 甶 l蕐.")
          return
	end
	MJXR_master_main(9,27)
end
--师门任务
function faction_task()
	if GetItemCount(2,0,785) == 0 then
		Talk(1,"",NPC_NAME.."G� u?")
		return
	else
		DelItem(2,0,785,1)
		DelItem(2,0,780,1)
		AddItem(2,0,783,1)
		Talk(1,"",NPC_NAME.."Чi L鵦 H醓 Ch駈g  l蕐 頲, <color=yellow>Tr� Tu� H醓 Ch駈g<color> t譵 <color=green>Quang Minh Ph竝 Vng L� Thi猲 Nhu薾<color> (175/191)")
		SetTask(1018,5)
		TaskTip("T譵 Quang Minh Ph竝 Vng L� Thi猲 Nhu薾 l蕐 Tr� Tu� H醓 Ch駈g")
		Msg2Player("T譵 Quang Minh Ph竝 vng L� Thi猲 Nhu薾 (175/191) l蕐 Tr� Tu� H醓 Ch駈g")
	end
end



function MJXR_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "е t� b竔 ki課 s� ph�!/#MJXR_EnterRoute("..faction_seq..","..route_seq..")",
          "H鋍"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."V� c玭g/#skilllearn("..route_seq..")",
          "Ta c� 頲 t祅 quy觧 m藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭./#MJXR_book_chg("..route_seq..")",
          "Ch祇 h醝/end_dialog",
     }
     local t_dia_show = {}
     local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
     if GetPlayerFaction() == faction_seq then  --本门弟子
          tinsert(t_dia_show,t_dia_sel[1])
          tinsert(t_dia_show,t_dia_sel[2])
          tinsert(t_dia_show,t_dia_sel[3])
          -- end
     end
     if getn(t_dia_show) == 1 then
          Talk(1,"",s_dia_main)
     else
          Say(s_dia_main,
               getn(t_dia_show),
               t_dia_show
          )
     end
end

function MJXR_EnterRoute( faction_seq,route_seq )
     if GetPlayerFaction() ~= faction_seq then
          Say(NPC_NAME.."Thi誹 hi謕 ph秈 頲 gi竜 ch� ng � cho gia nh藀 Minh Gi竜, sau  m韎 c� th� n b竔 s� h鋍 ngh�.",0)
     elseif GetPlayerRoute()  == route_seq then -- 本派弟子
          Say(NPC_NAME.."Mau 甶 luy謓 c玭g, kh玭g 頲 l祄 bi課g.",0)
     elseif GetPlayerRoute()  == 24 then        -- 本门无派弟子
          get_in_route(faction_seq,route_seq)
     else                                       -- 本门别派弟子
          Say(NPC_NAME.."Ta kh玭g ph秈 s� ph� c馻 ngi, ngi n猲 g鋓 ta l� s� th骳!",0)
     end
end

function MJXR_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --流派检测
          Say(NPC_NAME.."Ngi kh玭g ph秈  t� c馻 ta, m藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭 sau c� th� giao cho ngi!", 0)
          return
     else
          book_chg(route_seq)
     end 
end



GREATE_SKILL_NAME = "H祅 B╪g Mi猲 Chng"
GREATE_SKILL_ID = 1213
ROUTE_SKILL_NAME = "Minh Gi竜 Huy誸 Nh﹏"
function showlimit(n)    --师门说话
     if n==2 then
          Say(NPC_NAME.."C蕄 kh玭g   h鋍 v� c玭g m韎, h穣 th╪g c蕄 trc?",0)
     elseif n==3 then
          Say(NPC_NAME.."Kinh nghi謒 kh玭g  h鋍 v� c玭g m韎, h穣 luy謓 t藀 trc?",0)
     elseif n==4 then
          Say(NPC_NAME.."Danh v鋘g c馻 ngi kh玭g   h鋍 v� c玭g m韎, h穣 l祄 nhi謒 v�  t輈h l騳 th猰 danh v鋘g.",0)
     elseif n==5 then
          Say(NPC_NAME.."V� c玭g trc v蒼 ch璦 h鋍 xong, kh玭g th� h鋍 v� c玭g m韎!",0)
     elseif n==6 then
          Say(NPC_NAME.."Ng﹏ lng c馻 ngi kh玭g , t譵  r錳 h穣 quay l筰 nh�!",0)
     else
     end
end;

function skilllearn(route_seq)         --学习技能
     if GetPlayerRoute() ~= route_seq then --门派检测
          Say(NPC_NAME.."Kh玭g ph秈  t�, kh玭g th� h鋍"..ROUTE_SKILL_NAME.."V� c玭g.",0)
     else
          Say(NPC_NAME.."G鉩 ph秈 ph輆 di bi觰 tng v� c玭g xu蕋 hi謓 d蕌 m騣 t猲 bi觰 th� c� th� h鋍 v� c玭g n祔, nh蕁 chu閠  t╪g c蕄.",0)
          AllowLearnSkill()
     end
end;

function beforelearnskill(id)
     if id == GREATE_SKILL_ID then 
          if GetSkillLevel(GREATE_SKILL_NAME) <= 0 then
               return NPC_NAME.."\""..GREATE_SKILL_NAME.."? l� <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, kh玭g ph秈 ngi c� v� c cao trong b鎛 m玭, kh玭g 頲 h鋍."
          end
     end
end

function afterlearnskill(id)
     if id == GREATE_SKILL_ID then 
          if GetSkillLevel(GREATE_SKILL_NAME) == 1 then
               Say(NPC_NAME.."Thi誹 hi謕 qu� t� ch蕋 h琻 ngi,  s� b� l穘h ng� 頲 ?"..GREATE_SKILL_NAME.."?, th藅 hi誱 c�!<enter><color=green>Ngi ch琲<color>:  Nh璶g s� ph�, t筰 sao khi con xu蕋 chi猽 ?"..GREATE_SKILL_NAME.."?, c秏 th蕐 n閕 kh� kh玭g t藀 trung kh� l遪g thi tri觧? T� trc  nghe n鉯 L鬰 M筩h Th莕 Ki誱 c馻 Чi L� 筺 Th�, mu鑞 thi tri觧 nh璶g kh玭g 頲.<enter>"..NPC_NAME.."Thi誹 hi謕 c� 甶襲 ch璦 bi誸, ?"..GREATE_SKILL_NAME.."? d� c� bi誸 nh璶g mu鑞 甶襲 khi觧 n� th藅 kh玭g ph秈 chuy謓 d�. Tinh kh� trong c� th� kh玭g n閕 t� th祅h ?S竧 kh�? (甶觤 s竧 kh�) s� kh玭g th� thi tri觧. Mu鑞 thi tri觧 c莕 t鑞 ?S竧 kh�?. ?S竧 khi? t鎛g 10 ph莕, trong c玭g th� t� thng c� th� t╪g, ng th阨 c騨g s� t� t� t藀.", 1, "уng �/GiveMomentum")
          elseif GetSkillLevel(GREATE_SKILL_NAME) == 5 then
               Say(NPC_NAME.."Thi誹 hi謕 qu� t� ch蕋 th玭g minh, ?"..GREATE_SKILL_NAME.."?  l穘h ng� 頲 5 ph莕. V� c玭g n祔 t鎛g c� 20 c蕄, 5 c蕄 ti誴 theo thi誹 hi謕 ph秈 si猲g n╪g tu luy謓, n  thu莕 th鬰 nh蕋 nh m韎 c� th� t ph�. C遪 10 c蕄 sau c飊g ph秈 tham ng� m藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭 m韎 c� th� l穘h ng� ra.", 0)
          end
     end
end

function GiveMomentum()
     Say(NPC_NAME.."Л頲, gi� ta s� v薾 c玭g  s竧 kh� trong c� th� ngi n閕 t� 10 ph莕, gi髉 ngi xu蕋 chi猽?"..GREATE_SKILL_NAME.."?.<enter><enter>R蕋 l﹗...<enter><enter>"..NPC_NAME.."Xong r錳, s竧 kh� trong c� th� thi誹 hi謕  h譶h th祅h, gi� c� th� th� xu蕋 chi猽 ?"..GREATE_SKILL_NAME.."? r錳. Tuy謙 h鋍 tr蕁 ph竔 b鎛 m玭 uy l鵦 ng s�, ch� 頲 d飊g  gi髉  m鋓 ngi, thay tr阨 h祅h o, kh玭g 頲 l祄 h筰 ngi v� t閕, nh� ...", 0)
     SetMomentum(10)
     RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh� s� ph� truy襫 cho", "momentumtip")
end

