-- ����1����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("��nh Ni�n th�");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(12,0);
	OutputMsg(format("��i Ni�n Th� xu�t hi�n v�o l�c 12:00..."));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	-- ִ���ٻ����޵Ľű�����
	local index = random(11,18)
	GlobalExecute(format("dw createNewYearBoss(%d)",index))
end
