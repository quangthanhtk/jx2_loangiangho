--ÿ��20:00׼ʱˢ��

function TaskShedule()
	TaskName("T�p m�i Ph� Th�y B�ng Gi�");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(20,00);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw oly_hanbingwunv(%d)", tonumber(nDate)));
end