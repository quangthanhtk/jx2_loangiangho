Include("\\RelaySetting\\Task\\silingding_string.lua")

function TaskShedule()
	TaskName("");	
	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(11,0);
        -- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()

    local nRandom = random(1,5)
    msg = format(VET_201008_02_STR_SILINGDING_CITY_NAME[0],VET_201008_02_STR_SILINGDING_CITY_NAME[nRandom])
    OutputMsg(format(msg));
    GlobalExecute(format("dw tianzhansilingboss(%d)",nRandom));
end
