-- �����ˣ� �����������칦��

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	Say("B�n mu�n d�ng c� quan nh�n? N� c� th� gi�p b�n m� m�t s� ch�c n�ng trong 1 gi�.", 2, "��ng/#yes_use("..nItemIndex..")", "Sai/no_say")
end

function yes_use(nItemIndex)
	if GetTask(2509) > 0 then
		Say("B�n �� d�ng m�t c� quan nh�n.", 0)
	else
		if DelItem(2,1,1011,1) == 1 then
			SetTask(2509, 3600 * 18)
			Msg2Player("B�n �� d�ng 1 c� quan nh�n ")
		end
	end
end