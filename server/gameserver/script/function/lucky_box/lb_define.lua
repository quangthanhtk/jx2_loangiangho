--����
DebugOutput = nothing

--�����ʱ��
LB_START_TIME = {2014,6,13,0,0,0};
LB_STOP_TIME = {2024,7,1,0,0,0};

--�������ñ�
LB_AWARD_CONFIG = "\\script\\function\\lucky_box\\lucky_box.txt"

--��ѿ�������
LB_FREE_USE_MAX = 80;
--�շѿ�������
LB_IB_ITEM_USE_MAX = 1000;

--�������
LB_FREE_COST_ITEM = {2, 1, 30499, 2, "Hu�n ch��ng anh h�ng"};
--�շ�����
LB_IB_COST_ITEM = {2, 1, 30230, 3, "Hu�n ch��ng anh h�ng"};

-------------
EVENT_QUAYTHUONG_MAX_LOTTERY_NUM=10000;

----------------Ph�n th��ng m�c quay th��ng
g_tbQuayThuong_AccumulateAward = {
    { nRequireNum = 100, szName = "Moc Thuong 500",
      tbAward = {
          { tbProp = { 2, 102, 225 }, nStack = 10},
          { tbProp = { 2, 1, 30912 }, nStack = 1000 },
          { tbProp = { 2, 1, 31402 }, nStack = 100},
          { tbProp = { 2, 1, 31401 }, nStack = 100 },
        }
    },
    { nRequireNum = 200, szName = "B� �i�n 25", tbAward = { tbProp = { 2, 1, 40058 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 500, szName = "B� �i�n 27", tbAward = { tbProp = { 2, 1, 40057 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 1000, szName = "T�i �� qu� 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 1500, szName = "C� Kim Th�ch", tbAward = { tbProp = { 2, 201, 14 }, nStack = 3, nStatus = 4 }, },
    { nRequireNum = 2000, szName = "Th��ng h�i Di Ch�u 5", tbAward = { tbProp = { 2, 102, 223 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 2500, szName = "Thi�n M�n Kim L�nh", tbAward = { tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 3000, szName = "Thi�n Cang L�nh", tbAward = { tbProp = {  2, 95, 204 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 4000, szName = "Th�n Nguy�t L�nh", tbAward = { tbProp = { 2, 1, 31256 }, nStack = 1, nStatus = 4 }, },
    { nRequireNum = 5000, szName = "�i�m Tinh Ng�c", tbAward = { tbProp = { 2, 201, 16 }, nStack = 1, nStatus = 4 }, },
    --{ nRequireNum = 3000, szName = "1 B� Thi�n H� V� Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B�o Trai')" }, },
    --{ nRequireNum = 1000, szName = "4 Qu�n C�ng Huy Ho�ng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    --{ nRequireNum = 20000, szName = "2 C� Ph�-T�i T�n Quy�n", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 2, nQuality = szRareMsg }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "3 C� Ph�-T�i T�n Quy�n", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 3, nQuality = szRareMsg }, },
}



