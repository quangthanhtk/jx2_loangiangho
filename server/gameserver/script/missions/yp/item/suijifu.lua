--������ͷ�ֽ

Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	local nMapID = GetWorldPos();
	if nMapID ~= 6300 then
		Talk(1,"","V�t ph�m n�y ch� ���c d�ng � b�n �� �Th�t L�c Nhai�!");
		return 0;
	end
	if DelItem(2,97,36,1) == 1 then
		DoWait(129,130,5);
	end
end

function yp_suijifu_sur()
	local nMapID = GetWorldPos();
	if nMapID ~= 6300 then
		return 0;
	end
	local nRand = random(1,getn(tBzPos[6300]));
	SetFightState(1);
	SetPos(tBzPos[6300][nRand][1],tBzPos[6300][nRand][2]);
end

function yp_suijifu_fail()
	return 0;
end