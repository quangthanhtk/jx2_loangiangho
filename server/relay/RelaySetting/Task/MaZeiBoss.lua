
function TaskShedule()
	TaskName("��nh m� t�c");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(21,30);
	OutputMsg(format("M� t�c ��u m�c xu�t hi�n v�o l�c 21:30..."));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	-- ִ���ٻ�����ͷĿ�Ľű�����
	GlobalExecute("dw createMaZeiBoss()")
end