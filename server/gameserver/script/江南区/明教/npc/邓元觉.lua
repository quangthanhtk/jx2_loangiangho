--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
Include("\\script\\task\\global_task\\gtask_head.lua");

NPC_NAME = "<color=green>��ng Nguy�n Gi�c<color>:"

function main()
	if tGtTask:check_cur_task(135) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	if	GetTask(1018) == 6 then
		if	GetItemCount(2,0,781) > 0 and GetItemCount(2,0,782) > 0 and GetItemCount(2,0,783) > 0 and GetItemCount(2,0,784) > 0  then
			Talk(1,"",NPC_NAME.."m, l�m t�t l�m, �� thu th�p �� 4 H�a Ch�ng r�i, th�nh h�a s� c� th� ch�y m�i kh�ng ng�t. Ng��i l�m t�t l�m, ta s� ph�i ng��i �i b�m b�o gi�o ch� (182/188), ng��i h�y quay v� ph�c m�nh v�i �ng �y.")
			for i = 781,784 do
				DelItem(2,0,i,1)
			end
			SetTask(1018,7)
			TaskTip("T�m Ph��ng L�p (182/188) gia nh�p Minh Gi�o")
			Msg2Player("T�m Ph��ng L�p (182/188) gia nh�p Minh Gi�o")
		else
			Talk(1,"",NPC_NAME.."Duy tr� th�nh h�a c�n 4 H�a Ch�ng: Thanh T�nh, Quang Minh, ��i L�c, Tr� Tu�, sau khi thu th�p �� h�y ��n t�m ta!")
		end
	elseif	GetTask(1018) == 7 then
		Talk(1,"",NPC_NAME.."Gi�o ch� v�n �ang ��i ng��i ��y, mau �i t�m �� gia nh�p.")
	else
		if random(1000) < 500 then
			Talk(1,"",NPC_NAME.."Minh Gi�o x�a nay lu�n t�n s�ng �nh s�ng v� th�nh h�a, th�n l� Th�nh H�a ��n H� Ph�p, tr�ch nhi�m b�o v� th�nh h�a r�t n�ng n�.")
		else
			Talk(1,"",NPC_NAME.."Th�nh h�a h�ng h�c, thi�u ��t th�n ta, s�ng c� g� vui, ch�t c� g� bu�n.")
		end
	end
	
end
