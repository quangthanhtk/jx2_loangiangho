Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- ÿ24Сʱ����

function TaskShedule()
	TaskName("��m Huy Ho�ng kinh nghi�m nh�n ��i");	

	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local hour = TIME_START
	local min = 0
	TaskTime(hour, min);
	OutputMsg(format("Nhi�m v� ��m Huy Ho�ng kinh nghi�m nh�n ��i b�t ��u v�o l�c %d:%d...", hour, min));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight start......")
	-- ѡ����	
	local multiple = GetGlbInt(RELAYGLB_MULTIPLE)
	if (multiple == 0) then
		multiple = get_multiple()
	end
	
	-- ���ý������ϻԻ�֮ҹ������
	local system = GetShiningChoice()
	if (system == 0) then
		-- ��ȡ�����ϵͳ����
		system = GetGlbInt(RELAYGLB_SYSTEM)
		if (system == 0) then
			system = get_random_system()
		end
	end
	
	-- �����NB��ͶƱ�˵�����
	local szVoteName = GetVoteName()

	-- ����
	local multiple_msg = map_sysnames[system][3]
	if (multiple_msg == 0) then
		multiple_msg = multiple / 100
	end
	local msg = format("Ho�t ��ng ��m Huy Ho�ng �� b�t ��u, t�i 19:00-23:15, %sPh�n th��ng%s h� th�ng t�ng%1.1f l�n, hy v�ng m�i ng��i tham gia ��ng ��.",
		map_sysnames[system][1],
		map_sysnames[system][2],
		multiple_msg)
		
	-- �Ի�֮ҹ��ʼ
	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)

	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- ���relay�еļ���
	ClearShiningNight()
end
