Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");

g_NpcName = "<color=green>Thanh Thanh C« N­¬ng:<color>";

tNonsense = {
	"Hi hi, cuèi cïng còng ®· ®uæi ®­îc huynh ®Ö nhµ hä Ng« ®i råi, tõ nay ®©y sÏ lµ ®Þa bµn cña ta!",
	"KiÕm §·ng YÕn V©n cã quan hÖ mËt thiÕt víi ta.",
	"§Õn KiÕm §·ng YÕn V©n nhÊt ®Þnh ph¶i mang theo PhËt Muéi muéi.",
	"Ph¶i nghe kü cuéc ®èi tho¹i cña Méc QuÕ Anh vµ D­¬ng T«n B¶o!",
	"V­ît ¶i thÊt b¹i cã thÓ khiªu chiÕn l¹i, kh«ng cÇn tho¸t ra ®¨ng nhËp l¹i.",
};

function main()
	local strTab = {
		"\n rêi ¶i/JJG_ConfirmLeave",
		"\nMuèn trë vÒ chiÕn tr­êng (CÇn Thiªn Kiªu LÖnh x1)/JJG_Back2Fight",
		"\nKÕt thóc ®èi tho¹i/nothing",
	};
	local nIdx = random(1, getn(tNonsense));
	Say(g_NpcName..tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
	local strtab = {
			"\n ®õng nãi nhiÒu lêi, t¹i h¹ ph¶i ®i/JJG_Leave",
			"\n ngåi quan s¸t chê th«ng quan/nothing",
		};
	Say(g_NpcName.."Kh«ng ®­îc bá cuéc!",
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
	if 1 == GetMissionV(tJDYY.mv_03) then	--×÷±×Ä£Ê½
		JDYY_AddGodState();
	end
--	local nRoute = GetPlayerRoute();
--	if tRouteList[nRoute] then
--		Msg2Player(format("ÄãÔö¼Ó¹¥»÷%d%%£¬³ÖÐø5·ÖÖÓ", tRouteList[nRoute]));
--		CastState("state_p_attack_percent_add", tRouteList[nRoute], 5*60*18, 1, 10010);
--	end
end

function JJG_Back2Fight()
	local szCurStageId = GetMissionS(this.MS_STAGE);
	
	if not tPlayerPos[szCurStageId] then
		WriteLog(format("[KiÕm §·ng YÕn V©n] [StageId = %d, trë l¹i ®iÓm täa ®é ban ®Çu cña chiÕn tr­êng lçi]\n", szCurStageId));
		return 0;
	end
	
	if not JDYY_InDeathArea() then return end
	
	if 1 ~= DelItem(2, 97, 236, 1) then	--Ìì½¾Áî
		Talk(1, "", g_NpcName.."Thiªn Kiªu LÖnh mang theo trªn ng­êi kh«ng ®ñ!");
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