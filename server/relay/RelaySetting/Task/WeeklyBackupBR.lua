-- һ��һ�α���ս������

function TaskShedule()
	TaskName("WeeklyBackupBR");	
	
	local h = tonumber(date("%H"))
	
	-- 60���Ӵ���һ��
	TaskInterval(60)	
	TaskTime(21, 0)
	-- ִ�����޴�
	TaskCountLimit(0)
end

function TaskContent()

	local w = tonumber(date("%w"))
	local h = tonumber(date("%H"))

	if w == 6 and h == 21 then
		CalcHonorPoint(5)
		OutputMsg("�ang th�ng k� x�p h�ng chi�n tr��ng!...")
	end
end