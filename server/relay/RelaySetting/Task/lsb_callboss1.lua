-- BOSS��ʱ��

function TaskShedule()
	TaskName("Boss L��ng S�n Ho�ng Kim");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(12,30);
	OutputMsg(format("Boss L��ng S�n Ho�ng Kim xu�t hi�n v�o l�c 12: 30..."));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	-- ִ���ٻ��ű�����
	local nRand = random(1,3);
	GlobalExecute(format("dw Create_LSB_BOSS(%d)",nRand));
end