function TaskShedule()
	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(22,00);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw ibc_CallBoss(%d)", tonumber(nDate)));
end