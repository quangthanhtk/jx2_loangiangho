Include("\\script\\missions\\yp\\qmy\\head.lua")
Include("\\script\\missions\\yp\\qmy\\entrynpc.lua")
Include("\\script\\missions\\yp\\yp_head.lua")

function main()
	if yp_checkRewardTime() ~= 0 then
		Msg2Player("Trong th�i gian Thi�n �m Th�m B� kh�ng th� r�i kh�i n�i n�y!");
		return 0;
	end
--	NewWorld(6300,1504,3027);
--	SetFightState(1);
	local nMaskState = GetMaskStatus();
	if nMaskState == 1 then
		UseMask(0,0);
	end	
	enter();
	SetPos(1504,3027);
	SetFightState(1);
end