--ÿ��12:30,21:30׼ʱˢ��

function TaskShedule()
	TaskName("BOSS N�m M�i");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(12,30);
	OutputMsg(format("BOSS N�m M�i s� xu�t hi�n � %s...", "12:30"));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d")) + random(10000);
	GlobalExecute(format("dw Yb_CreateBoss(%d)", tonumber(nDate)));
end