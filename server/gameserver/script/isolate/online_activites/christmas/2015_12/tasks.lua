
GBL_SERVER_COUNT = 0
TASK_STATUS_FINISH=255
tTasks = {
	[1] = {
        {"Tuy�t Ph�ch", {2,1,45,50}, "B�ng Qu�i", "B�ng T�m ��ng_2" },
        {"Ng�c Nh� �", {2,1,87,50}, "B�ng T�m N�", "B�ng T�m ��ng_2" },
        {"D� T�c Qu�i Li�n", {2,1,164,50}, "Xi H�a �ao Kh�ch", "V�n M�ng Tr�ch" },
        {"M�u ��n", {2,1,76,50}, "H�c Phong Ki�m Kh�ch", "H�c Phong ��ng" },
        {"da Th��ng Vi�n", {2,1,166,50}, "Th��ng Vi�n", "V� Di s�n" },
        {"T�u B�i", {2,1,44,50}, "�ao V��ng", "D��ng Trung ��ng-3" },
	},
	[2] = {
        {"Tuy�t Tinh", {2,1,22,3}, "Tuy�t Qu�i", "B�ng T�m ��ng_1" },
        {"D� Minh Ch�u", {2,1,39,3}, "N� Hi�p Kh�ch", "Tr�c Ty ��ng_1" },
        {"H� Ph�ch", {2,1,84,3}, "Tr�ng Qu�i", "Thi�n S� ��ng-1" },
        {"Huy�n Quang", {2,1,99,3}, "Tr�ng Qu�i V��ng", "Thi�n S� ��ng-2" },
        {"D� T�c Qu�i Li�n", {2,1,164,50}, "Xi H�a �ao Kh�ch", "V�n M�ng Tr�ch" },
        {"T�u B�i", {2,1,44,50}, "�ao V��ng", "D��ng Trung ��ng-3" },
	},
	[3] = {
        {"Tuy�t Tinh", {2,1,22,3}, "Tuy�t Qu�i", "B�ng T�m ��ng_1" },
        {"D� Minh Ch�u", {2,1,39,3}, "N� Hi�p Kh�ch", "Tr�c Ty ��ng_1" },
        {"H� Ph�ch", {2,1,84,3}, "Tr�ng Qu�i", "Thi�n S� ��ng-1" },
        {"Huy�n Quang", {2,1,99,3}, "Tr�ng Qu�i V��ng", "Thi�n S� ��ng-2" },
        {"M�u ��n", {2,1,76,50}, "H�c Phong Ki�m Kh�ch", "H�c Phong ��ng" },
        {"Ch�n th�", {2,1,112,1}, "Th� r�ng", "B�n �� chu vi th�nh ch�nh" },
	},
	[4] = {
        {"D� Minh Ch�u", {2,1,39,3}, "N� Hi�p Kh�ch", "Tr�c Ty ��ng_1" },
        {"H� Ph�ch", {2,1,84,3}, "Tr�ng Qu�i", "Thi�n S� ��ng-1" },
        {"Tuy�t Ph�ch", {2,1,45,50}, "B�ng Qu�i", "B�ng T�m ��ng_2" },
        {"Ng�c Nh� �", {2,1,87,50}, "B�ng T�m N�", "B�ng T�m ��ng_2" },
        {"da Th��ng Vi�n", {2,1,166,50}, "Th��ng Vi�n", "V� Di s�n" },
        {"T�u B�i", {2,1,44,50}, "�ao V��ng", "D��ng Trung ��ng-3" },
	},
}

tTaskRand = {
	[1] = {
		1,1,1,1,1,
		2,2,2,2,
		3,
	},
	[2] = {
		1,1,1,1,1,
		4,4,4,4,4,
	},
}

tTaskAward = {
	[1] = {
		--���飬���֣�����
		{{30000,  0, 0},  {35000,  0, 0}},
		{{60000,  1, 0},  {68000,  2, 0}},
		{{80000,  2, 0},  {90000,  3, 0}},
		{{100000, 3, 0},  {120000, 4, 0}},
		{{150000, 4, 1},  {180000, 5, 2}},
		{{300000, 5, 0},  {340000, 6, 0}},
		{{400000, 6, 0},  {450000, 7, 0}},
		{{500000, 7, 0},  {560000, 8, 0}},
		{{600000, 8, 0},  {670000, 9, 0}},
		{{700000, 14, 2}, {780000, 15, 3}},
		{{900000, 0, 5},  {990000, 0, 7}},
	},
	[2] = {
		{{30000,  0, 0},  {35000,  0, 0}},
		{{60000,  2, 0},  {68000,  3, 0}},
		{{80000,  3, 0},  {90000,  4, 0}},
		{{100000, 4, 1},  {120000, 5, 1}},
		{{150000, 5, 1},  {180000, 6, 2}},
		{{300000, 6, 1},  {340000, 7, 2}},
		{{400000, 7, 2},  {450000, 8, 2}},
		{{500000, 8, 2},  {560000, 9, 3}},
		{{600000, 9, 2},  {670000, 10, 3}},
		{{700000, 16, 3}, {780000, 17, 4}},
		{{900000, 0, 8},  {990000, 0, 10}},
	},
}
tItemBox = {
	{"Qu� Song ��n-Th��ng",2,1,30971},
	{"Qu� Song ��n-H�o Hoa",2,1,30972},
}

tFinalAward = {
	{500, {2,2,8,2,4}
	},
	{1000, {2,1,30493,3,4}
	},
	{2000, {2,1,30913,2,4}
	},
}
OPEN_IB_TREE_GOLD=80

function get_cur_task(nType, bGen)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	if 0 == nCurTask and bGen then
		local nStep = get_task_byte(szTask, "byte_step") + 1
		if nType == 2 and nStep == 1 then
			if bGen == 1 then
				local szTitle = format("<color=green>%s:<color> M� C�y Noel-H�o Hoa c�n ti�u hao %d V�ng, ��ng �?", GetTargetNpcName(), OPEN_IB_TREE_GOLD)
            	local tSay = {}
            	tinsert(tSay, format("%s/#get_cur_task(%d,2)", "X�c ��nh m�", nType))
            	tinsert(tSay, format("%s/nothing", "R�i kh�i"))
            	Say(szTitle, getn(tSay), tSay)
            	return 0
			else
				if Pay(OPEN_IB_TREE_GOLD*10000) ~= 1 then
					Talk(1, "", format("Tr�n ng��i hi�p s� kh�ng �� %d V�ng", OPEN_IB_TREE_GOLD))
					return 0
				end
			end
		end
		nCurTask = _get_rand_task(nType, nStep)
		set_task_byte(szTask, "byte_task", nCurTask)
	end
	return nCurTask
end

function get_step(nType)
	local szTask = format("id_task_%d", nType)
	local nStep = get_task_byte(szTask, "byte_step")
	return nStep
end

function finish_task(nType)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	local nStep = get_task_byte(szTask, "byte_step") + 1
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if nCurTask > 0 then
--		if nCurTask == TASK_STATUS_FINISH then
--			return
--		end
		local t = _get_task_cfg_(nCurTask)
		local tt = t[2]
		if DelItem(tt[1],tt[2],tt[3],tt[4]) == 1 then
			--set_task_byte(szTask, "byte_task", TASK_STATUS_FINISH)
			get_task_award(nType, nStep)
			Talk(1, "", format("Sau khi trang tr� %s l�n tr�n c�y, qu� nhi�n ��p h�n r�t nhi�u.", t[1]))
			return 1
		else
			Talk(1, "", format("H�nh nh� kh�ng c� %d %s, mau ��n %s t�m tr�n ng��i c�a %s n�o!", tt[4], t[1], t[4], t[3]))
		end
	end
	return 0
end

function _get_rand_task(nType, nStep)
	local nGroup = tTaskRand[nType][nStep]
	local nRet = 0
	if nGroup then
		local r = random(1,getn(tTasks[nGroup]))
		nRet = nGroup*10 + r
	end
	return nRet
end
function _get_task_cfg_(nTask)
	if nTask == TASK_STATUS_FINISH then return nil end
	local nGroup = floor(nTask / 10)
	local nIdx = mod(nTask,10)
	return tTasks[nGroup][nIdx]
end

function get_task_award(nType, nStep)
	local szTask = format("id_task_%d", nType)
	local nCurTask = get_task_byte(szTask, "byte_task")
	if nStep > getn(tTaskAward[nType]) then
		--Talk(1, "", "����װ���Ѵﵽ��߽׶Σ��޷��ٽ���װ�Ρ�")
		return
	end 
--	if nCurTask ~= TASK_STATUS_FINISH then
--		return 0
--	end
	local t = tTaskAward[nType][nStep]
	local tAward = t[1]
	if IsActivatedVipCard() == 1 then
		tAward = t[2]
	end
	local nLevel = GetLevel()
	local nExp = floor(tAward[1] * (nLevel^3)/(80^3))
	ModifyExp(nExp)
	Msg2Player(format("Nh�n ���c %d Exp", nExp))
	if tAward[2] > 0 then
		add_task("id_score", tAward[2])
		Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c %d �i�m trang tr�", tAward[2]))
	end
	if tAward[3] > 0 then
		local tItem = tItemBox[nType]
		AddItem(tItem[2],tItem[3],tItem[4],tAward[3])
		Msg2Player(format("Nh�n ���c %d %s", tAward[3], tItem[1]))
	end
	add_task_byte(szTask, "byte_step", 1)
	set_task_byte(szTask, "byte_task", 0)
	return 1
end

function get_server_award(nIdx)
	if get_task_bit("id_server_award", nIdx) == 1 then
		Talk(1, "", "�� nh�n ph�n th��ng n�y r�i")
		return
	end
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if get_step(1) ~= getn(tTaskAward[1]) or get_step(2) ~= getn(tTaskAward[2]) then
		Talk(1, "", "H�m nay ch�a ho�n th�nh l��t 2 nhi�m v� trang tr� C�y Noel")
		return
	end
	local t = tFinalAward[nIdx]
	if get_server_count() < t[1] then
		Talk(1, "", format("L��t t�ch l�y c�a server ch�a ��t ��n %d", t[1]))
		return
	end
	local tt = t[2]
	AddItem(tt[1],tt[2],tt[3],tt[4],tt[5])
	set_task_bit("id_server_award", nIdx, 1)
	Talk(1, "", "Nh�n th��ng th�nh c�ng")
end

function get_server_count()
end

function add_server_count()
end
