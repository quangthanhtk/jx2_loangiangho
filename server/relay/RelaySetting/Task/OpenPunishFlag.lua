-- ����1����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("H�n gi� ��ng m�");	

	-- һ��һ��
	TaskInterval(14400);
	-- ���ô���ʱ��
	TaskTime(23,59);
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute(format("dw OpenPunishFlag(%d)", 1));
end
