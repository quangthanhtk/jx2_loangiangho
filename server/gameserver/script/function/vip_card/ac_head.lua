Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
----------------------------------------------------------------------------------------------------------isolate begin
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 0,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "activity_card",
    szViewName 			= "Th� ho箃 ng",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
function finish_task(nTaskIndex, szTaskName, nPoint)
	if ac_IsActivate() ~= 1 then return 0 end
	local nOldValue = ac_GetEventTag(nTaskIndex);
	if nOldValue ~= 0 then return 0; end
	
	ac_SetEventTag(nTaskIndex);
	ac_ModifyDayValue(nPoint);
	ac_ModifyMonthValue(nPoint);
	
	Msg2Player(format("Ch骳 m鮪g b筺  ho祅 th祅h nhi謒 v� [%s] c馻 Th� Ho箃 чng, nh薾 頲 [%d] 甶觤 t輈h l騳.", szTaskName, nPoint))
end
function handle_elem(tEvent, data, para)
	if ac_IsActivate() ~= 1 then return 0 end
	local nTaskIndex = para[getn(para)]
	finish_task(nTaskIndex, tEvent[4][1], tEvent[4][2])
end
function handle_elem_ib_cost(tEvent, data, para)
	if ac_IsActivate() ~= 1 then return 0 end
	local nTaskIndex = para[getn(para)]
	local nOldValue = ac_GetEventTag(nTaskIndex);
	if nOldValue ~= 0 then return 0; end
	
	local nMaxCnt = tEvent[4][3]
	local nTotalCnt = ac_AddUseItemCount(nUseCnt)
	if nTotalCnt >= nMaxCnt then
		finish_task(nTaskIndex, tEvent[4][1], tEvent[4][2])
	end
end
function handle_on_item_talk_jndsj(nIndex)--锦囊大事件对话
	ac_MainDialog(nIndex)
end
t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {task_name, nAwardPoint, MaxUseCount}}
	{"event_player_login", {}, 								handle_elem,	{"Жng nh藀 tr� ch琲", 1},  },
	{"event_player_daily_online_minute", {60}, 				handle_elem,	{"Online 60 ph髏", 5},  },
	{"event_mission_stage_finish", {"liangshan", 4}, 		handle_elem,	{"Ho祅 th祅h 秈 4 Lng S琻 B筩", 6},  },
	{"event_mission_stage_finish", {"liangshan", 8}, 		handle_elem,	{"Ho祅 th祅h 秈 8 Lng S琻 B筩", 15},  },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 	handle_elem,	{"Ho祅 th祅h 秈 4 V筺 Ki誱 Gia", 6},  },
	{"event_mission_stage_finish", {"dixuangong", 4}, 		handle_elem,	{"Ho祅 th祅h 秈 4 мa Huy襫 Cung", 6},  },
	{"event_mission_stage_finish", {"dixuangong", 7}, 		handle_elem,	{"Ho祅 th祅h 秈 7 мa Huy襫 Cung", 15},  },
	{"event_mission_stage_finish", {"taiyi", 3}, 			handle_elem,	{"Ho祅 th祅h 秈 3 Th竔 Nh蕋 Th竝", 6},  },
	{"event_mission_stage_finish", {"taiyi", 6}, 			handle_elem,	{"Ho祅 th祅h 秈 6 Th竔 Nh蕋 Th竝", 15},  },
	{"event_mission_stage_finish", {"herotaiyi", 3}, 		handle_elem,	{"Ho祅 th祅h 秈 3 Th竔 Nh蕋 Th竝 - Anh h飊g ", 8},  },
	{"event_mission_stage_finish", {"herotaiyi", 6}, 		handle_elem,	{"Ho祅 th祅h 秈 6 Th竔 Nh蕋 Th竝 - Anh h飊g", 20},  },
	{"event_mission_award", {"newbattle", -1, -1, 4}, 		handle_elem,	{"L穘h thng chi課 trng Nh筺 M玭 Quan", 10},  },
	{"event_mission_award", {"newbattle", -1, -1, 3}, 		handle_elem,	{"L穘h thng chi課 trng B秓 V� Th祅h Tr�", 8},  },
	{"event_mission_award", {"newbattle", -1, -1, 2}, 		handle_elem,	{"L穘h thng chi課 trng Lng Th鵦", 8} },
	{"event_mission_award", {"newbattle", -1, -1, 1}, 		handle_elem,	{"L穘h thng chi課 trng Th玭 Trang", 8},  },
	{"event_mission_task_award", {"pvp","yunbiao", -1}, 	handle_elem,	{"Ho祅 th祅h 1 l莕 v薾 ti猽", 10},  },
	{"event_mission_task_award", {"pvp","duobiao", -1}, 	handle_elem,	{"Ho祅 th祅h 1 l莕 cp ti猽", 10},  },
	{"event_mission_task_award", {"pvp","baozang", -1}, 	handle_elem,	{"Ho祅 th祅h nhi謒 v� o Kho B竨", 10},  },
	{"event_mission_task_award", {"pvp","toujingshu", -1}, 	handle_elem,	{"Ho祅 th祅h nhi謒 v� tr閙 Kinh Th�", 10},  },
	{"event_mission_task_award", {"pvp","shangjin", -1}, 	handle_elem,	{"L穘h thng Thng V祅g Th� S╪", 10},  },
	{"event_ib_cost", 		{PackItemId(2,1,30692)}, 		handle_elem_ib_cost,	{"S� d鬾g 20 b秓 rng Чi H閕 T� V�", 10, 20},  },
	{TeamEvent("event_mission_task_award"), {"pvp","killboss", -1}, 	handle_elem,	{"Ti猽 di謙 BOSS th� gi韎/th� l鵦 3 phe", 15},  },
	{"event_mission_task_award", {"pvp","plant", -1}, 		handle_elem,	{"Ho祅 th祅h 1 l莕 nhi謒 v� B� Qu�", 10},  },
	{"event_mission_task_award", {"pvp","touguoshi", -1}, 	handle_elem,	{"Ho祅 th祅h 1 l莕 nhi謒 v� tr閙 qu�", 10},  },
	{"event_mission_award", {"kfbattle",-1, -1, -1}, 		handle_elem,	{"L穘h thng 1 l莕 chi課 trng li猲 server", 20},  },
}
t_cfg = t_isolate_user_batch_watch_list

function on_init()
	local nMaxTaskCount = 31*getn(AC_EVENT_TASKGROUP);
	local nTaskList = getn(t_cfg);
	if nTaskList > nMaxTaskCount then 
		error(format("getn(%s) %d > %d", "t_isolate_user_batch_watch_list", nTaskList, nMaxTaskCount)) 
	end
end
function on_event_player_login(nExchangeComing)
	if ac_IsActivate() ~= 1 then --尚未激活活动卡 所有发送到该模块的event都不要在这个玩家身上触发
		isolate_disable_event_dispatch(PlayerIndex)
	end
end
function on_event_daily_clear(nCurDate, nLastDate)
	SetTask(TASK_ACTIVITY_CARD_DAY, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_ONLINE, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	for _, v in AC_EVENT_TASKGROUP do
		SetTask(v, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	end
end

function on_add_watches()
	isolate_watch_item_talk(2, 1, 30045, "handle_on_item_talk_jndsj")--锦囊大事件对话
end
----------------------------------------------------------------------------------------------------------isolate end

AC_DAILY_AWARD = {
	--{贡献值，经验，银券，金币}
	{24, 5000000, 10, 21},
	{60, 12000000, 20, 33},
	{100, 20000000, 40, 45},
	{150, 30000000, 60, 56},
	{200, 40000000, 80, 68},
	{250, 50000000, 100, 79},
};

AC_MONTH_AWARD = {
	--{贡献值，说明内容，道具或函数字符串，数量，空间}
	{1400, "Thi誸 tinh c蕄 4", {2, 1, 30612}, 20, 1},
	{2100, "Hu﹏ chng anh h飊g", {2, 1, 30499}, 100, 1},
	{2800, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977}, 4, 1},
	{3600, "b竛h 輙 B竎 B秓", {2, 1, 1125}, 20, 1},
	{4800, "Tinh Hoa U萵 Linh C蕄 6", {2, 1, 30668}, 3, 1},
	{5600, "B秓 Th筩h c蕄 3,4,5", "ac_Gem345()", 3, 3},
};

AC_LOG = "Th� ho箃 ng";
AC_DayValueMax = 250 --每日贡献值上限

--事件标记组
AC_EVENT_TASKGROUP = {
	TASK_ACTIVITY_CARD_TASK1,
	TASK_ACTIVITY_CARD_TASK2,
};

function ac_GetCardSeq()
	return tonumber(date("%Y%m"));
end

function ac_IsActivate()
	if GetTask(TASK_ACTIVITY_CARD_SEQ) == ac_GetCardSeq() then
		return 1;
	end
	return 0;
end


--每日贡献值
function ac_GetDayValue()
	return gf_GetMyTaskByte(TASK_ACTIVITY_CARD_DAY, 1, 2);
end

function ac_ModifyDayValue(nValue)
	if ac_IsActivate() ~= 1 then return end;
	local nTaskValue = ac_GetDayValue();
	nValue = min((nValue or 0), AC_DayValueMax - nTaskValue);
	if nValue <= 0 then return 0; end
	gf_SetMyTaskByte(TASK_ACTIVITY_CARD_DAY, 1, 2, nTaskValue + nValue, TASK_ACCESS_CODE_ACTIVITY_CARD);
	if nValue > 0 then
		Msg2Player(format("[Th� ho箃 ng] nh薾 頲 %d 甶觤 c鑞g hi課 m鏸 ng祔!", nValue));
	else
		Msg2Player(format("[Th� ho箃 ng] ti猽 hao %d 甶觤 c鑞g hi課 m鏸 ng祔!", nValue));
	end
end

--记录比武宝箱使用次数
function ac_GetUseItemCount()
	return gf_GetTaskByte(TASK_ACTIVITY_CARD_DAY, 3);
end

function ac_AddUseItemCount(nUseCnt)
	local nNew = ac_GetUseItemCount() + nUseCnt
	gf_SetTaskByte(TASK_ACTIVITY_CARD_DAY, 3, nNew, TASK_ACCESS_CODE_ACTIVITY_CARD);
	return nNew
end

--每日领奖标记
function ac_GetDayTag()
	return gf_GetTaskByte(TASK_ACTIVITY_CARD_DAY, 4);
end

function ac_SetDayTag()
	gf_SetTaskByte(TASK_ACTIVITY_CARD_DAY, 4, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_GetDailyAward(nIndex)
	if nIndex <= 0 or nIndex > getn(AC_DAILY_AWARD) then
		return 0;
	end
	if ac_GetDayTag() ~= 0 then
		return 0;
	end
	if ac_GetDayValue() < AC_DAILY_AWARD[nIndex][1] then
		Talk(1,"","觤 c鑞g hi課 m鏸 ng祔 kh玭g , kh玭g th� l穘h thng!");
		return 0;
	end
	ac_SetDayTag();
	--ac_ModifyDayValue(AC_DAILY_AWARD[nIndex][1]);
	gf_ModifyExp(AC_DAILY_AWARD[nIndex][2]);
	--ModifyYinJuan(AC_DAILY_AWARD[nIndex][3], 1);
	Earn(10000*AC_DAILY_AWARD[nIndex][4]);
	return 1;
end

--每月贡献值
function ac_GetMonthValue()
	return GetTask(TASK_ACTIVITY_CARD_MONTH);
end

function ac_ModifyMonthValue(nValue)
	if ac_IsActivate() ~= 1 then return end;
	if not nValue or nValue == 0 then return end;
	local nTaskValue = ac_GetMonthValue();
	SetTask(TASK_ACTIVITY_CARD_MONTH, nTaskValue + nValue, TASK_ACCESS_CODE_ACTIVITY_CARD);
	if nValue > 0 then
		Msg2Player(format("[Th� ho箃 ng] nh薾 頲 %d 甶觤 c鑞g hi課 m鏸 th竛g!", nValue));
	else
		Msg2Player(format("[Th� ho箃 ng] ti猽 hao %d 甶觤 c鑞g hi課 m鏸 th竛g!", nValue));
	end
end

--月贡献奖励
function ac_GetMonthTag(nIndex)
	return gf_GetTaskBit(TASK_ACTIVITY_CARD_AWARD, nIndex);
end

function ac_SetMonthTag(nIndex)
	gf_SetTaskBit(TASK_ACTIVITY_CARD_AWARD, nIndex, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_GetMonthAward(nIndex)
	if nIndex <= 0 or nIndex > 31 then return 0; end
	if ac_GetMonthTag(nIndex) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(AC_MONTH_AWARD[nIndex][5], 10, " ") ~= 1 then
		return 0;
	end
	if ac_GetMonthValue() < AC_MONTH_AWARD[nIndex][1] then
		Talk(1,"","觤 c鑞g hi課 m鏸 th竛g kh玭g , kh玭g th� l穘h thng!");
		return 0;
	end
	ac_SetMonthTag(nIndex);
	local nType = type(AC_MONTH_AWARD[nIndex][3]);
	if nType == "table" then
		local t = AC_MONTH_AWARD[nIndex][3];
		local num = AC_MONTH_AWARD[nIndex][4];
		gf_AddItemEx2({t[1], t[2], t[3], num}, GetItemName(t[1], t[2], t[3]), 
			AC_LOG, AC_LOG, 0, 1);
	elseif nType == "string" then
		for i = 1, AC_MONTH_AWARD[nIndex][4] do
			dostring(AC_MONTH_AWARD[nIndex][3]);
		end
	else
		error("type mismatch");
	end
	return 1;
end

--激活活动卡
function ac_ActivateCard()
	if GetLevel() < 80 and gf_GetPlayerRebornCount() <= 0 then
		Talk(1,"",format("Ъng c蕄 nh﹏ v藅 kh玭g  c蕄 %d, kh玭g th� k輈h ho箃 %s", 80, "Th� ho箃 ng"));
		return 0;
	end
	if ac_IsActivate() ~= 0 then
		Talk(1,"","B筺  k輈h ho箃 th� ho箃 ng r錳!");
		return 0;
	end
	if GetItemCount(2, 1, 30903) < 1 then
		Talk(1,"",format("Trong t骾 h祅h trang kh玭g c� b蕋 k� th� ho箃 ng n祇! H穣 甶 <color=gold>%s<color> mua.", "Thng Th祅h"));
		return 0;
	end
	if DelItem(2, 1, 30903, 1) ~= 1 then
		return 0;
	end
	SetTask(TASK_ACTIVITY_CARD_SEQ, ac_GetCardSeq(), TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_MONTH, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	SetTask(TASK_ACTIVITY_CARD_AWARD, 0, TASK_ACCESS_CODE_ACTIVITY_CARD);
	isolate_enable_event_dispatch(PlayerIndex) --删除该玩家所有的event派发黑名单
	Talk(1,"","B筺  k輈h ho箃 th祅h c玭g th� ho箃 ng!");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function ac_GetEventTag(nType)
	local nIndex = ceil(nType / 31);
	local nBit = mod(nType, 31);
	if nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP) then 
		error("nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP)"); 
	end
	return gf_GetTaskBit(AC_EVENT_TASKGROUP[nIndex], nBit);
end

function ac_SetEventTag(nType)
	local nIndex = ceil(nType / 31);
	local nBit = mod(nType, 31);
	if nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP) then 
		error("nIndex < 1 or nIndex > getn(AC_EVENT_TASKGROUP)"); 
	end
	return gf_SetTaskBit(AC_EVENT_TASKGROUP[nIndex], nBit, 1, TASK_ACCESS_CODE_ACTIVITY_CARD);
end

function ac_MainDialog(nIndex)
	local msg = format("<color=gold>%s<color>:", AC_LOG);
	local tSay = {};
	if ac_IsActivate() ~= 1 then
		msg = msg.."Th� ho箃 ng th竛g n祔 v蒼 ch璦 k輈h ho箃!"
		tinsert(tSay, "\n k輈h ho箃 th� ho箃 ng/ac_ActivateCard");
	else
		local nYear = tonumber(date("%Y"));
		local nMonth = tonumber(date("%m"));
		local nDay = tonumber(date("%d"));
		local tMonth = {31,28,31,30,31,30,31,31,30,31,30,31}		
		if mod(nYear, 400) == 0 or (mod(nYear, 4) == 0 and mod(nYear, 100) ~= 0) then
			tMonth[2] = 29;
		end
		msg = msg..format("Th� ho箃 ng  k輈h ho箃, th阨 gian c� hi謚 l鵦 c遪 l筰 <color=green>%d<color> ng祔", tMonth[nMonth] - nDay + 1);
		tinsert(tSay,	"Xem nhi謒 v� h祅g ng祔/ac_DailyTaskList");
		tinsert(tSay,	"Ph莕 thng 甶觤 c鑞g hi課 ng祔/ac_DailyAward");
		tinsert(tSay,	"Ph莕 thng 甶觤 c鑞g hi課 th竛g/ac_MonthAward");
		tinsert(tSay,	"Ti謒 Ng﹏ Phi誹/ac_IBShop");
	end
	tinsert(tSay, "\nT玦 ch� xem xem th玦/nothing");
	Say(msg, getn(tSay), tSay);
end

function ac_DailyTaskList()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG);
	tSay.msg = tSay.msg..format("%s nh薾 頲 甶觤 c鑞g hi課 th玭g qua tham gia c竎 ho箃 ng, c鑞g hi課 ng祔 m鏸 ng祔 nh薾 頲 nhi襲 nh蕋 %d 甶觤, 甶觤 c鑞g hi課 th竛g kh玭g t鑙 產.", 
		gf_GetPlayerSexName(), AC_DayValueMax)
	tSay.sel = {};
	local szResult = {"Ch璦 ho祅 th祅h", "Х ho祅 th祅h"};
	for i = 1, getn(AC_TASK_LIST) do
		tinsert(tSay.sel, {
			format("%s (%d 甶觤 c鑞g hi課) (%s)", AC_TASK_LIST[i][1], AC_TASK_LIST[i][2], szResult[ac_GetEventTag(i) + 1]),
			 "ac_DailyTaskList"});
	end
	tinsert(tSay.sel, {"\n Ph秐 h錳", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra kh醝", "nothing"});
	temp_Talk(tSay);
end

function ac_DailyAward()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG)
	tSay.msg = tSay.msg..format("觤 c鑞g hi課 ng祔 hi謓 t筰 l� <color=green>%d<color>, %s mu鑞 l穘h nh薾 ph莕 thng g�.", ac_GetDayValue(), gf_GetPlayerSexName());
	if ac_GetDayTag() ~= 0 then
		tSay.msg = tSay.msg.."<color=red> H玬 nay  l穘h nh薾 ph莕 thng, m鏸 ng祔 ch� l穘h 1 l莕.<color>";
	end
	tSay.sel = {};
	for i = 1, getn(AC_DAILY_AWARD) do
		tinsert(tSay.sel, {
			format("%dEXP, %d 甶觤 phi誹 b筩, %d v祅g#%d 甶觤 c鑞g hi課#", 
				AC_DAILY_AWARD[i][2], AC_DAILY_AWARD[i][3], AC_DAILY_AWARD[i][4], AC_DAILY_AWARD[i][1]),
			 format("#ac_GetDailyAward(%d)", i)});
	end
	tinsert(tSay.sel, {"\n Ph秐 h錳", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra kh醝", "nothing"});
	temp_Talk(tSay);
end

function ac_MonthAward()
	local tSay = {};
	tSay.msg = format("<color=gold>%s<color>:", AC_LOG)
	tSay.msg = tSay.msg..format("觤 c鑞g hi課 th竛g hi謓 t筰 l� <color=green>%d<color>, %s mu鑞 l穘h nh薾 ph莕 thng g�", ac_GetMonthValue(), gf_GetPlayerSexName());
	tSay.sel = {};
	local szResult = {"Ch璦 l穘h nh薾", "Х l穘h nh薾"};
	for i = 1, getn(AC_MONTH_AWARD) do
		tinsert(tSay.sel, {
			format("%s*%d (%d 甶觤 c鑞g hi課)#%s#", 
				AC_MONTH_AWARD[i][2], AC_MONTH_AWARD[i][4], AC_MONTH_AWARD[i][1], szResult[ac_GetMonthTag(i) + 1]),
			 format("#ac_GetMonthAward(%d)", i)});
	end
	tinsert(tSay.sel, {"\n Ph秐 h錳", "ac_MainDialog"});
	tinsert(tSay.sel, {"Ra kh醝", "nothing"});
	temp_Talk(tSay);
end

function ac_IBShop()
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3033)");
end

function ac_Gem345()
	local tGem345 = {
		{1,15, "Huy誸Tr輈hTh筩h Lv3", {2,22,103,1},nil,nil,nil,nil},
		{1,15, "Nguy謙B筩hTh筩h Lv3", {2,22,203,1},nil,nil,nil,nil},
		{1,15, "H� Ph竎h Th筩h C蕄 3", {2,22,303,1},nil,nil,nil,nil},
		{1,15, "H綾 Di謚 Th筩h C蕄 3", {2,22,403,1},nil,nil,nil,nil},
		{1,9, "Huy誸Tr輈hTh筩h Lv4", {2,22,104,1},nil,nil,nil,nil},
		{1,9, "Nguy謙B筩hTh筩h Lv4", {2,22,204,1},nil,nil,nil,nil},
		{1,9, "H� Ph竎h Th筩h C蕄 4", {2,22,304,1},nil,nil,nil,nil},
		{1,9, "H綾 Di謚 Th筩h C蕄 4", {2,22,404,1},nil,nil,nil,nil},
		{1,1, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
		{1,1, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
		{1,1, "H� Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
		{1,1, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(tGem345, 100, 1, AC_LOG, AC_LOG);
end