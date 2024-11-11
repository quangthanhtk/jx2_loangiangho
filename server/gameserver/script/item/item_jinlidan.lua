function OnUse(nItem)
	local nValue = 50;
	local nCur, nMax = ModifyEnergy(0, 1);
	if nCur >= nMax then
		Talk(1,"","T�m th�i kh�ng c�n d�ng Tinh L�c ��n");
		return 0;
	end
	local nActually = min((nMax - nCur), 50)
	Say(format("D�ng Tinh L�c ��n s� nh�n ���c %d �i�m tinh l�c, quy�t ��nh d�ng ngay kh�ng?", nActually), 2, format("D�ng ngay/#OnUseJinglidan(%d, %d)", nItem, nActually), "T�i h� ch� xem qua th�i/nothing")
end

function OnUseJinglidan(nItem, nValue)
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	ModifyEnergy(nValue, 1);
end