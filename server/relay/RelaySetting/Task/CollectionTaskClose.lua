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
    -- return hour, 5;
    local hour = tonumber(date("%H"));
    local min = tonumber(date("%M"));
    local add = 40;
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
	OutputMsg(format("Nhi�m v� thu th�p v�t ph�m k�t th�c v�o l�c %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	OutputMsg("��ng nhi�m v� thu th�p v�t ph�m...");
	-- ����GameServer�ϵĽű�
	-- GlobalExecute("dw LoadScript([[\\settings\\trigger_collectionclose.lua]])");
	GlobalExecute(format("dw closeDataCall(%d)", 0));
end
