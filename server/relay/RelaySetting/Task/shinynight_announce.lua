Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 1440	-- ÿ24Сʱ����

function TaskShedule()
	TaskName("C�ng b� ��m Huy Ho�ng");	

	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local hour = 18
	local min = 0
	TaskTime(hour, min);
	OutputMsg(format("Nhi�m v� ��m Huy Ho�ng s� ���c kh�i ��ng v�o %d:%d...", hour, min));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
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

	-- ѡ����
	local multiple = get_multiple()
	SetGlbInt(RELAYGLB_MULTIPLE, multiple)

	-- ����
	local multiple_msg = map_sysnames[system][3]
	if (multiple_msg == 0) then
		multiple_msg = multiple / 100
	end
	local msg = format("Ho�t ��ng ��n Huy Ho�ng t�i nay s� b�t ��u 19:00-23:15, h� th�ng %s_%s ph�n th��ng s� t�ng %1.1f l�n. Hy v�ng m�i ng��i t�ch c�c tham gia ho�c d�ng B� V��ng Huy Ho�ng l�nh �� nhanh ch�ng ��t ���c ph�n th��ng nh� mong mu�n!",
		map_sysnames[system][1],
		map_sysnames[system][2],
		multiple_msg)

	GlobalExecute(format("dw AddGlobalNews([[%s]])", msg))
end

