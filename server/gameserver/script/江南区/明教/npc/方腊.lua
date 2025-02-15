--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
--   (__)　
--　 /oo\\________
--　 \　/　　　　 \---\
 --　 \/　　　 /　 \　 \
 --　　　\\_|___\\_|/　　*
 --　　　  ||　 YY|  
 --　　　  ||　　||  　最NB的策划能以最不折腾的方式来合理的实现自己的功能，所以不要用折腾来表达你专业程度。
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- 门派任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")

Import("\\script\\task\\faction_task\\faction_task.lua")


NPC_NAME = "<color=green>Phng L筽<color>:"
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
MING_FACTION_ID = 9
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
g_nFactionID = 9

Import("\\script\\ksgvn\\functions\\phutu_functions.lua")
g_szTalkHead = NPC_NAME

function main()
	local selTab = {
		"Ngu錸 g鑓 Minh Gi竜/say1_1",
		"V� c玭g Minh Gi竜/say1_2",
		"襲 ki謓 nh藀 m玭/say1_3",
		--"Ph� tu m玭 ph竔/phutu_Main", --LongDaiKa: ng t輓h n╪g ph� tu m玭 ph竔
		-- "我要加入明教/say1_4",
		"Ta mu鑞 l祄 nhi謒 v� S� M玭/#ftask_repeat_main(9)",
		"Li猲 quan tu luy謓./practice",
		"Ta s緋 th祅h th﹏ n猲 ph秈 xu蕋 s�/#faction_graduate(9)",
		"B竔 ki課 gi竜 ch�/end_dialog",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(selTab, 1, format("Nhi謒 V� S� M玭 M韎/#nft_talk(%d)", g_nFactionID));	
	end	
	Say(NPC_NAME.."Minh Gi竜 x璦 nay lu玭 t玭 s飊g 竛h s竛g v� th竛h h醓, tr� gian di謙 竎. Tuy kh玭g h頿 v韎 nh﹏ s� trung nguy猲 nh璶g t蕀 l遪g th祅h kh萵 th� nh藅 nguy謙 ch鴑g gi竚.",
		getn(selTab),
		selTab
	)
end
--起源
function say1_1()
	Talk(2,"main",
		NPC_NAME.."Gi竜 ph竔 c馻 ta c� ngu錸 g鑓 t� Ma Ni Gi竜 � Ba T�, gia nh藀 v祇 trung nguy猲 t� i nh� Л阯g, sau  d莕 d莕 ph竧 tri觧 l猲. дn i nh� T鑞g th� i t猲 th祅h 'Minh Gi竜'. Minh Gi竜 x璦 nay lu玭 t玭 s飊g 竛h s竛g v� th竛h h醓, cho r籲g th� gi韎 n祔 竛h s竛g v� b鉵g t鑙 lu玭 i l藀 v韎 nhau, 竛h s竛g cu鑙 c飊g s� chi課 th緉g b鉵g t鑙. Hi謓 nay, gi竜 ngh躠 c馻 b鎛 gi竜 quy n筽 th祅h 8 ch� 'Thanh t辬h, quang minh, i l鵦, tr� tu�'.",
		NPC_NAME.."Gi竜 ch髇g c馻 b鎛 gi竜 n t� kh緋 m鋓 n琲, kh玭g ph﹏ bi謙 ng祅h ngh� t� n玭g d﹏, t� t礽, l鬰 l﹎ h秓 h竛, cng o, t╪g l� ho芻 o s� u c� th� gia nh藀. Nh璶g b鎛 gi竜 x璦 nay h祅h tung 萵 d藅, ch辵 s� nghi k� c馻 tri襲 nh v� c竎 m玭 ph竔 kh竎, th薽 ch� c遪 b� xem l� 'Ma gi竜', x璦 nay lu玭 b� tri襲 nh v� c竎 m玭 ph竔 kh竎 kh鑞g ch�. Cho n猲  b総 tay v祇 x﹜ d鵱g Quang Minh жnh tr猲 n骾 C玭 L玭, xem nh� t鎛g n m韎 c馻 Minh Gi竜,  tr竛h b� tri襲 nh di謙 g鋘."
		)
end
--武功
function say1_2()
	Talk(4,"main",
		NPC_NAME.."Gi竜 ch髇g Minh Gi竜 chia th祅h 3 h� <color=yellow>Th竛h Chi課, Huy誸 Nh﹏, Tr薾 Binh<color>.",
		NPC_NAME.."<color=yellow>Th竛h Chi課<color> c k誸 t� � ngh躠 c馻 'Quang minh', kh玭g s� h穒, d飊g th﹏ m譶h  ngh猲h chi課 ch t� ch輓h di謓. L鵦 chi課 do t﹎ quy誸 nh, t﹎ c祅g n� th� s鴆 c祅g m筺h, ch� c莕 c遪 n� � th� kh玭g s� g� c�. Tr蕁 ph竔 <color=red>C祅 Kh玭 Чi Na Di<color>, k� n╪g c馻 <color=yellow>Th竛h Chi課<color> do <color=green>Quang Minh Ph竝 Vng-L� Thi猲 Nhu薾<color> truy襫 th�.",
		NPC_NAME.."<color=yellow>Huy誸 Nh﹏<color> c k誸 t� � ngh躠 c馻 'Thanh t辬h', thanh t辬h nh� tr╪g s竛g. Khi chi課 u v韎 h� n祔 n誹 tr髇g ph秈 蕁 k� th� ph竝 c m玭, l骳 u s� kh玭g c� d蕌 v誸, n誹 d飊g th� ph竝 c m玭  ph� 蕁 th� s鴆 m筺h b猲 trong s� khi課 k� ch b� tr鋘g thng. T譵 <color=green>X輈h Di謒 Ph竝 Vng-T� H祅h Phng<color>  h鋍 <color=red>H祅 B╪g Mi猲 Chng<color>.",
		NPC_NAME.."<color=yellow>Tr薾 Binh<color> c k誸 t� � ngh躠 c馻 'Tr� tu�', d祅h cho ngi tr� tu�. H� n祔 b総 ngu錸 t� Ng� H祅h K�, th� ph竝 b� tr薾 c o, k� ch khi l鋞 v祇 tr薾 s� b� kh鑞g ch�, b蕋 k� h祅h ng ho芻 thi tri觧 k� n╪g u b� t﹎ ma kh鑞g ch�, g﹜ s竧 thng cho b秐 th﹏. Khi ng i trong tr薾, s� cng h鉧 b秐 th﹏, 甶襲 tr� v誸 thng. Tr蕁 ph竔 <color=red>Quang Minh Ng� H祅h Tr薾<color>, v� c玭g c馻 h� n祔 do <color=green>Чi V﹏ Ph竝 Vng-Vng D莕<color> truy襫 th�."
	)
end
--条件
function say1_3()
	Talk(1,"",NPC_NAME.."Kh玭g gi韎 h筺 nam n�, ch璦 c� m玭 ph竔 v� kh玭g ph秈 ph秐  u c� th� gia nh藀. Gi竜 ch髇g c莕 ph秈 h祅h thi謓 tr� 竎, n誹 c� t礽 s秐 th� ph秈 c鴘 tr� ngi ngh蘯, t玭 s飊g minh t玭.")
end
--加入昆仑
function say1_4()
	--等级判断
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."C蕄 kh玭g , t c蕄 <color=yellow>10<color> r錳 quay l筰.")
		return
	end
	--本门判断
	if GetPlayerFaction() == 9 then
		Talk(1,"",NPC_NAME.."Ngi  l� ngi c馻 Minh Gi竜, c遪 t譵 ta l祄 g�!")
		return
	end
	--流派判断
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."Thi誹 hi謕  c� m玭 ph竔, ta kh玭g th� nh薾.")
		return
	end
	local faction_task_step = without_other_factask(MING_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."Х nh薾 nhi謒 v� c馻 ph竔 kh竎, kh玭g th� gia nh藀 b鎛 ph竔.")
		return
	elseif faction_task_step == 7 then
		Talk(3,"",
			NPC_NAME.."<color=green>ng Nguy猲 Gi竎<color>  th玭g b竜 v韎 ta, ngi  giao 4 H醓 Ch駈g cho 玭g 蕐. Ngi l祄 t鑤 l緈, hi謓 t筰 c� th� gia nh藀 gi竜 ph竔. Nh璶g h穣 nh� l蕐, sau khi v祇 gi竜 th� ph秈 h祅h thi謓 tr� 竎, n誹 c� t礽 s秐 th� ph秈 c鴘 tr� ngi ngh蘯, t玭 s飊g minh t玭.",
			PLAYER_NAME.."е t� ghi nh�.",
			NPC_NAME.."Gi竜 ch髇g Minh Gi竜 chia th祅h 3 h� <color=green>Tr薾 Binh, Th竛h Chi課, Huy誸 Nh﹏<color>. Ngi c� th� 甶 t譵 <color=green>Чi V﹏ Ph竝 Vng-Vng D莕<color> h鋍 k� n╪g <color=yellow>Tr薾 Binh<color>, n誹 h鴑g th� v韎 <color=yellow>Th竛h Chi課<color> th� ph秈 t譵 <color=green>Quang Minh Ph竝 Vng-L� Thi猲 Nhu薾<color>, c遪 h鴑g th� v韎 <color=yellow>Huy誸 Nh﹏<color> th� h穣 甶 t譵 <color=green>X輈h Di謒 Ph竝 Vng-T� H祅h Phng<color>."
		)
		TaskTip("Ta  thu薾 l頸 gia nh藀 Minh Gi竜")
		SetPlayerFaction(9)
		SetPlayerRoute(24)
		SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],8)
		return
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],1)
			TaskTip("T譵 Phng Th蕋 Ph藅 l蕐 H醓 Chung")
			Msg2Player("T譵 Phng Th蕋 Ph藅 (185/189) l蕐 H醓 Chung")
			Talk(3,"",
				NPC_NAME.."<color=yellow>Th竛h h醓 h鮪g h鵦, thi猽 t th﹏ ta, s鑞g c� g� vui, ch誸 c� g� bu錸<color>. Gi竜 quy nghi猰 ng苩, kh玭g ph秈 t飝 ti謓 c� th� gia nh藀 v祇 gi竜, nh璶g n� t譶h ngi t� xa n y, n誹 c� th� gi髉 <color=yellow>Th竛h H醓 Уn<color> h� ph竝 <color=green>ng Nguy猲 Gi竎<color> mang v� 4 H醓 Ch駈g, ta s� cho ngi gia nh藀.",
				PLAYER_NAME.."Ta ph秈 l祄 sao.",
				NPC_NAME.."4 H醓 Ch駈g: Thanh T辬h, Quang Minh, Чi L鵦, Tr� Tu� c馻 Minh Gi竜 do 4 ngi <color=green>Quang Minh H鱱 S�-H莡 Йn, Чi V﹏ Ph竝 Vng-Vng D莕, X輈h Di謒 Ph竝 Vng-T� H祅h Phng, Quang Minh Ph竝 Vng-L� Thi猲 Nhu薾<color> n緈 gi�, ngi ph秈 chu萵 b� 4 H醓 Chung  b� H醓 Ch駈g, t譵 <color=green>Phng Th蕋 Ph藅<color> (185/189)  l蕐 nh�."
			)
		else
			Talk(1,"",NPC_NAME..GetPlayerSex().."Kh玭g th蕐 <color=green>Phng Th蕋 Ph藅<color> sao?  g 蕐 � c竎h y kh玭g xa, h穣 甶 t譵  l蕐 <color=green>4 H醓 Chung<color>.")
		end
		
	end
end
--结束对话
function end_dialog()
	
end
--处理函数
--处理函数
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end

-- 闭关修炼
function practice()
    if GetPlayerFaction() ~= MING_FACTION_ID then
       Talk(1,"",NPC_NAME.."Ngi kh玭g ph秈 l�  t� Minh Gi竜, kh玭g th� n y tu luy謓.");
    else
        if GetItemCount(2,0,788) >= 1 then  --师门令牌
            Say(NPC_NAME.."Bc v祇 tu luy謓 kh玭g?",2,"ng/practice_start","Sai/no");
        else
            Talk(1,"",NPC_NAME.."Ngi kh玭g c� <color=yellow>Minh Gi竜 S� M玭 L謓h<color>, kh玭g th� ti課 h祅h b� quan tu luy謓.");
        end;
    end;
end;