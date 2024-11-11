Include("\\script\\isolate\\functions\\tong_title\\daily_task.lua")
Include("\\script\\isolate\\functions\\tong_extension\\main.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\missions\\kuafu_boss\\bossfight_head.lua")
Import("\\script\\lib\\globalfunctions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function main()
	npc_talk_main()
end

function npc_talk_main()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C� th� gi�p g� ���c b�n ?")
    local tbSay = {}
    
    tinsert(tbSay, format("%s/desc", "Gi�i thi�u t�nh n�ng"))
    tinsert(tbSay, format("%s/npc_talk_finish_rand_task", "Nhi�m v� h�ng ng�y"))
    tinsert(tbSay, format("%s/open_equip_shop", "C�a h�ng Bang h�i."))
    tinsert(tbSay, format("%s/TongExt_DevotionTalk", "G�p v�t ph�m"))
    --tinsert(tbSay, format("%s/TongExt_BuyBossTicket", "Mua Tri�u G�i Ph�")) --LongDaiKa: ��ng t�nh n�ng
	--tinsert(tbSay, format("%s/TongExt_GiveGiftTalk", "Ph�t ph�c l�i bang")) --LongDaiKa: ��ng t�nh n�ng
	--tinsert(tbSay, format("%s/GetKFBossAward", "Nh�n th��ng Chi�n BOSS Li�n Server")) --LongDaiKa: ��ng t�nh n�ng
    --tinsert(tbSay, format("%s/Exchange_ZhiYangHuan", "��i Ch� D��ng Ho�n")) --LongDaiKa: ��ng t�nh n�ng
    tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function Exchange_ZhiYangHuan()
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "1 Th�i Nh�t L�nh ��i 15 Ch� D��ng Ho�n, ��ng �?")
    local nTaiyi = GetItemCount(2,	1,	30687)
    if nTaiyi == 0 then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "1 Th�i Nh�t L�nh ��i 15 Ch� D��ng Ho�n, hi�n kh�ng �� Th�i Nh�t L�nh."))
        return
    end
    local tbSay = {}
    tinsert(tbSay, format("%s/Exchange_ZhiYangHuan_Confirm", "X�c ��nh "))
    tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
    Say(szTitle, getn(tbSay), tbSay)
end

function Exchange_ZhiYangHuan_Confirm()
    local nTaiyi = GetItemCount(2,	1,	30687)
    AskClientForNumber("Exchange_ZhiYangHuan_CB",1,min(999,nTaiyi),"Th�i Nh�t L�nh Mi�n Ph�");
end

function Exchange_ZhiYangHuan_CB(nCount)
    local nZhiyang = nCount * 15
    local needbag = ceil(nZhiyang / 9999) 
    if gf_Judge_Room_Weight(needbag,needbag,"") ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
        return
    end
    local nHave = GetItemCount(2,1,30687)
    if nHave  < nCount then
        Talk(1,"","Hi�n kh�ng �� Th�i Nh�t L�nh!")
        return
    end
    if DelItem(2,	1,	30687, nCount) == 1 then
        AddItem(2,	1,	31255, nZhiyang)
    end
end


function desc()
	local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Thi�n �m Gi�o lui gi� � T�y V�c, trung nguy�n kh�p n�i ���c ngh� ng�i ng�n h�n. L�c n�y V� L�m Minh hy v�ng c�c bang h�i l�n c� th� nhanh ch�ng l�p bang, b�i d��ng hi�p s� c��ng m�nh, chu�n b� t�t c�ng vi�c ch�ng l�i Thi�n �m Gi�o quay tr� l�i, v� v�y V� L�m Minh �y th�c t�i ��n gi�p �� m�i ng��i, t�i s� c�ng b� m�t s� nhi�m v� cho c�c v�, sau khi ho�n th�nh c� th� nh�n ���c �� c�ng hi�n bang h�i, n�u hi�p s� c� k�ch ho�t th� th�ng th� c�n c� th� nh�n ���c ph�n th��ng g�p b�i. �� c�ng hi�n c� th� d�ng � trong bang h�i �� nh�n ���c danh hi�u bang h�i v� cung c�p ti�u hao danh hi�u bang h�i, c�ng c� th� ho�n ��i m�t s� �� v�t � ��y. Hy v�ng c� th� gi�p ���c m�i ng��i.")
    local tbSay = {}
    tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
    tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    
    Say(szTitle, getn(tbSay), tbSay)
end

function open_equip_shop()
	if GetTongName() == "" then
		Talk(1, "", "M�i gia nh�p bang h�i tr��c");
		return 0;
	end
	WLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_BANGHOI);
end

function GetKFBossAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "�� qu� h�n nh�n th��ng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Th�i gian nh�n th��ng BOSS Li�n Server l� 22:00-23:59 ng�y di�n ra thi ��u.")
	end
	local szMsg = "Tham d� Chi�n BOSS Li�n Server s� ���c nh�n th��ng h�p d�n."
	local tTab = {
		format("L�nh ph�n th��ng bang h�i/GetTongAward"),
		format("Nh�n Th��ng K�t Li�u-Bang H�i/GetTongLastHitAward"),
		format("Nh�n Th��ng K�t Li�u-C� Nh�n/GetPersonLastHitAward"),
		format("Nh�n Th��ng Tham D�-C� Nh�n/GetPersonJoinAward"),
		format("\n h�y b�/nothing"),
	}
	Say(szMsg, getn(tTab), tTab)
end

function GetTongAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "�� qu� h�n nh�n th��ng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Th�i gian nh�n th��ng BOSS Li�n Server l� 22:00-23:59 ng�y di�n ra thi ��u.")
	end

	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 and nTongDuty ~= 2 and nTongDuty ~= 3 then
		return Talk(1,"","Ch� c� bang ch�, ph� bang ch� ho�c tr��ng l�o m�i c� th� nh�n ph�n th��ng Bang h�i")
	end

	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", g_TongAwardRecord[szRealmTongName][4]))
	end
	local sdb = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2)
	sdb:apply2(GetTongAwardCB)
end

function GetTongAwardCB(nCount, sdb)
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", g_TongAwardRecord[szRealmTongName][4]))
	end
	for i = 0, nCount - 1 do
		local tData = sdb[i]
		gf_PrintTable(tData)
		if tData[1] and tData[1] == szRealmTongName and tData[2] == 1 then
			return Talk(1, "", "Th�nh vi�n bang ta �� nh�n th��ng h�ng bang h�i r�i.")
		end
	end
	local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2, 2)
	--local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2)
	sdb.sortType = 2
	sdb:apply2(GetTongRankData)
end

function GetTongRank(nCount, sdb)
	local nDate = gf_TodayDate()
	local szTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local nRank = 0;
	local tData = {}
	for i = 0, nCount - 1 do
		tData = sdb[i]
		if szTongName == tData[1] then
			nRank = i + 1;
			break;
		end
	end
	--return 16, {16, 20000}
	return nRank, tData
end

function GetTongRankData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Y�u c�u s� li�u li�n server th�t b�i.")
	end
	local nRank, tData = GetTongRank(nCount, sdb)
	if nRank <= 0 then
		return Talk(1, "", "Bang c�a ��i hi�p kh�ng tham d� ho�t ��ng l�n n�y, kh�ng th� nh�n th��ng")
	end
	
	if nRank <= 15 then
		GiveTongRankAward(nRank, tData)
	else
		GiveTongJoinAward(nRank, tData)
	end
end

function GiveTongRankAward(nRank, tData)
	local szMsg = format("Bang c�a ��i hi�p nh�n %f �i�m trong ho�t ��ng l�n n�y, ��t h�ng %d", tData[2], nRank)
	local tSel  = {
		format("Nh�n ph�n th��ng x�p h�ng/#GetRankAward(%d, %d)",tData[2], nRank),
		"\n t�m th�i ch�a mu�n/nothing",
	}
	print("GiveTongRankAward")
	Say(szMsg, getn(tSel), tSel)
end

function GetRankAward(nScore, nRank)
	
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", g_TongAwardRecord[szRealmTongName][4]))
	end
	local s = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2);
	s:apply2(callout(GetRankAwardCB, nScore, nRank));
end

function GetRankAwardCB(nScore, nRank, nCount, sdb)
	local nBagCount = g_tTongRankBagCount[nRank]
	if not nBagCount then
		return Talk(1, "", format("Bang c�a ��i hi�p ��t h�ng %d, kh�ng th� nh�n th��ng h�ng."))
	end
	
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local tData = sdb[RealmTongName];
	if g_TongAwardRecord[RealmTongName] and g_TongAwardRecord[RealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", g_TongAwardRecord[RealmTongName][4]))
	end
	if tData and tData[1] == 1 and tData[4] then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", tData[4]))
	end
	sdb[RealmTongName] = {"ddds", 1, nRank, nScore, GetName()};
	g_TongAwardRecord[RealmTongName] = {1, nRank, nScore, GetName()};
	
	--������
	gf_AddItemEx2({2,1,31418,nBagCount}, "T�i Qu� BOSS Li�n Server", "Ho�t ��ng BOSS Li�n Server", "Nh�n Th��ng H�ng BOSS Li�n Server", 0, 1)
	
	AddRuntimeStat(102, 1, 0, 1);
	
end

function checkJoinAward(nRank, tData)
	if tData[2] > 1000 then
		return 1
	end
	return 0
end

function GiveTongJoinAward(nRank, tData)
	if checkJoinAward(nRank, tData) ~= 1 then
		return Talk(1, "", "Bang c�a ��i hi�p ch�a nh�n ���c th��ng trong ho�t ��ng BOSS Li�n Server.")
	end
	
	local szMsg = format("Bang c�a ��i hi�p nh�n %f �i�m trong ho�t ��ng l�n n�y, ��t h�ng %d, th� hi�n t�ch c�c, nh�n ���c Th��ng Tham D�.", tData[2], nRank)
	local tSel  = {
		format("Nh�n Th��ng Tham D�/#GetTongJoinAward2(%d, %d)",tData[2], nRank),
		"\n t�m th�i ch�a mu�n/nothing",
	}
	Say(szMsg, getn(tSel), tSel)
end

function GetTongJoinAward2(nScore, nRank)
	local szRealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szRealmTongName] and g_TongAwardRecord[szRealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", tData[4]))
	end
	local s = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2);
	s:reflash();
	s:apply2(callout(GetTongJoinAwardCB, nScore, nRank));
end

function GetTongJoinAwardCB(nScore, nRank, nCount, sdb)
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	local tData = sdb[RealmTongName];
	if g_TongAwardRecord[RealmTongName] and g_TongAwardRecord[RealmTongName][1] == 1 then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", g_TongAwardRecord[RealmTongName][4]))
	end
	
	if tData and tData[1] == 1 and tData[4] then
		return Talk(1, "", format("Ph�n th��ng �� ���c %s bang ta nh�n r�i.", tData[4]))
	end

	sdb[RealmTongName] = {"ddds", 1, nRank, nScore, GetName()};
	g_TongAwardRecord[RealmTongName] = {1, nRank, nScore, GetName()};
		--������
	gf_AddItemEx2({2,1,31418,2}, "T�i Qu� BOSS Li�n Server", "Ho�t ��ng BOSS Li�n Server", "Nh�n Th��ng Tham D� BOSS Li�n Server", 0, 1)
	
	AddRuntimeStat(102, 1, 0, 1);
end

function GetTongLastHitAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "�� qu� h�n nh�n th��ng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Th�i gian nh�n th��ng BOSS Li�n Server l� 22:00-23:59 ng�y di�n ra thi ��u.")
	end

	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 and nTongDuty ~= 2 and nTongDuty ~= 3 then
		return Talk(1,"","Ch� c� bang ch�, ph� bang ch� ho�c tr��ng l�o m�i c� th� nh�n ph�n th��ng Bang h�i k�t li�u Boss th�t")
	end

	if not g_LastHit then
		local s = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
		s:apply2(GetTongLastHitData);
		--s:delete()
	else
		if checkTongLastHit(g_LastHit) ~= 1 then
			return
		end
		GiveTongLastHitAward()
	end
end

function checkTongLastHit(tData)
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if not (tData and tData[3] and tData[3] == RealmTongName) then
		Talk(1, "", "Bang c�a ��i hi�p kh�ng ph�i ng��i k�t li�u BOSS, kh�ng th� nh�n th��ng n�y.")
		return 0
	end
	if tonumber(tData[4]) == 1 then
		Talk(1, "", format("Ph�n th��ng �� ���c %s trong bang c�a ��i hi�p nh�n r�i.", tData[5]))
		return 0
	end
	return 1
end

function GetTongLastHitData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Bang c�a ��i hi�p kh�ng ph�i ng��i k�t li�u BOSS, kh�ng th� nh�n th��ng n�y.")
	end
	local tData = sdb["LastHit"]
	g_LastHit = tData
	if checkTongLastHit(tData) ~= 1 then
		return
	end
	GiveTongLastHitAward()
end

function GiveTongLastHitAward()
	--��¼�콱��¼
	g_LastHit				 = {g_LastHit[1], g_LastHit[2], g_LastHit[3], 1, GetName()}
	local sdb				 = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
	sdb["LastHit"]   = {"sdsds", g_LastHit[1], g_LastHit[2], g_LastHit[3], 1, GetName()}
	--������
	gf_AddItemEx2({2,95,204,5},"Thi�n Cang L�nh", "Ho�t ��ng BOSS Li�n Server", "Th��ng K�t Li�u BOSS Li�n Serve (Bang)", 0, 1)
	gf_AddItemEx2({2,1,30370,5},"Thi�n M�n Kim L�nh", "Ho�t ��ng BOSS Li�n Server", "Th��ng K�t Li�u BOSS Li�n Serve (Bang)", 0, 1)
	AddRuntimeStat(102, 2, 0, 1);
end

function GetPersonLastHitAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "�� qu� h�n nh�n th��ng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Th�i gian nh�n th��ng BOSS Li�n Server l� 22:00-23:59 ng�y di�n ra thi ��u.")
	end
	if not g_LastHit then
		local s = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
		s:apply2(GetPersonLastHitData);
	else
		if checkPersonLastHit(g_LastHit) ~= 1 then
			return
		end
		GivePersonLastHitAward()
	end
end

function checkPersonLastHit(tData)
	local RealmName = format("%s*%s", GetRouterGroupName(), GetName());
	if not (tData and tData[1] and tData[1] == RealmName) then
		Talk(1, "", "��i hi�p kh�ng ph�i ng��i k�t li�u BOSS, kh�ng th� nh�n th��ng n�y.")
		return 0
	end
	
	if tonumber(tData[2]) == 1 then
		Talk(1, "", "Kh�ng th� nh�n th��ng nhi�u l�n.")
		return 0
	end
	return 1
end

function GetPersonLastHitData(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Bang c�a ��i hi�p kh�ng ph�i ng��i k�t li�u BOSS, kh�ng th� nh�n th��ng n�y.")
	end
	
	local tData = sdb["LastHit"]
	g_LastHit 	= tData
	
	if checkPersonLastHit(tData) ~= 1 then
		return
	end
	
	GivePersonLastHitAward()
end

function GivePersonLastHitAward()
	--��¼�콱��¼
	g_LastHit				 = {g_LastHit[1], 1, g_LastHit[3], g_LastHit[4], g_LastHit[5]}
	local sdb				 = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2);
	sdb["LastHit"]   = {"sdsds", g_LastHit[1], 1, g_LastHit[3], g_LastHit[4], g_LastHit[5]}
	--������
	gf_AddItemEx2({2,95,204,2},"Thi�n Cang L�nh", "Ho�t ��ng BOSS Li�n Server", "Th��ng K�t Li�u BOSS Li�n Serve (C� Nh�n)", 0, 1)
	gf_AddItemEx2({2,1,30370,2},"Thi�n M�n Kim L�nh", "Ho�t ��ng BOSS Li�n Server", "Th��ng K�t Li�u BOSS Li�n Serve (C� Nh�n)", 0, 1)
	
	AddRuntimeStat(102, 3, 0, 1);
end

KFB_TSKID_ACTIVE_POINT 						= 3593
KFB_TASKID_PERSON_JOIN_AWARD_FLAG = 3597

function GetPersonJoinAward()
	if tonumber(date("%w")) ~= 6 then
		return Talk(1, "", "�� qu� h�n nh�n th��ng");
	end
	local nHour = tonumber(date("%H"))
	if nHour < 22 then
		return Talk(1, "", "Th�i gian nh�n th��ng BOSS Li�n Server l� 22:00-23:59 ng�y di�n ra thi ��u.")
	end
	if GetTask(KFB_TSKID_ACTIVE_POINT) < 5 then
		return Talk(1, "", "�i�m n�ng ��ng kh�ng ��, kh�ng th� nh�n th��ng.")
	end
	
	if GetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG) > 0 then
		return Talk(1, "", "�� nh�n th��ng r�i, kh�ng th� nh�n l�i.")
	end
	
	local szTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	if g_TongAwardRecord[szTongName] then
		local nRank = g_TongAwardRecord[szTongName][2]
		gf_SetLogCaption("KuaFuBossPersonalJoinAward")
		if nRank > 15 then
			gf_Modify("Exp", 300000000)
		else
			gf_Modify("Exp", 600000000)
		end
		gf_SetLogCaption("")
		SetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG, 1)
		AddRuntimeStat(102, 4, 0, 1);
		return
	end
	
	local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2, 2)
	sdb.sortType = 2
	sdb:apply2(GetTongRankData2)
	
end

function GetTongRankData2(nCount, sdb)
	if nCount <= 0 then
		return Talk(1, "", "Y�u c�u s� li�u li�n server th�t b�i.")
	end
	local nRank, tData = GetTongRank(nCount, sdb)
	
	if nRank <= 0 then
		return Talk(1, "", "Bang c�a ��i hi�p kh�ng tham d� ho�t ��ng l�n n�y, kh�ng th� nh�n th��ng")
	end
	
	if GetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG) > 0 then
		return Talk(1, "", "�� nh�n th��ng r�i, kh�ng th� nh�n l�i.")
	end
	
	local RealmTongName = format("%s*%s", GetRouterGroupName(), GetTongName())
	g_TongAwardRecord[RealmTongName] = {0, nRank, tData[2], ""};
	gf_SetLogCaption("KuaFuBossPersonalJoinAward")
	if nRank > 15 then
		gf_Modify("Exp", 300000000)
	else
		gf_Modify("Exp", 600000000)
	end
	gf_SetLogCaption("")
	SetTask(KFB_TASKID_PERSON_JOIN_AWARD_FLAG, 1)
	AddRuntimeStat(102, 4, 0, 1);
end