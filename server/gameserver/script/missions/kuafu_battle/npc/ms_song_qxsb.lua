Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local nState = GetMissionV(KF_MV_BATTLE_STATE);
	local nMapID = GetWorldPos();
	if KF_MS_STATE_PEACE == nState or KF_MS_STATE_READY == nState then
		local nLoop = GetMissionV(KF_MV_BATTLE_TIMER_LOOP);
		local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID);
		local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID);	
		local szTitle="<color=green>Ti�n tuy�n qu�n T�ng<color>".." c�n "..tostring(KF_READY_TIME/18*nLoop).."s, chi�n tr��ng li�n ��u ch�nh th�c b�t ��u. S� ng��i hi�n t�i l�: "..KF_CampOne_Name.."["..nPlayerOne.."]:"..KF_CampTwo_Name.."["..nPlayerTwo.."]"
		Say(szTitle, 0);
	else
		if KF_MS_STATE_COMPLETE ~= nState and GetFightState() == 0 then
			local tSay = {};
			local nCamp = KF_GetCamp();
			local nMapID, nX, nY = GetNpcWorldPos(GetTargetNpc());
			if nX == 1623 and nY == 3734 then
				tinsert(tSay, format("��a ta ��n tr��c ��i doanh/#KF_TransmitPlayer(%d,%d,%d)", 0, 1642, 3691));
			else
				tinsert(tSay, format("��a ta ��n b�n g�n ��i doanh/#KF_TransmitPlayer(%d,%d,%d)", 0, 1642, 3831));
			end
			local tRevivePos = {
				[1] = {1606, 3309, "C�nh M�n Tr�n K�"},
				[2] = {1827, 3370, "Di�t M�n Tr�n K�"},
				[3] = {1888, 3754, "Sinh M�n Tr�n K�"},
				[4] = {1656, 3676, "T� M�n Tr�n K�"},
				[5] = {1736, 3537, "��i Tr�n K�"},
			};
			local tTemp = {
				KF_MV_BATTLE_FLAG_JM, --����0������1�Σ�2��
				KF_MV_BATTLE_FLAG_MM, --����0������1�Σ�2��
				KF_MV_BATTLE_FLAG_SM,	--����0������1�Σ�2��
				KF_MV_BATTLE_FLAG_SI,	--����0������1�Σ�2��
				KF_MV_BATTLE_FLAG_DA,	--����0������1�Σ�2��
			}
			for i = 1, getn(tTemp) do
				if GetMissionV(tTemp[i]) == nCamp then
					tinsert(tSay, format("��a ta ��n %s/#KF_TransmitPlayer(%d,%d,%d)", tRevivePos[i][3], i, tRevivePos[i][1], tRevivePos[i][2]));
				end
			end
			--������ȫ����
			local nSongScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
			local nLiaoScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
			local nPointIndex = GetMissionV(KF_MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG);
			if nPointIndex > 0 and nPointIndex <= getn(KF_TEMP_SAFE_POS[nCamp]) and nLiaoScore - nSongScore > KF_TEMP_SAFE_POS_CONDITION then
				tinsert(tSay, format("��a ta ��n �i�m truy�n t�ng kh�c/#KF_SafeTransmitPlayer(%d)", nPointIndex));
			end
			tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
			Say("<color=green>Li�u Ti�n Tuy�n Binh<color>".."Thi�u hi�p quy�t ��nh ��n chi�n tr��ng ?", getn(tSay), tSay);
		end
	end
end

