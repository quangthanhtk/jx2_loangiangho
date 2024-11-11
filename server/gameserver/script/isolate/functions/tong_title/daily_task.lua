Include("\\script\\isolate\\functions\\tong_title\\head.lua")

function del_gem_lv1(nNum, bDel)
	local tGem = {
		{2, 22, 101 },
		{2, 22, 201 },
		{2, 22, 301 },
		{2, 22, 401 },
	}
	for i = 1,getn(tGem) do
		local t = tGem[i]
		if GetItemCount(unpack(t)) >= nNum then
			if bDel == 1 and DelItem(t[1], t[2], t[3], nNum) ~= 1 then
				return 0
			end
			return 1
		end
	end
	return 0
end

tTask = {
    {"N�p 1 c�i �� qu� c�p 1", del_gem_lv1, 1 },
    {"N�p 1 ��i Ti�u L�nh", {2,95,918,1}},
    {"N�p 1 Ng�ng Tinh L�", {2,1,30804,1}},
    {"N�p 1 Thi�t Tinh c�p 1", {2,1,30533,1}},
    {"N�p 1 Ti�u Ki�p T�n", {2,0,141,1}},
    {"N�p 1 Huy Ch��ng ��ng Ch�", {0,153,1,1}},
    {"N�p 1 Gi�y V�i Th�", {0,154,1,1}},
    {"N�p 1 �o Cho�ng T�o B�", {0,152,1,1}},
    {"N�p 1 Huy Ch��ng Anh H�ng", {2,1,30499,1}},
    {"N�p 1 Luy�n L� Thi�t Kho�ng", {2,1,30537,1}},
    {"N�p 1 T�y T�m Th�ch Kho�ng", {2,1,30536,1}},
    {"N�p 1 H�c Ng�c �o�n T�c Cao", {1,0,6,1}},
    {"N�p 1 Ch� Huy�t T�n", {1,0,3,1}},
    {"N�p 1 Ng� Hoa Ng�c L� Ho�n", {1,0,15,1}},
    {"N�p 1 V�n V�t Quy Nguy�n ��n", {1,0,11,1}},
    {"N�p 1 Ti�u Ho�n ��n", {1,0,7,1}},
    {"N�p 1 �ch Kh� T�n", {1,0,13,1}},
    {"N�p 1 H�o Hi�p L�nh", {2,95,2084,1}},
    {"N�p 1 L�i Vi�m Th�ch", {2,1,30683,1}},
    {"N�p 1 Vi�m Linh Ti", {2,1,30671,1}},
    {"N�p 1 Da Ma Lang", {2,1,30672,1}},
    {"N�p 1 Huy�n Vi�m Thi�t", {2,1,30670,1}},
    {"N�p 1 Da ��a Long", {2,1,30673,1}},
    {"N�p 1 Huy Ch��ng Thi�t Ch�", {0,153,2,1}},
    {"N�p 1 �o Cho�ng C�m �o�n", {0,152,2,1}},
    {"N�p 1 Kim L�ng T�u", {2,95,822,1}},
	{"N�p 1 B�t Nh� nh�", {2,0,504,1}},
	{"N�p 1 B�t Nh� l�n", {2,0,398,1}},
	{"N�p 1 Xu v�t ph�m", {2,1,30230,1}},
	{"N�p 1 Ti�u Dao Ng�c", {2,1,30603,1}},
}

function check_condition(bNotify)
	if GetTongName() == "" then
		if bNotify and 1 == bNotify then
			Talk(1, "", "Gia nh�p Bang h�i m�i c� th� ho�n th�nh nhi�m v� m�i ng�y")
		end
		return 0
	end
	if get_daily_task_cnt() >= MAX_TASK_DAILY_CNT then
		if bNotify and 1 == bNotify then
			Talk(1, "", "S� l�n ho�n th�nh nhi�m v� m�i ng�y ng�y h�m nay �� ��t t�i �a")
		end
		return 0
	end
	if get_tong_title_lv() <= 0 and get_tong_gxd() >= NO_TITLE_GXD_LIMIT then
		if bNotify and 1 == bNotify then
			Talk(1, "", "M�i sau khi k�ch ho�t x�ng danh bang h�i quay l�i")
		end
		return 0
	end
	return 1
end

function get_rand_task()
	if check_condition(1) == 0 then
		return 0
	end
	local nIdx = get_daily_task_idx()
	if nIdx == 0 then
		nIdx = random(1,getn(tTask))
		set_daily_task_idx(nIdx)
	end
	return nIdx
end

tGXDAward = {
	[1] = 20,
	[2] = 20,
	[3] = 20,
	[4] = 20,
	[5] = 20,
	[6] = 10,
	[7] = 10,
	[8] = 10,
	[9] = 10,
	[10] = 10,
}
function finish_rand_task(nIdx, bPass)
	if check_condition(1) == 0 then
		return 0
	end
	
	local tTsk = tTask[nIdx]
	if tTsk then
		if not bPass then
    		if type(tTsk[2]) == "function" then
    			if tTsk[2](tTsk[3], 1) ~= 1 then
    				Talk(1, "", "��o c� kh�ng ��")
    				return 0
    			end
    		else
    			local g,d,p,n = unpack(tTsk[2])
    			if GetItemCount(g,d,p) < n then
    				Talk(1, "", "��o c� kh�ng ��")
    				return 0
    			end
    			if DelItem(g,d,p,n) ~= 1 then
    				return 0
    			end
    		end
    	end
		local nCnt = get_daily_task_cnt()
		local nGXD = tGXDAward[nCnt + 1]
		--�¿��Ѽ���˫�����׶�
		if IsActivatedVipCard()== 1 then --if gIsVipCardActive and gIsVipCardActive() == 1 then
			nGXD = nGXD * 2
		end
		add_tong_gxd(nGXD)
		inc_daily_task_cnt()
		set_daily_task_idx(0)--�����ǰ����
		local szMsg = format("Ch�c m�ng ho�n th�nh nhi�m v� [%s] nh�n ���c [%d] �� c�ng hi�n bang h�i", tTsk[1], nGXD)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		FireEvent("event_task_award", "tong_daily_task", nIdx)
		return 1
	end
end

function npc_talk_finish_rand_task(bConfirm)
	local nIdx = get_rand_task()
	if nIdx > 0 then
		if not bConfirm or bConfirm == 0 then
			local nCnt = get_daily_task_cnt()
			local tTsk = tTask[nIdx]
			if not tTsk then return 0 end
            local szTitle = format("<color=gold>%s:<color>%s(%d/%d):<color=yellow>%s<color>, %s", GetTargetNpcName(), "Nhi�m v� hi�n t�i", nCnt, MAX_TASK_DAILY_CNT, tTsk[1], "C� ch�c ch�n ho�n th�nh kh�ng?")
            local tbSay = {}
            
            tinsert(tbSay, format("%s/#npc_talk_finish_rand_task(1)", "Ch�c ch�n ho�n th�nh"))
            tinsert(tbSay, format("%s/pass_task", "B� qua nhi�m v�"))
            tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
            
            Say(szTitle, getn(tbSay), tbSay)
			return 0
		end
		return finish_rand_task(nIdx)
	end
end

function pass_task(bConfirm)
	local nPassNeedGold = 200
	local nIdx = get_rand_task()
	if nIdx <= 0 then return 0 end
	if not bConfirm or bConfirm == 0 then
		local szTip = format("B� qua nhi�m v� ph�i ti�u hao %d v�ng, x�c nh�n b� qua kh�ng?", nPassNeedGold)
		local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), szTip)
		local tbSay = {}
        tinsert(tbSay, format("%s/#pass_task(1)", "X�c nh�n b� qua"))
        tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
        
        Say(szTitle, getn(tbSay), tbSay)
		return 0
	end
	if Pay(nPassNeedGold*10000)~=1 then
		Talk(1, "", format("V�ng kh�ng �� %d, b� qua nhi�m v� th�t b�i", nPassNeedGold))
		return 0
	end
	local nRet = finish_rand_task(nIdx, 1)
	Talk(1, "", "Ch�c m�ng b�n �� th�nh c�ng b� qua nhi�m v�")
	return nRet
end
