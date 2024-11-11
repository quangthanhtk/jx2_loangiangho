-- =====================================================
-- ��ʱ�������û��npc�ŵ����λ�õĽű�
-- =====================================================

-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("NPC ho�t ��ng Tr�ng r�m s� t�y l�c xu�t hi�n")
	
	-- һ��Сʱһ��
	TaskInterval(60)
	
	-- ���ô���ʱ��
	local nHour = tonumber(date("%H"))
	
	if nHour >= 22 or nHour <= 7 then  --23�㵽8��֮�䲻����
		nHour = 9
	else
		nHour = nHour + 1
	end
	
	-- ��ǰrelay��������һ��Сʱ�ͼ�������
	TaskTime(nHour, 0)

	-- �ظ�ִ�����޴���
	TaskCountLimit(0)
	
	local msg = "Ti�u th� s� xu�t hi�n l�c"..nHour.." gi� 0 ph�t xu�t hi�n "
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()

	--    ���еص㣺
	tMap = {
		{"Tuy�n Ch�u", 100, 1459, 2811},
		{"Bi�n Kinh", 200, 1169, 2845},
		{"Th�nh ��", 300, 1653, 3559},
		{"T��ng D��ng", 350, 1436, 2808},
		{"D��ng Ch�u", 150, 1680, 3118},
		{"��i L�", 400, 1485, 3018},
	}
		
	local nIndex = random(1, 6)
	local nHour = tonumber(date("%H"))
	if nHour < 23 and nHour > 8 then
		local msg="Ti�u th� s� xu�t hi�n � v� tr� m�i:"..tMap[nIndex][1].."!"
		OutputMsg(format(msg))
	
		-- ִ���ٻ�����̻�npc�Ľű�
		GlobalExecute(format("dw abluemoon_start(%d)", nIndex))
	end
end;

