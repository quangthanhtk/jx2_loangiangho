--ʥ�𴫵ݻ

g_nInterValTime = 2;	--�����ļ��ʱ��
-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("Ho�t ��ng chuy�n th�nh h�a")
	
	-- 1���Ӵ���һ��
	TaskInterval(g_nInterValTime)
	
	-- ���ô���ʱ��
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"))
	--Relay��������һ��quarterִ��
	TaskTime(nHour, nMin)

	-- �ظ�ִ�����޴���
	TaskCountLimit(0)
	
	local msg = "Ho�t ��ng chuy�n th�nh h�a b�t ��u, th�i gian l� "..nHour.." �i�m"..nMin.." Ph�t "
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()
	local nTime = tonumber(date("%H%M"))
	if nTime == 1940 or nTime == 1941 then
		GlobalExecute("dw shenghuochuandi_init(1)")
	elseif nTime == 2000 or nTime == 2001 then
		GlobalExecute("dw shenghuochuandi_init(2)")
	elseif nTime > 2001 and nTime < 2104 then
		GlobalExecute("dw shenghuochuandi_init(4)")
	elseif nTime == 2104 or nTime == 2105 then
		GlobalExecute("dw shenghuochuandi_init(3)")
	end
end;
