--=============================================
--create by baiyun 2009.12.21
--describe:Խ�ϰ�����ʹ���ճ����� relay���������ļ�
--=============================================

--�����ճ������б�
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu ph�c  Ph��ng Ho�ng t�i Th�i H� �o c�nh", 10, {"Kinh nghi�m Ph�ng ho�ng", "Luy�n Ph�ng Ho�ng", "B�o Th�ch Ph�ng ho�ng", "Trang b� Ph�ng ho�ng"}},
    {"Thu ph�c Th�c Nh�n Th�o t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m Th�c nh�n th�o", "Luy�n Th�c Nh�n Hoa", "B�o Th�ch Th�c Nh�n hoa", "Trang b� Th�c nh�n th�o"}},
    {"Thu ph�c Th� t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m Th�", "Luy�n Th� t�", "B�o Th�ch Th�", "Trang b� Th�"}},
    {"Thu ph�c H�a K� L�n t�i Th�i H� �o c�nh", 10, {"Kinh nghi�m H�a K� L�n", "Luy�n H�a K� L�n", "B�o Th�ch H�a K� L�n", "Trang b� H�a K� L�n"}},
    {"Thu ph�c B� T�y T�ng t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m B� T�y T�ng", "Luy�n Mao Ng�u", "B�o Th�ch B� T�y T�ng", "Trang b� B� T�y T�ng"}},
    {"Thu ph�c C�m Ti�n T� t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m C�m Ti�n T�", "Luy�n C�m Ti�n T�", "B�o Th�ch C�m Ti�n T�", "Trang b� C�m Ti�n T�"}},
}

--�Ŷ��ճ������б�
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t�m B�c L�c L�m L�nh", 10, "B�c L�c L�m l�nh"},
    {"Truy t�m Tr�c �nh th��ng", 20, "Tr�c �nh Th��ng"},
    {"Truy t�m Tuy�t T�nh Th�ch", 20, "Tuy�t T�nh Th�ch"},
    {"Truy t�m L�nh B�i T�ng Qu�n ngo�i vi�n", 5, "L�nh b�i t�ng qu�n ngo�i vi�n"},
    {"Truy t�m L�nh B�i T�ng qu�n n�i vi�n", 5, "L�nh b�i t�ng qu�n n�i vi�n"},
    {"Truy t�m Vi�t N� Ki�m", 5, "Vi�t N� ki�m"},
    {"Truy t�m Trang Ch� Kim �n", 15, "Trang ch� kim �n"},
    {"Truy t�m Tr��ng L�o ch� ho�n", 20, "Tr��ng L�o Ch� Ho�n"},
}

---- ��ʱ�趨
function TaskShedule()
	-- ��������
	TaskName("nhi�m v� th��ng nh�t c� nh�n".."nhi�m v� th��ng nh�t t� ��i")
	
	-- 24Сʱһ��
	TaskInterval(24 * 60)
	
	TaskTime(0, 0)
	
	-- �ظ�ִ�����޴���
	TaskCountLimit(0)
	
	--local msg = "ɱ���û��"..nHour.."ʱ"..nMinute.."�ֿ�ʼ��"
	--OutputMsg(format(msg))
end

-- ��ʱִ�е�����
function TaskContent()
    local nPersonalTask = get_rand_item_by_table(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2);
    local nTeamTask = get_rand_item_by_table(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 3);
    GlobalExecute(format("dw InitDaliyTask(%d, %d)", nPersonalTask, nTeamTask));
end

function get_rand_item_by_table(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

