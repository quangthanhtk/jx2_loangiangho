--һЩ�¼�������
Include("\\script\\isolate\\online_activites\\christmas\\2015_12\\tasks.lua")

function handle_on_npc_talk(nIndex)
	local szTitle = format("<color=green>%s:<color> Ng�y l� s�p ��n r�i, m�i ng��i c� th� ��n ch� c�a ta �� t�m hi�u th�ng tin ho�t ��ng.", GetTargetNpcName())
	local tSay = {
		format("%s/#_npc_talk_1(%d)", "Gi�i th�ch ho�t ��ng", nIndex),
		--format("%s/#_npc_talk_2(%d)", "��ȡÿ���ۻ�װ�ν���", nIndex),
		format("%s/#_npc_talk_3(%d)", "C�a H�ng Song ��n", nIndex),
		format("%s/nothing", "R�i kh�i"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _npc_talk_1(nIndex)
	local _,nStartDate, nEndDate = isolate_get_dates()
	local szTitle = format("<color=green>%s:<color> Trong th�i gian %s~%s, ��i tho�i v�i C�y Noel g�n ��y �� nh�n nhi�m v� trang tr� C�y Noel.", GetTargetNpcName(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate))
	szTitle = format("%s\n%s", szTitle, "M�i l�n trang tr� C�y Noel ��u nh�n ���c ph�n th��ng EXP, khi c�y tr��ng th�nh ��n c�p t�i �a s� nh�n ���c ph�n th��ng cu�i c�ng: Ngo�i ph�n th��ng EXP c�n c� Qu� Song ��n.")
	szTitle = format("%s\n%s",szTitle, "C�n c� theo ��ng c�p c�a b�n m� nh�n ���c ph�n th��ng EXP kh�c nhau, c�p c�ng cao th� EXP nh�n ���c c�ng nhi�u.")
	--szTitle = format("%s\n%s",szTitle, "ÿ�գ��㻹�л����Ϊʥ��֮�ǣ�����ȡ���ս���ʱ�����2���ľ��齱��Ŷ��")
	local tSay = {
		format("%s/nothing", "R�i kh�i"),
	}
	Say(szTitle, getn(tSay), tSay)
end
--function _npc_talk_2(nIndex)
--	local szTitle = format("<color=green>%s:<color>��ǰ�������ۻ����װ��ʥ���������Ѵ�<color=yellow>%d<color>�֡�", GetTargetNpcName(), get_server_count())
--	local tSay = {}
--	for i = 1, getn(tFinalAward) do
--		local t = tFinalAward[i]
--		local szWord = format("�������ۻ���������ﵽ%d�εĽ���", t[1])
--		tinsert(tSay, format("%s/#get_server_award(%d)", szWord, i))
--	end
--	tinsert(tSay, format("%s/nothing", "�뿪"))
--	Say(szTitle, getn(tSay), tSay)
--end
function _npc_talk_3(nIndex)
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3070, "C�a H�ng Song ��n"))
end

function handle_on_tree1_talk(nIndex)
	_tree_talk(nIndex, 1)
end
function handle_on_tree2_talk(nIndex)
	_tree_talk(nIndex, 2)
end
function _tree_talk(nIndex, nType)
	local szTitle = format("<color=green>%s:<color> Trang tr� c�y c� th� gi�p C�y Noel c�a m�nh tr� n�n xinh ��p h�n, ��ng th�i c�ng nh�n ���c ph�n th��ng trang tr�, sau khi trang tr� c�y th� ph�n th��ng c�a l�n trang tr� sau ��u g�p ��i, cho ��n khi ho�n th�nh trang tr� c�y.", GetTargetNpcName())
	szTitle = format("%s\n%s", szTitle, format("��i hi�p b�y gi� �ang c� %d �i�m trang tr�", get_task("id_score")))
	local tSay = {
		format("%s/#_tree_talk_1(%d,%d)", "Trang tr� c�y th�ng", nIndex,nType),
		format("%s/#_tree_talk_2(%d,%d)", "Nh�n qu� gi�ng sinh", nIndex,nType),
		format("%s/nothing", "R�i kh�i"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _tree_talk_1(nIndex, nType,nOption)
	local nTask = get_cur_task(nType,1)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType])-1 then
		Talk(1, "", "L��t trang tr� n�y �� ��t giai �o�n cao nh�t, kh�ng th� ti�p t�c trang tr�, ng�y mai h�y quay l�i.")
		return
	end
	if nTask == 0 then
		return
	end
	local tCfg = _get_task_cfg_(nTask)
	if tCfg then
		if not nOption then
    		local szTitle = format("<color=green>%s:<color> Ng�m ngh�a C�y Noel ph�t hi�n c�n m�t s� thi�u s�t, quy�t ��nh d�ng <color=yellow>%d %s<color> ti�n h�nh trang tr�, nh�ng nh�ng v�t n�y ch� c� <color=yellow>%s - %s<color> m�i c�, ng��i mu�n �i xem th� kh�ng? L��t n�y ng��i �� ho�n th�nh %d/%d l�n nhi�m v� trang tr� r�i."
    			, GetTargetNpcName(), tCfg[2][4], tCfg[1], tCfg[4], tCfg[3], nStep, getn(tTaskAward[nType])-1)
        	local tSay = {
        		format("%s/#_tree_talk_1(%d,%d,1)", "��ng � trang tr�", nIndex,nType),
        		format("%s/nothing", "R�i kh�i"),
        	}
        	Say(szTitle, getn(tSay), tSay)
        	return
        elseif nOption == 1 then
        	finish_task(nType)
        end
	end
end
function _tree_talk_2(nIndex, nType, bConfirm)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType]) then
		Talk(1, "", "�� nh�n t�t c� ph�n th��ng c�a l��t trang tr� n�y, ng�y mai h�y quay l�i.")
		return
	end 
	local nCurTask = get_cur_task(nType,0)
	if nCurTask > 0 then
		Talk(1, "", "H�nh nh� ch�a ho�n th�nh nhi�m v� trang tr�")
		return
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	if not bConfirm then
		local szTitle = format("<color=green>%s:<color> L��t hi�n t�i <color=yellow>%d/%d, c�n ch� � l� sai khi nh�n th��ng s� k�t th�c l��t hi�n t�i, ��ng �?<color>"
			, GetTargetNpcName(), nStep, getn(tTaskAward[nType])-1)
    	local tSay = {
    		format("%s/#_tree_talk_2(%d,%d,1)", "Nh�n ", nIndex,nType),
    		format("%s/nothing", "R�i kh�i"),
    	}
    	Say(szTitle, getn(tSay), tSay)
    	return
	end
	
	local szTask = format("id_task_%d", nType)
	set_task_byte(szTask, "byte_task", TASK_STATUS_FINISH)
	get_task_award(nType, nStep+1)
	set_task_byte(szTask, "byte_step", getn(tTaskAward[nType]))
	add_server_count()
end

tItem = {
	--limit,cost,award,point
	[200130971] = {500, 0, "act_12_normal", 0},
	[200130972] = {-1, 10, "act_12_ib", 12},
}
function handle_on_use_item(nIndex,confirm)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nId = PackItemId(g,d,p)
	local t = tItem[nId]
	if t then
		if t[1] > 0 and get_task("id_open_box1") >= t[1] then
			Talk(1,"",format("H�m nay s� l��ng m� %s �� ��t gi�i h�n", GetItemName(nIndex)))
			return
		end
		if CustomAwardCheckCondition(t[3]) ~= 1 then
			return
		end
		if t[2] > 0 then
			if not confirm then
    			local szTitle = format("M� %s c�n ti�u hao %d %s, ��ng � kh�ng?", GetItemName(nIndex), t[2], "Xu")
    			local tSay = {
    				format("%s/#handle_on_use_item(%d,1)", "X�c ��nh m�", nIndex),
    				format("%s/nothing", "T� b�"),
    			}
    			Say(szTitle, getn(tSay), tSay)
    			return
    		end
    		if DelItem(2,1,30230,t[2]) ~= 1 then
    			Talk(1,"",format("%s kh�ng �� %d", "Xu", t[2]))
    			return
    		end
		end
		if DelItemByIndex(nIndex, 1) ~= 1 then
			return
		end
		if CustomAwardGiveGroup(t[3], 0) ~= 1 then
			return
		end
		if t[4] > 0 then
			add_task("id_score", t[4])
			Msg2Player(format("Nh�n ���c %d �i�m trang tr�", t[4]))
		end
		if t[1] > 0 then
			add_task("id_open_box1", 1)
		end
	end
end

