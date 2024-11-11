Import("\\script\\missions\\yp\\ywz\\mission_head.lua")
Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\lib\\talktmp.lua")

function main()
	local msg = "N�i ��y ch��ng kh� m�t m�, � ��y s� khi�n cho c� b�p to�n th�n b� t� c�ng, ph�ng th� t�ng cao m�nh."
	local tSay = {
		"Gi�i thi�u ho�t ��ng/qxn_info",
		"Li�n quan Th� L�c Ba Phe/qxn_main",
		"Quy t�c ho�t ��ng/qxn_rule",
		"R�i kh�i Di�n V� Chi�n Tr��ng/qxn_leave",
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(msg, getn(tSay), tSay);
end

function qxn_info()
	Talk(1,"","Th� l�c Thi�n �m Gi�o d�n lui kh�i trung nguy�n, kh�i ph�c nguy�n kh�. Tri�u ��nh nh�m mu�n ng�n ch�n s� ph�n c�ng c�a Thi�n �m Gi�o, quy�t ��nh t�ng c��ng s�c m�nh c�a v� l�m, ban th��ng l�n cho Th� L�c Ba Phe ti�n h�nh di�n v�, �� x�p h�ng cho 3 th� l�c; Th� L�c Ba Phe-Di�n V� Chi�n chia th�nh 2 giai �o�n: X�y d�ng t� ��n th� l�c v� Th� L�c Ba Phe Di�n V�; trong Th� L�c Ba Phe-Di�n V� Chi�n, ��i hi�p c� bi�u hi�n ki�t xu�t s� nh�n ���c th�m ph�n th��ng. Hy v�ng c� th� gi�p �� m�i ng��i.")
end

function qxn_main()
	local msg = format("�i�m di�n v�: %d �i�m", ywzm_GetScore());
	local tSay = {
		--"��ȡBUFF�ӳ�/qxn_ItemExchgBuff",
		"Xem �i�m di�n v� th� l�c/qxn_ShowShiliScore",
		"Xem x�p h�ng �i�m di�n v� c� nh�n/qxn_ShowScoreRank",
		"\nT�i ch� xem xem th�i/nothing"
	}
	if ywzm_GetCamp() == 1 then
		tinsert(tSay, 1, "Nh�n BUFF c�a phe th�/qxn_GetProtectBuff");
	end
	Say(msg, getn(tSay), tSay);
end

function qxn_leave()
	Say("Quy�t ��nh mu�n r�i kh�i Di�n V� Chi�n Tr��ng ngay kh�ng?", 2, "Tho�t ngay/qxn_leave_do", "\nT�i ch� xem xem th�i/nothing")
end

function qxn_leave_do()
	DelMSPlayer(tbYWZ.missionID, ywzm_GetCamp());
end

function qxn_GetProtectBuff()
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(qxn_GetProtectBuff_CB);
end

function qxn_GetProtectBuff_CB(nCount, sdb)
	local nValue = 0;
	local nCamp,_ = ywzm_GetParam()
	for i = 1, nCount do
		local tData = sdb[i-1];
		if nCamp == tonumber(tData[1]) then
			nValue = tonumber(tData[2]);
			break
		end
	end
	local nBuff = 0;
	if nValue >= 300000 then
		nBuff = 300;
	elseif nValue >= 200000 then
		nBuff = 200;
	else
		nBuff = 100;
	end
	Say(format("�� x�y d�ng th� l�c ��t %d, c� th� nh�n ���c %d �i�m BUFF thu�c t�nh ph� ��ch", nValue, nBuff), 2, format("Nh�n /#qxn_GetProtectBuff_Do(%d)", nBuff), "H�y b�/nothing");
end

function qxn_GetProtectBuff_Do(nValue)
	CastState("state_destiny_attack_point_add", nValue, 3600*18, 1, 10001, 1);
	SyncCustomState(1, 10001, 1, "Phe th� c�ng th�m");
	Msg2Player(format("Ch�c m�ng b�n nh�n ���c %d �i�m thu�c t�nh ph� ��ch", nValue));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function qxn_ItemExchgBuff()
	local msg = "��i hi�p c� y�u c�u g�?";
	local tItem = {
		{50, 100},
		{100, 200},
		{150, 300},
		{200, 400},
		{250, 500},
		{300, 600},
		{500, 700},
		{700, 800},
		{900, 900},
		{1300, 1000},
	}
	local tSay = {};
	for i = 1, getn(tItem) do
		local section = format("N�p %d c�i %s (t�ng %d �i�m thu�c t�nh ph� ��ch)/#qxn_ItemExchgBuffDo(%d, %d)", tItem[i][1], "Anh D�ng Ch�ng", tItem[i][2], tItem[i][1], tItem[i][2])
		tinsert(tSay, section);
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	Say(msg, getn(tSay), tSay);
end

function qxn_ItemExchgBuffDo(nNum, nValue)
	if GetItemCount(2, 1,30969) < nNum then
		Talk(1,"",format("trong h�nh trang, s� l��ng c�a %s kh�ng �� %d", "Anh D�ng Ch�ng", nNum))
		return 0;
	end
	if DelItem(2, 1, 30969, nNum) ~= 1 then
		return 0;
	end
	CastState("state_destiny_attack_point_add", nValue, 3600*18, 1, 10002, 1);
	SyncCustomState(1, 10002, 1, "Anh d�ng c�ng th�m");
	Msg2Player(format("Ch�c m�ng b�n nh�n ���c %d �i�m thu�c t�nh ph� ��ch", nValue));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	AddRuntimeStat(36, 6, 0, nNum);
end

function qxn_ShowShiliScore()
	local tSay = {
		format("�i�m di�n v� th� l�c ��i L� %d �i�m/nothing", GetMissionV(tbYWZ.mv1)),
		format("�i�m di�n v� th� l�c Th� Ph�n %d �i�m/nothing", GetMissionV(tbYWZ.mv2)),
		format("�i�m di�n v� th� l�c T�y H� %d �i�m/nothing", GetMissionV(tbYWZ.mv3)),
		"\nT�i ch� xem xem th�i/nothing"
	}
	Say("�i�m di�n v� Th� L�c Ba Phe nh� sau:", getn(tSay), tSay);
end

function qxn_ShowScoreRank()
	local nMapID = GetWorldPos();
	local t = ywzm_GetRankTable(nMapID)
	local tSay = {}
	for i = 1, getn(t) do
		tinsert(tSay, format("%d, %s (%d �i�m di�n v�)/nothing", t[i][1], t[i][2], t[i][3]));
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	Say("B�ng x�p h�ng �i�m di�n v� c� nh�n:", getn(tSay), tSay);
end

function qxn_rule()
	local npcName = GetNpcName(GetTargetNpc());
	local tbSay = {};
	local msg = "\n1. �i�u ki�n tham gia: Trong giai �o�n 1, ng��i ch�i n�m trong TOP 100 �i�m x�y d�ng c�a th� l�c. Th�i gian ho�t ��ng: 20:00-21:00 th� 7 h�ng tu�n.\n2. Ng��i ch�i kh�ng th� t�n c�ng c� c�a phe m�nh, sau khi ng��i ch�i th� l�c kh�c ��nh b�i c� s� l�p t�c t�o m�i th�nh c� c�a th� l�c kh�c, ng��i ch�i ��nh b�i c� s� nh�n ���c 50 �i�m di�n v�.\n3. Trong ph�m vi c� c�a th� l�c, ch� c� ng��i ch�i c�n s�ng c�ng phe v�i c� m�i nh�n ���c �i�m di�n v�, m�i 5 gi�y nh�n ���c 3 �i�m di�n v�.\n4. N�u trong th�i gian giai �o�n 2 c�a ho�t ��ng ti�n h�nh ��i th� l�c, th� �i�m di�n v� c�a ng��i ch�i n�y ch� gi� l�i 20%.\n5. Ph�n th��ng x�p h�ng th� l�c v� x�p h�ng c� nh�n ��u c�n �i�m di�n v� c� nh�n c�a ng��i ch�i ��t 300 �i�m m�i ���c nh�n.\n6. Trong giai �o�n 2 c�a ho�t ��ng, khi ng��i ch�i ti�u di�t ng��i ch�i th� l�c kh�c s� nh�n ���c 2 �i�m di�n v�, khi m�t ng��i ch�i li�n t�c t� vong 2 l�n, n�u trong v�ng 3 ph�t b� ��nh b�i l�n n�a th� ng��i ��nh b�i ng��i ch�i n�y s� kh�ng nh�n ���c �i�m di�n v�.\n7. Sau khi giai �o�n 2 b�t ��u 5 ph�t, ��ng truy�n t�ng ��n t�nh n�ng Ch��ng Kh� S�n C�c.";
	tbSay.msg = msg;
	tbSay.sel = {
		{"\n Ph�n h�i","main"},
		{"\n Tho�t ", "nothing"},
	};
	temp_Talk(tbSay);
end
