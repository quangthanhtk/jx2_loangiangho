Import("\\script\\isolate\\functions\\tong_title\\head.lua")

function OnUse(nItem)
	Say(format("X�c ��nh s� d�ng %s kh�ng?", GetItemName(nItem)), 
		2, format("��ng �/#UseBglp(%d)", nItem), "T�i h� ch� xem qua th�i/nohitng");	
end

function UseBglp(nItem)
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	add_tong_gxd(100)
	Msg2Player(format("B�n nh�n ���c %d �i�m �� c�ng hi�n bang h�i", 100));
end