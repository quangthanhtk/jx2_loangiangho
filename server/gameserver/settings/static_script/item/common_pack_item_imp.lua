------------------------------------------------------------
-- �����xxxʵ��,�һ�ʹ�û��x��xxx
------------------------------------------------------------

tPackItems = {
	[200130822] = {"Nh�n S�m D��ng Vinh Ho�n",1,0,30005,100},--һ���˲�������
	[200130823] = {"�i�n Th�t Sa ��m Ho�n",1,0,30006,100},--һ�������赨��
	[200130824] = {"C�u Hoa Ng�c L� Ho�n",1,0,30007,100},--һ��Ż���¶��
}

-- �ű�������Ĭ�ϵ��õ���ں���
function on_use_real(nItemIndex)
	local name = GetItemName(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nKey = p + d*100000+g*1000*100000
	local t = tPackItems[nKey]
	if not t then
		return
	end
	local szMsg = format("M� %s s� nh�n ���c %d c�i <color=yellow>%s<color>. ��ng � m� kh�ng?", name, t[5], t[1])
	Say(szMsg,
		2,
		format("%s/#sure_open(%d)","M�", nItemIndex),
		format("%s/nothing","Ra kh�i"))
end;


-- �򿪰���
function sure_open(nItemIndex)
	--local name = GetItemName(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nKey = p + d*100000+g*1000*100000
	local t = tPackItems[nKey]
	if not t then
		return
	end
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) or GetFreeItemRoom() < 1 then
		Say("Kho�ng tr�ng trong t�i h�nh trang kh�ng ��", 0)
		return
	end

	if (DelItem(g,d,p, 1) == 1) then
		if (AddItem(t[2],t[3],t[4],t[5]) == 0) then	
			AddItem(g,d,p, 1)
		else
			local szMsg = format("B�n �� nh�n ���c %d c�i %s", t[5], t[1])
			Say(szMsg, 0)
			Msg2Player(szMsg)
		end
	end
end;

