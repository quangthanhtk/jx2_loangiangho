function TaskShedule()
		TaskName("Hoa Tr�ng D��ng");	
		-- 5����һ��
		TaskInterval(5);
		-- ���ô���ʱ��
		local nHour = tonumber(date("%H"))
		local nMinute = tonumber(date("%M"))
		
		if (nMinute >= 50) then
			nMinute = nMinute - 50
			if (nHour + 1 == 24) then
				nHour = 0
			else
				nHour = nHour + 1
			end
		else
			nMinute = nMinute + 10
		end
		
		-- ��ǰrelay������10���Ӿͼ�������
		TaskTime(nHour, nMinute)
		-- ִ�����޴�
		TaskCountLimit(0)
end

function TaskContent()
	GlobalExecute("dw double_nineth()")
end
