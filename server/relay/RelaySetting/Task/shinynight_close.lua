Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- ÿ24Сʱ����

function TaskShedule()
	TaskName("��ng ��m Huy Ho�ng kinh nghi�m nh�n ��i");	

	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local hour = TIME_CLOSE
	local min = 15
	TaskTime(hour, min);
	OutputMsg(format("��ng ��m Huy Ho�ng kinh nghi�m nh�n ��i, nhi�m v� s� ���c kh�i ��ng v�o %d:%d...", hour, min));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	-- �Ի�֮ҹ����
	SetGlbInt(RELAYGLB_SHINYNIGHT, 0)

	local msg = "Ho�t ��ng ��m Huy Ho�ng �� k�t th�c, m�i m�i ng��i ng�y mai tham gia ��ng ��."
	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute("dw ShinyNight_Close()")
end
