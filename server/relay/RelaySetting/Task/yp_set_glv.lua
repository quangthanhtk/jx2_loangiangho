function TaskShedule()
	TaskName("PVP ngo�i th�nh");

	-- ÿСʱboss����
	TaskInterval(60);

	-- ���ô���ʱ��
	local nHour = tonumber(date("%H"));
	nHour = nHour + 1;
	if nHour >= 24 then
		nHour = nHour - 24;
	end

	TaskTime(nHour,0);
	OutputMsg(format("T�i th�nh c�ng PVP ngo�i th�nh"));

	-- ִ�����޴�
	TaskCountLimit(0);
end


function TaskContent()
	local nHour = tonumber(date("%H"));
	if nHour == 4 then --�賿4�� ���ٺð���
		GlobalExecute("dw yp_write_data()");
	end
end
            