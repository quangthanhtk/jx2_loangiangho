function TaskShedule()
	TaskName("Thi�n T�m Th�p Ho�ng Kim BOSS xu�t hi�n!");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(12,30);
	OutputMsg(format("Thi�n T�m Th�p Ho�ng Kim BOSS xu�t hi�n r�i!", "12:30"));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Qht_Relay_Create_Gold_boss(%d)", tonumber(nDate)));
end