-- ����1����ֵ�BOSS��ʱ��

function TaskShedule()
	TaskName("��nh Ni�n th�");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(9,0);
	OutputMsg(format("K� L�n xu�t hi�n v�o l�c 09:00..."));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	-- ִ���ٻ����޵Ľű�����
	local m1 = random(11,12)
	local m2 = random(13,15)
	local m3 = random(16,18)
	GlobalExecute(format("dw createNewYearBoss(%d,%d,%d,%d)", 0, m1, m2, m3))
end
