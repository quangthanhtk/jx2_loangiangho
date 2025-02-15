Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\faction\\faction_head.lua")


NFT_NEED_REBORN 						= 8		--转生等级要求
NFT_DAILY_LIMIT_FINISH_COUNT 			= 40	--每日最大完成次数
NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT 	= 20	--每日免费多倍奖励次数
NFT_FINISH_AWARD_FREE_MULTI 			= 2 	--免费多倍奖励倍率
NFT_FINISH_AWARD_PAY_MULTI 				= 2 	--付费多倍奖励倍率 倍率间乘算


TASKID_NFT_CUR_TASK 					= 3600	--记录当前接取的师门任务ID
TASKID_NFT_TOTAL_FINISH_COUNT 			= 3604  --记录累计完成次数，触发累计次数奖励后清0

TASKID_NFT_DAILY_FINISH_COUNT 			= 3601	--日清：记录每日完成次数
TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT = 3602	--日清：记录每日免费双倍完成次数
TASKID_DC_NFT_PAY_FINISH_COUNT 			= 3638	--日清：记录每日付费双倍完成次数

G_T_NFT_TASK_INFO = {
	[1] = { --寻物
		[1] = 800, --概率
		[2] = {692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709},		
	},
	[2] = { --杀怪
		[1] = 200,
		[2] = {679,680,681,682,683,684,685,686,687,688,689,690,691},
	},
}

NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE 	= 1700 	--双倍完成 必给的师门威望
NFT_T_FINISH_PAY_EXTRA_AWARD_RAND 		= {		--双倍完成 随机奖励
	--[i] = {{g,d,p,n,nBind}, 概率因子y(最大10000)},
		[1] = {{2, 1, 31499, 4}, 100},
}

NFT_N_EXTRA_AWAD_NEED_DAILY_FINISH_COUNT = 10 	--每日进行n次触发额外奖励
NFT_N_EXTRA_AWAD_NEED_TOTAL_FINISH_COUNT = 100 	--累计完成n次触发额外奖励

NFT_T_FINISH_PAY_ITEM_COST 				= {2, 1, 31500, 1} 		--双倍完成消耗道具
NFT_T_DAILY_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--每日每10个任务在完成时的额外奖励
NFT_T_TOTAL_FINISH_COUNT_EXTRA_AWAD 	= {2, 1, 31499, 1, 4}	--累计每完成100个任务时的额外奖励
NFT_N_REFRESH_TASK_MONEY_COST 			= 100					--刷新任务游戏币消耗 单位:金

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
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy觧 sinh %d c蕄 %d<color> tr� l猲 m韎 頲 tham d�", NFT_NEED_REBORN, 1))
		return
	end
	
	if nFaction and nFaction ~= GetPlayerFaction() then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Kh玭g c飊g s� m玭, kh玭g th� nh薾 nhi謒 v� t� ch� ta.")
		return
	end
	local selTab = {
				"Nh薾 nhi謒 v�/nft_get_task",
				"Ho祅 th祅h nhi謒 v�/nft_finish_task",
				"B� qua nhi謒 v�/nft_close_task",
				" tr� l筰/main_new",
				"K誸 th骳 i tho筰/nothing",
			}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("Ti課  Nhi謒 V� S� M玭 M韎: <color=yellow>%d/%d<color>. S� l莕 nh薾 thng x%d: <color=yellow>%d/%d<color>. Thng ti課 : <color=yellow>%d/%d<color>",
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
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy觧 sinh %d c蕄 %d<color> tr� l猲 m韎 頲 tham d�", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H玬 nay  ho祅 th祅h s� l莕 t鑙 產, ng祔 mai h穣 quay l筰!")
		return
	end
	if GetTask(TASKID_NFT_CUR_TASK) > 0 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Х nh薾 nhi謒 v�, h穣 ho祅 th祅h ho芻 t� b� trc.")
		return
	end

	local nTaskID = nft_get_random_task()
	print("nft_get_random_task nTaskID = "..nTaskID)
	local nRet =  OpenGTask(nTaskID)
	if nRet == 3 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Nhi謒 v�  nh薾 t t鑙 產, h穣 s緋 x誴 l筰 trc.")
		return
	elseif nRet ~= 1 then
		return
	end

	Talk(1,"",format("Х nh薾 nhi謒 v� <color=yellow>%s<color>", gt_GetTaskName(nTaskID)))
	SetTask(TASKID_NFT_CUR_TASK, nTaskID)
end

function nft_get_random_task()
	local tTemp, nIdx = gf_RandRate(G_T_NFT_TASK_INFO)
	return tTemp[2][random(1, getn(tTemp[2]))]
end

function nft_finish_task()
	if GetPlayerRebornLevel() < NFT_NEED_REBORN then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("<color=red>Chuy觧 sinh %d c蕄 %d<color> tr� l猲 m韎 頲 tham d�", NFT_NEED_REBORN, 1))
		return
	end
	if GetTask(TASKID_NFT_DAILY_FINISH_COUNT) >= NFT_DAILY_LIMIT_FINISH_COUNT then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."H玬 nay  ho祅 th祅h s� l莕 t鑙 產, ng祔 mai h穣 quay l筰!")
		return
	end

	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch璦 nh薾 nhi謒 v�.")
		return
	end

	if gt_IsTaskCanFinish(nTaskID) ~= 1 then
		Talk(1,"",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch璦 t 甶襲 ki謓 ho祅 th祅h.")
		return
	end

	local selTab = {
			"Ho祅 Th祅h Thng/#nft_finish_task_by_type(1,1)",
			"Ho祅 Th祅h x2/#nft_finish_task_by_type(2)",
			" tr� l筰/nft_talk",
			"K誸 th骳 i tho筰/nothing",
		}
	Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("\nHo祅 Th祅h Thng 頲 nh薾 t蕋 c� ph莕 thng nhi謒 v鬨n<color=yellow>Ho祅 Th祅h x2<color> c� th� d飊g o c� nh薾 thng <color=yellow>x%d<color>, c� c� h閕 nh薾 <color=yellow>thng th猰<color>.\nH穣 ch鋘 c竎h ho祅 th祅h:",NFT_FINISH_AWARD_PAY_MULTI),getn(selTab),selTab);
end

function nft_finish_task_by_type(nType, bConfirm)
	--nType : 1普通, 2付费
	if not nType then
		return
	end

	if bConfirm ~= 1 and nType == 2 then
		local selTab = {
			"уng �/#nft_finish_task_by_type(2,1)",
			" tr� l筰/nft_finish_task",
			"K誸 th骳 i tho筰/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("Ho祅 Th祅h x2 c莕 t鑞: <color=red>%s x%d<color>", 
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
		Talk(1,"", format("<color=green>%s<color>:", GetTargetNpcName() or "")..format("%s kh玭g  %d", 
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

	--埋点
	local tRtInfo = T_NFT_RUNTIME["dailyfinish_all"][GetTask(TASKID_NFT_DAILY_FINISH_COUNT)]
	if tRtInfo then
		AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
	end

	if nType == 1 then
		--埋点
		tRtInfo = T_NFT_RUNTIME["finish_free"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	elseif nType == 2 then
		--双倍完成消耗道具
		if nft_pay_finish_cost() ~= 1 then
			return
		end
		gf_ModifyTask(TASKID_DC_NFT_PAY_FINISH_COUNT, 1)

		--埋点
		tRtInfo = T_NFT_RUNTIME["finish_pay"]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
		tRtInfo = T_NFT_RUNTIME["dailyfinish_pay"][GetTask(TASKID_DC_NFT_PAY_FINISH_COUNT)]
		if tRtInfo then
			AddRuntimeStat(tRtInfo[1], tRtInfo[2], 0, 1)
		end
	end
	
	--多倍奖励
	if bFreeMulti == 1 then
		gf_ModifyTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT, 1)
	end

	if nExtraAwardCount > 1 then
		for _=1, nExtraAwardCount -1 do
			tGtTask:DoPrize(nTaskID)
		end
	end

	--付费额外奖励
	if nType == 2 then
		gf_SetLogCaption("NFT_FINISH_PAY_EXTRA_AWARD")

		--固定奖励
		--gf_Modify("ShiMenWeiWang", NFT_N_FINISH_PAY_EXTRA_AWARD_PRESTIGE)

		--付费额外随机奖励
		local tAwardInfo = gf_RandRate(NFT_T_FINISH_PAY_EXTRA_AWARD_RAND, 10000, 2)
		if tAwardInfo and getn(tAwardInfo) > 0 then
			gf_AddItemEx(tAwardInfo[1])
		end
	end

	--累计奖励
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
	AddRuntimeStat(105, nSubId, 0, 1); --埋点

	nft_talk()
end

function nft_close_task(bConfirm)
	local nTaskID = GetTask(TASKID_NFT_CUR_TASK)
	if nTaskID <= 0 then
		Talk(1,"nft_talk",format("<color=green>%s<color>:", GetTargetNpcName() or "").."Ch璦 nh薾 nhi謒 v�.")
		return
	end

	if bConfirm ~= 1 then
		local szTalk = format("Mu鑞 b� qua? (T鑞 <color=red>%d V祅g<color>, h駓 nhi謒 v� hi謓 t筰 v� nh薾 ng蓇 nhi猲 1 nhi謒 v� S� M玭 m韎)",NFT_N_REFRESH_TASK_MONEY_COST)
		if gt_IsTaskCanFinish(nTaskID) == 1 then
			szTalk = "Х ho祅 th祅h nhi謒 v�, "..szTalk
		end

		local selTab = {
			"уng �/#nft_close_task(1)",
			" tr� l筰/nft_talk",
			"K誸 th骳 i tho筰/nothing",
		}
		Say(format("<color=green>%s<color>:", GetTargetNpcName() or "")..szTalk,
				getn(selTab),
				selTab);
		return
	end

	if Pay(NFT_N_REFRESH_TASK_MONEY_COST*10000) ~= 1 then
		Talk(1,"",format("<color=green>V祅g trong t骾 <color>kh玭g  %d<color=red>",NFT_N_REFRESH_TASK_MONEY_COST) )
		return
	end

	ClearGTask(nTaskID)
	SetTask(TASKID_NFT_CUR_TASK, 0)

	-- gf_ModifyTask(TASKID_NFT_DAILY_FINISH_COUNT, 1)
	-- if GetTask(TASKID_NFT_DAILY_FREE_MULTI_AWARD_COUNT) < NFT_DAILY_LIMIT_FREE_MULTI_AWARD_COUNT then
	-- 	--跳过也扣除免费双倍奖励次数
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
			Msg2Player("Kh玭g gian h祅h trang kh玭g ")
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