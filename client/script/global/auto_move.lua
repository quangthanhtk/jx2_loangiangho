--������ Begin

--��ѯ�����;�
AUTO_MOVE_QUERY_COST = 20;

--������ End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0, "B�n �t nh�t c�n "..AUTO_MOVE_QUERY_COST.." �i�m �� b�n 'Th�n h�nh b� ph�' ho�c 'Th�n h�nh b�o �i�n' m�i c� th� t�m ng��i"
	end

	return 1, ""

end