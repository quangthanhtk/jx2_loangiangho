-- ��ʱ�����ɰ�����������

function TaskShedule()
	TaskName("Thi�t l�p ch� s� may m�n ho�t ��ng Olympic");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(20,58);
	OutputMsg(format("21:00 m�i ng�y s� thi�t l�p ch� s� may m�n Olympic..."));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	-- ִ���ٻ��ű�����
	GlobalExecute("dw Relay_Generate_LuckNum()")
end