

function TaskShedule()
	TaskName("L�ng ��n may m�n");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(21,0);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	-- ִ�д��������Ľű�����
	GlobalExecute("dw mooncake_08_viet()")
end
