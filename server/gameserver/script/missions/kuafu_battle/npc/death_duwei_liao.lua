Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLMONSTE)
		KF_AddScore(KF_SCORE_DUWEI);
	end
	SetMissionV(KF_MV_BATTLE_DUWEI_TAG_LIAO, 2);
	SetMissionV(KF_MV_BATTLE_DUWEI_DEATHTIME_LIAO, GetTime());
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s ph�ng th� th�t b�i, lui v� ��i doanh %s.", "Li�u �� Th�ng", "Qu�n Li�u"));
end