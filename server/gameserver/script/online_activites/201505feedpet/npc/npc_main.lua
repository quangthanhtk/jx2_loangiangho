--���npc�Ի�ѡ��
Include("\\script\\online_activites\\201505feedpet\\head.lua")
Include("\\script\\online_activites\\201505feedpet\\main.lua")

m_szNpcName ="��i S� ho�t ��ng"
SZ_NPC_TITLE_1505="Ch�o m�ng tham gia ho�t ��ng Hu�n luy�n th� m�a h�"
T_MAIN_DIALOG_1505={
	format("%s/do_desc", "Gi�i thi�u ho�t ��ng"),
	format("%s/do_get_tool", "Nh�n C�i Th� C�ng"),
	format("%s/#do_get_award(%d)", "Nh�n th��ng (Hu�n luy�n th� c�ng th��ng)", 1),
	format("%s/#do_get_award(%d)", "Nh�n th��ng (Hu�n luy�n th� c�ng hi�m)", 2),
	format("%s/do_get_follower", "Nh�n ���c 1 th� c�ng theo sau"),
}

function npc_talk_main_1505()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", m_szNpcName, "Ch�o m�ng tham gia ho�t ��ng Hu�n luy�n th� m�a h�")
	local tbSay = {}
	tinsert(tbSay, format("%s/do_desc", "Gi�i thi�u ho�t ��ng"))
	tinsert(tbSay, format("%s/do_get_tool", "Nh�n C�i Th� C�ng"))
	
	tinsert(tbSay, format("%s/#do_get_award(%d)", "Nh�n th��ng (Hu�n luy�n th� c�ng th��ng)", 1))
	tinsert(tbSay, format("%s/#do_get_award(%d)", "Nh�n th��ng (Hu�n luy�n th� c�ng hi�m)", 2))
	
	tinsert(tbSay, format("%s/do_get_follower", "Nh�n ���c 1 th� c�ng theo sau"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_desc()
	local szTitle = format("%s:%s", m_szNpcName, "Ch�o m�ng tham gia ho�t ��ng Hu�n luy�n th� m�a h�")
	local tbSay = {}
	tinsert(tbSay, format("%s/_desc1", "Gi�i thi�u hu�n luy�n th� c�ng"))
	tinsert(tbSay, format("%s/_desc2", "Gi�i thi�u y�n ti�c ngo�i tr�i"))
	if g_debug==1 then
		tinsert(tbSay, format("%s/on_daily_clear", "DailyReset"))
	end
	
	tinsert(tbSay, format("%s/npc_talk_main_1505", "tr� l�i"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc1()
	local szTitle = format("%s:%s", m_szNpcName, "T� 15/05 - 31/05, h�ng ng�y c� th� ��n ch� c�a l�o phu nh�n C�i Th� C�ng-Th��ng, m�i ng�y c� th� hu�n luy�n 5 Th� C�ng-Th��ng, khi �� c��ng tr�ng ��t 46 �i�m c� th� ��n ch� c�a ta �� nh�n th��ng. ��ng r�i, t�i ��ng v�t ph�m hu�n luy�n th� c�ng �� b� k� tr�m c��p �i, ng��i h�y ��n V��ng M�u ��ng 2 v� 3, Sa M�c M� Cung l� c� th� t�m ���c. N�u ng��i c�m th�y phi�n ph�c th� c� th� v�o Ng� C�c xem th�, trong �� c� v�t ph�m hi�m c� �� hu�n luy�n th� c�ng, ngo�i ra Ti�n Qu� m� c�c th� c�ng y�u th�ch c� th� gi�p b�n m�t tay.")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "tr� l�i"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _desc2()
	local szTitle = format("%s:%s", m_szNpcName, "T� 15/05 - 31/05,  t� 19:00-21:00 h�ng ng�y, l�o phu s� t� ch�c ti�c �� th��ng cho c�c hi�p kh�ch c� c�ng hu�n luy�n th� c�ng, do s� l��ng hi�p kh�ch qu� nhi�u n�n m�i ng��i ch� c� 10 ph�t �� �n ti�c, tuy th�i gian kh�ng nhi�u nh�ng c�ng ��ng qu�n mang theo m� t�u do l�o phu t�ng �� nh�p ti�c nh�!")
	local tbSay = {}
	
	tinsert(tbSay, format("%s/do_desc", "tr� l�i"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_get_tool()
	local nAwardCnt = get_award_count(1)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("S� l�n hu�n luy�n th� c�ng c�a h�m nay �� ��t t�i �a"))
		return
	end
	local t = g_tFeedPet.tToolItem[1]
	local ti = t[3]
	if BigGetItemCount(ti[1], ti[2], ti[3]) < 1 then
		AddItem(ti[1], ti[2], ti[3], 1)
	else
		Talk(1, "", format("�� c� C�i Th� C�ng"))
	end
end

function do_get_award(nLevel)
	local nAwardCnt = get_award_count(nLevel)
	local ncurPoint = get_cur_point(nLevel)
	if nAwardCnt >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1, "", format("S� l�n hu�n luy�n th� c�ng c�a h�m nay �� ��t t�i �a"))
		return
	end
	local t = g_tFeedPet.tToolItem[nLevel]
	local ti = t[3]
	if GetItemCount(ti[1], ti[2], ti[3]) < 1 then
		Talk(1, "", format("Ph�i ch�ng �� qu�n mang theo C�i Th� C�ng r�i?"))
		return
	end
	if ncurPoint ~=g_tFeedPet.nFeedTargetPoint then
		Talk(1, "", format("�� hu�n luy�n hi�n t�i: %d/%d, ch�a ho�n th�nh", ncurPoint, g_tFeedPet.nFeedTargetPoint))
		return
	end
	
	if DelItem(ti[1], ti[2], ti[3], 1) ~= 1 then
		Talk(1, "", format("Ph�i ch�ng �� qu�n mang theo C�i Th� C�ng r�i?"))
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	local tAward = g_tFeedPet.tMainAward[nLevel]
	gf_EventGiveRandAward(tAward.tRand, 10000, 1, "Ho�t ��ng hu�n luy�n th�", "1505activity");
	gf_EventGiveAllAward(tAward.tAll, "Ho�t ��ng hu�n luy�n th�", "1505activity");
	set_cur_point(nLevel, 0)
	set_award_count(nLevel, nAwardCnt + 1)
	Talk(1, "", format("�a t� c�c h� gi�p ch�ng t�i hu�n luy�n th� c�ng, ��y l� th� lao xin h�y nh�n l�y"))
end

function do_get_follower()
	rand_follower()
end
