-- ���۱�����ʱ��

-- INTERVAL_TIME = 120	-- ÿСʱ����
INTERVAL_TIME = 90	-- ÿСʱ����

function GetNextTime()
    -- local hour = tonumber(date("%H"));
    -- if (hour == 23) then
    -- 	hour = 0;
    -- else
    -- 	hour = hour + 1;
    -- end
    -- return hour, 0;
    local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
    local add = 10;
    if (min + add >= 60) then
        min = min + add - 60
        hour = hour + 1
        if (hour >= 24) then
            hour = 0
        end
    else
        min = min + add
    end
    return hour, min;
end

function TaskShedule()
	TaskName("Thi ��u thuy�n r�ng");	

	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Nhi�m v� thu th�p v�t ph�m b�t ��u v�o l�c %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()

    local nRandomSeed = tonumber(date("%y")..date("%m")..date("%d")..date("%H")..date("%M")..date("%S"));

	OutputMsg("Nhi�m v� thu th�p v�t ph�m b�t ��u ...");
	-- ����GameServer�ϵĽű�
	-- GlobalExecute("dw LoadScript([[\\settings\\trigger_collectionstart.lua]])");
	-- GlobalExecute(format("dw CollectionTaskStart(%d, %d, %d, %d)", 100, 100, 100, 100));
	
	-- ִ�п�ʼ�ռ�����ű�
	GlobalExecute(format("dw createDataCall(%d)", nRandomSeed));
end
