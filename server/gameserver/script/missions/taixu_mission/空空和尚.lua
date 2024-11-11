--2007��2��28���޸�
--�޸����ݣ�����̫������������ضԻ�
--�߻��ˣ�����
--�����д�ˣ��峤
--2013��4��12���޸�
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\̫��þ�\\head.lua")
Include("\\script\\̫��þ�\\award.lua")
--̫����������
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\missionfunctions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

TAIXU_TIME = 1782;--����̫���ʱ��
taixu_jwl_taskID = 998
--����

--���Ի�ȡ���� ��ӦGetEquipBaGua()����ֵ��ע�ⷵ��5Ϊ̫��
tBaguaNum = {--��2��3��4Ϊ��Ʒid����5λΪ����ֵ81-120��Ҫ������  ����λ����ֵ61-80��Ҫ������
	[1]={"Kh�m",2,1,471,10,10},
	[2]={"Kh�n",2,1,470,10,10},
	[3]={"Ch�n",2,1,474,9,2},
	[4]={"T�n",2,1,476,9,2},
	[6]={"C�n",2,1,469,10,10},
	[7]={"�o�i",2,1,472,10,10},
	[8]={"C�n",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100������ľ����
	{0,0,5,5,0,0,0,0,0},	--100�����Ͻ����
	{0,0,0,0,0,0,0,0,0},	--80������ľ����
	{0,0,0,0,0,0,0,0,0},	--80�����Ͻ����
}
function tx_level_chk()
	local nOldIndex = PlayerIndex
	local ret = 1
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local player_level = gf_GetTransLevel()
		if player_level < g_NeedLevel then
			ret = 0
			break
		end
	end
	PlayerIndex = nOldIndex
	return ret;
end
function TodayCanEnter()
	local nNow = tonumber(date("%Y%m%d"))
	local nLastTime = GetTask(TAIXU_TIME)
	local nDuration = nNow - nLastTime
	return nDuration
end

function chk_enter()
	local szSex = {"Thi�u hi�p", "N� hi�p "}
	local szNoTeam ={"Th�i H� Huy�n C�nh nguy hi�m tr�ng tr�ng,", " n�n t� ��i hay h�n!"}
	local szNoGroupTeam = {"<color=green>Th�n Du Ch�n Nh�n<color>: Kh�ng th� t� ��i v�o Th�i H� Huy�n C�nh."}
	local szNoGs = {"Th�i H� Huy�n C�nh nguy hi�m tr�ng tr�ng,", "H�y t�p h�p c�c th�nh vi�n ��i tr��c."}
	local nSex = GetSex()
	local szLevel = format("<color=green>C�p ��t Lv%d tr� l�n<color>", g_NeedLevel);
	local szTimes = "<color=green>4 l�n<color>"
	local szLeader = "<color=green>��i tr��ng<color>"
	local szTown = "<color=green>��i vi�n c�ng m�t th�nh th�<color>"
	local szExMsg = ""				-- �������Ϣ
	local nRetCode = 1
	local szCash = "<color=green> M�i th�nh vi�n c� �� 39 v�ng, <color>"
	local szEnergy = "";
	--	local szItemCount = "<color=green>1��̫����ۻ���<color>"
	if IsinTeam() == 0 then --�Ƿ����
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end

	if 1 ~= gf_team_check_gs(GetTeamID()) then --��Ա����һ��
		nRetCode = 0
		return nRetCode, szNoGs[1]..szSex[nSex]..szNoGs[2]
	end
	
	if gf_IsGroupTeam() == 1 then
		nRetCode = 0;
		return nRetCode, szNoGroupTeam[1];
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>��i tr��ng<color>"
	end

	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	if tx_level_chk() ~= 1 then
		nRetCode = 0
		szLevel = format("<color=red> C�p ��t Lv%d tr� l�n, <color>", g_NeedLevel)
	end
	if CheckCashJoin() ~= 1 then
		nRetCode = 0
		szCash = "<color=red> M�i th�nh vi�n c�n c� 39 v�ng, <color>"
	end

	-- mod th�m ti�u hao tinh l�c
	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		szEnergy = format("<color=green> M�i th�nh vi�n c� �� %d tinh l�c, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		if WTeam:CheckMemberHaveEnergy(g_WCFG_THAIHU2.nConsumeEnergy, WEnv.TRUE) == WEnv.FALSE then
			nRetCode = 0;
			szEnergy = format("<color=red> M�i th�nh vi�n c� �� %d tinh l�c, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		end
	end

	--for i = 1, nSize do
	--	PlayerIndex = GetTeamMember(i)
	--	if TodayCanEnter() <= 0 then
	--		nRetCode = 0
	--		szTimes = "<color=red> 4 l�n <color>"
	--		szExMsg = szExMsg..GetName()..", "
	--	end
	--end
	PlayerIndex = OldPlayer
	if szExMsg ~= "" then
		local nLen = strlen(szExMsg)
		szExMsg = strsub(szExMsg, 1, nLen - 2)
		szExMsg = szExMsg.."H�m nay �� v�o 1 l�n r�i"
	end

	if AreaCheck() == 0 then --��Ա����ͬһ������
		nRetCode = 0
		szTown = "<color=red>��i vi�n c�ng m�t th�nh th�<color>"
	end

	local nSleepCheckRet = 0
	local szSleepCheck = ""
	nSleepCheckRet, szSleepCheck = SleepCheck()
	if nSleepCheckRet == 0 then
		nRetCode = 0
	end

	if szExMsg ~= "" then --��Ա�����Ƿ��Ѿ��������ʾ
		gf_Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		gf_Msg2Team(szSleepCheck)
--		return
	end

	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		-- mod th�m ti�u hao tinh l�c
		local szMsg = "Do "..szLeader.." d�n ��u, "..szCash..szLevel..szTown..szEnergy..", 1 ng�y v�o "..szTimes.." Th�i H� Huy�n C�nh_. \n\n(<color=white>M�u xanh t��ng tr�ng �� �i�u ki�n, m�u �� kh�ng �� nguy�n nh�n<color>)"
		return nRetCode, szMsg
	else
		-- m�c ��nh
		local szMsg = "Do "..szLeader.." d�n ��u, "..szCash..szLevel..szTown..", 1 ng�y v�o "..szTimes.." Th�i H� Huy�n C�nh. \n\n(<color=white>M�u xanh t��ng tr�ng �� �i�u ki�n, m�u �� kh�ng �� nguy�n nh�n<color>)"
		return nRetCode, szMsg

	end
end
function entry(nType,npcIdx,nJump)
	nJump = nJump or 0;
	local strnotice="";
	local ncheck=0;
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if  GetTask(4085)>=4 then
			ncheck=ncheck+1;
			strnotice=strnotice..GetName().."--"
		end
	end
	PlayerIndex = nOldIndex;
	if ncheck>=4 then
		return Msg2Player("Nh�n v�t: "..strnotice.."�� v��t �i qu� 4 l�n. Kh�ng th� �i ti�p")
	end
	local nRetCode, szMsg = chk_enter();
	if nRetCode == nil and szMsg == nil then
		return
	end
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end
	--- ���صĶ����ж�
	local tJumpTicket = {10,25};
	if nJump > 0 then
		local bRet = 0;
		local szNameList = "";
		
		local nPIdx = PlayerIndex;
		
		local nNow = tonumber(date("%y%m%d"))
		local MASK = 10000000
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			
			local nValue = GetTask(EAT_TIME_TODAY)
			local nDate = mod(nValue, MASK)
			local nChance = floor(nValue / MASK)
			if nNow == nDate and nChance >= 1 then
				szNameList = szNameList .. GetName() .. ",";
				bRet = 1;
			end
		end
		
		PlayerIndex = nPIdx;
		if bRet == 1 then
			local szErr = format("%s �� d�ng Th�i H� �a M�t Qu�, kh�ng th� ch�n Nh�y ?i, h�y khi�u chi�n theo c�ch th��ng.", strsub(szNameList, 1, -3))
			gf_Msg2Team(szErr);
			Talk(1, "", "<color=green>Th�n Du Ch�n Nh�n<color>:" .. szErr);
			return
		end
		
		if GetItemCount(2,97,236) < tJumpTicket[nJump] then
			Talk(1, "", format("<color=green>Th�n Du Ch�n Nh�n<color>: [Thi�n Ki�u L�nh] tr�n ng��i kh�ng �� %d.", tJumpTicket[nJump]))
			return
		end
	end
	
	
	local nPlace = random(1,4);

	local nId,nX,nY = GetNpcWorldPos(npcIdx);
	SendScript2VM("\\script\\missions\\taixu_mission\\mission.lua",format("create_enter_exit_pos(%d,%d)", nPlace,nId)); 
	local nMapID = tbTaiXu:Create();
	local szLog = format("[��i Tr��ng: %s][Nh�y ?i: %d]", GetName(), nJump);
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		Pay(390000)
		-- mod ti�u hao tinh l�c
		if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
			ModifyEnergy(-g_WCFG_THAIHU2.nConsumeEnergy, 1);
		end
		SetTask(TAIXU_TIME,tonumber(date("%Y%m%d")));
		szLog = szLog .. format("[acc:%s role:%s lv:%d route:%s]", GetAccount(), GetName(), GetLevel(), gf_GetRouteName(GetPlayerRoute()));
	end
	PlayerIndex = nOldPlayer;
	if nJump > 0 then
		DelItem(2,97,236, tJumpTicket[nJump]);
	end
	WriteLog("[Th�i H� Huy�n C�nh] [V�o Th�i H� Huy�n C�nh]" .. szLog);
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv4,nPlace,nMapID)--����
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv6,nJump,nMapID);--����
	if GetTeamSize() > 0 then
		if GetTeamMember(0) == PlayerIndex then
			-- ��¼��ӽ��������� + Teamsize
			AddRuntimeStat(70, 1, 0, GetTeamSize())
		end
	else
		-- �������� + 1
		AddRuntimeStat(70, 1, 0, 1)
	end
	tbTaiXu:TeamEnter(nMapID,nType);

end

function main()
	if g_WCFG_THAIHU2:IsDateOpen(1) ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end
	if  GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>= g_WCFG_THAIHU2.nCountStageLimit then
		return Talk(1,"","M�i ng�y ch� v��t �i 4 l�n")
	end

	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"Th�i H� Huy�n C�nh l� g�/Hewei",
		"D�n ��i v��t Th�i H�/try_entry",
		--"Mua 1 Th�i H� Th�n Du ��n: S� d�ng x2 ph�n th��ng v��t �i (100 xu v�t ph�m)/buy_ThanDuDon", --LongDaiKa: b� �i d�ng n�y v� ph�n th��ng ���c set m�c ��nh r�i
		-- "��ȡ[̫�����ε�]/get_exp_drug",
		-- "��ȡ[̫����Ӱ��]/get_exp_drug",
		-- "̫��þ��ؿ�����ģʽ/athletics_mode",
		--"��ȡ̫���������/WantSeed",
		--"��̫������ƻ�ȡ����/GetAwardPai",
		--"S� d�ng Th�i H� B�t Qu�i b�i ��i ph�n th��ng/GetAwardPai",
		"S� d�ng 20 xu �� v��t �i nhanh/notice_vuotainhanh",
		-- "��̫������ƻ�ȡ����/#show_equip_shop(22)",
		--"��������̫������/taixu_jwl_up_inf",
--		"Ta mu�n t�ng c�p Trang s�c Th�i H�/taixu_jwl_up_inf",
		--"Ta mu�n k�ch ho�t l�c b�t qu�i c�a trang b�/choose_lingqi",
		"K�t th�c ��i tho�i/no"
		}
	-- if GetTask(TASK_LINGSHI_ID) == 3 or GetTask(TASK_LINGSHI_ID) == 9 or GetTask(TASK_LINGSHI_ID)==10 then
	-- 	tinsert(strtab, getn(strtab), "������ʯ����ѧϰ����/new_task2");
	-- end
	Say("B�n ��o ph�ng m�nh C�u Thi�n Huy�n N� ��n nh�n gian �� h�a m�i ng��i ��n Th�i H� Huy�n C�nh. Th� ch� xem ra ng��i h�u duy�n ��n ��y c� chuy�n g� kh�ng?",
		getn(strtab),
		strtab)
end

--===================================================================����==========================================================
TaiXu_TJL2TXSYD = 2  -- �콾��һ�̫�����ε�
TaiXu_XYZZ2TXSYD = 300  -- ����֤֮�һ�̫�����ε�
function notice_vuotainhanh()
	Say("<color=yellow>Ch� d�n<color>: B�n mu�n v��t �i nhanh Th�i H�! ��ng � kh�ng?",
			2,
			"��ng �/#vuotainhanh_thaihu()",
			"Kh�ng ��ng �/main"
	)
end
function vuotainhanh_thaihu()
	if GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>=4 then
		return Talk(1,"","M�i ng�y ch� v��t �i 4 l�n")
	end
	if GetFreeItemRoom() < 4 then
		Talk(1,"","H�nh trang kh�ng �� ch�")
		return
	end
	if DelItem(2,1,30230,20) == 1 then
		WAward:ThaiHu2_HoanThanhTatCaAi();
	end
end

function get_exp_drug_tjl_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","H�nh trang kh�ng �� ch�")
		return
	end
	if DelItem(2,97,236,TaiXu_TJL2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th�i H� Th�n Du ��n");
	end
end
function get_exp_drug_tjl()
	local MAX = 100
	local nItem = GetItemCount(2,97,236)
	local nCanExchange = floor(nItem / TaiXu_TJL2TXSYD)
	if nItem < TaiXu_TJL2TXSYD then
		Talk(1,"","��o c� mang theo tr�n ng��i kh�ng ��")
		return
	end
	AskClientForNumber("get_exp_drug_tjl_cb", 1, min(MAX, nCanExchange), "C�n ��i bao nhi�u c�i")
end

function get_exp_drug_xyzz_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","H�nh trang kh�ng �� ch�")
		return
	end
	if DelItem(2,1,30912,TaiXu_XYZZ2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th�i H� Th�n Du ��n");
	end
end

function get_exp_drug_xyzz()
	local MAX = 100
	local nItem = GetItemCount(2,1,30912)
	local nCanExchange = floor(nItem / TaiXu_XYZZ2TXSYD)
	if nItem < TaiXu_XYZZ2TXSYD then
		Talk(1,"","��o c� mang theo tr�n ng��i kh�ng ��")
		return
	end
	AskClientForNumber("get_exp_drug_xyzz_cb", 1, min(MAX, nCanExchange), "C�n ��i bao nhi�u c�i")
end

function get_exp_drug()
	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"��i b�ng Thi�n Ki�u L�nh/get_exp_drug_tjl",
		"��i b�ng Hi�p Ngh�a Chi Ch�ng/get_exp_drug_xyzz",
		"H�y b�/main"
		}
	local szSay = format("<color=green>%s<color>: %s v�n l� n�i ti�n c�nh, mu�n ph�t huy t�i �a c�ng hi�u n�i n�y, ph�i Luy�n Kh� H�a Th�n, v��t kh�i r�ng bu�c c�a ph�m th�. Tuy n�i th� d�, nh�ng mu�n Luy�n Kh� H�a Th�n v� c�ng ph�c t�p, ng��i th��ng kh� m� th�c hi�n. May l� � ch� ta c� m�t lo�i <color=yellow>%s<color>, c� th� gi�p ph�m th� <color=red>t�m th�i<color> ��t ��n c�nh gi�i n�y. D� nhi�n, lo�i ��n d��c n�y v� c�ng qu� hi�m, ta kh�ng l� n�o �em t�ng mi�n ph�! N�u thi�u hi�p c�n, c� th� d�ng <color=yellow>2 Thi�n Ki�u L�nh<color> ho�c <color=yellow>300 Hi�p Ngh�a Chi Ch�ng<color> �� ��i.",
		GetTargetNpcName(),
		"Th�i H� Huy�n C�nh",
		"Th�i H� Th�n Du ��n"
	)
	Say(szSay,
		getn(strtab),
		strtab)
end

function choose_lingqi()
	local strtab = {
		"Ta mu�n k�ch ho�t trang b� b�t qu�i c� �i�m linh kh� d��i 60/mianfei_jihuo",
		"Ta mu�n k�ch ho�t trang b� b�t qu� �i�m linh kh� 61-79/#jihuo_bagua(2)",
		"Ta mu�n k�ch ho�t trang b� b�t qu� �i�m linh kh� 80-120/#jihuo_bagua(1)",
		"��i ch�t, �� ta xem �i�m linh kh� trang b� c�a ng��i/nothing"
		}
	Say("Mu�n k�ch ho�t b�t qu�i tr�n trang b�, c�n Th�i H� B�t Qu�i B�i t��ng �ng, n�u ��a �� s� l��ng ta s� kh�ch ho�t cho ng��i. H�y ch�n tr� linh kh� mu�n k�ch ho�t, tr� linh kh� <color=yellow>d��i 60<color>, ngo�i trang b� qu� <color=yellow>Ch�n v� T�n<color>, ta c� th� k�ch ho�t <color=yellow>mi�n ph�<color> nh�ng c�i kh�c cho ng��i. Kho�ng tr� linh kh� l�n h�n 60 kh�c nhau s� c�n s� l��ng Th�i H� B�t Qu�i kh�c nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"��u/#mianfei_jihuo_weizhi(0)",
		"Y ph�c/#mianfei_jihuo_weizhi(1)",
		"H� y/#mianfei_jihuo_weizhi(3)",
		"V� kh�/#mianfei_jihuo_weizhi(2)",
		"��i ta m�c trang b� c�n k�ch ho�t v�o./nothing"
		}
	Say("N�u tr� linh kh� c�a trang b� t� <color=yellow>60 tr� xu�ng<color>, k�ch ho�t <color=yellow>Ch�n v� T�n<color> qu�i trang b� c�n <color=yellow>1<color> Th�i H� B�t Qu�i b�i t��ng �ng, c�n l�i ta c� th� k�ch ho�t mi�n ph� cho ng��i. Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta. Ng��i mu�n k�ch ho�t trang b� � b� ph�n n�o?",
		getn(strtab),
		strtab)
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ng��i kh�ng m�c n� tr�n ng��i!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang b� ng��i �ang m�c kh�ng ph�i trang b� b�t qu�i ch�a k�ch ho�t.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang b� tr�n ng��i ng��i �� k�ch ho�t r�i.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","Tr� linh kh� t� <color=yellow>60 tr� xu�ng<color>, ta c� th� mi�n ph� k�ch ho�t n�ng l�c trang b� b�t qu�i cho ng��i. Nh�ng trang b� b�t qu�i ng��i �ang m�c c�n Th�i H� B�t Qu�i b�i �� k�ch ho�t.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang b� ng��i �ang m�c kh�ng ph�i trang b� b�t qu�i.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Mu�n k�ch ho�t Ch�n qu�i trang b�, c�n 1 Ch�n B�n, ng��i kh�ng c� Ch�n B�n.");
			return
		else
			Say("Ng��i quy�t ��nh k�ch ho�t <color=yellow>Ch�n<color> qu�i trang b�? T�n 1 Ch�n B�n.",
				2,
				"��ng, ta mu�n k�ch ho�t/#jihuo_zhengua(3,"..nWz..")",
				"�� ta suy ngh� l�i/nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Mu�n k�ch ho�t T�n qu�i trang b�, c�n 1 T�n B�n, ng��i kh�ng c� T�n B�n.");
			return
		else
			Say("Ng��i quy�t ��nh k�ch ho�t <color=yellow>T�n<color> qu�i trang b�? T�n 1 T�n B�n.",
				2,
				"��ng, ta mu�n k�ch ho�t/#jihuo_zhengua(4,"..nWz..")",
				"�� ta suy ngh� l�i/nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[nWz+1].."Trang b� thu�c t�nh b�t qu�i");
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[nWz+1].."Trang b� thu�c t�nh b�t qu�i");
	end
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[3][6].."M�nh Th�i H� B�t Qu�i b�i-Ch�n, �� k�ch ho�t Ch�n qu�i trang b�/#check_bagua(3,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[4][6].."M�nh Th�i H� B�t Qu�i b�i-T�n, �� k�ch ho�t T�n qu�i trang b�/#check_bagua(4,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[1][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�m, �� k�ch ho�t Kh�m qu�i trang b�/#check_bagua(1,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[2][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�n, �� k�ch ho�t Kh�n qu�i trang b�/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[3][5].."c�i Th�i H� B�t Qu�i B�i - Tr�n + 5 c�i T� Kim B�t Qu�i �� k�ch ho�t m�t chi�c trang b� Tr�n Qu�i/#check_bagua(3,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[4][5].."c�i Th�i H� B�t Qu�i B�i - T�n + 5 c�i T� Kim B�t Qu�i �� k�ch ho�t m�t chi�c trang b� T�n Qu�i/#check_bagua(4,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[1][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�m, �� k�ch ho�t Kh�m qu�i trang b�/#check_bagua(1,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[2][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�n, �� k�ch ho�t Kh�n qu�i trang b�/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang k�/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./nothing");
	Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
		getn(strtab),
		strtab);
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta mu�n d�ng "..tBaguaNum[6][5].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(6,1)",
			"Ta mu�n d�ng "..tBaguaNum[7][5].."M�nh Th�i H� B�t Qu�i b�i-�o�i, �� k�ch ho�t �o�i qu�i trang b�/#check_bagua(7,1)",
			"Ta mu�n d�ng "..tBaguaNum[8][5].."c�i Th�i H� B�t Qu�i B�i - C�n + 5 c�i Th�n M�c B�t Qu�i �� k�ch ho�t m�t chi�c trang b� C�n Qu�i/#check_bagua(8,1)",
			"Ta mu�n d�ng "..tBaguaNum[9][5].."c�i Th�i H� B�t Qu�i B�i - Ly + 5 c�i Th�n M�c B�t Qu�i �� k�ch ho�t m�t chi�c trang b� Ly Qu�i/#check_bagua(9,1)",
			"Trang tr��c/#jihuo_bagua("..nType..")",
			"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./nothing"
			}
		Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta mu�n d�ng "..tBaguaNum[6][6].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(6,2)",
			"Ta mu�n d�ng "..tBaguaNum[7][6].."M�nh Th�i H� B�t Qu�i b�i-�o�i, �� k�ch ho�t �o�i qu�i trang b�/#check_bagua(7,2)",
			"Ta mu�n d�ng "..tBaguaNum[8][6].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(8,2)",
			"Ta mu�n d�ng "..tBaguaNum[9][6].."M�nh Th�i H� B�t Qu�i b�i-Li, �� k�ch ho�t Li qu�i trang b�/#check_bagua(9,2)",
			"Trang tr��c/#jihuo_bagua("..nType..")",
			"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./nothing"
			}
		Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
			getn(strtab),
			strtab);
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu th�p �� Th�i H� B�t Qu�i b�i r�i quay l�i t�m ta, b�y nhi�u �� sao c� th� k�ch ho�t.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu th�p �� Th�i H� B�t Qu�i b�i r�i quay l�i t�m ta, b�y nhi�u �� sao c� th� k�ch ho�t.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� Th�n M�c B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� T� Kim B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"��u/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y ph�c/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H� y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"V� kh�/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ng��i kh�ng c� trang b� ch�a k�ch ho�t t��ng �ng v�i thu�c t�nh b�t qu�i n�y.");
		else
			tinsert(strtab,"Th�i ta kh�ng k�ch ho�t n�a./nothing");
			Say("N�y, ng��i quy�t ��nh k�ch ho�t thu�c t�nh b�t qu�i n�o?"..tBaguaNum[nType][1].."H�y ch�n trang b� c�n k�ch ho�t tr�n ng��i ng��i.",getn(strtab),strtab)
		end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai r�i, linh kh� trang b� c�a ng��i kh�ng ph�i t� 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai r�i, linh kh� trang b� c�a ng��i kh�ng ph�i t� 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� Th�n M�c B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� T� Kim B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[i].."Trang b� thu�c t�nh b�t qu�i");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[i].."Trang b� thu�c t�nh b�t qu�i");
					break;
				end
			end
		end
	end
end

function new_task2()
	if GetTask(TASK_LINGSHI_ID) == 3 then
		Talk(1,"give_lingshi","C�n d�ng Th�i H� B�t Qu�i b�i �� k�ch ho�t thu�c t�nh b�t qu�i tr�n trang b�, ta c� th� d�ng B�t Qu�i b�i t��ng �ng �� c� ���c s�c m�nh c�a trang b� thu�c t�nh ��, sau �� ng��i c� th� th� k�ch ho�t trang b� b�t qu�i theo t� h�p nh�t ��nh �� c� ���c tgran ph�c b�t qu�i. Th� t� kh�m n�m h�y tham kh�o trong \'B�t Qu�i B�o �i�n\' <color=yellow>Ta mu�n t�m hi�u c�ch ch� t�o trang b� thu�c t�nh b�t qu�i t��ng �ng<color>")
	elseif GetTask(TASK_LINGSHI_ID) == 9 then
		Say("Sao r�i? H�p th�nh trang b� ch�a kich ho�t ch�a?<color=yellow>H�y m�c ch�ng l�n ng��i<color>, ta s� mi�n ph� k�ch ho�t cho ng��i. Ch� �, ta ch� k�ch ho�t 1 l�n",
			4,
			"Ta �� m�c tr�n ng��i r�i, k�ch ho�t �i./jihuo_newtask",
			"��i ta m�c ch�ng v�o./nothing",
			"Ta �� t� b� mi�n ph� k�ch ho�t, ��a ta ��n ch� c�a truy�n nh�n C�ng D� Th� Gia./confirm_fangqi",
			"���c r�i, ta �� hi�u!/confirm_cancel");
	elseif GetTask(TASK_LINGSHI_ID) == 10 then
		Say("�� k�ch ho�t xong trang b� b�t qu�i, c� th� t�m truy�n nh�n c�a C�ng D� th� gia h�p th�nh trang ph�c b�t qu�i.",
			3,
			"Ta mu�n ��n ch� truy�n nh�n c�a C�ng D� Th� Gia h�p th�nh trang ph�c b�t qu�i./#goto_gongye2(1)",
			"T�m th�i ch�a mu�n �i!/#goto_gongye2(2)",
			"���c r�i, ta �� hi�u!/confirm_cancel");
	end
end

function confirm_fangqi()
	Say("Ng��i quy�t ��nh t� b� k�ch ho�t?",
		2,
		"��ng, ta mu�n ��n ch� truy�n nh�n c�a C�ng D� th� gia./#goto_gongye2(1)",
		"Ch�n sai r�i, tr� l�i/new_task2")
end

function give_lingshi()
		if Zgc_pub_goods_add_chk(16) ~= 1 then
			return
		end
		SetTask(TASK_LINGSHI_ID,9);
		AddLingShi(tLingqi[1][1],tLingqi[1][2],tLingqi[1][3],tLingqi[1][4]);
		AddLingShi(tLingqi[2][1],tLingqi[2][2],tLingqi[2][3],tLingqi[2][4]);
		AddLingShi(tLingqi[3][1],tLingqi[3][2],tLingqi[3][3],tLingqi[3][4]);
		AddLingShi(tLingqi[4][1],tLingqi[4][2],tLingqi[4][3],tLingqi[4][5]);
		AddLingShi(tLingqi[5][1],tLingqi[5][2],tLingqi[5][3],tLingqi[5][5]);
		AddLingShi(tLingqi[6][1],tLingqi[6][2],tLingqi[6][3],tLingqi[6][5]);
		AddLingShi(tLingqi[7][1],tLingqi[7][2],tLingqi[7][3],tLingqi[7][5]);
		AddLingShi(tLingqi[8][1],tLingqi[8][2],tLingqi[8][3],tLingqi[8][4]);
		AddLingShi(tLingqi[9][1],tLingqi[9][2],tLingqi[9][3],tLingqi[9][5]);
		AddLingShi(tLingqi[10][1],tLingqi[10][2],tLingqi[10][3],tLingqi[10][4]);
		AddLingShi(tLingqi[11][1],tLingqi[11][2],tLingqi[11][3],tLingqi[11][4]);
		AddLingShi(tLingqi[12][1],tLingqi[12][2],tLingqi[12][3],tLingqi[12][5]);
		local nTi = GetBody();
		local nRoute = GetPlayerRoute();
		local nToubuLq = tLingqi[1][4]+tLingqi[2][4]+tLingqi[3][4];
		local nYifuLq = tLingqi[4][5]+tLingqi[5][5]+tLingqi[6][5];
		local nKuziLq = tLingqi[7][5]+tLingqi[8][4]+tLingqi[9][5];
		local nWuqiLq = tLingqi[10][4]+tLingqi[10][4]+tLingqi[10][5];
		AddItem(tZhuangbeiOne[nTi][1],tZhuangbeiOne[nTi][2],tZhuangbeiOne[nTi][3],1,1,0,0,0,0,0,0,0,0,nToubuLq);
		AddItem(tZhuangbeiOne[nTi][4],tZhuangbeiOne[nTi][5],tZhuangbeiOne[nTi][6],1,1,0,0,0,0,0,0,0,0,nYifuLq);
		AddItem(tZhuangbeiOne[nTi][7],tZhuangbeiOne[nTi][8],tZhuangbeiOne[nTi][9],1,1,0,0,0,0,0,0,0,0,nKuziLq);
		if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
			AddItem(tWeapon10[nRoute][1],tWeapon10[nRoute][2],tWeapon10[nRoute][3],1,1,0,0,0,0,0,0,0,0,nWuqiLq);
		else
			AddItem(0,0,3,1,1,0,0,0,0,0,0,0,0,nWuqiLq);
		end
		Msg2Player("Nh�n ���c ��u, Y Ph�c, H� Y, V� Kh� v� 12 vi�n Linh Th�ch.");
		TaskTip("H� th�ng nhi�m v� Linh Th�ch: Th� h�p th�nh trang b� ch�a k�ch ho�t, sau �� t�m Th�n Du Ch�n Nh�n �� mi�n ph� k�ch ho�t trang b� b�t qu�i.");
end

function jihuo_newtask()
	local nMaoziId1,nMaoziId2,nMaoziId3 = GetPlayerEquipInfo(0);
	local nYifuId1,nYifuId2,nYifuId3 = GetPlayerEquipInfo(1);
	local nKuziId1,nKuziId2,nKuziId3 = GetPlayerEquipInfo(3);
	local nWuqiId1,nWuqiId2,nWuqiId3 = GetPlayerEquipInfo(2);
	local nMaoziIndex = GetPlayerEquipIndex(0);
	local nYifuIndex = GetPlayerEquipIndex(1);
	local nKuziIndex = GetPlayerEquipIndex(3);
	local nWuqiIndex = GetPlayerEquipIndex(2);
	local nTi = GetBody();
	local nRoute = GetPlayerRoute();
	if nMaoziId1==tZhuangbeiOne[nTi][1] and nMaoziId2==tZhuangbeiOne[nTi][2] and nMaoziId3==tZhuangbeiOne[nTi][3] and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
		SetEquipBaGuaJiHuo(nMaoziIndex,1);
	end
	if nYifuId1==tZhuangbeiOne[nTi][4] and nYifuId2==tZhuangbeiOne[nTi][5] and nYifuId3==tZhuangbeiOne[nTi][6] and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
		SetEquipBaGuaJiHuo(nYifuIndex,1);
	end
	if nKuziId1==tZhuangbeiOne[nTi][7] and nKuziId2==tZhuangbeiOne[nTi][8] and nKuziId3==tZhuangbeiOne[nTi][9] and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
		SetEquipBaGuaJiHuo(nKuziIndex,1);
	end
	if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
		if nWuqiId1==tWeapon10[nRoute][1] and nWuqiId2==tWeapon10[nRoute][2] and nWuqiId3==tWeapon10[nRoute][3] and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			SetEquipBaGuaJiHuo(nWuqiIndex,1);
		end
	else
		if nWuqiId1==0 and nWuqiId2==0 and nWuqiId3==3 and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			SetEquipBaGuaJiHuo(nWuqiIndex,1);
		end
	end
	SetTask(TASK_LINGSHI_ID,10);
	TaskTip("H� th�ng nhi�m v� Linh Th�ch: Ng��i �� k�ch ho�t trang b� b�t qu�i, v� t�m Th�n Du Ch�n Nh�n");
end

function goto_gongye2(nType)
	SetTask(TASK_LINGSHI_ID,4);
	if nType == 1 then
		local nRand = random(1,3);
		NewWorld(tGongyeNpc[nRand][1],tGongyeNpc[nRand][2],tGongyeNpc[nRand][3]);
	end
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤
function Zgc_pub_goods_add_chk(goods_num)
		if GetFreeItemRoom() < goods_num then
			Talk(1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		else
			return 1
		end
end

function nothing()
end

function end_say()
end

function Hewei()
	local nNpcIdx = GetTargetNpc()

	Say("C�u Thi�n Huy�n N� l�y tam thu thanh l� v� b�ch hoa qu� m�t l�m ra nhi�u lo�i linh th�; ngo�i ra c�n l�y m�y m� luy�n ng� s�c k� th�ch ��t ch�ng t�i m�t th� gi�i huy�n �o c� t�n Th�i H�. Ph�m ai v�o ���c trong ��u to�i nguy�n.",
		3, 
		"L�m sao v�o ���c Th�i H� Huy�n C�nh?/Ruhe", 
		-- "���������ս/TiaoGuan",
		format("\n Xin ��i s� ��a ch�ng t�i v�o \n /try_entry"), 
		"Ta ch� h�i th�i!/no")
end

function Ruhe()
	local nNpcIdx = GetTargetNpc();
	local szTitle = format("<color=green>Th�n Du Ch�n Nh�n<color>: Ch� c�n g�i v�i ba b�ng h�u, h�p th�nh t� ��i, l� c� th� v�o v��t �i. C� �i�u Th�i H� l� n�i ti�n c�nh, ng��i ph�m � l�i qu� l�u s� b� hao t�n, l�i b�t c�p h�i. Do ��, m�i ng��i m�i ng�y ch� ���c v�o Th�i H� Huy�n C�nh 1 l�n, m�i l�n t�i �a 30 ph�t. Th�i H�-M�i g�m %s t�ng, m�i t�ng ��u ph�i ��nh b�i c�c Linh Th� v� Th�n Th� Gi� ? m�i ���c v�o t�ng k�. Sau khi v��t ���c m�i t�ng, s� ���c nh�n th��ng kinh nghi�m v� r�n luy�n. S� l�u ph�i c� m�t trong ��i c�ng nhi�u, th��ng kinh nghi�m v� r�n luy�n c�ng nhi�u. Ngo�i ra, m�i t�ng s� xu�t hi�n r��ng t�y theo s� l�u ph�i c� m�t trong ��i, ��nh v� ch�ng s� nh�n ���c Th�i H� B�n.",g_MaxLevel);
	Say(szTitle,
		3, 
		"Th�i H� Huy�n C�nh l� sao?/Hewei", 
		-- "���������ս��/TiaoGuan",
		format("\n Xin ��i s� ��a ch�ng t�i v�o \n /try_entry"), 
		"Ta ch� h�i th�i!/no")
end

function TiaoGuan()
	local nNpcIdx = GetTargetNpc();
	Say("<color=green>Th�n Du Ch�n Nh�n<color>: C�c hi�p s� c� th� d�ng m�t l��ng Thi�n Ki�u L�nh nh�t ��nh, ch�n �� kh� th�ch h�p v�i m�nh �� khi�u chi�n. Nh�y ?i khi�u chi�n ch� c� 20 ph�t , t�y theo h�nh th�c Nh�y ?i kh�c nhau, nh�n ���c ph�n th��ng kh�c nhau. Hi�n c� th� ch�n d�ng 10 Thi�n Ki�u L�nh �� v�o, nh�n th��ng x2, ho�c ch�n d�ng 25 Thi�n Ki�u L�nh �� v�o, nh�n th��ng x4. Sau khi ch�n Nh�y ?i �� v�o, s� nh�n ���c 12 �i�m t�ch c�c. Kinh nghi�m nh�n ���c khi Nh�y ?i khi�u chi�n s� ���c c�ng th�m t� c�p ��, l�u ph�i v� k� n�ng Th�n Truy�n, Hi�p L� c�a nh�n v�t. Nh�y ?i khi�u chi�n ���c t�nh chung l��t v�o v�i khi�u chi�n th��ng, m�i ng�y hi�p s� ch� ���c ch�n 1 c�ch �� v�o khi�u chi�n. L��t khi�u chi�n s� ���c x�a l�c 0 gi� m�i ng�y.",
		4, 
		"Th�i H� Huy�n C�nh l� g�/Hewei", 
		"L�m sao v�o ���c Th�i H� Huy�n C�nh?/Ruhe", 
		format("\n Xin ��i s� ��a ch�ng t�i v�o \n /try_entry"), 
		"Ta ch� h�i th�i!/no")
end

-- function athletics_mode()
-- 	local szScript = [[\script\missions\nephalem_rift\�տպ���.lua]];
-- 	SetPlayerScript(szScript);
-- 	SendScript2VM(szScript, "main()");
-- end

function try_entry()
	local nNpcIdx = GetTargetNpc();
	local szMsg = "<color=green>Th�n Du Ch�n Nh�n<color>: H�y ch�n c�ch mu�n v�o."
	local tSel = {
		"Khi�u chi�n/#entry(1," ..nNpcIdx .. ", 0)",
		-- "�ӵ�41�ؿ�ʼ��ս������10���콾���սʱ��Ϊ20���ӣ���ý���Ϊ������ս��������/#entry(1," ..nNpcIdx .. ", 1)",
		-- "�ӵ�61�ؿ�ʼ��ս������25���콾���սʱ��Ϊ20���ӣ���ý���Ϊ������ս���ı���/#entry(1," ..nNpcIdx .. ", 2)",
		"tr� l�i/main",
		"Ta ch� h�i th�i!/no",
	};
	Say(szMsg, getn(tSel), tSel);
end
function CheckCashJoin()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCash() < 390000 then
--			gf_Msg2Team("T� ��i c�a b�n c� th�nh vi�n "..GetName().." kh�ng c� 29 v�ng",2)
			return 0	
		end
	end
	PlayerIndex = nOldIndex
	return 1
end
function buy_ThanDuDon()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30230) < 100 then
		Talk(1,"","<color=yellow>Th�n Du Ch�n Nh�n: <color> B�n kh�ng c� �� 100 xu v�t ph�m!")
		return 0
	end
	if DelItem(2,1,30230,100) == 1 then
		gf_AddItemEx2({2, 1, 31268, 1},"ThanDuDon", "Th�n du ��n","th�n du ��n")
	end
	
end
