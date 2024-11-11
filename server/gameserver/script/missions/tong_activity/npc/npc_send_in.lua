Include("\\script\\missions\\tong_activity\\head.lua")
Import("\\script\\missions\\tong_activity\\tong_activity_value.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\lib\\message.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

g_NpcName = "<color=green>S� Gi� Ho�t ��ng Bang<color>:";
g_MyFileName = "\\script\\missions\\tong_activity\\npc_send_in.lua";

g_tbNeedItem = {2,111,149,1}
g_nMaxMissionsCount = 30; --����GS����ܿ����İ������

function get_my_tong_map_id()
	--return tTongValues[enumTongValue_ActivityMapId];
	return TongActivity_GetTongValue(enumTongValue_ActivityMapId);
end

function check_mission_time()
	local nWeek = tonumber(date("%w"));
	local nTime	= tonumber(date("%H%M"))
	if (nWeek == 1 and nTime < 200) or (nWeek == 0 and nTime > 2200) then		
		return 0;
	end
	
	return 1;
end

function get_mission_opened()
	if TongActivity_GetTongValue(enumTongValue_ActivityOpenTime) > 0 then	
		return 1;
	else
		return 0;
	end
end

function time_str_to_num(v)
	local nDate = floor(v / 10000);
	local nTime = mod(v, 10000);
	local nH = floor(nTime / 100);
	local nM = mod(nTime, 100);
	
	return nDate, nH * 60 + nM;
end

--function is_mission_can_enter()
--	local v = TongActivity_GetTongValue(enumTongValue_ActivityOpenTime);
--	if v > 0 then
--		local nDate, nTime = time_str_to_num(v);
--		local nNowDate, nNowTime = time_str_to_num(tonumber(date("%d%H%M")));
--		if (nNowDate == nDate) and ((nNowTime - nTime) < 30) then
--			return 1; --30�����ڿ���������븱��
--		end
--	end	
--	
--	return 0;
--end
--
function is_player_can_enter()
	local v1 = TongActivity_GetTongValue(enumTongValue_ActivityOpenTime);
	local v2 = GetTask(TASKID_TONG_JOIN_ACTIVITY_TIME);
	if (v1 > 0) and (v2 == 0) then
		return 1;
	end
	
	if (v1 > 0) and (v2 > 0) then
		local nDate1, nTime1 = time_str_to_num(v1);
		local nDate2, nTime2 = time_str_to_num(v2);	
		
		if (nDate2 == nDate1) and ((nTime2 - nTime1) < 60) then
			return 1; --�����Ѿ���������������ϴν��븱��ʱ����븱������ʱ������60���ӣ������������
		end
	end	
	
	return 0;
end

function is_mission_can_enter()
	local nMapID = TongActivity_GetTongValue(enumTongValue_ActivityMapId);
	if nMapID == 0 then
		return 0;
	end
	local nMissionMapID = mf_GetMissionV(tbTongActivity.missionID, tbTongActivity.mv6, nMapID);
	if nMissionMapID ~= nMapID then
		return 0;
	end
	
	return 1;
end

--function is_player_can_enter()
--	if GetTask(TASKID_TONG_JOIN_ACTIVITY_TIME) ~= 0 then
--		return 0;
--	end
--	
--	return 1;
--end

function do_open_activity()
	local nNow = tonumber(date("%d%H%M"));
	local nIsOpen = get_mission_opened();

	if nIsOpen == 1 then
		--�����Ѿ�������ֱ�ӽ���
		enter_mission();
	else		
		--����û�п���������������
		
		--���������ϵĸ������������Ƿ�̫��
		local tMapId = gf_GetDataTable(GetSameMaps(tbTongActivity.realMapID));
		if getn(tMapId) > g_nMaxMissionsCount then
			Talk(1,"", g_NpcName .. "Server �ang b�n, ��i hi�p ��i sau h�y ��n.");
			return 0;
		end
		 
		--�۳�����  --��Ҫ��Ʊ��
		-- if DelItem(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3], g_tbNeedItem[4]) ~= 1 then
		-- 	Talk(1,"", g_NpcName .. "˵�õİ���ټ����أ�");
		-- 	return 0;
		-- end
		
		nMapID = tbTongActivity:Create();
		TongActivity_SetTongValue(enumTongValue_ActivityOpenTime, nNow);
		TongActivity_SetTongValue(enumTongValue_ActivityMapId, nMapID);
		SetTask(TASKID_TONG_ACTIVITY_MAP,nMapID)
		AddRuntimeStat(54, 1, 0, 1) --��������ͳ��
		tbTongActivity:Enter(nMapID,1);
		
		-- ds_TONG_DATA:AddStatValue(1, 4, 1); --������㣺��¼�������
		
		SendTongMessage("D��ng Ch�u Gia C�t C�m �� m� ���ng ��n khu v�c ho�t ��ng bang, tham d� �� nh�n th��ng.");
		--����־
		WriteLog(format("[%s] [role:%s(acc:%s)] [tong:%s] [duty:%d] [M� ho�t ��ng bang %d]",
				"TongActivity", GetName(), GetAccount(), GetTongName(), GetTongDuty(), nNow ));
	end
end

function enter_mission()
	local nMapID = 0;
	local nIsOpen = get_mission_opened();
	if nIsOpen == 1 then
		if is_mission_can_enter() ~= 1 then
			Talk(1,"", g_NpcName .. "Con ���ng ph�a tr��c �� h�ng, kh�ng th� �i. ��i hi�p h�y t�m bang ch� h�i xem ho�t ��ng �� m� ch�a."); --��ʱ��
			return 0;
		end
		if is_player_can_enter() ~= 1 then
			--�����Ѿ��μӹ��
			Talk(1,"", g_NpcName .. "Ta nh� ra r�i! Ng��i �� �i qua 1 l�n, m�i tu�n ta ch� cho �i 1 l�n, ��ng tham lam qu�.");
			return 0;
		end
		 
		local tMapId = gf_GetDataTable(GetSameMaps(tbTongActivity.realMapID));
		local nMyTongMapId = get_my_tong_map_id();
		for i = 1,getn(tMapId) do
			if tMapId[i] == nMyTongMapId then
				nMapID = tMapId[i];
				break;
			end
		end
	else
		Talk(1,"", g_NpcName .. "H�y nh� Qu�n S� ��n m� ho�t ��ng, ta m�i c� th� ��a ng��i v�o.");
		return 0;
	end

	if nMapID == 0 then
		Talk(1,"", g_NpcName .. "Ho�t ��ng l�i kh�ng th� tham gia.");
		return 0;
	end
		
	local nNow = tonumber(date("%d%H%M"));
	SetTask(TASKID_TONG_JOIN_ACTIVITY_TIME, nNow);


	if tGtTask:check_cur_task(561) == 1 then
		SetTask(TASKID_TONG_ACTIVITY_ENTER,1);
	end
	SetTask(TASKID_TONG_ACTIVITY_MAP,nMapID)
	tbTongActivity:Enter(nMapID,1);	
	
	WriteLog(format("[%s] [role:%s(acc:%s)] [tong:%s] [duty:%d] [V�o khu v�c ho�t ��ng bang %d]",
			"TongActivity", GetName(), GetAccount(), GetTongName(), GetTongDuty(), nNow ));	
end

function ready_to_open_activity()
	try_to_open_activity();
end

function prepare_to_enter_mission()
	enter_mission();
end

function try_to_open_activity()
	local szTip1 = "��y l� giao d�ch l�n, h�y g�i Qu�n S� Bang c�a c�c ng��i ��n.";
	local szTip2 = "22:00 ch� nh�t ��n 2:00 ng�y h�m sau ta s� ngh� ng�i, ��ng l�m phi�n.";
	-- local szTip3 = "�����ҿ���������������ȸ�����屨��һ���������������ˡ����������İ���ټ����Ҳ��ܴ����ȥ��";
	local szTip4 = "Tu�n n�y �� m�, kh�ng c�n ��n n�a.";
	local szTip5 = "Qu� bang th�p h�n 280000, kh�ng th� m� ho�t ��ng bang.";
	
	-- local nMoney = GetTongMoney();
	local nDutyID = GetTongDuty();
	local tbValidDutyID = {DUTY_ID_KING, DUTY_ID_QUEEN, DUTY_ID_GENERAL};
	local bValid = 0;

	if nTongLv == 0 then
		Talk(1,"",g_NpcName.."C�p bang kh�ng ��.");
		return 0;		
	end

	for _, id in tbValidDutyID do
		if id == nDutyID then
			bValid = 1;
			break
		end
	end

	if bValid == 0 then
		Talk(1,"",g_NpcName.. szTip1);
		return 0;		
	end

	local nType ,_ = GetTongTotem()
	if nType < 3 then
		Talk(1, "", g_NpcName .. "Ph�i c� �� ��ng Bang c�p 3 tr� l�n m�i c� th� m� ho�t ��ng bang.");
		return 0;
	end

	if check_mission_time() ~= 1 then
		Talk(1,"",g_NpcName.. szTip2);
		return 0;		
	end		
	-- ��Ҫ��Ʊ��
	-- local nCount = GetItemCount(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3]);
	-- if (nCount == nil) or (nCount < 1) then
	-- 	Talk(1, "", g_NpcName .. szTip3);
	-- 	return 0;
	-- end
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 604800 then
		Say("Th�i gian v�o bang ch�a �� 7 ng�y, kh�ng th� tham gia!", 0)
		return
	end
	
	if get_mission_opened() == 1 then
		Talk(1, "", g_NpcName .. szTip4);
		return 0;
	end
	if tGtTask:check_cur_task(561) == 1 then
		SetTask(TASKID_TONG_ACTIVITY_ENTER,1);
	end
	do_open_activity();
end

function not_ready_to_open_activity()
	suTalk("main", g_NpcName .. "Sau khi chu�n b� xong h�y ��n t�m ta.");
end

function open_activity()
	local szContent = "H�y tri�u t�p bang ch�ng ��n ��y, n�i n�y ch� t�n t�i 1 gi�, ��ng �i l�c ��y. V�n ch�a chu�n b� xong?";
	local tMsg = {		
		"Ng��i trong bang ��u �� chu�n b� xong./ready_to_open_activity",
		"Ch�a chu�n b� xong/not_ready_to_open_activity",
		"R�i kh�i/nothing",
	}
	
	suSay(g_NpcName .. szContent,
		getn(tMsg),
		tMsg);	
end

function go_somewhere()
	local strMsg = {
		"Su�t! Nh� ti�ng n�o! Ng��i mu�n ai c�ng bi�t sao! Ta nghe ca ca Gia C�t K� n�i c�c ng��i mu�n ��n L�m Gian Tuy�t Nguy�n?\nN�i �� l� v�ng ��t phong th�y.\nTrong th�i gian quy ��nh ti�u di�t c�c ��ng v�t g�y r�i s� nh�n ���c ph�n th��ng phong ph�.\nChi ti�t ta kh�ng r� nh�ng nghe n�i C�u T��ng c�a C� y H�i bi�t nhi�u th�ng tin, h�y ��n t�m hi�u."
	};
	local tMsg = {
		"Bi�t r�i!/nothing",
	};
	suSay(g_NpcName .. strMsg[1], 
		getn(tMsg),
		tMsg);
end

function about_qiujiang()
	local strMsg = {
		"C�u �y l� k� nh�t nh�t th�i. nh�ng m� ��i v�i nh�ng th�ng tin v� c�a b�u v�t l� th� r�t quan t�m, n�n k� tinh minh C� Hy m�i g�i n� v�o C� y H�i ��y. H�m �� C�u �y v�i v� ch�y ra v�i v� kinh kh�ng nh�ng l�i v�i m�t ch�t ��ng ti�c, Anh t�i th�y n� th� bi�t c� vi�c. N� gi�i th�ch l�u c�ng kh�ng cho r� l�m, ch� bi�t l� c� m�t qu�i v�t l�n lo, n�u c� th� ��nh b�i qu�i ��, ch�c ch�n c� th� nh�n ���c c�u c�i l�n.",
	}
	suTalk("main", g_NpcName .. strMsg[1]);
end

function test_only()
	TongActivity_SetTongValue(enumTongValue_ActivityOpenTime, 0);
	SetTask(TASKID_TONG_JOIN_ACTIVITY_TIME, 0);
	SetTask(TASKID_TONG_GET_ACTIVITY_AWARD, 0);

	--��鱳���ռ�	
	if gf_JudgeRoomWeight(2, 100, "") ~= 1 then
		return 
	end

	--������ټ���
	-- local nCount = GetItemCount(g_tbNeedItem[1], g_tbNeedItem[2], g_tbNeedItem[3]);
	-- if nCount == nil or nCount < 1 then
	-- 	gf_AddItemEx(g_tbNeedItem, "����ټ���", 1);
	-- end	

	--����Ըɰ
	local tSpecialItem = {2, 95, 231};
	local nSpecialCount = 100;
	nCount = GetItemCount(gf_UnPack(tSpecialItem));
	if nCount == nil or nCount < nSpecialCount then
		gf_AddItemEx(tSpecialItem, "C�t ��c Nguy�n", nSpecialCount);
	end
end

function main()
	if IsTongMember() == 0 then
		Talk(1,"",g_NpcName.."��i hi�p gia nh�p bang ph�i r�i h�y ��n.");
		return 0;
	end
	
	if GetLevel() < 70 then
		Talk(1,"",g_NpcName.."��i hi�p ��t c�p 70 h�y ��n.");
		return 0;
	end
	
	local tMsg = {		
		"Ta mu�n m� ho�t ��ng bang/open_activity",
		"Ta mu�n v�o khu v�c ho�t ��ng/prepare_to_enter_mission",
		"Ti�u ca, nghe n�i ng��i c� th� ��a ch�ng ta ��n.../go_somewhere",
		"C�u T��ng c�a C� y H�i l� ng��i th� n�o?/about_qiujiang",
		"R�i kh�i/nothing",
	}

	if g_isDebug == 1 then
		tinsert(tMsg, getn(tMsg), "****Th� nghi�m ri�ng: X�a bi�n l��ng*****/test_only");
	end
	
	Say(g_NpcName .. "Xin d�ng b��c, h�nh nh� kh�ch quan thi�u t�i h� 212 l��ng 5 ti�n v�ng.",
		getn(tMsg),
		tMsg);	
end