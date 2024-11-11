-- =====================================================
-- ��ʱ���̻�������̵�npc�ŵ����λ�õĽű�
-- Tony(Jizheng)
-- =====================================================

-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("NPC nhi�m v� Th��ng H�i s� thay ��i c�c v� tr� xu�t hi�n")
	
	-- ���Сʱһ��
	TaskInterval(30)
	
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

	-- �ظ�ִ�����޴���
	TaskCountLimit(0)
	
	local msg = "NPC th��ng h�i"..nHour.." gi� "..nMinute.."ph�t xu�t hi�n!"
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()

	--    ���еص㣺
	local strMapName = 	{"Tuy�n Ch�u", "Bi�n Kinh", "Th�nh ��", "T��ng D��ng", "D��ng Ch�u", "��i L�"}
	local nMapID 	 =	{100,  	 200,    300,    350,    150,    400}
	local nMapX 	 =	{1499,   1439,   1794,   1497,   1653,   1428}
	local nMapY 	 =	{3059,   2956,   3608,   2882,   3109,   3005}
	
	local nIndex = random(1, 6)
	local msg="NPC th��ng h�i s� xu�t hi�n �:"..strMapName[nIndex].."!"
	OutputMsg(format(msg))

	-- ִ���ٻ�����̻�npc�Ľű�
	GlobalExecute(format("dw random_shop(%d,%d,%d)", nMapID[nIndex], nMapX[nIndex], nMapY[nIndex]))
end;

