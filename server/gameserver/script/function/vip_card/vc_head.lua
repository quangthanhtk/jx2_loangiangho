Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\vip_card\\vc_define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\date.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\function\\vip_card\\config.lua")
Include("\\script\\function\\vip_card\\mission_task.lua")

--function fix_bug_20160601()
--	--��ʱ�ɵ�22��˫�ӿ� �����µ�
--	local nTask = 3236
--	local nIndex = GetTask(nTask)
--	if nIndex == 22 then
--		SetTask(nTask, 6, 26)
--	end
--end

function vc_IsVipCardOpen()
	return IsActivatedVipCard(VC_CURRENT_ID);
end

function vc_GetMainTitle()
--	fix_bug_20160601()
	local szTitle = "Danh ph�n ��i Hi�p"
	local nRemainTime = GetVipCardRemainTime();
	local nState = -1;
	if nRemainTime > 0 then
		szTitle = szTitle.." ("..format("C�n %d ng�y", ceil(nRemainTime / (24 * 3600)))..")";
		nState = 1;
	elseif vc_HaveValueAward() ~= 0 then
		szTitle = szTitle.." (".."Ch�a nh�n ph�n th��ng c�ng hi�n"..")";
		nState = 2;
	else
		szTitle = szTitle.." (".."Ch�a k�ch ho�t"..")";
		nState = 0;
	end
	szTitle = szTitle..format("/#vc_MainFunction(%d)", nState);
	return szTitle
end

function vc_MainFunction(nState)
	local nKind = tonumber(nState)
	if 0 == nKind then
		vc_Activating();
	elseif 1 == nKind then
		vc_JoinFunction();
	elseif 2 == nKind then
		vc_GetValueAward();
	end
end

function vc_Activating()
	if IsActivatedVipCard(VC_CURRENT_ID) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID)).."T�nh n�ng t�m ��ng");
		return
	end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end

	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {
		format("\nL�p t�c k�ch ho�t %s/vc_ActivatingNow", szCardName),
		format("\nXem ph�n th��ng %s/vc_LookForAward", szCardName),
		"\n r�t lui/nothing"
	}
	local szTitle = format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ng��i ch�a k�ch ho�t %s.Ng��i ch�i c�p 80 tr� l�n c� th� mua th� VIP v� l�m v� ti�n h�nh k�ch ho�t.", szCardName)
	szTitle = format("%s %s", szTitle, format("Th�i gian k�ch ho�t th� VIP n�y %s~%s", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE)))
	Say(szTitle, getn(tSay), tSay);
end

function vc_ActivatingNow(bTag)
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	
	local szCardName = GetVipCardName(VC_CURRENT_ID);
	local nRemainTime = GetVipCardRemainTime();
	if not bTag and nRemainTime > 0 then
		Say(format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("%s s� m�t hi�u l�c, x�c nh�n s� k�ch ho�t kh�ng?", GetVipCardName(GetVipCardIndex())), 2, "\n v�n k�ch ho�t/#vc_ActivatingNow(1)", "\n v� sau xem l�i/nothing");
		return 0;
	end
	if vc_HaveValueAward() ~= 0 then
		Talk(1,"",format("Ch�a nh�n xong gi�i th��ng %s �� c�ng hi�n, kh�ng th� k�ch ho�t %s", GetVipCardName(GetVipCardIndex()), szCardName));
		return 0;
	end
	if GetLevel() < 59 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("��ng c�p nh�n v�t kh�ng �� c�p %d, kh�ng th� k�ch ho�t %s", 59, szCardName));
		return 0;
	end
	if is_in_valid_date(1) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local nRet = ActivatingVipCard(VC_CURRENT_ID);
	if nRet ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Trong t�i kh�ng c� %s, k�ch ho�t th�t b�i", szCardName))
		return 0;
	end
	RemoveTitle(99, 1)
	AddTitle(99, 1)
	SetTitleTime(99, 1, GetTime() + 30 * 24 * 3600)
	SetCurTitle(99, 1)
	SetTask(TASKID_VC_VALUE_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	clear_ib_award_tasks()
	vc_DailyTaskReset();
	local nRet, nIndex = AddItem(0,200,40,1,4) --�����б���
	if nRet == 1 then
		SetItemExpireTime(nIndex, 30 * 24 * 3600)
	end
	Msg2Player(msg);
	local msg = format("%s �� k�ch ho�t th�nh c�ng", szCardName);
	Talk(1,"vc_JoinFunction",format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..msg);
end

function vc_LookForAward()
	local szCardName = GetVipCardName(VC_CURRENT_ID)
	local tSay = {};
	tSay.msg = format("<color=green>%s:<color>", GetVipCardName(VC_CURRENT_ID))..format("Ng��i ch�i k�ch ho�t %s, s� nh�n ���c ph�n th��ng sau:\nKhi k�ch ho�t s� nh�n ���c 1 Th�n H�nh B�o �i�n, ph�n th��ng c�a L��ng S�n, ��a Huy�n Cung, V�n Ki�m Tr�ng, chi�n tr��ng l�n nh�, Thi�n M�n Tr�n, Chi�n Tr��ng Li�n Server s� ���c c�ng th�m\nPh�n th��ng �� c�ng hi�n: H�ng ng�y ho�n th�nh nhi�m v� V� L�m Treo Th��ng s� nh�n ���c �� c�ng hi�n, ��t �� c�ng hi�n nh�t ��nh s� nh�n ���c Hu�n Ch��ng Anh H�ng v� L�i H� Tinh Ph�ch", szCardName).."\nTh� 6, th� 7 v� ch� nh�t, sau khi ho�n th�nh nhi�m v� h�ng ng�y, s� l��ng EXP v� v�ng nh�n ���c ��u t�ng 1.5 l�n";
	tSay.sel = {
		{"Ra kh�i", "nothing"},
	};
	temp_Talk(tSay);
end

function vc_JoinFunction()
	local tMsg = {
		[0] = "Ch�a nh�n", 
		[1] = "�� nh�n",
	}
	local msg = tMsg[gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31)] or tMsg[1];
	local tSay = {
		format("Xem ph�n th��ng %s/vc_LookForAward", GetVipCardName(GetVipCardIndex())),
		"Nhi�m v� h�m nay/vc_DailyTask",
		format("Nh�n �i�m tinh l�c (%s)/vc_DailyEnergy", msg),
		"Ph�n th��ng �� c�ng hi�n/vc_GetValueAward",
		"Nh�n ��ng T� Chi Nguy�n/vc_GetItemTjzy",
		"Nh�n th��ng ti�u hao Thi�n Ki�u L�nh/ib_award_talk_main",
		"\n r�t lui/nothing"
	}
	local nCurID = GetVipCardIndex();
	if nCurID ~= VC_CURRENT_ID then
		local nDate = tonumber(date("%Y%m%d"))
		DebugOutput("nDate =", nDate)
		if nDate >= CUR_VIP_CARD_START_DATE and nDate <= CUR_VIP_CARD_END_DATE then
			tinsert(tSay, 1, format("k�ch ho�t %s/vc_Activating", GetVipCardName(VC_CURRENT_ID)));
		end
	end
	local _,_,_,nDays = GetVipCardTime(nCurID);
	local nTime = GetVipCardActivateTime();
	local nY, nM, nD = GmTime(nTime);
	local nStartTime = nD.."/"..nM.."/"..nY;
	nY, nM, nD = GmTime(nTime + nDays * 24 * 3600);
	local nEndTime = nD.."/"..nM.."/"..nY;
	Say(format("<color=green>%s:<color> ", GetVipCardName(GetVipCardIndex()))..format("�� k�ch ho�t th�nh c�ng %s, h�n s� d�ng %s ��n %s", GetVipCardName(GetVipCardIndex()), nStartTime, nEndTime), getn(tSay), tSay)
end

function vc_GetValueAward()
	local tMsg = {
		[1] = "�� nh�n",
		[2] = "Ch�a nh�n",
		[3] = "Ch�a ��t ���c",
	}
	local tSay = {};
	local nIndex = 0;
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) == 1 then
			nIndex = 1;
		else
			if nValue >= tAward[i][1] then
				nIndex = 2;
			else
				nIndex = 3;
			end		
		end
		if tAward[i][2] == 1 then
			tinsert(tSay, format("%d %s*%d(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tAward[i][3][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 2 then
			tinsert(tSay, format("%d %d%s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][3], tAward[i][4], tMsg[nIndex], nIndex, i));
		elseif tAward[i][2] == 3 then
			tinsert(tSay, format("%d %s(%s)/#vc_GetValueAwardFinish(%d, %d)", tAward[i][1], tAward[i][4], tMsg[nIndex], nIndex, i));
		end
	end
	tinsert(tSay, "Ra kh�i/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("�� c�ng hi�n hi�n t�i l� <color=green>%d<color>. M�i m�c c�ng hi�n ch� ���c nh�n th��ng 1 l�n. Sau khi d�ng th� th�ng m�i s� kh�ng th� nh�n ph�n th��ng �� c�ng hi�n c�a th� th�ng c�. H�y nh�n k�p th�i", nValue), getn(tSay), tSay)
end

function vc_GetItemTjzy()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local task = GetTask(TASKID_VC_RECORD_WEEK);
	if task ~= 0 then
		Talk(1,"","Tu�n n�y c�c h� �� nh�n, h�n g�p l�i tu�n sau!");
		return 0;
	end
	SetTask(TASKID_VC_RECORD_WEEK, 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_AddItemEx2({2, 1, 30913, 7}, "��ng T� Chi Nguy�n", GetVipCardName(GetVipCardIndex()), "Nh�n ��ng T� Chi Nguy�n", 0, 1)
end

function vc_GetValueAwardFinish(nTag, nIndex)
	if 1 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."B�n �� nh�n ph�n th��ng n�y r�i ");
		return
	end
	if 3 == nTag then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Ch�a ��t �� c�ng hi�n, kh�ng th� nh�n ph�n th��ng n�y");
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	local tCell = tAward[nIndex]
	if not tCell then
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_VALUE_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	if tCell[2] == 1 then
		gf_AddItemEx2(tCell[3], tCell[4], GetVipCardName(GetVipCardIndex()), "Ph�n th��ng �� c�ng hi�n", 0, 1);
	elseif tCell[2] == 2 then
		gf_Modify("Exp", tCell[3]);
	elseif tCell[2] == 3 then
		dostring(tCell[3]);
	end
end

--�жϹ��׽����Ƿ�Ϊ��ȡ
function vc_HaveValueAward()
	local nValue = GetVipCardValue();
	local nCardIndex = GetVipCardIndex();
	if not nCardIndex or nCardIndex < 1 or nCardIndex > getn(VC_VALUE_AWARD_INDEX) then
		return 0;
	end
	local tAward = VC_VALUE_AWARD[VC_VALUE_AWARD_INDEX[nCardIndex]];
	if not tAward then return 0; end
	for i = 1, getn(tAward) do
		if nValue >= tAward[i][1] then
			if gf_GetTaskBit(TASKID_VC_VALUE_FLAG, i) ~= 1 then
				return 1;
			end
		end
	end
	return 0;
end

function vc_DailyTaskReset()
	SetTask(TASKID_VC_DAILY_TASK_FLAG, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_1, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_2, 0, TASK_ACCESS_CODE_VIP_CARD);
	SetTask(TASKID_VC_DAILY_TASK_3, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_WeeklyTaskReset()
	SetTask(TASKID_VC_RECORD_WEEK, 0, TASK_ACCESS_CODE_VIP_CARD);
end

function vc_GetServerIndex(tCell)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	if not tCell.Content then
		return 1;
	end
	return mod(wDay, getn(tCell.Content)) + 1;
end

function vc_GetContentIndex(tCell, bGenerate)
	local nContentIndex = gf_GetTaskByte(tCell.TaskIndex, tCell.ByteIndex);
	if bGenerate then
		if nContentIndex <= 0 or nContentIndex > getn(tCell.Content) then
			if tCell.RandType == 1 then
				nContentIndex = vc_GetServerIndex(tCell);
			elseif tCell.RandType == 2 then
				nContentIndex = random(getn(tCell.Content));
			end
			gf_SetTaskByte(tCell.TaskIndex, tCell.ByteIndex, nContentIndex, TASK_ACCESS_CODE_VIP_CARD);
		end
	end
	return nContentIndex;
end

function vc_DailyTask()
	local tSay = {}
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	for i = 1, getn(tTaskTable) do
		local tCell = tTaskTable[i];
		DebugOutput("tCell =", tCell);
		local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte);
		DebugOutput("nFinishTimes =", nFinishTimes);
		local cIndex = vc_GetContentIndex(tCell, 1);
		DebugOutput("cIndex =", cIndex);
		tinsert(tSay, format("%s(%d/%d)/#vc_DailyTaskDetail(%d, %d)", tCell.Content[cIndex][1], 
			min(nFinishTimes, tCell.Content[cIndex][2]), tCell.Content[cIndex][2], i, cIndex));
	end
	tinsert(tSay, "Ra kh�i/nothing")
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."Nhi�m v� V� L�m Treo Th��ng kh�ng c�n nh�n, ch� c�n trong ng�y ho�n th�nh �i�u ki�n s� c� th� ho�n th�nh, nh�ng ph�n th��ng ph�i t� nh�n. C� th� n�p Thi�n Ki�u L�nh �� t� ��ng ho�n th�nh nhi�m v�, m�i l�n t� ��ng ho�n th�nh th� s� l��ng Thi�n Ki�u L�nh ti�u hao ng�y c�ng nhi�u.", getn(tSay), tSay)
end

function vc_DailyTaskDetail(nIndex, cIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	local tSay = {}
	local msg = format("<color=yellow>[%s*%d]<color>", tSub[1], tSub[2])..tSub[3];
	local bIsFinish = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex);
	if bIsFinish ~= 0 then
		msg = msg.."<color=green>(�� ho�n th�nh m�c n�y)<color>"
	else
		if nFinishTimes <= 0 then
			tinsert(tSay, format("\nNh�n nhi�m v�/#vc_DailyTaskDetail_GetTask(%d)", nIndex));
			tinsert(tSay, format("\nT� ��ng ho�n th�nh/#vc_DailyTaskDetail_AotoFinish(%d)", nIndex));
		elseif nFinishTimes >= tSub[2] then
			tinsert(tSay, format("\n Nh�n ph�n th��ng/#vc_DailyTaskDetail_GetTaskAward(%d)", nIndex));
		end
	end
	tinsert(tSay, "\n r�t lui/nothing");
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..msg, getn(tSay), tSay);
end

function vc_DailyTaskDetail_GetTask(nIndex)
	DebugOutput("vc_DailyTaskDetail_GetTask", nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	local tSub = tCell.Content[cIndex];
	if not tSub then return end
	Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Mau �i ho�n th�nh nhi�m v� h�ng ng�y <color=green>%s<color>!", tSub[1]));
end

function vc_DailyTaskDetail_GetTaskAward(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."M�c n�y �� ho�n th�nh (M�i ng�y ch� ���c ho�n th�nh 1 l�n");
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex, 1, TASK_ACCESS_CODE_VIP_CARD);
	dostring(tCell.Award);
end

function vc_DailyTaskDetail_AotoFinish(nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, nIndex) ~= 0 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex())).."M�c n�y �� ho�n th�nh (M�i ng�y ch� ���c ho�n th�nh 1 l�n");
		return
	end
	local nAutoFinishTimes = GetTask(TASKID_VC_AUTO_FINISH_TIMES);
	local nCostNum = (nAutoFinishTimes * 2 + 1) * tCell.AutoFinish[4];
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H�m nay �� d�ng <color=red>%d<color> l�n t� ��ng ho�n th�nh, l�n n�y c�n ti�u hao <color=yellow>%s<color>*%d", 
		nAutoFinishTimes, tCell.AutoFinish[5], nCostNum), 2, 
		format("\nX�c nh�n/#vc_DailyTaskDetail_AotoFinish_Ensure(%d, %d, %d, %d, %d)", tCell.AutoFinish[1], tCell.AutoFinish[2], 
			tCell.AutoFinish[3], nCostNum, nIndex), "\n r�t lui/nothing");
end

function vc_DailyTaskDetail_AotoFinish_Ensure(nG, nD, nP, nNum, nIndex)
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	DebugOutput("vc_GetContentIndex(tCell) =", vc_GetContentIndex(tCell))
	local tSub = tCell.Content[vc_GetContentIndex(tCell)];
	if not tSub then return end
	if DelItem(tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum) ~= 1 then
		Talk(1,"",format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("S� l��ng %s trong t�i kh�ng �� %d c�i", tCell.AutoFinish[5], nNum));
		return
	end
	FireEvent("event_ib_cost", tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum)
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCell.AutoFinish[1], tCell.AutoFinish[2], tCell.AutoFinish[3], nNum})
	SetTask(TASKID_VC_AUTO_FINISH_TIMES, GetTask(TASKID_VC_AUTO_FINISH_TIMES) + 1, TASK_ACCESS_CODE_VIP_CARD);
	gf_SetTaskByte(tCell.Task, tCell.Byte, tSub[2], TASK_ACCESS_CODE_VIP_CARD);
	vc_DailyTaskDetail_GetTaskAward(nIndex);
end

function vc_DailyEnergy()
	local nRet = gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31);
	local tMsg = {
		[0] = "Ch�a nh�n", 
		[1] = "�� nh�n",
	}
	local msg = tMsg[nRet];
	local tMsg2 = {
		[0] = "��ng",
		[1] = "��ng �",
	}
	local tFunc = {
		[0] = "vc_DailyEnergy_do",
		[1] = "nothing",
	}
	local tSay = {
		format("%s/%s", tMsg2[nRet], tFunc[nRet]),
		"\n r�t lui/nothing",
	}
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("H�m nay c� th� nh�n tr�c ti�p %d �i�m tinh l�c, ng��i h�m nay %s", 120, msg), getn(tSay), tSay);
end

function vc_DailyEnergy_do()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	Say(format("<color=green>%s:<color>", GetVipCardName(GetVipCardIndex()))..format("Hi�n t�i nh�n ���c %d �i�m tinh l�c, ��ng � nh�n kh�ng?", min(nCanGive, 120)), 2, "\nX�c nh�n/vc_DailyEnergy_do_ensure", "\n h�y b�/nothing");
end

function vc_DailyEnergy_do_ensure()
	if gf_GetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31) ~= 0 then
		return 0;
	end
	local nCur, nMax = ModifyEnergy(0,1);
	local nCanGive = nMax - nCur;
	ModifyEnergy(min(nCanGive, 120), 1);
	gf_SetTaskBit(TASKID_VC_DAILY_TASK_FLAG, 31, 1, TASK_ACCESS_CODE_VIP_CARD);
	return 1;
end

--���3-4�ǻ���
function vc_Rand_3_4_JS_badge()
	local tAward = {
		{1, 88000, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Huy Ch��ng Du Hi�p", {0, 153, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "Huy Ch��ng Thi�t Huy�t", {0, 153, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "Huy Ch��ng V�n Du", {0, 153, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "Huy ch��ng 3-4 sao ng�u nhi�n")
end

--���3-4�ǹ���
function vc_Rand_3_4_JS_cape()
	local tAward = {
		{1, 88000, "�o Cho�ng H�a V�n", {0, 152, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "�o Cho�ng Du Hi�p", {0, 152, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "�o Cho�ng V�n Du", {0, 152, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "�o cho�ng 3-4 sao ng�u nhi�n")
end

--���3-4��Ь
function vc_Rand_3_4_JS_foot()
	local tAward = {
		{1, 88000, "B� Ch� Cao ��ng Ngoa", {0, 154, 3, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 2000, "Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1900, "Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 35, "Tr��ng H�i Du Hi�p", {0, 154, 26, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 35, "Chi�n H�i Thi�t Huy�t", {0, 154, 27, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{1, 30, "��o H�i V�n Du", {0, 154, 28, 1, 1, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, GetVipCardName(GetVipCardIndex()), "Gi�y 3-4 sao ng�u nhi�n")
end

--���2-4����ʯ����
function vc_Rand_2_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 18, "Huy�tTr�chTh�ch Lv2", {2, 22, 102, 1, 4}, 0},
		{1, 18, "Nguy�tB�chTh�ch Lv2", {2, 22, 202, 1, 4}, 0},
		{1, 18, "H� Ph�ch Th�ch C�p 2", {2, 22, 302, 1, 4}, 0},
		{1, 18, "H�c Di�u Th�ch C�p 2", {2, 22, 402, 1, 4}, 0},
		{1, 6, "Huy�tTr�chTh�ch Lv3", {2, 22, 103, 1, 4}, 0},
		{1, 6, "Nguy�tB�chTh�ch Lv3", {2, 22, 203, 1, 4}, 0},
		{1, 6, "H� Ph�ch Th�ch C�p 3", {2, 22, 303, 1, 4}, 0},
		{1, 6, "H�c Di�u Th�ch C�p 3", {2, 22, 403, 1, 4}, 0},
		{1, 1, "Huy�tTr�chTh�ch Lv4", {2, 22, 104, 1, 4}, 1},
		{1, 1, "Nguy�tB�chTh�ch Lv4", {2, 22, 204, 1, 4}, 1},
		{1, 1, "H� Ph�ch Th�ch C�p 4", {2, 22, 304, 1, 4}, 1},  
		{1, 1, "H�c Di�u Th�ch C�p 4", {2, 22, 404, 1, 4}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "�� qu� c�p 2-4", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong Th� VIP V� L�m ��i �i�m c�ng hi�n nh�n ���c ph�n th��ng %s*%d", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--���4����鼼����
function vc_Rand_10_4_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 9,"Ch�n kh� h� th� C�p 4", {2, 150, 4,  1, 1}},
		{1, 7,"�ch Th� Di�n D��ng C�p 4", {2, 150, 8,  1, 1}},
		{1, 7,"C��ng Th�n B� Th� C�p 4", {2, 150, 12, 1, 1}},
		{1, 7,"�m Phong Th�c C�t C�p 4", {2, 150, 16, 1, 1}},
		{1, 7,"Huy�n V� V� Song C�p 4", {2, 150, 20, 1, 1}},
		{1, 7,"V� H�nh V� T��ng C�p 4", {2, 150, 24, 1, 1}},
		{1, 7,"Kim Linh Ph� Th� C�p 4", {2, 150, 28, 1, 1}},
		{1, 7,"M�c Linh Ph� Th� C�p 4", {2, 150, 32, 1, 1}},
		{1, 7,"Thu� Linh Ph� Th� C�p 4", {2, 150, 36, 1, 1}},
		{1, 7,"Ho� Linh Ph� Th� C�p 4", {2, 150, 40, 1, 1}},
		{1, 7,"Th� Linh Ph� Th� C�p 4", {2, 150, 44, 1, 1}},
		{1, 6,"Ph� Kh�ng Tr�m �nh C�p 4", {2, 150, 48, 1, 1}},
		{1, 6,"S�t th��ng gia n�ng c�p 4", {2, 150, 52, 1, 1}},
		{1, 3,"Khinh Linh T�n T�t  C�p 4", {2, 150, 56, 1, 1}},
		{1, 6,"V� H�nh Chi C� C�p 4", {2, 150, 60, 1, 1}},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "S�ch K� N�ng ��ng H�nh c�p 4", 0, 1);
end

--���3-5����ʯ����
function vc_Rand_10_6_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 18, "Huy�tTr�chTh�ch Lv3", {2, 22, 103, 1, 4}, 0},
		{1, 18, "Nguy�tB�chTh�ch Lv3", {2, 22, 203, 1, 4}, 0},
		{1, 18, "H� Ph�ch Th�ch C�p 3", {2, 22, 303, 1, 4}, 0},
		{1, 18, "H�c Di�u Th�ch C�p 3", {2, 22, 403, 1, 4}, 0},
		{1, 6,  "Huy�tTr�chTh�ch Lv4", {2, 22, 104, 1, 4}, 1},
		{1, 6,  "Nguy�tB�chTh�ch Lv4", {2, 22, 204, 1, 4}, 1},
		{1, 6,  "H� Ph�ch Th�ch C�p 4", {2, 22, 304, 1, 4}, 1},
		{1, 6,  "H�c Di�u Th�ch C�p 4", {2, 22, 404, 1, 4}, 1},
		{1, 1,  "Huy�tTr�chTh�ch Lv5", {2, 22, 105, 1, 4}, 1},
		{1, 1,  "Nguy�tB�chTh�ch Lv5", {2, 22, 205, 1, 4}, 1},
		{1, 1,  "H� Ph�ch Th�ch C�p 5", {2, 22, 305, 1, 4}, 1},
		{1, 1,  "H�c Di�u Th�ch C�p 5", {2, 22, 405, 1, 4}, 1},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5]}, tAward[nIndex][3], "VipCard", "�� qu� c�p 3-5", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2Global(format("[%s] trong Th� VIP V� L�m ��i �i�m c�ng hi�n nh�n ���c ph�n th��ng %s*%d", GetName(), tAward[nIndex][3], tonumber(nNum)))
	end
end

--���5������
function vc_Rand_10_8_Gem(nNum)
	nNum = nNum or 1;
	local tAward = {
		{1, 100, "H-Li�t Nham-Lv5", {0, 148, 69, 1},},
		{1, 100, "H-Ph� Kh�ng-Lv5", {0, 148, 70, 1},},
		{1, 100, "H-T�y Ki�m-Lv5", {0, 148, 71, 1},},
		{1, 100, "H-T�t Phong-Lv5", {0, 148, 72, 1},},
		{1, 100, "H-T�n V�-Lv5", {0, 148, 73, 1},},
		{1, 100, "H-�ng T�p-Lv5", {0, 148, 74, 1},},
		{1, 100, "H-Linh T�m-Lv5", {0, 148, 75, 1},},
		{1, 100, "H-Th�n L�c-Lv5", {0, 148, 76, 1},},
		{1, 100, "H-Ng�ng Th�n-Lv5", {0, 148, 77, 1},},
		{1, 100, "H-V� Gian-Lv5", {0, 148, 78, 1},},
		{1, 100, "H-V� C�c-Lv5", {0, 148, 79, 1},},
		{1, 100, "H-Cu�ng Nh�n-Lv5", {0, 148, 80, 1},},
		{1, 100, "H-L�ng Nhu�-Lv5", {0, 148, 81, 1},},
		{1, 100, "H-Linh Vi�n-Lv5", {0, 148, 82, 1},},
		{1, 100, "H-H�i V�n-Lv5", {0, 148, 83, 1},},
		{1, 100, "H-H�i T�m-Lv5", {0, 148, 84, 1},},
		{1, 100, "C-Li�t Nham-Lv5", {0, 149, 70, 1},},
		{1, 100, "C-Ph� Kh�ng-Lv5", {0, 149, 71, 1},},
		{1, 100, "C-T�y Ki�m-Lv5", {0, 149, 72, 1},},
		{1, 100, "C-T�t Phong-Lv5", {0, 149, 73, 1},},
		{1, 100, "C-T�n V�-Lv5", {0, 149, 74, 1},},
		{1, 100, "C-Qu�n Th�ch-Lv5", {0, 149, 75, 1},},
		{1, 100, "C-N� Ng�m-Lv5", {0, 149, 76, 1},},
		{1, 100, "C-Xuy�n V�n-Lv5", {0, 149, 77, 1},},
		{1, 100, "C-Th�n L�c-Lv5", {0, 149, 78, 1},},
		{1, 100, "C-Ng�ng Th�n-Lv5", {0, 149, 79, 1},},
		{1, 100, "C-V� Gian-Lv5", {0, 149, 80, 1},},
		{1, 100, "C-V� C�c-Lv5", {0, 149, 81, 1},},
		{1, 100, "C-Cu�ng Nh�n-Lv5", {0, 149, 82, 1},},
		{1, 100, "C-L�ng Nhu�-Lv5", {0, 149, 83, 1},},
		{1, 100, "C-Linh Vi�n-Lv5", {0, 149, 84, 1},},
		{1, 100, "C-H�i V�n-Lv5", {0, 149, 85, 1},},
		{1, 100, "C-H�i T�m-Lv5", {0, 149, 86, 1},},
		{1, 100, "T-Li�t Nham-Lv5", {0, 150, 69, 1},},
		{1, 100, "T-Ph� Kh�ng-Lv5", {0, 150, 70, 1},},
		{1, 100, "T-T�y Ki�m-Lv5", {0, 150, 71, 1},},
		{1, 100, "T-T�t Phong-Lv5", {0, 150, 72, 1},},
		{1, 100, "T-T�n V�-Lv5", {0, 150, 73, 1},},
		{1, 100, "T-V� L��ng-Lv5", {0, 150, 74, 1},},
		{1, 100, "T-M�c Minh-Lv5", {0, 150, 75, 1},},
		{1, 100, "T-Th�n L�c-Lv5", {0, 150, 76, 1},},
		{1, 100, "T-Ng�ng Th�n-Lv5", {0, 150, 77, 1},},
		{1, 100, "T-V� Gian-Lv5", {0, 150, 78, 1},},
		{1, 100, "T-V� C�c-Lv5", {0, 150, 79, 1},},
		{1, 100, "T-Cu�ng Nh�n-Lv5", {0, 150, 80, 1},},
		{1, 100, "T-L�ng Nhu�-Lv5", {0, 150, 81, 1},},
		{1, 100, "T-Linh Vi�n-Lv5", {0, 150, 82, 1},},
		{1, 100, "T-H�i V�n-Lv5", {0, 150, 83, 1},},
		{1, 100, "T-H�i T�m-Lv5", {0, 150, 84, 1},},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2({tAward[nIndex][4][1], tAward[nIndex][4][2], tAward[nIndex][4][3], tonumber(nNum), tAward[nIndex][4][5] or 1, -1,-1,-1,-1,-1,-1}, tAward[nIndex][3], "VipCard", "U�n Linh c�p 5 (Ng�u nhi�n)", 0, 1);
end

--����------------------------------------------------------
--˫�ӿ�
function vc_AwardCopy()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardPlant()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardTmz()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardBattle()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

function vc_AwardEquip()
	AddVipCardValue(20);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 20, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
end

--��з��
--ʨ�ӿ�
--��Ů��
--��Ы��
--���ֿ�
--Ħ�ɿ�
--ˮƿ��
--˫�㿨
function vc_Award_2_1()
	AddVipCardValue(60);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_2()
	AddVipCardValue(40);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_2_3()
	AddVipCardValue(50);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", 6000000);
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--����
--���塢������1.5��
function _GetAwardScale()
	local nWeek = tonumber(date("%w"))
	if nWeek == 0 or nWeek == 5 or nWeek == 6 then
		return 1.5
	end
	return 1
end

function vc_Award_10_1()
	local nScale = _GetAwardScale();
	AddVipCardValue(60);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 60, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(300000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_10_2()
	local nScale = _GetAwardScale();
	AddVipCardValue(40);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 40, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(100000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

function vc_Award_10_3()
	local nScale = _GetAwardScale();
	AddVipCardValue(50);
	Msg2Player(format("Nh�n ���c %d �i�m [%s] c�ng hi�n", 50, GetVipCardName(GetVipCardIndex())));
	gf_Modify("Exp", floor(6000000*nScale));
	gf_Modify("Money", floor(50000*nScale));
	gf_AddItemEx2({2, 1, 30499, 1}, "Hu�n ch��ng anh h�ng", "VipCard", GetVipCardName(GetVipCardIndex()), 0, 1);
end

--������ʵ�ֽӿ�---------------------------------------------
--VipCard ID��VC_DAILY_TASK������������������
function _vc_DailyTaskFinishOnce(nID, nIndex, cTag)
	--����vip�����ѹر�
	if IsActivatedVipCard(nID) ~= 1 then
		return
	end
	--��ǰ�����ID
	if GetVipCardIndex() ~= nID then
		return
	end
	--δ��������vip����
	if GetVipCardRemainTime() <= 0 then
		return
	end
	local nCardIndex = GetVipCardIndex();
	local tTaskTable = VC_DAILY_TASK[VC_DAILY_TASK_INDEX[nCardIndex]];
	if not tTaskTable then  return 0; end
	local tCell = tTaskTable[nIndex];
	if not tCell then return end
	local cIndex = vc_GetContentIndex(tCell);
	if cTag ~= cIndex then
		return
	end
	local tSub = tCell.Content[cIndex];
	if not tSub then return end;
	local nFinishTimes = gf_GetTaskByte(tCell.Task, tCell.Byte); 
	if nFinishTimes >= tSub[2] then
		return
	end
	gf_SetTaskByte(tCell.Task, tCell.Byte, nFinishTimes + 1, TASK_ACCESS_CODE_VIP_CARD);
	Msg2Player(format("Ho�n th�nh [%s] nhi�m v� h�ng ng�y %s %d/%d", GetVipCardName(nID), tSub[1], nFinishTimes + 1, tSub[2]))
end

--��ɽͨ8��
function _vc_LS_Pass_8()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 1);
end

--������ͨ7��
function _vc_DXG_Pass_7()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 2);
end

--��ڣͨ4��
function _vc_WJZ_Pass_4()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 3);
end

--��̫ͨһ��ȫͨ
function _vc_TYT_AllPass()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 1, 4);
end

--������ȡʤ
function _vc_TMZ_Win()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 1);
	end
end

--����������
function _vc_JoinOnceTMZ()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 3, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 2);
	end
end

--�������Źش�ս������ȡ����
function _vc_JoinBigbattle()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 3);
	end
end

--��������Сս������ȡ����
function _vc_JoinSmallBattle()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 4, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 2, 4);
	end
end

--�μӶ�Թ̨��ȡ��ʤ��
function _vc_JoinEytBattle_Win()
	_vc_DailyTaskFinishOnce(GetVipCardIndex(), 2, 5);
end

--װ��ǿ��
function _vc_EnhanceOnce(bIsSucc, enhLevel)
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 1);
	end
end

--װ������
function _vc_Equip_Evolution(bIsSucc)
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 5, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 2);
	end
end

--��ֲС������
function _vc_PlantSmallBanRuo()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 1);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 3);
	end
end

--��ֲ������
function _vc_PlantBigBanRuo()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 2);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 4);
	end
end

--�����Ӱ�
function _vc_OpenSeedBag()
	local nId = GetVipCardIndex()
	if VC_DAILY_TASK_INDEX[nId] == 1 then
		_vc_DailyTaskFinishOnce(1, 2, 3);
	else
		_vc_DailyTaskFinishOnce(nId, 3, 5);
	end
end