-- ��սǧѰ����ʱ��������

function TaskShedule()
	TaskName("Thi�t l�p th�i gian Thi�n T�m Th�p");

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(00,30);
	OutputMsg(format("M�i ng�y 00h30 s� thi�t l�p l�i d� li�u Thi�n T�m Th�p..."));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	-- ִ���ٻ��ű�����
	GlobalExecute("dw Qht_Relay_Clean()")
end