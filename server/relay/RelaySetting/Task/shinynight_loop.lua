
Include("\\RelaySetting\\Task\\shinynight_head.lua");

INTERVAL_TIME = 5	-- ÿ5���Ӵ���

function TaskShedule()
	TaskName("B�t ��u tu�n ho�n kinh nghi�m nh�n ��i ��m Huy Ho�ng");	

	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
  	local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
 	TaskTime(hour, min);
	OutputMsg(format("Nhi�m v� tu�n ho�n kinh nghi�m nh�n ��i ��m Huy Ho�ng b�t ��u v�o l�c %d:%d...", hour, min));
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("ShinyNight loop......")
	
	if (GetGlbInt(RELAYGLB_SHINYNIGHT) == 1) then
		return
	end

  	local hour = tonumber(date("%H"))
    local min = tonumber(date("%M"));
    -- min >= 2�ż���ִ�У���֤shinynight_loop��shinynight_start����ͻ�� 
 	if (hour < TIME_START or hour >= TIME_CLOSE or min < 2) then
  		return
  	end
  	
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

	SetGlbInt(RELAYGLB_SHINYNIGHT, 1)
	GlobalExecute(format("dw ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	
	-- ���relay�еļ���
	ClearShiningNight()
end
