--���
Include("\\script\\isolate\\online_activites\\catch_fish\\head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end
	local szMsg = "Uy l�c c�a th� ph�o n�y c�ng kh� l�n, may l� ch�a kinh ��ng ai c�."
	if szBoss ~= "" then
		szMsg = format("Uy l�c c�a th� ph�o n�y qu� m�nh, h�nh nh� �� kinh ��ng %s d��i long cung", g_tCatchFish.szBoss)
	end
	local szTitle = format("Ng� Ph�: Trong Ng� D�n Th� Ph�o b� c�ng nhi�u lo�i ph�o t�t, t� l� nh�n ���c h�i s�n hi�m c� c�ng cao. %s", szMsg)
	local tbSay = {}
	--tinsert(tbSay, format("%s/combin_bomb", "�ϳ�С����"))
	tinsert(tbSay, format("%s/npc_talk_open_shop", "��i Ph�o Nh�"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3096, "Ti�m H�i S�n"));
end

--function combin_bomb()
--	local szTitle = format("%s\n%s", 
--		"��򣺶���������������ϴ��д��ʯ���Ǻϳ�С����ıر����ϡ�",
--		"1С����= 10��������+10����Ͳ+10ըҩ+10���ʯ"
--		)
--	local tbSay = {}
--	tinsert(tbSay, format("%s/do_combin_bomb", "ȷ�Ϻϳ�"))
--	tinsert(tbSay, format("%s/npc_talk_main", "�����ϲ�"))
--	tinsert(tbSay, format("%s/nothing", "�˳�"))
--	
--	Say(szTitle, getn(tbSay), tbSay)
--end
--
--function do_combin_bomb()
--	local szFunc = format("do_combin_bomb_sure")
--	local nMax=get_max_combine_count()
--	AskClientForNumber(szFunc, 1, nMax, "�ϳɶ��ٸ��أ�");
--end
--
--function get_max_combine_count()
--	local t = g_tCatchFish.tCombine
--	local tr = t.tRequite
--	local r = 1000
--	for i=1,getn(tr) do
--		local tt = tr[i]
--		local nTemp = floor(GetItemCount(tt[2],tt[3],tt[4])/tt[5])
--		r = min(r,nTemp)
--	end
--	return r
--end
--
--function do_combin_bomb_sure(nNum)
--	if nNum <= 0 then
--		return
--	end
--	if gf_Judge_Room_Weight(1, 100, "")~=1 then
--		return
--	end
--	local nMax=get_max_combine_count()
--	if nMax < nNum then
--		Talk(1,"","���ϲ���")
--		return
--	end
--	local t = g_tCatchFish.tCombine
--	local tg=t.tItem
--	local tr = t.tRequite
--	for i=1,getn(tr) do
--		local tt = tr[i]
--		if DelItem(tt[2],tt[3],tt[4],tt[5]*nNum) ~= 1 then
--			return
--		end
--	end
--	AddItem(tg[2],tg[3],tg[4],nNum)
--	Talk(1,"",format("�ɹ��ϳ�%d��%s",nNum, tg[1]))
--end



