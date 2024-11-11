Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\missions\\yp\\ywz\\define.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\lib\\sdb.lua")
Import("\\script\\lib\\globalvalue.lua")

--�������
function ywz_GetScore()
	return gf_GetMyTaskByte(YWZ_TASK_1, 3, 4);
end

function ywz_AddScore(nValue)
	local nNewValue = min(ywz_GetScore() + nValue, 2^16 - 1);
	gf_SetMyTaskByte(YWZ_TASK_1, 3, 4, nNewValue, TASK_ACCESS_CODE_YANWUZHAN)
end

--�ܳ�
function ywz_GetWeekTaskCount()
	return max(YWZ_WEEK_TASK_LIMIT - gf_GetTaskByte(YWZ_TASK_1, 1), 0);
end

function ywz_AddWeekTaskCount(nValue)
	local nNewValue = min(gf_GetTaskByte(YWZ_TASK_1, 1) + nValue, 2^8 - 1);
	gf_SetTaskByte(YWZ_TASK_1, 1, nNewValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--���⽱��
function ywz_GetExAwardCount()
	return max(YWZ_EX_TASK_AWARD - gf_GetTaskByte(YWZ_TASK_1, 2), 0);
end

function ywz_AddExAwardCount(nValue)
	local nNewValue = min(gf_GetTaskByte(YWZ_TASK_1, 2) + nValue, 2^8 - 1);
	gf_SetTaskByte(YWZ_TASK_1, 2, nNewValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--����������
function ywz_GetWeekTaskIndex()
	return gf_GetTaskByte(YWZ_TASK_2, 1);
end

function ywz_SetWeekTaskIndex(nIndex)
	gf_SetTaskByte(YWZ_TASK_2, 1, nIndex, TASK_ACCESS_CODE_YANWUZHAN);
end

--�������kill��
function ywz_GetKillMax()
	return gf_GetTaskByte(YWZ_TASK_2, 2);
end

function ywz_SetKillMax(nValue)
	gf_SetTaskByte(YWZ_TASK_2, 2, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--����ǰkill��
function ywz_GetCurrKill()
	return gf_GetTaskByte(YWZ_TASK_2, 3);
end

function ywz_AddCurrKill(nValue)
	local nCount = ywz_GetCurrKill();
	local nNewValue = min(ywz_GetKillMax() - nCount, nValue);
	gf_SetTaskByte(YWZ_TASK_2, 3, nCount + nNewValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--��ȡboss�������
function ywz_GetBoxAwardFlag()
	return gf_GetTaskBit(YWZ_TASK_2, 25);
end

function ywz_SetBoxAwardFlag(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 25, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--5��������ȡ���ı��
function ywz_GetAward1Flag1()
	return gf_GetTaskBit(YWZ_TASK_2, 26);
end

function ywz_SetAward1Flag1(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 26, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywz_GetAward1Flag2()
	return gf_GetTaskBit(YWZ_TASK_2, 27);
end

function ywz_SetAward1Flag2(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 27, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywz_GetAward1Flag3()
	return gf_GetTaskBit(YWZ_TASK_2, 28);
end

function ywz_SetAward1Flag3(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 28, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywz_GetAward2Flag1()
	return gf_GetTaskBit(YWZ_TASK_2, 29);
end

function ywz_SetAward2Flag1(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 29, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywz_GetAward2Flag2()
	return gf_GetTaskBit(YWZ_TASK_2, 30);
end

function ywz_SetAward2Flag2(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 30, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywz_GetAward2Flag3()
	return gf_GetTaskBit(YWZ_TASK_2, 31);
end

function ywz_SetAward2Flag3(nValue)
	gf_SetTaskBit(YWZ_TASK_2, 31, nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

--��������
function ywz_WeeklyReset()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	SetTask(YWZ_TASK_1, 0, TASK_ACCESS_CODE_YANWUZHAN);
	SetTask(YWZ_TASK_2, 0, TASK_ACCESS_CODE_YANWUZHAN);
end

--��������
function ywz_DailyReset()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	ywz_SetBoxAwardFlag(0);
end

--ɱ�ִ�����
function ywz_KillTrigger(sName)
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local nIndex = ywz_GetWeekTaskIndex()
	if nIndex == 0 then
		return 0;
	end
	local tItem = YWZ_WEEK_TASK_TABLE[nIndex];
	if not tItem then
		return 0;
	end
	if tItem[2] ~= sName then
		return 0;
	end
	local times = ywz_GetCurrKill();
	if times >= tItem[1] then
		return 0;
	end
	ywz_AddCurrKill(1);
	local msg = format("Ti�u di�t %s (%d/%d)", sName, times + 1, tItem[1]);
	if times + 1 >= tItem[1] then
		msg = msg.."(Ho�n th�nh)";
	end
	Msg2Player(msg);
end

--��׶�
--1 ��һ�׶�
--2 ��һ�׶��콱
--3 �ڶ��׶�
--4 �ڶ��׶��콱
function ywz_GetStep()
	local wDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if wDay > 0 and wDay < 5 then
		return 1;
	elseif wDay == 5 then
		if nHour ~= 23 then
			return 1;
		end
	elseif wDay == 6 then
		if nHour >= 0 and nHour < 18 then
			return 2;
		end
		if nHour == 20 then
			return 3;
		end
		if nHour >= 21 and nHour < 23 then
			return 4;
		end
	end
	return 0;
end

--��������ɽ��
function ywz_GotoZqsg()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	if ywz_GetStep() ~= 3 then
		Talk(1,"","Ch��ng Kh� S�n C�c m� v�o 20:00 th� 7 h�ng tu�n, kho�ng th�i gian kh�c kh�ng th� v�o trong.");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp < 1 or nCamp > 3 then
		Talk(1,"","Ch� c� nh�n v�t gia nh�p th� l�c m�i ���c v�o Ch��ng Kh� S�n C�c.");
		return 0;
	end
	local nProtect = GetGlbValue(GLV_YWZ_PROTECT_CAMP);
	if nProtect < 1 or nProtect > 3 then
		Talk(1,"","Do kh�ng c� th� l�c phe th�, Di�n V� Chi�n kh�ng th� m�");
		return 0;
	end
	local nFightCamp = 2;
	if nCamp == nProtect then
		nFightCamp = 1;
	end
	local s= SDB(YWZ_SHARE_DATA, 0, nCamp);
	s:apply2(callout(ywz_GotoZqsg_cb, nFightCamp));
end

function ywz_GotoZqsg_cb(nFightCamp, nCount, sdb)
	if nCount < 1 then
		Talk(1,"",format("Nh�n v�t n�m trong TOP %d b�ng x�p h�ng �i�m t�ch l�y x�y d�ng t� ��n th� l�c m�i ���c tham gia.", 100));
		return 0;
	end
	local nFlag = nil;
	local nRank = 0;--1;
	local szName = GetName();
	for i = 1, nCount do
		local tData = sdb[i-1];
		local nScore = tonumber(tData[2]);
		--local lastData = sdb[i-2];
		--if lastData and getn(lastData) == 2 and nScore < tonumber(lastData[2]) then
			nRank = nRank + 1;
		--end
		if szName == tData[1] then
			nFlag = 1;
			break;
		end
	end
	if not nFlag or nRank > 100 then
		Talk(1,"",format("Nh�n v�t n�m trong TOP %d b�ng x�p h�ng �i�m t�ch l�y x�y d�ng t� ��n th� l�c m�i ���c tham gia.", 100));
		return 0;
	end
	SetPlayerScript("\\script\\missions\\yp\\ywz\\mission.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\mission.lua", format("JoinYwzMission(%d)", nFightCamp));
end

--������Ӫ
function ywz_TransCamp()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore <= 0 then
		return 0;
	end
	local nValue = floor(ywz_GetScore() / 2);
	ywz_AddScore(nValue - nScore);
end

--������Ӫ
function ywz_TransCampFinish()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore <= 0 then
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp < 1 or nCamp > 3 then
		return 0;
	end
	local ss= SDB(YWZ_SHARE_DATA, 0, nCamp);
	ss.sortType = 2;
	ss[GetName()] = {"d", nScore};
end

--��̳
function ywz_CreateNpc()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local tNpc = {
		{"SFYWZ_QJJT", "T� ��n ��i L�", 6300, 1501, 3196, "\\script\\missions\\yp\\ywz\\npc_shilijitan.lua"},
		{"SFYWZ_XQJT", "T� ��n T�y H�", 6300, 1380, 3048, "\\script\\missions\\yp\\ywz\\npc_shilijitan.lua"},
		{"SFYWZ_TLSJT", "T� ��n Th� Ph�n", 6300, 1251, 3237, "\\script\\missions\\yp\\ywz\\npc_shilijitan.lua"},
	}
	for _, v in tNpc do
		local npcIndex = CreateNpc(v[1], v[2], v[3], v[4], v[5]);
		if npcIndex > 0 then
			SetNpcScript(npcIndex, v[6]);
		end
	end
end
