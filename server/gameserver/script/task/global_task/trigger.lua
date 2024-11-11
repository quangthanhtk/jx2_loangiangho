
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Import("\\script\\tmp_task_id_def.lua")
----------------------------------------------------------------------------
--����˵��
--���ʱ� {10, 20, 30}
--�Ի� {{...}, {...}, {...}}
--����ֵ{0,1,1}
function DoTSTalkTask(tRand, tTalk, tRet)
	--if type(tRand) ~= "table" and type(tTalk) ~= "table" and type(tRet) ~= "table" then
		local nMax = 0
		for i = 1, getn(tRand) do
			nMax = nMax + tRand[i]
		end
		
		local nRand = random(1, nMax);
		local nTemp = 0;
		for i = 1, getn(tRand) do
			nTemp = nTemp + tRand[i]
			if nRand <= nTemp then
				nTemp = i
				break
			end
		end
		
		if tTalk[nTemp] ~= nil then
			--local strDiag = tGtNpcMain:dialog_string_deal(tTalk[nTemp]);
			TalkEx("", tTalk[nTemp]);
		end
		
		return tRet[nTemp];
	--else
		--return -1
	--end
end

----------------------------------------------------------------------------
--������� ����������е�������������б�
--����ֵ �б� [1] TaskID [2] TSDLIdx
function tGTaskTSDL:GetPlayerTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractTSDLList(tTaskID);
end

--������� �������δ��ɵ���������б�
function tGTaskTSDL:GetPlayerLiveTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
end

--������� ��������Ƿ����δ��ɵ��������
--����ֵ
	--1����
	--0����
function tGTaskTSDL:IsPlayerHaveLiveTSDL()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return 0
	end
	return tGTaskTSDL:IsLiveTSDL(tTaskID)
end

--�������Ĺ�
--1������������е�����
--2�����ڴ����Ĺֵ�����
--3����ͼ
--����ֵ
	--1���ɹ����䣬����Ҫ��������
	--2������Ҫ�������������Ƴ�������
	--3���ɹ����䣬��Ҫ��������
	--4��������䲻�ɹ�
function DoTSDLTask(szNpcName, nMapID)
	local tTaskID = tGtTask:GetAllTask();
	local nRet = 2;
	if tTaskID == nil or getn(tTaskID) == 0 then
		return nRet;
	end
	
	local tTaskIDList = {};
	local tTSDLList = {};
	tTaskIDList, tTSDLList = tGTaskTSDL:GetPlayerLiveTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		nRet = 4
		if tGTaskTSDL:IsMatch(tTSDLList[i], szNpcName, nMapID) == 1 then
			--print("TSDL:"..tTaskIDList[i]..tTSDLList[i]..szNpcName..nMapID);
			local nRand = random(1, 100);
			if nRand <= tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 6)) then	--����ɹ�
				--������Ʒ
				dostring("gf_AddItemEx({"..TABLE_GT_TSDL:getCell(tTSDLList[i], 5).."},\""..TABLE_GT_TSDL:getCell(tTSDLList[i], 4).."\")");
				
				--�Ƿ���ɵ���
				if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 1 and tGTaskTSDL:IsPlayerHaveLiveTSDL() == 0 then
					return 3
				end
				return 1
			end
		end
	end
	
	return nRet
end

KILL_JZJZ_TSDL = 4001
function TSDL_Trigger()	--�������	
	local nNpcIdx, szNpc, szNpcName = GetTriggeringUnit();	
	--local nMapID, nMapX, nMapY = GetWorldPos();
	local _, nMapID = SubWorldIdx2ID(SubWorld);
	
	local nCreateTrigger = 1;
	if nNpcIdx ~= 0 then
		local nRet = DoTSDLTask(szNpcName, nMapID);
		if nRet == 3 or nRet == 2 then	--��Ҫ��������
			nCreateTrigger = 0
		end
	end
	
	RemoveTrigger(GetRunningTrigger());
	
	if nCreateTrigger == 1 and GetTrigger(KILL_JZJZ_TSDL) == 0 then
		CreateTrigger(0, 1245, KILL_JZJZ_TSDL, 1);
	end
end

function OnTrigger()
	gt_trigger_callback();
end

--2ɱ�ִ�����
function xiaotulang()
	local nNpcIdx = CreateNpc("Th� Lang V��ng", "Th� Lang V��ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();
end

--2ɱ�ִ�����
function xiaoqinglang()
	local nNpcIdx = CreateNpc("Thanh Lang V��ng", "Thanh Lang V��ng", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
	gt_trigger_callback();	
end

--43 ɱ�ִ�����
function heixingxing()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function dushe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function yanjingshe()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

function danianshou()
	gt_trigger_callback();
	SetTask(Task_id_005,GetTask(Task_id_005)+1);
end

--121
function youhun_121()
	gt_trigger_callback();
	local tbTask = {
		"��y ch�nh l� d��ng l�c c�a <Qu� Hoa B�o �i�n> sao?! Haha, cu�i c�ng �� t�m ���c r�i.",
		"Qu� nhi�n l� m�t quy�n m�t t�ch v� c�ng th�n b�, luy�n xong c� th� �� th�ng k� kinh b�t m�ch tr�n ng��i, �n v�n ch�n kh�. Ta ph�i luy�n th� m�i ���c. \n<color=green>(��c m�t t�ch...)<color>",
		"M�t t�ch n�y qu� nhi�n k� di�u \n<color=green>(luy�n c�ng����)<color>",
		"�!!! trong ng��i nh� c� m�t lu�n ch�n kh� d�ng tr�o\n<color=green>(luy�n c�ng����)<color> (��t nhi�n sau l�ng n�i gi�)",
		"L� ai?!!! \n ( C�m gi�c m�t lu�ng nhi�t kh� t� ph�a sau �p t�i, ng�t �i,  trong l�c m� h� nh�n th�y m�t g� m�c �o m�u �en �o�t l�y << Qu� Hoa B�o �i�n>>  trong tay m�nh, ng��i n�y l� ai? nh�n th�n h�nh c� v� h�i quen.)",
	}
	Talk(getn(tbTask),"youhun_121_deal",tbTask[1],tbTask[2],tbTask[3],tbTask[4],tbTask[5]);
end

function youhun_121_deal()
	NewWorld(6018,1618,2901);
	SetFightState(0);
end

function yemaoxiang()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V�n Bang Ch�", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function heixingxing_101()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("yunbangzhu", "V�n Bang Ch�", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function huoqilin()
	gt_trigger_callback();
	local npcIndex = CreateNpc("lubangzhu", "L�c bang ch�", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\lubangzhu.lua");
	SetNpcLifeTime(npcIndex, 10*60);
end

function ck_zhangweigang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_shangguhuoqiling()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_yuguaitoumu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_lili()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_funiushandawang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_xixiajianglin()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuoyaofu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_boduyingji()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuosengwu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuozhanglao()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_axiuluo()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_mohuluojia()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_duanchengen()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chunshisanniang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_zaxusahan()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function chihuodaoke2()
	gt_trigger_callback()
	Msg2Player("Xi H�a �ao Kh�ch: C�u t�i v�i, xin ��i hi�p h�y tha cho ti�u nh�n, Th��ng �ng �ang b� giam � nh� lao c�a Long Nh�n ��ng 1!")
end

function huofeng_task_huanghuoliujin()
	SendScript2VM("\\script\\task\\huofengtask\\kill_trigger.lua", "kill_fenghuoliujin_call_back()")
end

function dongzhengmujiangjun()
	gt_trigger_callback();
	Talk(1, "", "Qu� th�t m�nh, r�t ti�c thi�n ma hi�p tinh �� b� ��a Huy�n C�ng Ch�a c��p �i, haha, ng��i ��n mu�n r�i")
end

function huofeng_task_daomuren()
	gt_trigger_callback();
	if random(1,10000) <= 100 then --1%
		Talk(1, "", "Xin ��i hi�p tha m�ng,H�n Tinh Thi�t �� b� L�m Xung L��ng S�n c��p �i")
	end
end

function yp_call_guse()
	gt_trigger_callback();
	Talk(1,"yp_call_guse_cb","C� d�u v�t c�a <color=red>C� X�<color>, h�y mau ��nh b�i n�!")
end

function yp_call_guse_cb()
	local nNpcIdx = CreateNpc("C� X�", "C� X�", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
end

function reborn3task_tysmr()
	gt_trigger_callback();
	if gf_GetTeamSize() == 1 or GetCaptainName() == GetName() then
		local nNpcIdx = CreateNpc("fs_hongyinjiaozhu", "L�i ���ng Ch�", GetWorldPos());
		SetNpcLifeTime(nNpcIdx, 3600*4);
	end
end