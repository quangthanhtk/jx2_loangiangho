--脚本功能：明教掌门对话函数
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-13
NPC_NAME = "<color=green>Phng Th蕋 Ph藅<color>:"
PLAYER_NAME = "<color=green>Ngi ch琲<color>: Л頲, ta 甶 ngay!"
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua")
Import("\\script\\faction\\npc\\buy_sell_main.lua")


function main()
	if GetTask(1018) ==1 then
		if GetFreeItemRoom() > 3 then
			local n_fire_num = BigGetItemCount(2,0,780,1) 
			if n_fire_num < 4 then
				AddItem(2,0,780,(4 - n_fire_num))
			end
			if BigGetItemCount(2,0,785,1) == 0 then
				AddItem(2,0,785,1)
			end
			if BigGetItemCount(2,0,786,1) == 0 then
				AddItem(2,0,786,1)
			end
			Talk(3,"",
				NPC_NAME.."Зy l� 4 H醓 Chung, 1 Ru M筺h v� 1 G� Quay, h穣 c莔 l蕐.",
				PLAYER_NAME.."Sao l筰 c� th猰 2 th�?",
				NPC_NAME.."Mu鑞 l蕐 H醓 Ch駈g 琻g nhi猲 ph秈 hi觰 r� t輓h t譶h c馻 c竎 v� Ph竝 Vng, gi竜 ch� c� th� ch璦 n鉯 v韎 ngi, Чi V﹏ Ph竝 Vng <color=green>Vng D莕<color> r蕋 th輈h u鑞g ru, c遪 X輈h Di謒 Ph竝 Vng <color=green>T� H祅h Phng<color> l筰 r蕋 th輈h ╪, ngi mang nh鱪g th� n祔 甶 l蕐 H醓 Ch駈g s� d� d祅g h琻 nhi襲. H穣 mau t譵 Quang Minh H鱱 S� <color=green>H莡 Йn<color> (189/185) l蕐 Thanh T辬h H醓 Ch駈g trc."
			)
			SetTask(1018,2)
			TaskTip("T譵 Quang Minh H鱱 S� H莡 Йn l蕐 Thanh T辬h H醓 Ch駈g")
			Msg2Player("T譵 Quang Minh H鱱 S� H莡 Йn (189/185) l蕐 Thanh T辬h H醓 Ch駈g")
		else
			Talk(1,"",NPC_NAME.."Trc khi l蕐 H醓 Chung h穣 s緋 x誴 l筰 t骾! (C莕 <color=yellow>4<color> �!)")
			return
		end
	
	elseif GetTask(1018)==2 then
		Talk(1,"",NPC_NAME.."Quang Minh H鱱 S� <color=green>H莡 Йn<color> (189/185) � c竎h y kh玭g xa, h穣 甶 g苝 玭g 蕐  l蕐 Thanh T辬h H醓 Ch駈g.")
	else
		local sDiaHead,tDiaSel = faction_buysell_main(9)
		Say(sDiaHead,getn(tDiaSel),tDiaSel)
		--sale_main(9)
	end
end
