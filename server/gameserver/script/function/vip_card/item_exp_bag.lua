
function OnUse(nItenIdx)
	local nAddExp = 400000000
	local nNeedItem = 1
	if CanModifyExp(nAddExp) ~= 1 then
		Talk(1,"", "Hi�n kh�ng th� nh�n kinh nghi�m")
		return
	end
	
	if DelItemByIndex(nItenIdx, nNeedItem) == 1 then
		ModifyExp(nAddExp)
		Msg2Player(format("Ch�c m�ng �� d�ng %d %s, nh�n ���c %d kinh nghi�m", 1, "T�i Kinh Nghi�m V��t �i", nAddExp))
		return 1
	end
end
