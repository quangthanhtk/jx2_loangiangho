--ÿ��8:30��12:30��17:30��22:30׼ʱˢ�£�ÿ�չ�����

function TaskShedule()
	TaskName("L�m m�i Th� T� BOSS ");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(22,30);
	OutputMsg(format("Th� T� BOSS  t�i %s xu�t hi�n...", "22:30"));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Cc_CreateBoss(%d)", tonumber(nDate)));
end