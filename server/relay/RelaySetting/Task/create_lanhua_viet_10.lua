

function TaskShedule()
	TaskName("Lan Hoa");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(10,15);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nRandom = random(1, 6)
	-- ִ�д��������Ľű�����
	GlobalExecute(format("dw create_lanhua_boss_viet(%d)", nRandom))
end
