function TaskShedule()
	TaskName("Ni�n Th� 2014");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(21,00);
	OutputMsg(format("Ni�n Th� s� t�i %s xu�t hi�n...", "21:00"));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw sp_CreateNianShou(%d)", tonumber(nDate)));
end