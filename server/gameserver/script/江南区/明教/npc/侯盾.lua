--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
NPC_NAME = "<color=green>H莡 Йn<color>:"
function main()
	if GetTask(1018) ==2 and BigGetItemCount(2,0,781) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh玭g c� H醓 Chung l祄 sao l蕐 H醓 Ch駈g, h穣 t譵 <color=green>Phng Th蕋 Ph藅<color> (185/189) l蕐 H醓 Chung!")
		else
			Talk(1,"",NPC_NAME.."Зy l� <color=yellow>Thanh T辬h H醓 Chung<color>, h穣 c莔 l蕐. Ti誴 theo h穣 甶 t譵 <color=green>Vng D莕<color> (195/189).")
			DelItem(2,0,780,1)
			AddItem(2,0,781,1)
			SetTask(1018,3)
			TaskTip("T譵 Чi V﹏ Ph竝 Vng-Vng D莕 l蕐 Quang Minh H醓 Ch駈g")
			Msg2Player("T譵 Чi V﹏ Ph竝 Vng-Vng D莕 (195/189) l蕐 Quang Minh H醓 Ch駈g")
		end
	elseif GetTask(1018) ==3 then
		Talk(1,"",NPC_NAME.."Vng D莕 (195/189) � ph輆 trc.")
	else
		if random(1000) == 137 then
			Talk(1,"",NPC_NAME.."T譵 ta c� vi謈 g�?")
		else
			Talk(1,"",NPC_NAME.."Thanh T辬h, Quang Minh, Чi L鵦, Tr� Tu�' l� gi竜 ngh躠 c馻 b鎛 gi竜, Th竛h H醓 H醓 Ch駈g do ta v� 3 Ph竝 Vng qu秐 l�.")
		end
	end
end
