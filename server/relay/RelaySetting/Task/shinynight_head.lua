
RELAYGLB_SYSTEM			= 1			-- Relayȫ�ֱ�����ϵͳ
RELAYGLB_MULTIPLE 		= 2			-- Relayȫ�ֱ���������
RELAYGLB_SHINYNIGHT		= 3			-- Relayȫ�ֱ������Ի�֮ҹ�Ƿ�����У�1Ϊ�����У�0Ϊδ����

SYS_BATTLE				= 1			-- ս����ս��
SYS_COC			 	 	= 2			-- �̻�Ľ���
SYS_MASTER_RANDOMTASK	= 3			-- ʦ�����������
SYS_MASTER_REPEATTASK	= 4			-- ʦ���ظ�������
SYS_KILLER_TASK			= 5			-- ɱ��������
SYS_DRAGONBOAT			= 6			-- ���ۻ��ֽ���

TIME_START				= 19		-- �Ի�֮ҹ����ʱ��
TIME_CLOSE				= 23		-- �Ի�֮ҹ�ر�ʱ��

map_multiple = {
	SYS_BATTLE,						-- ս����ս��
	SYS_COC,						-- �̻�Ľ���
	SYS_MASTER_RANDOMTASK,			-- ʦ�����������
	SYS_MASTER_REPEATTASK,			-- ʦ���ظ�������
	SYS_KILLER_TASK,				-- ɱ��������
	SYS_DRAGONBOAT					-- ���ۻ��ֽ���
}

-- ���塢������û��ɱ������
map_multiple_holiday = {
	SYS_BATTLE,						-- ս����ս��
	SYS_COC,						-- �̻�Ľ���
	SYS_MASTER_RANDOMTASK,			-- ʦ�����������
	SYS_MASTER_REPEATTASK,			-- ʦ���ظ�������
	SYS_DRAGONBOAT					-- ���ۻ��ֽ���
}

map_week_systems = {
	[0] = map_multiple_holiday,		-- ����
	[1] = map_multiple,				-- ��һ
	[2] = map_multiple,				-- �ܶ�
	[3] = map_multiple,				-- ����
	[4] = map_multiple,				-- ����
	[5] = map_multiple_holiday,		-- ����
	[6] = map_multiple_holiday		-- ����
}

map_sysnames = {
	{"Chi�n tr��ng", 			"Chi�n c�ng",		0},
	{"Th��ng h�i",			"",			0},
	{"Nhi�m v� s� m�n - ng�u nhi�n",	"",			0},
	{"Nhi�m v� s� m�n tu�n ho�n",	"�i�m t�ch l�y",		0},
	{"Nhi�m v� s�t th�",		"Kinh nghi�m",		0},
	{"Thuy�n r�ng",			"�i�m t�ch l�y",		0}
}

-- һ���ڵı������У���Ҫ����100��
map_week_multiples = {
	[0] = 200,	-- ����
	[1] = 150,	-- ��һ
	[2] = 150,	-- �ܶ�
	[3] = 150,	-- ����
	[4] = 150,	-- ����
	[5] = 150,	-- ����
	[6] = 200	-- ����
}

-- ���ѡ��һ��ϵͳ
function get_random_system()
	local wday = tonumber(date("%w"))
	local map = map_week_systems[wday]

	local yday = tonumber(date("%j"))
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	local sec = tonumber(date("%S"))
	local seed = yday * 86400 + hour * 3600 + min * 60 + sec
	randomseed(seed)
	for i=1,yday do
		random(1, 6)
	end

	--local system = random(1, getn(map))	-- ��ʱ����ս����Jeep tag
	local system = random(2, getn(map))
	return map[system]
end

-- ѡ����
function get_multiple()
	local wday = tonumber(date("%w"))
	return map_week_multiples[wday]
end
