Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
NORMAL_MSG = "<color=green>%s<color>: §µn khØ ®¸ng ghÐt ®ã, l¹i trém Thµnh Phßng §å! Ai gióp ta b¾t chóng, ta sÏ träng th­ëng.";

SUCCEED_MSG = {
	[CAMP_SONG] = "<color=green>%s<color>: §a t¹ %s gióp ®ì, §¹i Tèng sÏ kh«ng quªn ©n t×nh nµy.",
	[CAMP_LIAO] = "<color=green>%s<color>: §a t¹ %s gióp ®ì, T©y H¹ sÏ kh«ng quªn ©n t×nh nµy.",
}

function main()
	
	orb_honor:OnCatchMonkey()
	local nNpcIdx = GetTargetNpc();
	local szNpcCamp = GetNpcCamp(nNpcIdx);
	local szPlayerCamp = GetPlayerCamp();
	if szNpcCamp ~= szPlayerCamp then
		Talk(1, "",  "<color=green>" .. GetTargetNpcName() .. "<color>: Ng­êi ®©u, b¾t gian tÕ nµy.");
		return 0;
	end

	local nMonkeyIdx = GetFollower();
	if nMonkeyIdx == 0 then
		normal_talk();
	elseif GetNpcName(nMonkeyIdx) ~= MONKEY_NPC[2] then
		normal_talk();
	else
		monkey_talk(CAMPSTR2IDX[szNpcCamp]);
	end
end

function normal_talk()
	Talk(1, "", format(NORMAL_MSG, GetTargetNpcName()));
end

function monkey_talk(nCamp)
	KillFollower();
	orb_honor:OnCatchMonkey()
	Talk(1, "",  format(SUCCEED_MSG[nCamp], GetTargetNpcName(), gf_GetPlayerSexName()));
	SendScript2VM(thisFile, format("add_point(%d, %d)", GetTask(TASKID_ORB_CAMP), POINT_GET_MONKEY))
	SendScript2VM(thisFile, format("add_activity(%d)", ACTIVITY_MONKEY));
	Msg2MSAll(Mission_OneRoadBattle.missionID, format(MSG_CATCH_MONKEY, GetName()));
	gf_ModifyTask(TASKID_ORB_CATCH_MONKEY, 1);
	-- OnAchEvent(2, TASKID_ORB_CATCH_MONKEY);
	gf_ModifyTask(TASKID_TEMP_MONKEY, 1);
	-- AddStatValue("pvp_battlefield_monkey", 1);
end

