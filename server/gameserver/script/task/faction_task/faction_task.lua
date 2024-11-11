Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\faction\\faction_head.lua")


NFT_NEED_REBORN 						= 8		--ת���ȼ�Ҫ��
NFT_DAILY_LIMIT_FINISH_COUNT 			= 40	--ÿ�������ɴ���
NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT 	= 20	--ÿ����Ѷ౶��������
NFT_FINISH_AWARD_FREE_MULTI 			= 2 	--��Ѷ౶��������
NFT_FINISH_AWARD_PAY_MULTI 				= 2 	--���Ѷ౶�������� ���ʼ����


TASKID_NFT_CUR_TASK 					= 3600	--��¼��ǰ��ȡ��ʦ������ID
TASKID_NFT_TOTAL_FINISH_COUNT 			= 3604  --��¼�ۼ���ɴ����������ۼƴ�����������0

TASKID_NFT_DAILY_FINISH_COUNT 			= 3601	--���壺��¼ÿ����ɴ���
TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT = 3602	--���壺��¼ÿ�����˫����ɴ���
TASKID_DC_NFT_PAY_FINISH_COUNT 			= 3638	--���壺��¼ÿ�ո���˫����ɴ���

G_T_NFT_TASK_INFO = {
	[1] = { --Ѱ��
		[1] = 800, --����
		[2] = {692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709},		
	},
	[2] = { --ɱ��
		[1] = 200,
		[2] = {679,680,681,682,683,684,685,686,687,688,689,690,691},
	},
}

NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE 	= 1700 	--˫����� �ظ���ʦ������
NFT_T_FINISH_PAY_EXTRA_AWARD_RAND 		= {		--˫����� �������
	--[i] = {{g,d,p,n,nBind}, ��������y(���10000)},
		[1] = {{2, 1, 31499, 4}, 100},
}

NFT_N_EXTRA_AWAD_NEED_DAILY_FINISH_COUNT = 10 	--ÿ�ս���n�δ������⽱��
NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT = 100 	--�ۼ����n�δ������⽱��

NFT_T_FINISH_PAY_ITEM_COST 				= {2, 1, 31500, 1} 		--˫��������ĵ���
NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--ÿ��ÿ10�����������ʱ�Ķ��⽱��
NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--�ۼ�ÿ���100������ʱ�Ķ��⽱��
NFT_N_REFRESH_TASK_MONEY_COST 			= 100					--ˢ��������Ϸ������ ��λ:��

T_NFT_RUNTIME = {
	["finish_free"] = {105,1},
	["finish_pay"] 	= {105,2},
	["dailyfinish_all"] = {
		[10] = {105,3},
		[20] = {105,4},
		[30] = {105,5},
		[40] = {105,6},
	},
	["dailyfinish_pay"] = {
		[ 1] = {105,7},
		[10] = {105,8},
		[20] = {105,9},
	},
}
	
function nft_talk(nFaction)
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy�n sinh %d c�p %d<color> tr� l�n m�i ���c tham d�", NFT_NEED_REBORN, 1))
		return
	end
	
	if nFaction and nFaction ~= GetPlayerFaction() then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Kh�ng c�ng s� m�n, kh�ng th� nh�n nhi�m v� t� ch� ta.")
		return
	end
	local selTab = {
				"Nh�n nhi�m v�/nft_get_task",
				"Ho�n th�nh nhi�m v�/nft_finish_task",
				"B� qua nhi�m v�/nft_close_task",
				" tr� l�i/main_new",
				"K�t th�c ��i tho�i/nothing",
			}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("Ti�n �� Nhi�m V� S� M�n M�i: <color=yellow>%d/%d<color>. S� l�n nh�n th��ng x%d: <color=yellow>%d/%d<color>. Th��ng ti�n ��: <color=yellow>%d/%d<color>",
			GetTask(TASKID_NFT_DAILY_FINISH_COUNT),
			NFT_DAILY_LIMIT_FINISH_COUNT,
			NFT_FINISH_AWARD_FREE_MULTI,
			GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT),
			NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT,
			GetTask(TASKID_NFT_TOTAL_FINISH_COUNT),
			NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT
			),
		getn(selTab),
		selTab);
end

function nft_get_task()
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy�n sinh %d c�p %d<color> tr� l�n m�i ���c tham d�", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H�m nay �� ho�n th�nh s� l�n t�i �a, ng�y mai h�y quay l�i!")
		return
	end
	if GetTask(TASKID_NFT_CUR_TASK) > 0 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."�� nh�n nhi�m v�, h�y ho�n th�nh ho�c t� b� tr��c.")
		return
	end

	local nTaskID = nft_get_random_task()
	print("nft_get_random_task nTaskID = "..nTaskID)
	local nRet =  OpenGTask(nTaskID)
	if nRet == 3 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Nhi�m v� �� nh�n ��t t�i �a, h�y s�p x�p l�i tr��c.")
		return
	elseif nRet ~= 1 then
		return
	end

	Talk(1,"",format("�� nh�n nhi�m v� <color=yellow>%s<color>", gt_GetTaskName(nTaskID)))
	SetTask(TASKID_NFT_CUR_TASK, nTaskID)
end

function nft_get_random_task()
	local tTemp, nIdx = gf_RandRate(G_T_NFT_TASK_INFO)
	return tTemp[2][random(1, getn(tTemp[2]))]
end

function nft_finish_task()
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy�n sinh %d c�p %d<color> tr� l�n m�i ���c tham d�", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H�m nay �� ho�n th�nh s� l�n t�i �a, ng�y mai h�y quay l�i!")
		return
	end

	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch�a nh�n nhi�m v�.")
		return
	end

	if gt_IsTaskCanFinish(nTaskID) ~= 1 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch�a ��t �i�u ki�n ho�n th�nh.")
		return
	end

	local selTab = {
			"Ho�n Th�nh Th��ng/#nft_finish_task_by_type(1,1)",
			"Ho�n Th�nh x2/#nft_finish_task_by_type(2)",
			" tr� l�i/nft_talk",
			"K�t th�c ��i tho�i/nothing",
		}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("\nHo�n Th�nh Th��ng ���c nh�n t�t c� ph�n th��ng nhi�m v�\n<color=yellow>Ho�n Th�nh x2<color> c� th� d�ng ��o c� nh�n th��ng <color=yellow>x%d<color>, c� c� h�i nh�n <color=yellow>th��ng th�m<color>.\nH�y ch�n c�ch ho�n th�nh:",NFT_FINISH_AWARD_PAY_MULTI),getn(selTab),selTab);
end

function nft_finish_task_by_type(nType, bConfirm)
	--nType : 1��ͨ, 2����
	if not nType then
		return
	end

	if bConfirm ~= 1 and nType == 2 then
		local selTab = {
			"��ng �/#nft_finish_task_by_type(2,1)",
			" tr� l�i/nft_finish_task",
			"K�t th�c ��i tho�i/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("Ho�n Th�nh x2 c�n t�n: <color=red>%s x%d<color>", 
				GetItemName(NFT_T_FINISH_PAY_ITEM_COST[1], NFT_T_FINISH_PAY_ITEM_COST[2], NFT_T_FINISH_PAY_ITEM_COST[3]),
				NFT_T_FINISH_PAY_ITEM_COST[4]),
			getn(selTab),
			selTab);
		return
	end

	local nExtraAwardCount = 1
	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	local bFreeMulti = 0

	if GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT) < NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT then
		nExtraAwardCount = nExtraAwardCount * NFT_FINISH_AWARD_FREE_MULTI
		bFreeMulti = 1
		--gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	end

	if nType == 2 then
		nExtraAwardCount = nExtraAwardCount * NFT_FINISH_AWARD_PAY_MULTI
	end

	if nft_chk_multi_room_weight(nTaskID, nExtraAwardCount) ~= 1 then
		return
	end

	if nType == 2 and nft_chk_pay_finish_item_count() ~= 1 then
		Talk(1,"", format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("%s kh�ng �� %d", 
				GetItemName(NFT_T_FINISH_PAY_ITEM_COST[1],NFT_T_FINISH_PAY_ITEM_COST[2],NFT_T_FINISH_PAY_ITEM_COST[3]),
				NFT_T_FINISH_PAY_ITEM_COST[4]) )
		return
	end
	
	gf_SetLogCaption("NFT_FINISH_TASK")

	if FinishGTask(nTaskID) ~= 1 then
		return
	end
	gf_ModifyTask(TASKID_NFT_DAILY_FINISH_COUNT, 1)
	gf_ModifyTask(TASKID_NFT_TOTAL_FINISH_COUNT, 1)
	SetTask(TASKID_NFT_CUR_TASK, 0)

	--���
	local tRtInfo = T_NFT_RUNTIME["dailyfinish_all"][GetTask(TASKID_NFT_DAILY_FINISH_COUNT)]
	if tRtInfo then
		AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
	end

	if nType == 1 then
		--���
		tRtInfo = T_NFT_RUNTIME["finish_free"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	elseif nType == 2 then
		--˫��������ĵ���
		if nft_pay_finish_cost() ~= 1 then
			return
		end
		gf_ModifyTask(TASKID_DC_NFT_PAY_FINISH_COUNT, 1)

		--���
		tRtInfo = T_NFT_RUNTIME["finish_pay"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
		tRtInfo = T_NFT_RUNTIME["dailyfinish_pay"][GetTask(TASKID_DC_NFT_PAY_FINISH_COUNT)]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	end
	
	--�౶����
	if bFreeMulti == 1 then
		gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	end

	if nExtraAwardCount > 1 then
		for _=1, nExtraAwardCount -1 do
			tGtTask:DoPrize(nTaskID)
		end
	end

	--���Ѷ��⽱��
	if nType == 2 then
		gf_SetLogCaption("NFT_FINISH_PAY_EXTRA_AWARD")

		--�̶�����
		--gf_Modify("ShiMenWeiWang", NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE)

		--���Ѷ����������
		local tAwardInfo = gf_RandRate(NFT_T_FINISH_PAY_EXTRA_AWARD_RAND, 10000, 2)
		if tAwardInfo and getn(tAwardInfo) > 0 then
			gf_AddItemEx(tAwardInfo[1])
		end
	end

	--�ۼƽ���
	gf_SetLogCaption("NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD")
	local nFinishCount = GetTask(TASKID_NFT_DAILY_FINISH_COUNT)
	if nFinishCount ~= 0 and mod(nFinishCount, NFT_N_EXTRA_AWAD_NEED_DAILY_FINISH_COUNT) == 0 then
		gf_AddItemEx(NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD)
	end

	FireEvent("event_mission_task_award", "ksgsystem", "nvsumon_new", nFinishCount)

	gf_SetLogCaption("NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD")
	nFinishCount = GetTask(TASKID_NFT_TOTAL_FINISH_COUNT)
	if nFinishCount ~= 0 and mod(nFinishCount, NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT) == 0 then
		gf_AddItemEx(NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD)
		SetTask(TASKID_NFT_TOTAL_FINISH_COUNT, 0)
	end

	gf_SetLogCaption("");
	AddRuntimeStat(105, nSubId, 0, 1); --���

	nft_talk()
end

function nft_close_task(bConfirm)
	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch�a nh�n nhi�m v�.")
		return
	end

	if bConfirm ~= 1 then
		local szTalk = format("Mu�n b� qua? (T�n <color=red>%d V�ng<color>, h�y nhi�m v� hi�n t�i v� nh�n ng�u nhi�n 1 nhi�m v� S� M�n m�i)",NFT_N_REFRESH_TASK_MONEY_COST)
		if gt_IsTaskCanFinish(nTaskID) == 1 then
			szTalk = "�� ho�n th�nh nhi�m v�, "..szTalk
		end

		local selTab = {
			"��ng �/#nft_close_task(1)",
			" tr� l�i/nft_talk",
			"K�t th�c ��i tho�i/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..szTalk,
				getn(selTab),
				selTab);
		return
	end

	if Pay(NFT_N_REFRESH_TASK_MONEY_COST*10000) ~= 1 then
		Talk(1,"",format("<color=green>V�ng trong t�i <color>kh�ng �� %d<color=red>",NFT_N_REFRESH_TASK_MONEY_COST) )
		return
	end

	ClearGTask(nTaskID)
	SetTask(TASKID_NFT_CUR_TASK, 0)

	-- gf_ModifyTask(TASKID_NFT_DAILY_FINISH_COUNT, 1)
	-- if GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT) < NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT then
	-- 	--����Ҳ�۳����˫����������
	-- 	gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	-- end

	nft_get_task()
end

function nft_chk_multi_room_weight(nGTaskID, nMulti)
	if not nGTaskID or nGTaskID <= 0 then
		return 0
	end
	nMulti = nMulti or 1
	local nRoomWeight = tGtNpcInfo[nGTaskID]["data"][7];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1])*nMulti, tonumber(strArray[2])*nMulti, "") ~= 1 then
			Msg2Player("Kh�ng gian h�nh trang kh�ng ��")
			return 0
		end
	end

	return 1
end

function nft_pay_finish_cost()
	return gf_DelItem(
		NFT_T_FINISH_PAY_ITEM_COST[1],
		NFT_T_FINISH_PAY_ITEM_COST[2], 
		NFT_T_FINISH_PAY_ITEM_COST[3], 
		NFT_T_FINISH_PAY_ITEM_COST[4])
end

function nft_chk_pay_finish_item_count()
	return GetItemCount(NFT_T_FINISH_PAY_ITEM_COST[1],
		NFT_T_FINISH_PAY_ITEM_COST[2], 
		NFT_T_FINISH_PAY_ITEM_COST[3]) >= NFT_T_FINISH_PAY_ITEM_COST[4] and 1 or 0
end