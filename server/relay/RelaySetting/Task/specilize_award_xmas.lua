

function TaskShedule()
	TaskName("H�p Qu� ��c Bi�t");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(13,0);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local index = random(1,3)
	GlobalExecute(format("dw xmas_event_08_viet(%d)",index))
end
