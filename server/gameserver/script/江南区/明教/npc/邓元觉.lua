--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
Include("\\script\\task\\global_task\\gtask_head.lua");

NPC_NAME = "<color=green>ng Nguy猲 Gi竎<color>:"

function main()
	if tGtTask:check_cur_task(135) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	if	GetTask(1018) == 6 then
		if	GetItemCount(2,0,781) > 0 and GetItemCount(2,0,782) > 0 and GetItemCount(2,0,783) > 0 and GetItemCount(2,0,784) > 0  then
			Talk(1,"",NPC_NAME.."m, l祄 t鑤 l緈,  thu th藀  4 H醓 Ch駈g r錳, th竛h h醓 s� c� th� ch竬 m穒 kh玭g ng韙. Ngi l祄 t鑤 l緈, ta s� ph竔 ngi 甶 b萴 b竜 gi竜 ch� (182/188), ngi h穣 quay v� ph鬰 m謓h v韎 玭g 蕐.")
			for i = 781,784 do
				DelItem(2,0,i,1)
			end
			SetTask(1018,7)
			TaskTip("T譵 Phng L筽 (182/188) gia nh藀 Minh Gi竜")
			Msg2Player("T譵 Phng L筽 (182/188) gia nh藀 Minh Gi竜")
		else
			Talk(1,"",NPC_NAME.."Duy tr� th竛h h醓 c莕 4 H醓 Ch駈g: Thanh T辬h, Quang Minh, Чi L鵦, Tr� Tu�, sau khi thu th藀  h穣 n t譵 ta!")
		end
	elseif	GetTask(1018) == 7 then
		Talk(1,"",NPC_NAME.."Gi竜 ch� v蒼 產ng i ngi y, mau 甶 t譵  gia nh藀.")
	else
		if random(1000) < 500 then
			Talk(1,"",NPC_NAME.."Minh Gi竜 x璦 nay lu玭 t玭 s飊g 竛h s竛g v� th竛h h醓, th﹏ l� Th竛h H醓 Уn H� Ph竝, tr竎h nhi謒 b秓 v� th竛h h醓 r蕋 n苙g n�.")
		else
			Talk(1,"",NPC_NAME.."Th竛h h醓 h鮪g h鵦, thi猽 t th﹏ ta, s鑞g c� g� vui, ch誸 c� g� bu錸.")
		end
	end
	
end
