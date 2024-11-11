--���ؽ���
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--��һЩ�����ϵĶ������������� �������
g_tGTaskId = {1331,1345};  --�漰��������id �鿴gtask_main
--�洢��ͬ�����Ҫ���������
g_tInputInfo = {}
--���ڽ��������Ʒ����
g_nTaskItemNum = 1;
--��������������Ʒ ��1~g_nTaskItemNum��Ϊ���ڽ��������Ʒ
g_tTaskItem = {
	{{2, 111, 7, 1,}, "Th� ch�a b�c ra"},
}

g_tSudoku = {
	{
		{4, 9, 2,},
		{3, 5, 7,},
		{8, 1, 6,},
	},
	{
		{8, 3, 4,},
		{1, 5, 9,},
		{6, 7, 2,},
	},
	{
		{6, 1, 8,},
		{7, 5, 3,},
		{2, 9, 4,},
	},
	{
		{2, 7, 6,},
		{9, 5, 1,},
		{4, 3, 8,},
	},
}

function OnUse(nItemIdx)
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	
	if nHasTask ~= 1 then
		--Talk(1, "", "<color=green>���ؽ���<color>����û�н�ȡ��ǰ����");
		return 0;
	end
	
	
	--�ж��ǲ����Ѿ������
	local nHasFinished = 1;
	for i = 1, g_nTaskItemNum do
		if BigGetItemCount(g_tTaskItem[i][1][1], g_tTaskItem[i][1][2], g_tTaskItem[i][1][3]) == 0 then
			nHasFinished = 0;
			break;
		end
	end
	
	if nHasFinished == 1 then
		Talk(1, "", "Ng��i �� nh�n v�t ph�m nhi�m v�");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	--��ʾ����
	local tQuestion, tAnswer = get_sudoku_info();
	--���𰸴�����
	g_tInputInfo[GetName()] = tAnswer;
	
	--��ʾ
	local szMsg = "<color=green>H�p G�m Th�n B�: <color>H� �� l�c th�, danh b�t h� truy�n. (M�i m�t d�ng ��u thi�u 1 ch� s�; A, B, C s� h�p th�nh 3 ch� s�, �� ch�c l� �i�m m�u ch�t �� m� h�p g�m.#\n";
	for i = 1, getn(tQuestion) do
		szMsg = szMsg .. [[    ]];
		for j = 1, getn(tQuestion[i]) do
			szMsg = szMsg .. tQuestion[i][j] .. [[    ]];
		end
		szMsg = szMsg .. "\n";
	end
	szMsg = szMsg .. "Nh�p m�t m� c�a h�p g�m: ";
	local tSel = {
		"��ng �/input_code",
		"��ng/close_box",
	}
	Say(szMsg, getn(tSel), tSel);
end

function close_box()
	g_tInputInfo[GetName()] = nil;
end

function input_code()
	AskClientForString("input_code_cb","", 3, 6, "Nh�p m�t m� c�a h�p g�m: ");
end

function input_code_cb(szValue)
	if g_tInputInfo[GetName()] == nil then
		Talk(1, "", "M�t m� nh�p v�o b� l�i.");
		return 0;
	end
	
	local tAnswer = g_tInputInfo[GetName()];
	g_tInputInfo[GetName()] = nil;
	
	local nCorrect = 0;
	
	for i = 1, getn(tAnswer) do
		if szValue == tAnswer[i] then
			nCorrect = 1;
			break;
		end
	end
	if nCorrect == 0 then
		Talk(1, "", "M�t m� nh�p v�o b� l�i.");
		return 0;
	end
	
	if gf_Judge_Room_Weight(getn(g_tTaskItem),10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,6,1) ~= 1 then return 0; end
	--���Ը���Ʒ��
	gf_SetLogCaption("H�p G�m Th�n B�");
	for i = 1, getn(g_tTaskItem) do
		gf_AddItemEx(g_tTaskItem[i][1], g_tTaskItem[i][2]);
	end
	gf_SetLogCaption("");
end

function get_sudoku_info()
	local nRand = random(1, getn(g_tSudoku));
	local tSudoku = g_tSudoku[nRand];
	local tAnswer = {"", "", ""};
	local tQuestion = {};
	local tCode = {"Gi�", "B", "C",};
	local tChineseNum = {"m�t", "hai", "ba", "b�n", "Ng� ", "s�u", "b�y", "t�m", "ch�n"};
	local tTChineseNum = {"1", "2", "3", "4", "5", "�", "7", "8", "9"};
	for i = 1, getn(tSudoku) do
		nRand = random(1, getn(tSudoku[i]));
		tQuestion[i] = {};
		for j = 1, getn(tSudoku[i]) do
			if j == nRand then
				tQuestion[i][j] = "<color=yellow>" .. tCode[i] .. "<color>";
				tAnswer[1] = tAnswer[1] .. tostring(tSudoku[i][j]);
				tAnswer[2] = tAnswer[2] .. tChineseNum[tSudoku[i][j]];
				tAnswer[3] = tAnswer[3] .. tTChineseNum[tSudoku[i][j]];
			else
				--tQuestion[i][j] = tSudoku[i][j];
				tQuestion[i][j] = tTChineseNum[tSudoku[i][j]];
			end
		end
	end
	return tQuestion, tAnswer;
end
