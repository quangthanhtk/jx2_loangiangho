Import("\\script\\missions\\yp\\ywz\\mission_head.lua")

function main()
	local nCamp = ywzm_GetCamp()
	if 1 == nCamp then
		if ywzm_GetMissionState() ~= 1 then
			SetPos(1739, 3210);
			Talk(1,"","Hi�n �ang l� giai �o�n chu�n b�, xin vui l�ng ��i.");
			return 1;
		end
		SetFightState(1);
		RestoreAll();
	else
		SetPos(1736, 3367);
		return 1;
	end
end