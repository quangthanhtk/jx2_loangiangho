--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
NPC_NAME = "<color=green>Vng D莕<color>:"
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\技能树操作.lua")
--技能列表
SKILLS={
--明教阵兵
--光明逍遥功 (技能id=1083)
[1083]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={4,0,0,},
     --关键点（技能等级，玩家等级，消耗金钱，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--光明笔法 (技能id=1084)
[1084]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={9,26,0,0},
     },
--金锁阵 (技能id=1085)
[1085]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={7,28,0,0},
     },
--偃旗令 (技能id=1086)
[1086]={
     levelless={2,1,0,1085,1},
     [1]={1,10,1000,0},
     [2]={1,10,800,0},
     },
--玄水阵 (技能id=1087)
[1087]={
     levelless={4,2,0,1085,1,1084,1},
     [1]={1,10,8000,80},
     [2]={2,12,2500,80},
     [3]={3,15,0,80},
     [4]={7,27,0,80},
     },
--封兵令 (技能id=1088)
[1088]={
     levelless={3,1,0,1086,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={8,34,0,80},
     },
--盘木阵 (技能id=1089)
[1089]={
     levelless={3,1,0,1087,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,38,0,80},
     },
--迅影令 (技能id=1090)
[1090]={
     levelless={3,1,0,1088,1},
     [1]={1,20,27000,300},
     [2]={2,22,6000,300},
     [3]={8,34,0,300},
     },
--乾坤逆转 (技能id=1091)
[1091]={
     levelless={3,1,0,1090,1},
     [1]={1,30,90000,700},
     [2]={2,32,24000,700},
     [3]={7,42,0,700},
     },
--业火阵 (技能id=1092)
[1092]={
     levelless={3,1,0,1089,1},
     [1]={1,30,27000,300},
     [2]={2,33,6000,300},
     [3]={7,48,0,300},
     },
--五灵归元 (技能id=1095)
[1095]={
     levelless={3,1,0,1094,1},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--五灵散元 (技能id=1094)
[1094]={
     levelless={4,1,0,1084,1},
     [1]={1,40,27000,300},
     [2]={2,41,6000,300},
     [3]={3,43,0,300},
     [4]={9,55,0,300},
     },
--土牢阵 (技能id=1093)
[1093]={
     levelless={5,2,1,1095,1,1092,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--光明五行阵 (技能id=1096)
[1096]={
     levelless={5,2,1,1093,7,1091,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 3 and BigGetItemCount(2,0,782) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh玭g c� H醓 Chung l祄 sao l蕐 H醓 Ch駈g, h穣 t譵 <color=green>Phng Th蕋 Ph藅<color> (185/189) l蕐 H醓 Chung!")
		else
			Talk(4,"faction_task",
				NPC_NAME.."Ta 產ng u鑞g ru ngon l祅h, ng khi課 cho ta m蕋 h鴑g.",
				PLAYER_NAME.."Gi竜 ch� b秓 ta n y l蕐 H醓 Ch駈g.",
				NPC_NAME.."H醓 Ch駈g g� ch�, vi謈 u鑞g ru c馻 ta quan tr鋘g h琻, ng gh衪, ru c騨g h誸 r錳.",
				PLAYER_NAME.."Ta  chu萵 b� ru ngon r錳, m阨 d飊g."
			)
		end
		return
     elseif GetTask(1018) == 4 then
          Talk(1,"",NPC_NAME.."<color=green>T� H祅h Phng<color> (182/196) � hng kh竎, <color=yellow>Чi L鵦 H醓 Ch駈g<color> � trong ta c馻 玭g 蕐, h穣 mau 甶 l蕐 n祇.")
          return
	end

	MJZB_master_main(9,26)
end
--师门任务
function faction_task()
	if GetItemCount(2,0,786) == 0 then
		Talk(1,"",NPC_NAME.."Ru u?")
		return
	else
		DelItem(2,0,786,1)
		DelItem(2,0,780,1)
		AddItem(2,0,782,1)
		Talk(1,"",NPC_NAME.."Ru ngon! T鑤 l緈! N祇 h穣 n y mang <color=yellow>Quang Minh H醓 Ch駈g<color> 甶.  hng kh竎  t譵 <color=green>T� H祅h Phng<color> (182/196), <color=yellow>Чi L鵦 H醓 Ch駈g<color> � trong tay c馻 玭g 蕐.")
		SetTask(1018,4)
		TaskTip("T譵 T� H祅h Phng l蕐 Чi L鵦 H醓 Ch駈g")
		Msg2Player("T譵 T� H祅h Phng (182/196) l蕐 Чi L鵦 H醓 Ch駈g")
	end
end


function MJZB_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "е t� b竔 ki課 s� ph�!/#MJZB_EnterRoute("..faction_seq..","..route_seq..")",
          "H鋍"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."V� c玭g/#skilllearn("..route_seq..")",
          "Ta c� 頲 t祅 quy觧 m藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭./#MJZB_book_chg("..route_seq..")",
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

function MJZB_EnterRoute( faction_seq,route_seq )
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


function MJZB_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --流派检测
          Say(NPC_NAME.."Ngi kh玭g ph秈  t� c馻 ta, m藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭 sau c� th� giao cho ngi!", 0)
          return
     else
          book_chg(route_seq)
     end 
end


--光明五行阵 (技能id=1096)
GREATE_SKILL_NAME = "Quang Minh Ng� H祅h Tr薾"
GREATE_SKILL_ID = 1096
ROUTE_SKILL_NAME = "Minh Gi竜 Tr薾 Binh"
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

