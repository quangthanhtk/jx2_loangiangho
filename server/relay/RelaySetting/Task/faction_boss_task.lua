-- =====================================================
-- ��ʱ������boss����Ĵ��boss�ŵ����λ�õĽű�
-- Tony(Jizheng)
-- Dec 20th, 2006
-- =====================================================

-- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("Nhi�m v� BOSS m�n ph�i")
	-- 24��Сʱһ��
	TaskInterval(1440)
	
	-- ���ô���ʱ��
	local nHour = 21
	local nMinute = 0
	TaskTime(nHour, nMinute)
	-- �ظ�ִ�����޴���
	TaskCountLimit(0)
	
	local msg = "NCP nhi�m v� boss m�n ph�i t�y l�c�"..nHour.." gi� "..nMinute.."ph�t xu�t hi�n!"
	OutputMsg(format(msg))
end;

-- ��ʱִ�е�����
function TaskContent()

	--    boss���֣�
	local strBossName = 	{"Thanh Th�", "Huy�n Ch�n", "D��ng Di�n ��c", "���ng H�", "Ho�ng Ch�nh Nh�t", "C� M�c", "Tu� Minh"}
	
	local szPos = {1, 2, 3, 4, 5, 6, 7}
	local nPos1 = 0
	local nPos2 = 0
	local nPos3 = 0
	
	-- ��7��boss�м����ѡ��3��
	local nSel = random(1, 7)
	nPos1 = szPos[nSel]				-- ��һ��
	szPos[nSel] = szPos[7]
	
	nSel = random(1, 6)
	nPos2 = szPos[nSel]				-- �ڶ���
	szPos[nSel] = szPos[6]
	
	nSel = random(1, 5)
	nPos3 = szPos[nSel]				-- ������
	
	local msg="Boss m�n ph�i s� xu�t hi�n �:"..strBossName[nPos1]..", "..strBossName[nPos2]..", "..strBossName[nPos3].."!"
	OutputMsg(format(msg))
	
	-- ������������������boss
	GlobalExecute(format("dw call_faction_bt_boss(%d,%d,%d)", nPos1, nPos2, nPos3))
end;

