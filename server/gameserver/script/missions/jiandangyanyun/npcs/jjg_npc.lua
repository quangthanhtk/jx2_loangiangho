Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");

g_NpcName = "<color=green>Thanh Thanh C� N��ng:<color>";

tNonsense = {
	"Hi hi, cu�i c�ng c�ng �� �u�i ���c huynh �� nh� h� Ng� �i r�i, t� nay ��y s� l� ��a b�n c�a ta!",
	"Ki�m ��ng Y�n V�n c� quan h� m�t thi�t v�i ta.",
	"��n Ki�m ��ng Y�n V�n nh�t ��nh ph�i mang theo Ph�t Mu�i mu�i.",
	"Ph�i nghe k� cu�c ��i tho�i c�a M�c Qu� Anh v� D��ng T�n B�o!",
	"V��t �i th�t b�i c� th� khi�u chi�n l�i, kh�ng c�n tho�t ra ��ng nh�p l�i.",
};

function main()
	local strTab = {
		"\n r�i �i/JJG_ConfirmLeave",
		"\nMu�n tr� v� chi�n tr��ng (C�n Thi�n Ki�u L�nh x1)/JJG_Back2Fight",
		"\nK�t th�c ��i tho�i/nothing",
	};
	local nIdx = random(1, getn(tNonsense));
	Say(g_NpcName..tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
	local strtab = {
			"\n ��ng n�i nhi�u l�i, t�i h� ph�i �i/JJG_Leave",
			"\n ng�i quan s�t ch� th�ng quan/nothing",
		};
	Say(g_NpcName.."Kh�ng ���c b� cu�c!",
		getn(strtab),
		strtab)
end

function JJG_Leave()
	LeaveTeam(1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	JDYY_ClearAllGodState();
	DelMSPlayer(this.missionID, 1);
	if GetMSPlayerCount(tJDYY.missionID) == 0 then
		CloseMission(tJDYY.missionID);
	end
end

function JJG_AddGodState()
	if 1 == GetMissionV(tJDYY.mv_03) then	--����ģʽ
		JDYY_AddGodState();
	end
--	local nRoute = GetPlayerRoute();
--	if tRouteList[nRoute] then
--		Msg2Player(format("�����ӹ���%d%%������5����", tRouteList[nRoute]));
--		CastState("state_p_attack_percent_add", tRouteList[nRoute], 5*60*18, 1, 10010);
--	end
end

function JJG_Back2Fight()
	local szCurStageId = GetMissionS(this.MS_STAGE);
	
	if not tPlayerPos[szCurStageId] then
		WriteLog(format("[Ki�m ��ng Y�n V�n] [StageId = %d, tr� l�i �i�m t�a �� ban ��u c�a chi�n tr��ng l�i]\n", szCurStageId));
		return 0;
	end
	
	if not JDYY_InDeathArea() then return end
	
	if 1 ~= DelItem(2, 97, 236, 1) then	--�콾��
		Talk(1, "", g_NpcName.."Thi�n Ki�u L�nh mang theo tr�n ng��i kh�ng ��!");
		return 0;
	else
		FireEvent("event_ib_cost", 2,97,236,1)
	end
	SetFightState(1);
	JJG_AddGodState();
	RestoreAll();
	JDYY_SetPlayerPos(tPlayerPos[szCurStageId][1]);
	local nDifType = GetMissionV(2);
	local nTaskID = tTaskID.ConsumeTaskID[nDifType];
	SetTask(nTaskID, GetTask(nTaskID) + 2);
	
	if "03" == szCurStageId and GetMissionV(20) == 3 then
		local nValue = 8;
		if eDifType.NORMAL == GetMissionV(2) then
			nValue = 3;
		end
		
		CastState("state_lost_p_life_per18", nValue, 5*60*18, 0, 10005);
	end
	
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end