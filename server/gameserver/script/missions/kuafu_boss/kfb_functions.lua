Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_head.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")


function kfb_OpenOneMSByType(nType)
	if not T_KFB_MISSION_CONFIG 
		or not T_KFB_MISSION_CONFIG[nType] then
			print(format("[ERROR] kfb_OpenOneMSByType(nType) unvalid arguments nType=%d", nType or 0))
			WriteLog(format("[ERROR] kfb_OpenOneMSByType(nType) unvalid arguments nType=%d", nType or 0))
		return 0
	end

	local szScript = T_KFB_MISSION_CONFIG[nType][7]
	SendScript2VM(szScript,"return kfb_createMission()")
	return 1
end

function kfb_OpenAllMS()
	kfb_DataClear() --先重置临时数据

	if not T_KFB_MISSION_CONFIG then
		return 0
	end

	for k, v in T_KFB_MISSION_CONFIG do
		local nMaxMissionNum = v[3]
		for i=1, nMaxMissionNum do
			kfb_OpenOneMSByType(k)
		end
	end
	kfb_DataSetCurMSState(KFB_MS_PREPARE)
	Msg2Global(format("%s v� th� th﹏ xu蕋 hi謓 t筰 %s, c竎 v� hi謕 s� h穣 n ti猽 di謙!",
				"Ti猽 Nhi詍 Nguy謙", "Чi Th秓 Nguy猲 1, Чi Th秓 Nguy猲 2, B� L筩 Vng K�"))

	return 1
end

function kfb_CloseAllMs()
	if not T_KFB_MISSION_CONFIG then
		return 0
	end

	for k,v in T_KFB_MISSION_CONFIG do
		local tMapId = kfb_GetDynamicMapIds(v[2]) or {}
		local nMissionID = v[1]

		for i=1, getn(tMapId) do
			mf_CloseMission(nMissionID, tMapId[i])
		end		
	end

	return 1
end

function kfb_CheckEnter()
	local nCurMSState = kfb_DataGetCurMSState()
	
	if nCurMSState == KFB_MS_UNOPEN then
		Talk(1,"",format("Th阨 gian s╪ BOSS ch璦 b総 u, b竜 danh s╪ BOSS li猲 server di詎 ra v祇 th� b秠 - %s h祅g tu莕.", "21:00") )
		return 0
	elseif nCurMSState >= KFB_MS_CLOSE then
		Talk(1,"","Chi課 u  k誸 th骳, l莕 sau h穣 n")
		return 0
	end

	if GetPlayerRebornLevel() < KFB_NEED_REBORN 
		or GetLevel() < KFB_NEED_LEVEL then
			Talk(1,"",format("Ch璦 t Chuy觧 Sinh %d %d, kh玭g th� v祇!", KFB_NEED_REBORN, KFB_NEED_LEVEL))
			return 0
	end

	if not gf_GetRealmTongName() or gf_GetRealmTongName() == "" then
        Talk(1,"","Kh玭g trong bang h閕, kh玭g th� v祇!")
        return 0
	end

	return 1
end

function kfb_EnterMSByType(nType, nCamp)
	--return 0=人数已满 1=成功

	nType = nType or KFB_MISSION_DATA_IDX_YMG
	nCamp = nCamp or KFB_COMMON_PLAYER_CAMP

	if kfb_CheckEnter() ~= 1 then
		return 0
	end

	if not T_KFB_MISSION_CONFIG 
		or not T_KFB_MISSION_CONFIG[nType] then
		return 0
	end

	if kfb_DataCheckTongMemberFull(nType, gf_GetRealmTongName()) == 1 then
		Talk(1, "", "S� th祅h vi猲 bang trong khu v鵦 n祔 t t鑙 產. H穣 i ho芻 ch鋘 阯g kh竎.!");
		return 0
	end

	local nTotalPlayerAll = kfb_GetAllMSPlayerCount(nCamp) or 0
	if nType == KFB_MISSION_DATA_IDX_YMG 
		and GetNpcWorldPos() == 8899
		and nTotalPlayerAll  >= KFB_ALL_MAPS_MAX_PLAYER then
		 	Talk(1, "", "Л阯g 甶 ph輆 trc qu� ng, xin i trong gi﹜ l竧 r錳 th� l筰!");
		return 0
	end

	local tMSInfo = T_KFB_MISSION_CONFIG[nType]
	local tMapId = kfb_GetDynamicMapIds(tMSInfo[2]) or {}
	local nTargetMSId = tMSInfo[1]
	local nTargetMapId = 0
	for i=1, getn(tMapId) do
		if tMSInfo[4] > mf_GetPlayerCount(nTargetMSId, nCamp, tMapId[i]) then
			nTargetMapId = tMapId[i]
			if g_kfbDebug == 1 then
				print("======kfb_EnterMSByType() nTargetMapId = " ..nTargetMapId)
			end
			break
		end
	end
	if nTargetMapId > 0 then
		local nMSState = mf_GetMissionV(nTargetMSId, MV_MISSION_STATE, nTargetMapId)
		if nMSState >= KFB_MS_CLOSE then
			--战斗已结束
			Talk(1, "", "Chi課 u  k誸 th骳, kh玭g th� 甶 n!");
			return 0
		elseif nMSState < KFB_MS_FIGHTING and nType ~= KFB_MISSION_DATA_IDX_YMG then
			--除准备场地雁门关以外的战斗场地，战斗阶段才允许进入
			Talk(1, "", "S緋 b総 u chi課 u, t蕋 c� h穣 s絥 s祅g!!");
			return 0
		else
			if g_kfbDebug == 1 then
				print(format("======kfb_EnterMSByType() mf_JoinMission() nMSId=%d,nCamp=%d,nMapId=%d ======",
					nTargetMSId,nCamp,nTargetMapId ))
			end
			--mf_JoinMission(nTargetMSId, nCamp, nTargetMapId) --直接调用可能有函数名冲突
			SendScript2VM("\\script\\lib\\missionfunctions.lua",format("mf_JoinMission(%d, %d, %d)",nTargetMSId,nCamp,nTargetMapId))
			return 1
		end
	end

	--if getn(tMapId) >= tMSInfo[3] then
		Talk(1, "", "Л阯g 甶 ph輆 trc qu� ng, xin i trong gi﹜ l竧 r錳 th� l筰 ho芻 ch鋘 阯g kh竎!");
		return 0
	--end

	--return 2
end

function kfb_AddJoinMisisonBuff(nMissionIdx)
	local tState = T_KFB_JOIN_MISSION_BUFF[nMissionIdx]

	if not tState then
		return
	end
	for i=1, getn(tState) do
		if g_kfbDebug == 1 then
			print(format("=======kfb_AddJoinMisisonBuff buff=%s, value=%d ,time=%d =========", tState[i][1], tState[i][2], tState[i][3] ))
		end
		CastState(tState[i][1], tState[i][2], tState[i][3], tState[i][3], tState[i][4] or 0);
	end
end

function kfb_AddJoinMisisonDeBuff(nMissionIdx)
	local tState = T_KFB_JOIN_MISSION_DEBUFF[nMissionIdx]

	if not tState then
		return
	end
	for i=1, getn(tState) do
		if g_kfbDebug == 1 then
			print(format("=======kfb_AddJoinMisisonDeBuff buff=%s, value=%d ,time=%d =========", tState[i][1], tState[i][2] ,tState[i][3] ))
		end
		CastState(tState[i][1], tState[i][2], tState[i][3] * 18, tState[i][3], tState[i][4] or 0);
	end
end

function kfb_RemoveJoinMisisonBuff(nMissionIdx)
	local tState = T_KFB_JOIN_MISSION_BUFF[nMissionIdx]

	if not tState then
		return
	end
	for i=1, getn(tState) do
		if g_kfbDebug == 1 then
			print(format("=======kfb_RemoveJoinMisisonBuff buff=%s =========", tState[i][1] ))
		end
		RemoveState(tState[i][5]);
	end
end

function kfb_RemoveJoinMisisonDeBuff(nMissionIdx)
	local tState = T_KFB_JOIN_MISSION_DEBUFF[nMissionIdx]

	if not tState then
		return
	end
	for i=1, getn(tState) do
		if g_kfbDebug == 1 then
			print(format("=======kfb_RemoveJoinMisisonBuff buff=%s =========", tState[i][1] ))
		end
		RemoveState(tState[i][5]);
	end
end

function kfb_GetAllMSPlayerCount(nCamp)
	if not T_KFB_MISSION_CONFIG then
		return 
	end
	local nTotal = 0
	for k, v in T_KFB_MISSION_CONFIG do
		local tMapId = kfb_GetDynamicMapIds(v[2]) or {}
		for i=1, getn(tMapId) do
			nTotal = nTotal + mf_GetPlayerCount(v[1], nCamp, tMapId[i])
		end
	end

	return nTotal
end

function kfb_SetAllMSPhase2Next()
	if not T_KFB_MISSION_CONFIG then
		return 
	end

	local nOldSubWorld = SubWorld;

	for k, v in T_KFB_MISSION_CONFIG do
		local tMapId = kfb_GetDynamicMapIds(v[2]) or {}
		for i=1, getn(tMapId) do
			if tMapId[i] ~= nil then
				SubWorld = SubWorldID2Idx(tMapId[i]);
			end;
			if SubWorld > 0 and v[7] and v[7] ~= "" then
				SendScript2VM(v[7], format("gotoNextPhase()" ) )
			end;
		end
	end
	SubWorld = nOldSubWorld;

	return 1
end

function kfb_CheckAllMissionBossDead()
	if not T_KFB_MISSION_CONFIG then
		return 0
	end
	local nRet = 1

	for k, v in T_KFB_MISSION_CONFIG do
		local tMapId = kfb_GetDynamicMapIds(v[2]) or {}
		for i=1, getn(tMapId) do
			local nNpcIdx = mf_GetMissionV(v[1], MV_BOSS_IDX, tMapId[i])
			if g_kfbDebug == 1 then
				print(format("======CheckBossDead nMapId=%d,nNpcIdx=%d ======", tMapId[i], nNpcIdx or 0))
			end

			if 0 < nNpcIdx then
				nRet = 0
				break
			end
		end
		if nRet == 0 then
			break
		end
	end

	return nRet
end

--删掉某动态地图里的某个npc并更新misison状态
function kfb_RemoveNpcByMV(nMapId, nMvIdx)
	local nNpcIdx = mf_GetMissionV(0, nMvIdx, nMapId)
	if not nNpcIdx or nNpcIdx <= 0 then
		return
	end
	RemoveNpc(nNpcIdx)
	mf_SetMissionV(0, nMvIdx, 0, nMapId)
end

function kfb_GetDynamicMapIds(nRealMapId)
	local tMapId = gf_GetDataTable(GetSameMaps(nRealMapId));
	for i = 1, getn(tMapId) do
		if tMapId[i] == nRealMapId then
			tremove(tMapId, i); --不结算原地图
		end
	end
	return tMapId
end

function kfb_AddActivePoint(nType)
	if not nType then
		return
	end
	local tActInfo = T_KFB_ACTIVITYINFO[nType]
	if tActInfo == nil then 
		print(format("[ERROR] kfb_AddActivePoint(%d) nil ACTIVITY_TYPE! ", nType)) 
		return 
	end

	local nMultiple = T_KFB_ACTIVITY_ROUTE_MULTIPLE[GetPlayerRoute()] or 1
	local nMax = tActInfo.max
	local nAddValue = floor(tActInfo.value * nMultiple)
	local msg = ""

	if nMax and nMax > 0 then
		local nCurTypeAct = gf_GetMyTaskBit(tActInfo.taskid, tActInfo.lbit, tActInfo.rbit)
		if nCurTypeAct >= nMax then
			return
		end

		if nCurTypeAct + nAddValue > nMax then
			nAddValue = nMax - nCurTypeAct
		end
		msg = format("%s, nh薾 %d 甶觤 t輈h c鵦. Х nh薾 (%d/%d) t� c竎h n祔..",tActInfo.msg, nAddValue, nCurTypeAct + nAddValue, nMax)
		if nCurTypeAct + nAddValue >= nMax then
			msg = format("%s  nh薾 甶觤 t輈h c鵦 t鑙 產 t� c竎h n祔.", msg)
		end
		gf_SetMyTaskBit(tActInfo.taskid, tActInfo.lbit, tActInfo.rbit, nCurTypeAct + nAddValue)
	else
		msg = format("%s, nh薾 頲 %d 甶觤 n╪g ng.",tActInfo.msg, nAddValue)
	end 

	Msg2Player(msg)
	gf_ModifyTask(KFB_TSKID_ACTIVE_POINT, nAddValue)
end

function kfb_AddActivePointNearPos(nMap, nX, nY, nRadius)
	local tPlayers = GetPlayersNearPos(nMap, nX, nY, nRadius)
	if not tPlayers or getn(tPlayers) <= 0 then 
		return 
	end

	local nOldPlayerIdx = PlayerIndex;
	for i = 1, getn(tPlayers) do
		PlayerIndex = tPlayers[i]
		if IsPlayerDeath() ~= 1 and kfb_CheckAddActivetPointCd() == 1 then
			kfb_AddActivePoint(KFB_ACTIVITY_TYPE_CLOSE_BOSS)
			kfb_SetAddActivetPointCd()
		end
	end
end

function kfb_AddActivePointNearNpc(nNpcIdx, nRadius)
	if not nNpcIdx or nNpcIdx <= 0 then
		return
	end
	local nMap, nX, nY = GetNpcWorldPos(nNpcIdx);
	kfb_AddActivePointNearPos(nMap, nX, nY, nRadius)
end

--boss范围加活跃的cd限制
function kfb_SetAddActivetPointCd()
	SetTask(KFB_TSKID_ACTIVE_POINT_ADD_CD, GetTime())
end

function kfb_CheckAddActivetPointCd()
	return (GetTime() - GetTask(KFB_TSKID_ACTIVE_POINT_ADD_CD) > KFB_ADD_ACTIVE_POINT_ADD_CD) and 1 or nil
end