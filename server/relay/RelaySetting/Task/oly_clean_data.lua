-- ���������Ǽ���������������

function TaskShedule()
	TaskName("C�p nh�t d� li�u ho�t ��ng Olympic");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(23,58);
	OutputMsg(format("22:10 m�i ng�y c�p nh�t l�i d� li�u ho�t ��ng Olympic..."));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	-- ִ���ٻ��ű�����
	GlobalExecute("dw Relay_Clean_Data()")
end