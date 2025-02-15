--2007年2月28日修改
--修改内容：增加太虚首饰任务相关对话
--策划人：沈洋
--代码编写人：村长
--2013年4月12日修改
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\太虚幻境\\head.lua")
Include("\\script\\太虚幻境\\award.lua")
--太虚任务增加
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\missionfunctions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

TAIXU_TIME = 1782;--进入太虚的时间
taixu_jwl_taskID = 998
--结束

--八卦换取数量 对应GetEquipBaGua()返回值，注意返回5为太极
tBaguaNum = {--第2，3，4为物品id，第5位为灵气值81-120需要的数量  第六位灵气值61-80需要的数量
	[1]={"Kh秏",2,1,471,10,10},
	[2]={"Kh玭",2,1,470,10,10},
	[3]={"Ch蕁",2,1,474,9,2},
	[4]={"T鑞",2,1,476,9,2},
	[6]={"C祅",2,1,469,10,10},
	[7]={"礽",2,1,472,10,10},
	[8]={"C蕁",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100灵气神木八卦
	{0,0,5,5,0,0,0,0,0},	--100灵气紫金八卦
	{0,0,0,0,0,0,0,0,0},	--80灵气神木八卦
	{0,0,0,0,0,0,0,0,0},	--80灵气紫金八卦
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
	local szSex = {"Thi誹 hi謕", "N� hi謕 "}
	local szNoTeam ={"Th竔 H� Huy詎 C秐h nguy hi觤 tr飊g tr飊g,", " n猲 t� i hay h琻!"}
	local szNoGroupTeam = {"<color=green>Th莕 Du Ch﹏ Nh﹏<color>: Kh玭g th� t� i v祇 Th竔 H� Huy詎 C秐h."}
	local szNoGs = {"Th竔 H� Huy詎 C秐h nguy hi觤 tr飊g tr飊g,", "H穣 t藀 h頿 c竎 th祅h vi猲 i trc."}
	local nSex = GetSex()
	local szLevel = format("<color=green>C蕄 t Lv%d tr� l猲<color>", g_NeedLevel);
	local szTimes = "<color=green>4 l莕<color>"
	local szLeader = "<color=green>чi trng<color>"
	local szTown = "<color=green>чi vi猲 c飊g m閠 th祅h th�<color>"
	local szExMsg = ""				-- 额外的信息
	local nRetCode = 1
	local szCash = "<color=green> M鏸 th祅h vi猲 c�  39 v祅g, <color>"
	local szEnergy = "";
	--	local szItemCount = "<color=green>1个太虚多蜜花果<color>"
	if IsinTeam() == 0 then --是否组队
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end

	if 1 ~= gf_team_check_gs(GetTeamID()) then --队员不在一块
		nRetCode = 0
		return nRetCode, szNoGs[1]..szSex[nSex]..szNoGs[2]
	end
	
	if gf_IsGroupTeam() == 1 then
		nRetCode = 0;
		return nRetCode, szNoGroupTeam[1];
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>чi trng<color>"
	end

	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	if tx_level_chk() ~= 1 then
		nRetCode = 0
		szLevel = format("<color=red> C蕄 t Lv%d tr� l猲, <color>", g_NeedLevel)
	end
	if CheckCashJoin() ~= 1 then
		nRetCode = 0
		szCash = "<color=red> M鏸 th祅h vi猲 c莕 c� 39 v祅g, <color>"
	end

	-- mod th猰 ti猽 hao tinh l鵦
	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		szEnergy = format("<color=green> M鏸 th祅h vi猲 c�  %d tinh l鵦, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		if WTeam:CheckMemberHaveEnergy(g_WCFG_THAIHU2.nConsumeEnergy, WEnv.TRUE) == WEnv.FALSE then
			nRetCode = 0;
			szEnergy = format("<color=red> M鏸 th祅h vi猲 c�  %d tinh l鵦, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		end
	end

	--for i = 1, nSize do
	--	PlayerIndex = GetTeamMember(i)
	--	if TodayCanEnter() <= 0 then
	--		nRetCode = 0
	--		szTimes = "<color=red> 4 l莕 <color>"
	--		szExMsg = szExMsg..GetName()..", "
	--	end
	--end
	PlayerIndex = OldPlayer
	if szExMsg ~= "" then
		local nLen = strlen(szExMsg)
		szExMsg = strsub(szExMsg, 1, nLen - 2)
		szExMsg = szExMsg.."H玬 nay  v祇 1 l莕 r錳"
	end

	if AreaCheck() == 0 then --队员不再同一个城市
		nRetCode = 0
		szTown = "<color=red>чi vi猲 c飊g m閠 th祅h th�<color>"
	end

	local nSleepCheckRet = 0
	local szSleepCheck = ""
	nSleepCheckRet, szSleepCheck = SleepCheck()
	if nSleepCheckRet == 0 then
		nRetCode = 0
	end

	if szExMsg ~= "" then --队员今日是否已经进入过提示
		gf_Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		gf_Msg2Team(szSleepCheck)
--		return
	end

	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		-- mod th猰 ti猽 hao tinh l鵦
		local szMsg = "Do "..szLeader.." d蒼 u, "..szCash..szLevel..szTown..szEnergy..", 1 ng祔 v祇 "..szTimes.." Th竔 H� Huy詎 C秐h_. \n\n(<color=white>M祏 xanh tng tr璶g  甶襲 ki謓, m祏  kh玭g  nguy猲 nh﹏<color>)"
		return nRetCode, szMsg
	else
		-- m芻 nh
		local szMsg = "Do "..szLeader.." d蒼 u, "..szCash..szLevel..szTown..", 1 ng祔 v祇 "..szTimes.." Th竔 H� Huy詎 C秐h. \n\n(<color=white>M祏 xanh tng tr璶g  甶襲 ki謓, m祏  kh玭g  nguy猲 nh﹏<color>)"
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
		return Msg2Player("Nh﹏ v藅: "..strnotice.." vt 秈 qu� 4 l莕. Kh玭g th� 甶 ti誴")
	end
	local nRetCode, szMsg = chk_enter();
	if nRetCode == nil and szMsg == nil then
		return
	end
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end
	--- 跳关的额外判断
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
			local szErr = format("%s  d飊g Th竔 H�  M藅 Qu�, kh玭g th� ch鋘 Nh秠 ?i, h穣 khi猽 chi課 theo c竎h thng.", strsub(szNameList, 1, -3))
			gf_Msg2Team(szErr);
			Talk(1, "", "<color=green>Th莕 Du Ch﹏ Nh﹏<color>:" .. szErr);
			return
		end
		
		if GetItemCount(2,97,236) < tJumpTicket[nJump] then
			Talk(1, "", format("<color=green>Th莕 Du Ch﹏ Nh﹏<color>: [Thi猲 Ki猽 L謓h] tr猲 ngi kh玭g  %d.", tJumpTicket[nJump]))
			return
		end
	end
	
	
	local nPlace = random(1,4);

	local nId,nX,nY = GetNpcWorldPos(npcIdx);
	SendScript2VM("\\script\\missions\\taixu_mission\\mission.lua",format("create_enter_exit_pos(%d,%d)", nPlace,nId)); 
	local nMapID = tbTaiXu:Create();
	local szLog = format("[чi Trng: %s][Nh秠 ?i: %d]", GetName(), nJump);
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		Pay(390000)
		-- mod ti猽 hao tinh l鵦
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
	WriteLog("[Th竔 H� Huy詎 C秐h] [V祇 Th竔 H� Huy詎 C秐h]" .. szLog);
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv4,nPlace,nMapID)--区域
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv6,nJump,nMapID);--跳关
	if GetTeamSize() > 0 then
		if GetTeamMember(0) == PlayerIndex then
			-- 记录组队进入的玩家数 + Teamsize
			AddRuntimeStat(70, 1, 0, GetTeamSize())
		end
	else
		-- 单独进入 + 1
		AddRuntimeStat(70, 1, 0, 1)
	end
	tbTaiXu:TeamEnter(nMapID,nType);

end

function main()
	if g_WCFG_THAIHU2:IsDateOpen(1) ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end
	if  GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>= g_WCFG_THAIHU2.nCountStageLimit then
		return Talk(1,"","M鏸 ng祔 ch� vt 秈 4 l莕")
	end

	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"Th竔 H� Huy詎 C秐h l� g�/Hewei",
		"D蒼 i vt Th竔 H�/try_entry",
		--"Mua 1 Th竔 H� Th莕 Du Кn: S� d鬾g x2 ph莕 thng vt 秈 (100 xu v藅 ph萴)/buy_ThanDuDon", --LongDaiKa: b� 甶 d遪g n祔 v� ph莕 thng 頲 set m芻 nh r錳
		-- "获取[太虚神游丹]/get_exp_drug",
		-- "获取[太虚掠影丹]/get_exp_drug",
		-- "太虚幻境关卡竞技模式/athletics_mode",
		--"领取太虚般若树种/WantSeed",
		--"用太虚八卦牌换取奖励/GetAwardPai",
		--"S� d鬾g Th竔 H� B竧 Qu竔 b礽 i ph莕 thng/GetAwardPai",
		"S� d鬾g 20 xu  vt 秈 nhanh/notice_vuotainhanh",
		-- "用太虚八卦牌换取奖励/#show_equip_shop(22)",
		--"我想提升太虚首饰/taixu_jwl_up_inf",
--		"Ta mu鑞 t╪g c蕄 Trang s鴆 Th竔 H�/taixu_jwl_up_inf",
		--"Ta mu鑞 k輈h ho箃 l鵦 b竧 qu竔 c馻 trang b�/choose_lingqi",
		"K誸 th骳 i tho筰/no"
		}
	-- if GetTask(TASK_LINGSHI_ID) == 3 or GetTask(TASK_LINGSHI_ID) == 9 or GetTask(TASK_LINGSHI_ID)==10 then
	-- 	tinsert(strtab, getn(strtab), "继续灵石八卦学习任务/new_task2");
	-- end
	Say("B莕 o ph鬾g m謓h C鰑 Thi猲 Huy襫 N� n nh﹏ gian  h鉧 m鋓 ngi n Th竔 H� Huy詎 C秐h. Th� ch� xem ra ngi h鱱 duy猲 n y c� chuy謓 g� kh玭g?",
		getn(strtab),
		strtab)
end

--===================================================================结束==========================================================
TaiXu_TJL2TXSYD = 2  -- 天骄令兑换太虚神游丹
TaiXu_XYZZ2TXSYD = 300  -- 侠义之证兑换太虚神游丹
function notice_vuotainhanh()
	Say("<color=yellow>Ch� d蒼<color>: B筺 mu鑞 vt 秈 nhanh Th竔 H�! ng � kh玭g?",
			2,
			"уng �/#vuotainhanh_thaihu()",
			"Kh玭g ng �/main"
	)
end
function vuotainhanh_thaihu()
	if GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>=4 then
		return Talk(1,"","M鏸 ng祔 ch� vt 秈 4 l莕")
	end
	if GetFreeItemRoom() < 4 then
		Talk(1,"","H祅h trang kh玭g  ch�")
		return
	end
	if DelItem(2,1,30230,20) == 1 then
		WAward:ThaiHu2_HoanThanhTatCaAi();
	end
end

function get_exp_drug_tjl_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","H祅h trang kh玭g  ch�")
		return
	end
	if DelItem(2,97,236,TaiXu_TJL2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th竔 H� Th莕 Du Кn");
	end
end
function get_exp_drug_tjl()
	local MAX = 100
	local nItem = GetItemCount(2,97,236)
	local nCanExchange = floor(nItem / TaiXu_TJL2TXSYD)
	if nItem < TaiXu_TJL2TXSYD then
		Talk(1,"","Чo c� mang theo tr猲 ngi kh玭g ")
		return
	end
	AskClientForNumber("get_exp_drug_tjl_cb", 1, min(MAX, nCanExchange), "C莕 i bao nhi猽 c竔")
end

function get_exp_drug_xyzz_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","H祅h trang kh玭g  ch�")
		return
	end
	if DelItem(2,1,30912,TaiXu_XYZZ2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th竔 H� Th莕 Du Кn");
	end
end

function get_exp_drug_xyzz()
	local MAX = 100
	local nItem = GetItemCount(2,1,30912)
	local nCanExchange = floor(nItem / TaiXu_XYZZ2TXSYD)
	if nItem < TaiXu_XYZZ2TXSYD then
		Talk(1,"","Чo c� mang theo tr猲 ngi kh玭g ")
		return
	end
	AskClientForNumber("get_exp_drug_xyzz_cb", 1, min(MAX, nCanExchange), "C莕 i bao nhi猽 c竔")
end

function get_exp_drug()
	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"фi b籲g Thi猲 Ki猽 L謓h/get_exp_drug_tjl",
		"фi b籲g Hi謕 Ngh躠 Chi Ch鴑g/get_exp_drug_xyzz",
		"H駓 b�/main"
		}
	local szSay = format("<color=green>%s<color>: %s v鑞 l� n琲 ti猲 c秐h, mu鑞 ph竧 huy t鑙 產 c玭g hi謚 n琲 n祔, ph秈 Luy謓 Kh� H鉧 Th莕, vt kh醝 r祅g bu閏 c馻 ph祄 th�. Tuy n鉯 th� d�, nh璶g mu鑞 Luy謓 Kh� H鉧 Th莕 v� c飊g ph鴆 t筽, ngi thng kh� m� th鵦 hi謓. May l� � ch� ta c� m閠 lo筰 <color=yellow>%s<color>, c� th� gi髉 ph祄 th� <color=red>t筸 th阨<color> t n c秐h gi韎 n祔. D� nhi猲, lo筰 n dc n祔 v� c飊g qu� hi誱, ta kh玭g l� n祇 甧m t苙g mi詎 ph�! N誹 thi誹 hi謕 c莕, c� th� d飊g <color=yellow>2 Thi猲 Ki猽 L謓h<color> ho芻 <color=yellow>300 Hi謕 Ngh躠 Chi Ch鴑g<color>  i.",
		GetTargetNpcName(),
		"Th竔 H� Huy詎 C秐h",
		"Th竔 H� Th莕 Du Кn"
	)
	Say(szSay,
		getn(strtab),
		strtab)
end

function choose_lingqi()
	local strtab = {
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu竔 c� 甶觤 linh kh� di 60/mianfei_jihuo",
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu� 甶觤 linh kh� 61-79/#jihuo_bagua(2)",
		"Ta mu鑞 k輈h ho箃 trang b� b竧 qu� 甶觤 linh kh� 80-120/#jihuo_bagua(1)",
		"ьi ch髏,  ta xem 甶觤 linh kh� trang b� c馻 ngi/nothing"
		}
	Say("Mu鑞 k輈h ho箃 b竧 qu竔 tr猲 trang b�, c莕 Th竔 H� B竧 Qu竔 B礽 tng 鴑g, n誹 a  s� lng ta s� kh輈h ho箃 cho ngi. H穣 ch鋘 tr� linh kh� mu鑞 k輈h ho箃, tr� linh kh� <color=yellow>di 60<color>, ngo礽 trang b� qu� <color=yellow>Ch蕁 v� T鑞<color>, ta c� th� k輈h ho箃 <color=yellow>mi詎 ph�<color> nh鱪g c竔 kh竎 cho ngi. Kho秐g tr� linh kh� l韓 h琻 60 kh竎 nhau s� c莕 s� lng Th竔 H� B竧 Qu竔 kh竎 nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"u/#mianfei_jihuo_weizhi(0)",
		"Y ph鬰/#mianfei_jihuo_weizhi(1)",
		"H� y/#mianfei_jihuo_weizhi(3)",
		"V� kh�/#mianfei_jihuo_weizhi(2)",
		"ьi ta m芻 trang b� c莕 k輈h ho箃 v祇./nothing"
		}
	Say("N誹 tr� linh kh� c馻 trang b� t� <color=yellow>60 tr� xu鑞g<color>, k輈h ho箃 <color=yellow>Ch蕁 v� T鑞<color> qu竔 trang b� c莕 <color=yellow>1<color> Th竔 H� B竧 Qu竔 b礽 tng 鴑g, c遪 l筰 ta c� th� k輈h ho箃 mi詎 ph� cho ngi. Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta. Ngi mu鑞 k輈h ho箃 trang b� � b� ph薾 n祇?",
		getn(strtab),
		strtab)
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ngi kh玭g m芻 n� tr猲 ngi!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang b� ngi 產ng m芻 kh玭g ph秈 trang b� b竧 qu竔 ch璦 k輈h ho箃.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang b� tr猲 ngi ngi  k輈h ho箃 r錳.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","Tr� linh kh� t� <color=yellow>60 tr� xu鑞g<color>, ta c� th� mi詎 ph� k輈h ho箃 n╪g l鵦 trang b� b竧 qu竔 cho ngi. Nh璶g trang b� b竧 qu竔 ngi 產ng m芻 c莕 Th竔 H� B竧 Qu竔 b礽  k輈h ho箃.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang b� ngi 產ng m芻 kh玭g ph秈 trang b� b竧 qu竔.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Mu鑞 k輈h ho箃 Ch蕁 qu竔 trang b�, c莕 1 Ch蕁 B祅, ngi kh玭g c� Ch蕁 B祅.");
			return
		else
			Say("Ngi quy誸 nh k輈h ho箃 <color=yellow>Ch蕁<color> qu竔 trang b�? T鑞 1 Ch蕁 B祅.",
				2,
				"ng, ta mu鑞 k輈h ho箃/#jihuo_zhengua(3,"..nWz..")",
				"в ta suy ngh� l筰/nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Mu鑞 k輈h ho箃 T鑞 qu竔 trang b�, c莕 1 T鑞 B祅, ngi kh玭g c� T鑞 B祅.");
			return
		else
			Say("Ngi quy誸 nh k輈h ho箃 <color=yellow>T鑞<color> qu竔 trang b�? T鑞 1 T鑞 B祅.",
				2,
				"ng, ta mu鑞 k輈h ho箃/#jihuo_zhengua(4,"..nWz..")",
				"в ta suy ngh� l筰/nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[nWz+1].."Trang b� thu閏 t輓h b竧 qu竔");
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[nWz+1].."Trang b� thu閏 t輓h b竧 qu竔");
	end
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[3][6].."M秐h Th竔 H� B竧 Qu竔 b礽-Ch蕁,  k輈h ho箃 Ch蕁 qu竔 trang b�/#check_bagua(3,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[4][6].."M秐h Th竔 H� B竧 Qu竔 b礽-T鑞,  k輈h ho箃 T鑞 qu竔 trang b�/#check_bagua(4,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[1][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh秏,  k輈h ho箃 Kh秏 qu竔 trang b�/#check_bagua(1,2)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[2][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh玭,  k輈h ho箃 Kh玭 qu竔 trang b�/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[3][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - Tr薾 + 5 c竔 T� Kim B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� Tr薾 Qu竔/#check_bagua(3,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[4][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - T鑞 + 5 c竔 T� Kim B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� T鑞 Qu竔/#check_bagua(4,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[1][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh秏,  k輈h ho箃 Kh秏 qu竔 trang b�/#check_bagua(1,1)");
		tinsert(strtab,"Ta mu鑞 d飊g "..tBaguaNum[2][5].."M秐h Th竔 H� B竧 Qu竔 b礽-Kh玭,  k輈h ho箃 Kh玭 qu竔 trang b�/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang k�/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./nothing");
	Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
		getn(strtab),
		strtab);
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta mu鑞 d飊g "..tBaguaNum[6][5].."M秐h Th竔 H� B竧 Qu竔 b礽-C祅,  k輈h ho箃 C祅 qu竔 trang b�/#check_bagua(6,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[7][5].."M秐h Th竔 H� B竧 Qu竔 b礽-礽,  k輈h ho箃 礽 qu竔 trang b�/#check_bagua(7,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[8][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - C蕁 + 5 c竔 Th莕 M閏 B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� C蕁 Qu竔/#check_bagua(8,1)",
			"Ta mu鑞 d飊g "..tBaguaNum[9][5].."c竔 Th竔 H� B竧 Qu竔 B礽 - Ly + 5 c竔 Th莕 M閏 B竧 Qu竔  k輈h ho箃 m閠 chi誧 trang b� Ly Qu竔/#check_bagua(9,1)",
			"Trang trc/#jihuo_bagua("..nType..")",
			"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./nothing"
			}
		Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta mu鑞 d飊g "..tBaguaNum[6][6].."M秐h Th竔 H� B竧 Qu竔 b礽-C祅,  k輈h ho箃 C祅 qu竔 trang b�/#check_bagua(6,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[7][6].."M秐h Th竔 H� B竧 Qu竔 b礽-礽,  k輈h ho箃 礽 qu竔 trang b�/#check_bagua(7,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[8][6].."M秐h Th竔 H� B竧 Qu竔 b礽-C蕁,  k輈h ho箃 C蕁 qu竔 trang b�/#check_bagua(8,2)",
			"Ta mu鑞 d飊g "..tBaguaNum[9][6].."M秐h Th竔 H� B竧 Qu竔 b礽-Li,  k輈h ho箃 Li qu竔 trang b�/#check_bagua(9,2)",
			"Trang trc/#jihuo_bagua("..nType..")",
			"Ta kh玭g c� trang b� b竧 qu竔 ch璦 k輈h ho箃./nothing"
			}
		Say("Ngi mu鑞 k輈h ho箃 trang b� thu閏 t輓h b竧 qu竔 n祇? Ch� �, ta kh玭g r秐h ki觤 tra h祅h trang c馻 ngi, h穣 甧m trang b� c莕 k輈h ho箃 n g苝 ta.",
			getn(strtab),
			strtab);
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu th藀  Th竔 H� B竧 Qu竔 b礽 r錳 quay l筰 t譵 ta, b蕐 nhi猽  sao c� th� k輈h ho箃.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu th藀  Th竔 H� B竧 Qu竔 b礽 r錳 quay l筰 t譵 ta, b蕐 nhi猽  sao c� th� k輈h ho箃.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  Th莕 M閏 B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  T� Kim B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"u/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y ph鬰/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H� y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"V� kh�/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ngi kh玭g c� trang b� ch璦 k輈h ho箃 tng 鴑g v韎 thu閏 t輓h b竧 qu竔 n祔.");
		else
			tinsert(strtab,"Th玦 ta kh玭g k輈h ho箃 n鱝./nothing");
			Say("N祔, ngi quy誸 nh k輈h ho箃 thu閏 t輓h b竧 qu竔 n祇?"..tBaguaNum[nType][1].."H穣 ch鋘 trang b� c莕 k輈h ho箃 tr猲 ngi ngi.",getn(strtab),strtab)
		end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"u","Y ph鬰","V� kh�","H� y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai r錳, linh kh� trang b� c馻 ngi kh玭g ph秈 t� 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai r錳, linh kh� trang b� c馻 ngi kh玭g ph秈 t� 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  Th莕 M閏 B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>Th莕 Du Tr﹏ Nh﹏<color>: c�  T� Kim B竧 Qu竔  r錳 n g苝 t玦, ch� c� m蕐 c竔 n祔 l祄 sao k輈h ho箃 頲.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[i].."Trang b� thu閏 t輓h b竧 qu竔");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch骳 m鮪g b筺  k輈h ho箃."..tZhuangBei[i].."Trang b� thu閏 t輓h b竧 qu竔");
					break;
				end
			end
		end
	end
end

function new_task2()
	if GetTask(TASK_LINGSHI_ID) == 3 then
		Talk(1,"give_lingshi","C莕 d飊g Th竔 H� B竧 Qu竔 b礽  k輈h ho箃 thu閏 t輓h b竧 qu竔 tr猲 trang b�, ta c� th� d飊g B竧 Qu竔 b礽 tng 鴑g  c� 頲 s鴆 m筺h c馻 trang b� thu閏 t輓h , sau  ngi c� th� th� k輈h ho箃 trang b� b竧 qu竔 theo t� h頿 nh蕋 nh  c� 頲 tgran ph鬰 b竧 qu竔. Th� t� kh秏 n筸 h穣 tham kh秓 trong \'B竧 Qu竔 B秓 觧\' <color=yellow>Ta mu鑞 t譵 hi觰 c竎h ch� t筼 trang b� thu閏 t輓h b竧 qu竔 tng 鴑g<color>")
	elseif GetTask(TASK_LINGSHI_ID) == 9 then
		Say("Sao r錳? H頿 th祅h trang b� ch璦 kich ho箃 ch璦?<color=yellow>H穣 m芻 ch髇g l猲 ngi<color>, ta s� mi詎 ph� k輈h ho箃 cho ngi. Ch� �, ta ch� k輈h ho箃 1 l莕",
			4,
			"Ta  m芻 tr猲 ngi r錳, k輈h ho箃 甶./jihuo_newtask",
			"ьi ta m芻 ch髇g v祇./nothing",
			"Ta  t� b� mi詎 ph� k輈h ho箃, a ta n ch� c馻 truy襫 nh﹏ C玭g D� Th� Gia./confirm_fangqi",
			"Л頲 r錳, ta  hi觰!/confirm_cancel");
	elseif GetTask(TASK_LINGSHI_ID) == 10 then
		Say("Х k輈h ho箃 xong trang b� b竧 qu竔, c� th� t譵 truy襫 nh﹏ c馻 C玭g D� th� gia h頿 th祅h trang ph鬰 b竧 qu竔.",
			3,
			"Ta mu鑞 n ch� truy襫 nh﹏ c馻 C玭g D� Th� Gia h頿 th祅h trang ph鬰 b竧 qu竔./#goto_gongye2(1)",
			"T筸 th阨 ch璦 mu鑞 甶!/#goto_gongye2(2)",
			"Л頲 r錳, ta  hi觰!/confirm_cancel");
	end
end

function confirm_fangqi()
	Say("Ngi quy誸 nh t� b� k輈h ho箃?",
		2,
		"ng, ta mu鑞 n ch� truy襫 nh﹏ c馻 C玭g D� th� gia./#goto_gongye2(1)",
		"Ch鋘 sai r錳, tr� l筰/new_task2")
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
		Msg2Player("Nh薾 頲 u, Y Ph鬰, H� Y, V� Kh� v� 12 vi猲 Linh Th筩h.");
		TaskTip("H� th鑞g nhi謒 v� Linh Th筩h: Th� h頿 th祅h trang b� ch璦 k輈h ho箃, sau  t譵 Th莕 Du Ch﹏ Nh﹏  mi詎 ph� k輈h ho箃 trang b� b竧 qu竔.");
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
	TaskTip("H� th鑞g nhi謒 v� Linh Th筩h: Ngi  k輈h ho箃 trang b� b竧 qu竔, v� t譵 Th莕 Du Ch﹏ Nh﹏");
end

function goto_gongye2(nType)
	SetTask(TASK_LINGSHI_ID,4);
	if nType == 1 then
		local nRand = random(1,3);
		NewWorld(tGongyeNpc[nRand][1],tGongyeNpc[nRand][2],tGongyeNpc[nRand][3]);
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长
function Zgc_pub_goods_add_chk(goods_num)
		if GetFreeItemRoom() < goods_num then
			Talk(1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
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

	Say("C鰑 Thi猲 Huy襫 N� l蕐 tam thu thanh l� v� b竎h hoa qu� m藅 l祄 ra nhi襲 lo筰 linh th�; ngo礽 ra c遪 l蕐 m﹜ m� luy謓 ng� s綾 k� th筩h t ch髇g t筰 m閠 th� gi韎 huy襫 秓 c� t猲 Th竔 H�. Ph祄 ai v祇 頲 trong u to筰 nguy謓.",
		3, 
		"L祄 sao v祇 頲 Th竔 H� Huy詎 C秐h?/Ruhe", 
		-- "如何跳关挑战/TiaoGuan",
		format("\n Xin i s� a ch髇g t玦 v祇 \n /try_entry"), 
		"Ta ch� h醝 th玦!/no")
end

function Ruhe()
	local nNpcIdx = GetTargetNpc();
	local szTitle = format("<color=green>Th莕 Du Ch﹏ Nh﹏<color>: Ch� c莕 g鋓 v礽 ba b籲g h鱱, h頿 th祅h t� i, l� c� th� v祇 vt 秈. C� 甶襲 Th竔 H� l� n琲 ti猲 c秐h, ngi ph祄 � l筰 qu� l﹗ s� b� hao t鎛, l頸 b蕋 c藀 h筰. Do , m鏸 ngi m鏸 ng祔 ch� 頲 v祇 Th竔 H� Huy詎 C秐h 1 l莕, m鏸 l莕 t鑙 產 30 ph髏. Th竔 H�-M韎 g錷 %s t莕g, m鏸 t莕g u ph秈 nh b筰 c竎 Linh Th� v� Th莕 Th� Gi� ? m韎 頲 v祇 t莕g k�. Sau khi vt 頲 m鏸 t莕g, s� 頲 nh薾 thng kinh nghi謒 v� r蘮 luy謓. S� l璾 ph竔 c� m苩 trong i c祅g nhi襲, thng kinh nghi謒 v� r蘮 luy謓 c祅g nhi襲. Ngo礽 ra, m鏸 t莕g s� xu蕋 hi謓 rng t飝 theo s� l璾 ph竔 c� m苩 trong i, nh v� ch髇g s� nh薾 頲 Th竔 H� B祅.",g_MaxLevel);
	Say(szTitle,
		3, 
		"Th竔 H� Huy詎 C秐h l� sao?/Hewei", 
		-- "如何跳关挑战？/TiaoGuan",
		format("\n Xin i s� a ch髇g t玦 v祇 \n /try_entry"), 
		"Ta ch� h醝 th玦!/no")
end

function TiaoGuan()
	local nNpcIdx = GetTargetNpc();
	Say("<color=green>Th莕 Du Ch﹏ Nh﹏<color>: C竎 hi謕 s� c� th� d飊g m閠 lng Thi猲 Ki猽 L謓h nh蕋 nh, ch鋘  kh� th輈h h頿 v韎 m譶h  khi猽 chi課. Nh秠 ?i khi猽 chi課 ch� c� 20 ph髏 , t飝 theo h譶h th鴆 Nh秠 ?i kh竎 nhau, nh薾 頲 ph莕 thng kh竎 nhau. Hi謓 c� th� ch鋘 d飊g 10 Thi猲 Ki猽 L謓h  v祇, nh薾 thng x2, ho芻 ch鋘 d飊g 25 Thi猲 Ki猽 L謓h  v祇, nh薾 thng x4. Sau khi ch鋘 Nh秠 ?i  v祇, s� nh薾 頲 12 甶觤 t輈h c鵦. Kinh nghi謒 nh薾 頲 khi Nh秠 ?i khi猽 chi課 s� 頲 c閚g th猰 t� c蕄 , l璾 ph竔 v� k� n╪g Th﹏ Truy襫, Hi謕 L� c馻 nh﹏ v藅. Nh秠 ?i khi猽 chi課 頲 t輓h chung lt v祇 v韎 khi猽 chi課 thng, m鏸 ng祔 hi謕 s� ch� 頲 ch鋘 1 c竎h  v祇 khi猽 chi課. Lt khi猽 chi課 s� 頲 x鉧 l骳 0 gi� m鏸 ng祔.",
		4, 
		"Th竔 H� Huy詎 C秐h l� g�/Hewei", 
		"L祄 sao v祇 頲 Th竔 H� Huy詎 C秐h?/Ruhe", 
		format("\n Xin i s� a ch髇g t玦 v祇 \n /try_entry"), 
		"Ta ch� h醝 th玦!/no")
end

-- function athletics_mode()
-- 	local szScript = [[\script\missions\nephalem_rift\空空和尚.lua]];
-- 	SetPlayerScript(szScript);
-- 	SendScript2VM(szScript, "main()");
-- end

function try_entry()
	local nNpcIdx = GetTargetNpc();
	local szMsg = "<color=green>Th莕 Du Ch﹏ Nh﹏<color>: H穣 ch鋘 c竎h mu鑞 v祇."
	local tSel = {
		"Khi猽 chi課/#entry(1," ..nNpcIdx .. ", 0)",
		-- "从第41关开始挑战（花费10个天骄令，挑战时间为20分钟，获得奖励为正常挑战的两倍）/#entry(1," ..nNpcIdx .. ", 1)",
		-- "从第61关开始挑战（花费25个天骄令，挑战时间为20分钟，获得奖励为正常挑战的四倍）/#entry(1," ..nNpcIdx .. ", 2)",
		"tr� l筰/main",
		"Ta ch� h醝 th玦!/no",
	};
	Say(szMsg, getn(tSel), tSel);
end
function CheckCashJoin()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCash() < 390000 then
--			gf_Msg2Team("T� i c馻 b筺 c� th祅h vi猲 "..GetName().." kh玭g c� 29 v祅g",2)
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
		Talk(1,"","<color=yellow>Th莕 Du Ch﹏ Nh﹏: <color> B筺 kh玭g c�  100 xu v藅 ph萴!")
		return 0
	end
	if DelItem(2,1,30230,100) == 1 then
		gf_AddItemEx2({2, 1, 31268, 1},"ThanDuDon", "Th莕 du n","th莕 du n")
	end
	
end
