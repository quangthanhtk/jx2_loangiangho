Import("\\script\\lib\\globalfunctions.lua");

g_mgOpen  = 0; --1:open 0:close

g_mgDebug = 0; --print debug info?

--------------------------角色变量-----------------------
TASKID_MC_MG_ACT_POINT 					= 3609 --月清 历练点数

TASKID_DC_MG_FIRECRAKER_USE_NUM 		= 3611 --日清 每日胜利鞭炮使用次数
TASKID_DC_MG_FINISH_TONG_TASK_NUM		= 3612 --日清 每日帮会任务完成次数

TASKID_MC_MG_FINISH_WJZ_WEEK_TASK_NUM	= 3616 --月清 万剑冢 周常任务完成次数
TASKID_MC_MG_JDYY_FLOP_PAY_NUM			= 3617 --月清 剑荡燕云 周常任务完成次数
TASKID_MC_MG_FINISH_TYT_MISSION_NUM		= 3618 --月清 太一塔通关次数
TASKID_MC_MG_MAKE_SOUL_MEDICINE_NUM		= 3619 --月清 灵魂丹兑换次数
TASKID_MC_MG_USE_AMAZIONG_COIN_NUM		= 3620 --月清 神奇金币使用数量
TASKID_MC_MG_STONE_LOTTERY_NUM			= 3621 --月清 悬石抽奖次数
TASKID_MC_MG_USE_RYJGZ_NUM				= 3622 --月清 荣耀军功章使用次数
TASKID_MC_MG_QUENCH_LP_LV20_NUM			= 3623 --月清 淬炼沧海遗珠到满级次数
TASKID_MC_MG_BIG_BORE_TREE_AWARD_TIME 	= 3633 --月清 种植并成功收获大般若树次数
TASKID_MC_MG_FINISH_TONG_TASK_NUM 		= 3637 --月清 帮会任务完成次数

TASKID_MC_MG_NVWA_BOX_USECOUNT 			= 3634 --月清 女娲宝盒使用次数
TASKID_MC_MG_LUCKYSTAR_USECOUNT 		= 3635 --月清 幸运星使用次数
TASKID_MC_MG_SOURCE_BATTLE_AWARDCOUNT 	= 3636 --月清 资源战场领奖次数
--------------------------------------------------------

----------------------------常量------------------------
g_nMgActivatePrivilegeTaskIdx 			= 117  --激活特权任务的taskIdx
g_nMgPrivilegeBitConditionIdx 			= 507  --特权标记条件idx

g_MgLogCaption = "MonthlyGoals"
--------------------------------------------------------

g_tActivatePrivilegeCost = {2,97,236,50} --天骄令

function mg_CheckOpen()
	if g_mgOpen == 1 then
		return 1
	else
    	mg_DebugPrint("\n===== mg_CheckOpen()= 0 =====")
		return 0
	end
end

function mg_CheckDate()
	-- if tonumber(date("%d"))  > 28 then
	-- 	mg_DebugPrint("\n===== mg_CheckDate()= 0 =====")
 --    	return 0
 --  	end
  	return 1
end

function _mg_FakeItemAddPoint(tFakeItem, tParam)
	--{g,d,p,n,bind,["expire"]=expire}
	if not tFakeItem then
		return 0
	end
	local nEachPoint = tParam and tParam[1] or 0
	mg_ModifyPoint(tFakeItem[4]*nEachPoint)

	return 1
end

--配置表里的假道具
--必须要在此配置特殊处理
g_tFakeItem2RealOperation = {
	--积分假道具
--	[gf_PackItemGDP(g, d, p)] = {func, {param1,param2,...} },
	[gf_PackItemGDP(2, 1, 31506)] = {_mg_FakeItemAddPoint, {1} },
}

g_tMgTaskInfo = {
--	[nTaskIdx]= {
--		["nTaskId"]			= TaskIndex,
--		["nTaskType"]		= TaskType,
--		["szTitle"]			= Title,
--		["szTaskDes"]		= TaskDes,
--			-- ["szIsGetTaskCdtGroup"]	= {[1]={nCdtId1,...},[2]={"&","|",...}}, --IsGet
--			-- ["szIsFinishCdtGroup"]	= {[1]={nCdtId1,...},[2]={"&","|",...}}, --IsFinished
--			-- ["szIsAwardCdtGroup"]	= {[1]={nCdtId1,...},[2]={"&","|",...}}, --IsAwarded
--		["szIsGetTaskCdtGroup"]	= IsGet,
--		["szIsFinishCdtGroup"]	= IsFinished,
--		["szIsAwardCdtGroup"]	= IsAwarded,
--		["nNeedRoom"]		= NeedRoom,
--		["tAwards"]			= {
--			{g,d,p,n,bind, ["expire"]=expire1,["bMsg"]=GlobalMsg1},	--Award1,ExpireTime1,GlobalMsg1
--			{award2},
--			{award3},
--			...
--			{awardn},
--		},
--	},
}

function mg_InitConfig()
	local szConfigPath = "\\settings\\online\\monthly_goals\\task_main.txt"
	local tConfig = ff_GetTabFileTableEx(szConfigPath, 11)
	local tConfig = gf_TableNumberElementToNumber(tConfig)

	for i = 1, getn(tConfig) do
		local tTempTask = {
			["nTaskId"]			= nil,
			["nTaskType"] 		= nil,
			["szTitle"] 		= nil,
			["szTaskDes"]		= nil,
			["szIsGetTaskCdtGroup"]	= nil,
			["szIsFinishCdtGroup"]	= nil,
			["szIsAwardCdtGroup"]	= nil,
			["nNeedRoom"]		= nil,
			["tAwards"]= {},
		}
		tTempTask["nTaskId"]		= tonumber(tConfig[i]["TaskIndex"]);
		tTempTask["nTaskType"]		= tonumber(tConfig[i]["TaskType"]);
		tTempTask["szTitle"]		= tConfig[i]["Title"];
		tTempTask["szTaskDes"]		= tConfig[i]["TaskDes"];
		-- tTempTask["szIsGetTaskCdtGroup"]	= _mg_SplitConditonStr2Table(tConfig[i]["IsGet"]);
		-- tTempTask["szIsFinishCdtGroup"]	= _mg_SplitConditonStr2Table(tConfig[i]["IsFinished"]);
		-- tTempTask["szIsAwardCdtGroup"]	= _mg_SplitConditonStr2Table(tConfig[i]["IsAwarded"]);
		tTempTask["szIsGetTaskCdtGroup"]	= tConfig[i]["IsGet"];
		tTempTask["szIsFinishCdtGroup"]	= tConfig[i]["IsFinished"];
		tTempTask["szIsAwardCdtGroup"]	= tConfig[i]["IsAwarded"];
		tTempTask["nNeedRoom"]		= tConfig[i]["NeedRoom"];

		for j= 1,8 do
			local szAward = tConfig[i][format("Award%d",j)]
			if szAward and szAward ~= "" and szAward ~= 0 then
				local tt = split(szAward,";")
				local szTime = tConfig[i][format("ExpireTime%d",j)]
				if not szTime or szTime == "" then
					szTime = 0
				end
				tt["expire"] = split(szTime,",")
				tt = gf_TableNumberElementToNumber(tt)
				if getn(tt["expire"]) == 1 then
					tt["expire"][1] = tt["expire"][1] * 3600; --h to s
				end
				local bGlobalMsg = tConfig[i][format("GlobalMsg%d",j)]
				if not bGlobalMsg or bGlobalMsg == "" then
					bGlobalMsg = 0
				end
				tt["bMsg"] = bGlobalMsg
				tinsert(tTempTask.tAwards, tt)
			end
		end
		tTempTask.tAwards.n = nil;

		g_tMgTaskInfo[tonumber(tTempTask.nTaskId)] = tTempTask
	end

	--mg_DebugPrint("=========g_tMgTaskInfo = ", g_tMgTaskInfo)
end

function mg_ModifyPoint(nPoint)
	if nPoint == 0 then
		return
	end
	gf_ModifyTask(TASKID_MC_MG_ACT_POINT, nPoint)
	Msg2Player(format("Nh薾 頲 %d 觤 R蘮 Luy謓", nPoint) )
end

function mg_GiveTaskItemAward(nTaskId)
	if not g_tMgTaskInfo[nTaskId] then
		return 0
	end
	gf_SetLogCaption(g_MgLogCaption)

	for i=1, getn(g_tMgTaskInfo[nTaskId]["tAwards"]) do
		local tAwardInfo = g_tMgTaskInfo[nTaskId]["tAwards"][i]
		local tFakeItemInfo = g_tFakeItem2RealOperation[gf_PackItemGDP(tAwardInfo[1],tAwardInfo[2],tAwardInfo[3])]
		if tFakeItemInfo then
			tFakeItemInfo[1](tAwardInfo, tFakeItemInfo[2])
		else
			local nTimePass = gf_MkTimePass(gf_UnPack(tAwardInfo["expire"]))
			if nTimePass ~= 0 then
				tAwardInfo[5] = nTimePass*100 + mod(tAwardInfo[5], 100)
			end

			local nRet, nItemIdx = gf_AddItemEx(tAwardInfo)
			-- if nItemIdx > 0 then
			-- 	local tExpireTime =  tAwardInfo["expire"]
			-- 	if tExpireTime and tExpireTime[1] ~= 0 then
			-- 		gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime) );
			-- 	end
			-- end
			Msg2Global(format("Ch骳 m鮪g %s tham gia [Hi謕 Kh竎h H祅h], nh薾 頲 %s x%d",
					GetName(), GetItemName(tAwardInfo[1],tAwardInfo[2],tAwardInfo[3]), tAwardInfo[4]) )
		end
	end
	gf_SetLogCaption("")

	return 1
end

function mg_CheckCanGiveAward(nTaskId, bMsg)
	if not g_tMgTaskInfo[nTaskId] then
		return 0
	end
	--是否已接取
	if mg_CheckConditonGroup(g_tMgTaskInfo[nTaskId]["szIsGetTaskCdtGroup"]) ~= 1 then
		if bMsg == 1 then
			Talk(1, "", "Kh玭g th� nh薾 nhi謒 v� n祔");
		end
		mg_DebugPrint(format("\n====IsGetTask=0 mg_CheckCanGiveAward(nTaskId=%d)====", nTaskId) )
		return 0
	end
	--是否已领奖
	if mg_CheckConditonGroup(g_tMgTaskInfo[nTaskId]["szIsAwardCdtGroup"]) == 1 then
		if bMsg == 1 then
			Talk(1, "", "Kh玭g th� ho祅 th祅h nhi謒 v� l苝 l筰");
		end
		mg_DebugPrint(format("\n====IsAwarded=1 mg_CheckCanGiveAward(nTaskId=%d)====", nTaskId) )
		return 0
	end
	--是否已完成
	if mg_CheckConditonGroup(g_tMgTaskInfo[nTaskId]["szIsFinishCdtGroup"]) ~= 1 then
		if bMsg == 1 then
			Talk(1, "", "Nhi謒 v� ch璦 ho祅 th祅h");
		end
		mg_DebugPrint(format("\n====IsFinish=0 mg_CheckCanGiveAward(nTaskId=%d)====", nTaskId) )
		return 0
	end

	if gf_JudgeRoomWeight(g_tMgTaskInfo[nTaskId]["nNeedRoom"], 100, "") ~= 1 then
		return 0
	end

	return 1
end

--设置任务为已领奖状态
function mg_SetTaskAwarded(nTaskId)
	if not g_tMgTaskInfo[nTaskId] then
		return 0
	end

--	local nCdtId = tonumber(g_tMgTaskInfo[nTaskId]["szIsAwardCdtGroup"][1][1])
	local nCdtId = tonumber(g_tMgTaskInfo[nTaskId]["szIsAwardCdtGroup"])
	return ActSetBitCdtFinish(nCdtId)
end

function mg_CheckConditon(nConditionId)
	if not nConditionId then
		return 0
	end

	if nConditionId == 0 then
		return 0
	elseif nConditionId == -1 then
		return 1
	end

	return ActCheckCondition(nConditionId)
end

function mg_CheckConditonGroup(szCondition)
	if not szCondition or szCondition == "" then
		return 0
	end

	local nRet = 0
	local tAnd 	= split(szCondition,"&")
	local nTempRet = -1
	for i=1, getn(tAnd) do
		local tOr = split(tAnd[i],"|")
		for j=1,getn(tOr) do
			if mg_CheckConditon(tOr[j]) == 1 then
				nTempRet = 1
				break
			else
				nTempRet = 0
			end
		end
		if nTempRet == 0 then
			break
		end
	end

	if nTempRet == 1 then
		nRet = 1
	else
		nRet = 0
	end

	return nRet
end

-- function mg_CheckConditonGroup(tCondition)
-- 	local nRet = 0

-- 	if not tCondition or not tCondition[1] or getn(tCondition[1]) < 1 then
-- 		return nRet
-- 	end

-- 	local tConditionIds = tCondition[1]
-- 	local tOperationStr = tCondition[2]
-- 	for i=1, getn(tConditionIds) do
-- 		if i==1 then
-- 			nRet = mg_CheckConditon(tConditionIds[i])
-- 		else
-- 			if not tOperationStr or getn(tOperationStr) < 1 then
-- 				break
-- 			else
-- 				if tOperationStr[i-1] == "&" then
-- 					nRet = (nRet==0) and 0 or mg_CheckConditon(tConditionIds[i])
-- 				elseif tOperationStr[i-1] == "|" then
-- 					nRet = (nRet==1) and 1 or mg_CheckConditon(tConditionIds[i])
-- 				else
-- 					nRet = 0
-- 					break
-- 				end
-- 			end
-- 		end
-- 	end

-- 	return nRet
-- end

-- function _mg_SplitConditonStr2Table(szCondition, tCondition)
-- 	--&,|;  "1&2|3&4" --> tCondition={[1]={1,2,3,4},[2]={"&","|","&""}}
-- 	if not szCondition or szCondition == "" then
-- 		return 0
-- 	end

-- 	local tCondition = tCondition or {[1]={},[2]={}}

-- 	local tAnd 	= split(szCondition,"&")
-- 	local tOr = split(szCondition,"|")

-- 	if getn(tAnd) > 1 then
-- 		for i=1, getn(tAnd) do
-- 			_mg_SplitConditonStr2Table(tAnd[i], tCondition)
-- 			if i < getn(tAnd) then
-- 				tinsert(tCondition[2], "&") 
-- 			end
-- 		end
-- 	elseif getn(tOr) > 1 then
-- 		for i=1, getn(tOr) do
-- 			_mg_SplitConditonStr2Table(tOr[i], tCondition)
-- 			if i < getn(tOr) then
-- 				tinsert(tCondition[2], "|") 
-- 			end
-- 		end
-- 	else
-- 		tinsert(tCondition[1], tonumber(szCondition) )
-- 	end

-- 	tCondition[1].n = nil
-- 	tCondition[2].n = nil

-- 	return tCondition
-- end

function mg_DebugPrint(szStr, tTable)
	if g_mgDebug ~= 1 then
		return
	end
	if szStr then
		print("\n"..szStr)
	end
	if tTable then
		gf_PrintTable(tTable)
	end
end

function mg_CheckPrivilege()
	if ActCheckCondition(g_nMgPrivilegeBitConditionIdx) == 1 then
		return 1
	else
		return 0
	end
end

function mg_ActivatePrivilege()
	if mg_CheckPrivilege() == 1 then
		Talk(1,"","Х k輈h ho箃 thng ti課 c蕄 Hi謕 Kh竎h H祅h, kh玭g th� k輈h ho箃 n鱝")
		return 0
	end
	
	gf_SetLogCaption(g_MgLogCaption)
	local tCost = g_tActivatePrivilegeCost
	if gf_DelItem(tCost[1], tCost[2], tCost[3], tCost[4]) ~= 1 then
		Talk(1,"",format("<color=red>%s trong t骾 kh玭g  %d<color>, k輈h ho箃 th蕋 b筰",GetItemName(tCost[1],tCost[2],tCost[3]), tCost[4]) )
		return 0
	end
	ActSetBitCdtFinish(g_nMgPrivilegeBitConditionIdx)
	Talk(1,"","Х k輈h ho箃 thng ti課 c蕄 Hi謕 Kh竎h H祅h" )

	AddRuntimeStat(108, 1, 0, 1)
	gf_SetLogCaption("")

	return 1
end

mg_InitConfig()

T_TASK_RUNTIMESTAT = {
	[101] = {106,1},
	[102] = {106,2},
	[103] = {106,3},
	[104] = {106,4},
	[105] = {106,5},
	[106] = {106,6},
	[107] = {106,7},
	[108] = {106,8},
	[109] = {106,9},
	[110] = {106,10},
	[111] = {106,11},
	[112] = {106,12},
	[113] = {106,13},
	[114] = {106,14},
	[115] = {106,15},
	[116] = {106,16},
	[118] = {107,1},
	[119] = {107,2},
	[120] = {107,3},
	[121] = {107,4},
	[122] = {107,5},
	[123] = {107,6},
	[124] = {107,7},
	[125] = {107,8},
	[126] = {107,9},
	[127] = {107,10},
	[128] = {107,11},
	[129] = {107,12},
	[130] = {107,13},
	[131] = {107,14},
	[132] = {107,15},
	[133] = {107,16},
}

---------------------------------对外接口---------------------------
g_tActivatePrivilegeSay = {
	"\nуng � k輈h ho箃/mg_ActivatePrivilege",
	"\nв ta suy ngh� l筰/nothing",
}

function mg_GetTaskAward(nTaskId)
	mg_DebugPrint(format("====mg_GetTaskAward(nTaskId=%d)====", nTaskId) )
	if mg_CheckOpen() ~= 1 then
		Talk(1,"","Activity closed." )
		return 0
	end

	if not nTaskId or not g_tMgTaskInfo[nTaskId] then
		return 0
	end
	--激活特权任务特殊处理
	if nTaskId == g_nMgActivatePrivilegeTaskIdx and mg_CheckPrivilege() ~= 1  then
		local tCost = g_tActivatePrivilegeCost
		Say(format("D飊g <color=gold>%s x%d<color> k輈h ho箃 thng ti課 c蕄 Hi謕 Kh竎h H祅h. Khi 觤 R蘮 Luy謓 t m鴆 nh蕋 nh, 頲 nh薾 Thng Ti課 C蕄.", 
				GetItemName(tCost[1],tCost[2],tCost[3]), 
				tCost[4]),
			getn(g_tActivatePrivilegeSay), 
			g_tActivatePrivilegeSay );
		return 0
	end

	if mg_CheckCanGiveAward(nTaskId, 1) ~= 1 then
		return 0
	end
	--设为已领取
	if mg_SetTaskAwarded(nTaskId) ~= 1 then
		return 0
	end

	WriteLog(format("[Role:%s (acc:%s)] [%s] [mg_GetTaskAward] nTaskId=%d",
		GetName(), GetAccount(), g_MgLogCaption, nTaskId ) )

	mg_GiveTaskItemAward(nTaskId)

	if T_TASK_RUNTIMESTAT[nTaskId] then
		AddRuntimeStat(T_TASK_RUNTIMESTAT[nTaskId][1], T_TASK_RUNTIMESTAT[nTaskId][2], 0, 1)
	end

	return 1
end