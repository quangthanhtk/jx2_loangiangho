--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
NPC_NAME = "<color=green>Ph��ng Th�t Ph�t<color>:"
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
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
				NPC_NAME.."��y l� 4 H�a Chung, 1 R��u M�nh v� 1 G� Quay, h�y c�m l�y.",
				PLAYER_NAME.."Sao l�i c� th�m 2 th�?",
				NPC_NAME.."Mu�n l�y H�a Ch�ng ���ng nhi�n ph�i hi�u r� t�nh t�nh c�a c�c v� Ph�p V��ng, gi�o ch� c� th� ch�a n�i v�i ng��i, ��i V�n Ph�p V��ng <color=green>V��ng D�n<color> r�t th�ch u�ng r��u, c�n X�ch Di�m Ph�p V��ng <color=green>T� H�nh Ph��ng<color> l�i r�t th�ch �n, ng��i mang nh�ng th� n�y �i l�y H�a Ch�ng s� d� d�ng h�n nhi�u. H�y mau t�m Quang Minh H�u S� <color=green>H�u ��n<color> (189/185) l�y Thanh T�nh H�a Ch�ng tr��c."
			)
			SetTask(1018,2)
			TaskTip("T�m Quang Minh H�u S� H�u ��n l�y Thanh T�nh H�a Ch�ng")
			Msg2Player("T�m Quang Minh H�u S� H�u ��n (189/185) l�y Thanh T�nh H�a Ch�ng")
		else
			Talk(1,"",NPC_NAME.."Tr��c khi l�y H�a Chung h�y s�p x�p l�i t�i! (C�n <color=yellow>4<color> �!)")
			return
		end
	
	elseif GetTask(1018)==2 then
		Talk(1,"",NPC_NAME.."Quang Minh H�u S� <color=green>H�u ��n<color> (189/185) � c�ch ��y kh�ng xa, h�y �i g�p �ng �y �� l�y Thanh T�nh H�a Ch�ng.")
	else
		local sDiaHead,tDiaSel = faction_buysell_main(9)
		Say(sDiaHead,getn(tDiaSel),tDiaSel)
		--sale_main(9)
	end
end
