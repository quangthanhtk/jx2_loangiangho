Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\function\\ornament\\ornament.lua")

FH_EACH_POINT = 1

--�绪���־�	2, 1, 31004
function OnUse(nItemIdx)
	local nCnt = GetItemCount(2, 1, 31004)
	AskClientForNumber("doUse", 0, nCnt, "C�n d�ng bao nhi�u?");
end
function doUse(nNum)
	if nNum <= 0 then
		return
	end

	if DelItem(2,1,31004,nNum) ~= 1 then
		Talk(1,"","S� d�ng th�t b�i")
		return
	end

	ornament_add_score(nNum*FH_EACH_POINT)
	Msg2Player(format("Nh�n ���c %d �i�m Phong Hoa!",nNum*FH_EACH_POINT))
end