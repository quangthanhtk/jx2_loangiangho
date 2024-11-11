Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLMONSTE)
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN));
	else
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN), KF_CampTwo_ID, f);
	end
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s b� ��nh b�i, lui v� ��i doanh %s.", "T�ng T��ng Qu�n", "Qu�n T�ng"));
end