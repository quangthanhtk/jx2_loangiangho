--ÿ��12:00,19:00׼ʱˢ��

function TaskShedule()
	TaskName("T�o m�i NPC L�n S�...");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(12,00);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Ws_CreateWushiNpc(%d)", tonumber(nDate)));
end