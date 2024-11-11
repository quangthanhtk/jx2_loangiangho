Include("\\script\\missions\\yp\\slymg\\head.lua")

DAILY_IB_MAX = 100;
DAILY_FREE_MAX = 6;
TYMB_AWARD_IB = "Bht_Charge";
TYMB_AWARD_FREE = "Bht_Free";
--TYMB_AWARD_FREE1 = "Bht_Free_a";

function OnUse(nItem)
	local tSay = {
		format("s� d�ng %d thi�n ki�u l�nh �� m�/#OpenTymbIB(%d, %d)", 1, nItem, 1),
		format("s� d�ng %d �i�m t�ch l�y Long H� ���ng �� m�/#OpenTymbFree(%d, %d)", 40, nItem, 40),
		"\nT�i ch� xem xem th�i/nothing",
	}
	local msg = "B�n mu�n s� d�ng c�ch n�o �� m� M�t B�o?"	
	msg = msg..format("<color=green>B�n hi�n t�i c� %d �i�m t�ch l�y Long H� ���ng<color>", GetTask(TASK_MISSION_BAIHUTANG_SCORE));
	Say(msg, getn(tSay), tSay)
end

function OpenTymbIB(nItem, nNum)
	local nCount = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 1);
	if nCount >= DAILY_IB_MAX then
		Talk(1,"",format("%s g�i h�n m� m�i ng�y �� ��t %d", "Thi�n Ki�u L�nh", DAILY_IB_MAX));
		return 0;
	end
	if GetItemCount(2, 97, 236) < nNum then
		Talk(1,"",format("trong h�nh trang, s� l��ng c�a %s kh�ng �� %d", "Thi�n Ki�u L�nh", nNum));
		return 0;
	end
	if CustomAwardCheckCondition(TYMB_AWARD_IB) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 or DelItem(2, 97, 236, nNum) ~= 1 then
		return 0;
	end
	FireEvent("event_ib_cost", 2, 97, 236, nNum);
	gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 1, nCount + 1);
	CustomAwardGiveGroup(TYMB_AWARD_IB, 0);
	AddRuntimeStat(32, 5, 1, 1)
end

function OpenTymbFree(nItem, nNum)
	local nCount = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 2);
	if nCount >= DAILY_FREE_MAX then
		Talk(1,"",format("%s g�i h�n m� m�i ng�y �� ��t %d", "�i�m t�ch l�y Long H� ���ng", DAILY_FREE_MAX));
		return 0;
	end
	local nScore = GetTask(TASK_MISSION_BAIHUTANG_SCORE);
	if nScore < nNum then
		Talk(1,"", format("�i�m t�ch l�y Long H� ���ng kh�ng �� %d kh�ng th� m�", nNum));
		return 0;
	end
	if CustomAwardCheckCondition(TYMB_AWARD_FREE) ~= 1 then
		return 0;
	end
	--if CustomAwardCheckCondition(TYMB_AWARD_FREE1) ~= 1 then
	--	return 0;
	--end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	mg_ModifyScore(-nNum);
	gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 2, nCount + 1);
	CustomAwardGiveGroup(TYMB_AWARD_FREE, 1);
	--CustomAwardGiveGroup(TYMB_AWARD_FREE1, 0);
	AddRuntimeStat(32, 5, 0, 1)
end