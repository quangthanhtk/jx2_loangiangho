function TaskShedule()
	TaskName("��i t�c chi�n truy t�m l�i ch� vi�t");	

	-- һСʱһ��
	TaskInterval(60);
	-- ���ô���ʱ��
	TaskTime(10,30);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()

	-- ִ���ٻ�BOSS�ű�
	GlobalExecute("dw Dzt_Close()");
end