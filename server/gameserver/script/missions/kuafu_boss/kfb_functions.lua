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
	kfb_DataClear() --œ»÷ÿ÷√¡Ÿ ± ˝æ›

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
	Msg2Global(format("%s vµ th’ th©n xu t hi÷n tπi %s, c∏c vﬁ hi÷p s‹ h∑y Æ’n ti™u di÷t!",
				"Ti™u Nhi‘m Nguy÷t", "ßπi Th∂o Nguy™n 1, ßπi Th∂o Nguy™n 2, BÈ Lπc V≠¨ng K˙"))

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
		Talk(1,"",format("ThÍi gian s®n BOSS ch≠a bæt Æ«u, b∏o danh s®n BOSS li™n server di‘n ra vµo th¯ b∂y - %s hµng tu«n.", "21:00") )
		return 0
	elseif nCurMSState >= KFB_MS_CLOSE then
		Talk(1,"","Chi’n Æ u Æ∑ k’t thÛc, l«n sau h∑y Æ’n")
		return 0
	end

	if GetPlayerRebornLevel() < KFB_NEED_REBORN 
		or GetLevel() < KFB_NEED_LEVEL then
			Talk(1,"",format("Ch≠a Æπt Chuy”n Sinh %d %d, kh´ng th” vµo!", KFB_NEED_REBORN, KFB_NEED_LEVEL))
			return 0
	end

	if not gf_GetRealmTongName() or gf_GetRealmTongName() == "" then
        Talk(1,"","Kh´ng trong bang hÈi, kh´ng th” vµo!")
        return 0
	end

	return 1
end

function kfb_EnterMSByType(nType, nCamp)
	--return 0=»À ˝“—¬˙ 1=≥…π¶

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
		Talk(1, "", "SË thµnh vi™n bang trong khu v˘c nµy Æπt tËi Æa. H∑y ÆÓi ho∆c ch‰n Æ≠Íng kh∏c.!");
		return 0
	end

	local nTotalPlayerAll = kfb_GetAllMSPlayerCount(nCamp) or 0
	if nType == KFB_MISSION_DATA_IDX_YMG 
		and GetNpcWorldPos() == 8899
		and nTotalPlayerAll  >= KFB_ALL_MAPS_MAX_PLAYER then
		 	Talk(1, "", "ß≠Íng Æi ph›a tr≠Ìc qu∏ Æ´ng, xin ÆÓi trong gi©y l∏t rÂi thˆ lπi!");
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
			--’Ω∂∑“—Ω· ¯
			Talk(1, "", "Chi’n Æ u Æ∑ k’t thÛc, kh´ng th” Æi Æ’n!");
			return 0
		elseif nMSState < KFB_MS_FIGHTING and nType ~= KFB_MISSION_DATA_IDX_YMG then
			--≥˝◊º±∏≥°µÿ—„√≈πÿ“‘Õ‚µƒ’Ω∂∑≥°µÿ£¨’Ω∂∑Ω◊∂Œ≤≈‘ –ÌΩ¯»Î
			Talk(1, "", "Sæp bæt Æ«u chi’n Æ u, t t c∂ h∑y sΩn sµng!!");
			return 0
		else
			if g_kfbDebug == 1 then
				print(format("======kfb_EnterMSByType() mf_JoinMission() nMSId=%d,nCamp=%d,nMapId=%d ======",
					nTargetMSId,nCamp,nTargetMapId ))
			end
			--mf_JoinMission(nTargetMSId, nCamp, nTargetMapId) --÷±Ω”µ˜”√ø…ƒ‹”–∫Ø ˝√˚≥ÂÕª
			SendScript2VM("\\script\\lib\\missionfunctions.lua",format("mf_JoinMission(%d, %d, %d)",nTargetMSId,nCamp,nTargetMapId))
			return 1
		end
	end

	--if getn(tMapId) >= tMSInfo[3] then
		Talk(1, "", "ß≠Íng Æi ph›a tr≠Ìc qu∏ Æ´ng, xin ÆÓi trong gi©y l∏t rÂi thˆ lπi ho∆c ch‰n Æ≠Íng kh∏c!");
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

--…æµÙƒ≥∂ØÃ¨µÿÕº¿Ôµƒƒ≥∏ˆnpc≤¢∏¸–¬misison◊¥Ã¨
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
			tremove(tMapId, i); --≤ªΩ·À„‘≠µÿÕº
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
		msg = format("%s, nhÀn %d Æi”m t›ch c˘c. ß∑ nhÀn (%d/%d) tı c∏ch nµy..",tActInfo.msg, nAddValue, nCurTypeAct + nAddValue, nMax)
		if nCurTypeAct + nAddValue >= nMax then
			msg = format("%s Æ∑ nhÀn Æi”m t›ch c˘c tËi Æa tı c∏ch nµy.", msg)
		end
		gf_SetMyTaskBit(tActInfo.taskid, tActInfo.lbit, tActInfo.rbit, nCurTypeAct + nAddValue)
	else
		msg = format("%s, nhÀn Æ≠Óc %d Æi”m n®ng ÆÈng.",tActInfo.msg, nAddValue)
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

--boss∑∂Œßº”ªÓ‘æµƒcdœﬁ÷∆
function kfb_SetAddActivetPointCd()
	SetTask(KFB_TSKID_ACTIVE_POINT_ADD_CD, GetTime())
end

function kfb_CheckAddActivetPointCd()
	return (GetTime() - GetTask(KFB_TSKID_ACTIVE_POINT_ADD_CD) > KFB_ADD_ACTIVE_POINT_ADD_CD) and 1 or nil
end