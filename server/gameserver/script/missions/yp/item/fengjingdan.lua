--�ﾫ��
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	yp_clearPlayerData();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","H�y ��n V� L�m Minh gia nh�p th� l�c �� s� d�ng v�t ph�m n�y!");
		return 0;
	end
	Say("S� d�ng c� th� t�ng <color=yellow>30 �i�m<color> tinh l�c, ��ng � d�ng kh�ng?",
		2,
		"\n��ng/confirm_use_final",
		"\nK�t th�c ��i tho�i/nothing")
end

function confirm_use_final()
	if DelItem(tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1) == 1 then
		yp_setValue(3,30);
	end
end