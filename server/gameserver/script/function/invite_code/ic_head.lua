--邀请码功能
--design by liubo5
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

IC_TASK_GROUP = TaskManager:Create(IC_TASK_GROUP[1], IC_TASK_GROUP[2]);
IC_TASK_GROUP.InviteCode16H = 1; --记录自己的邀请码
IC_TASK_GROUP.InviteCode16L = 2; --记录自己的邀请码
IC_TASK_GROUP.Icd16H = 3; --记录已激活被邀请的激活码
IC_TASK_GROUP.Icd16L = 4; --记录已激活被邀请的激活码
IC_TASK_GROUP.FinishInvite = 5; --记录完成已被邀请
IC_TASK_GROUP.RecordAward = 6; --按位记录邀请者哪些领奖
IC_TASK_GROUP.Recrod2Award = 7; --按位记录被邀请者哪些条件已领奖
IC_TASK_GROUP.IBCost = 8;    --领取邀请码之后在御街消费计数
IC_TASK_GROUP.tagData = 9; --存放领奖标记
IC_TASK_GROUP.TempData = 10; --存放临时数据

IC_NPC_NAME = "<color=green> Чi S� ho箃 ng: <color>";
IC_NPC_TITLE = "H穣 nhanh ch鉵g m阨 b筺 b� n c飊g ch琲 tr� ch琲 n祇! B筺 b� c祅g nhi襲 th� s� c� th猰 nhi襲 ni襪 vui!";

IC_NPC_DIALOG = {
    "Gi韎 thi謚 ho箃 ng/ic_Introduce",
    "Nh薾 m� m阨/ic_GetInviteCode",
    "K輈h ho箃 m� m阨/ic_ActInviteCode",
    "Xem 甶觤 t輈h l騳/ic_QueryScore",
    "Nh薾 l蕐 ph莕 thng./ic_GetAward",
}

function fixUnknowError1711()
    local log = format(" [%s][%s] InviteCode fixUnknowError1711 reset task [", GetAccount(), GetName())
    for i = 1, 10 do
        local v = IC_TASK_GROUP:GetTask(i)
        log = log .. tostring(v)
        IC_TASK_GROUP:SetTask(i, 0)
    end
    log = log .. "]"
    WriteGsLog(6, log)
end

function ic_Introduce()
	local strTitle = format("%s%s%s%s<color=yellow>%s<color>",
			IC_NPC_NAME,
			format("Trong ho箃 ng, ngi ch琲 t n CS %d Lv%d tr� l猲 c� th� n t譵 Чi S� Ho箃 чng nh薾 m� m阨. G鰅 m� m阨 cho b筺 b�, ngi nh薾 頲 m� m阨 c� th� n g苝 Чi S� Ho箃 чng  k輈h ho箃 m� m阨.",
					0, 90),
			"Trong th阨 gian ho箃 ng m鏸 ngi ch� 頲 nh薾 m閠 m� m阨 v� ch� 頲 ti誴 nh薾 ngi kh竎 m阨 m閠 l莕, c� th� t苙g m� m阨 cho v� s� ngi ch琲.",
			"Ngi ch琲 t苙g m� m阨 nh薾 頲 甶觤 t輈h l騳 do ngi ti誴 nh薾 c鑞g hi課, khi 甶觤 t輈h l騳 t n c竎 m鑓 s� nh薾 頲 gi秈 thng kh竎 nhau.",
			"Ngi  nh薾 l阨 m阨 c� th� tham gia:"
		)

	local tbSay = {};
	tbSay.msg = strTitle;
	tbSay.sel = {};
	for i=1, getn(IC_BeiYAO_AWARD) do
		if IC_BeiYAO_AWARD[i][1] > 0 then
			tinsert(tbSay.sel, {format("%s sau 頲 nh薾 thng v� g鉷 %d 甶觤",_icGetConditionDes(i), _get_award_point(i)),"nothing"})
		end
	end
	tinsert(tbSay.sel, {"\n r髏 lui","nothing"})
	temp_Talk(tbSay);
end

function ic_GetInviteCode()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetInviteCode();
    DebugOutput("szInviteCode =", szInviteCode, tonumber(szInviteCode));
    if tonumber(szInviteCode) ~= 0 then
        Say(IC_NPC_NAME .. format("B筺  nh薾 m� m阨, s� m� m阨 l� <color=gold>%q<color>", szInviteCode), 0);
    else
        szInviteCode = _ic_generate_code();
        --这里要写数据库再回调
        --ic_GetInviteCode_CB
        if ic_CheckClickTime() ~= 1 then
            return 0;
        end
        DebugOutput("call InviteCode()", szInviteCode)
        InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "ic_GetInviteCode_CB");
        AddRuntimeStat(82, 1, 0, 1)
    end
end

function ic_GetInviteCode_CB(nRet, nScore)
    DebugOutput("ic_GetInviteCode_CB()", nRet, nScore);
    if 1 == nRet then
        local szInviteCode = _ic_generate_code();
        DebugOutput("call _ic_generate_code()", szInviteCode)
        _ic_SetInviteCode(szInviteCode);
        Say(IC_NPC_NAME .. format("M� m阨 m� b筺 nh薾 頲 l� <color=green>%q<color>", szInviteCode), 0);
    else
        Talk(1, "", "Nh薾 m� m阨 th蕋 b筰!");
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Register[%s] Failed!", GetAccount(), GetName(), GetPlayerRoute(), _ic_generate_code()));
    end
end

function ic_ActInviteCode()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    --	local szInviteCode = _ic_GetInviteCode();
    --	if szInviteCode ~= _ic_generate_code() then
    --		Say(IC_NPC_NAME.."您自己还没有领取任何邀请码！", 0)
    --		return 0;
    --	end
    AskClientForString("ic_ActInviteCode_Acfs", "M� m阨", 10, 10, "H穣 nh藀 m� m阨");
end

function ic_ActInviteCode_Acfs(szInviteCode)
	if ic_IsOpen() ~= 1 then
		Talk(1, "", "Ho箃 ng  qu� h筺")
		return 0;
	end
	--合法性检查
	--Msg2Player(szInviteCode)
	if ic_CheckCondition() ~= 1 then
		return 0;
	end
    if _ic_CheckInviteCode(szInviteCode) ~= 1 then
        Say(IC_NPC_NAME .. "K輈h ho箃 m� m阨 th蕋 b筰!", 0);
        return 0;
    end
    --不能激活自己的邀请码
    local selfCode = _ic_GetInviteCode();
    if selfCode == szInviteCode then
        Say(IC_NPC_NAME .. format("<color=red>%q<color> l� m� m阨 c馻 b筺, ch� 頲 k輈h ho箃 m� m阨 c馻 ngi kh竎 m韎 c� th� nh薾 ph莕 thng m阨 v� t輈h l騳 c鑞g hi課!", selfCode), 0);
        return 0;
    end
    --判断是否已激活
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if 0 ~= nType then
        Say(IC_NPC_NAME .. "B筺  頲 m阨 qua r錳, h穣 nhanh ch鉵g ho祅 th祅h 甶襲 ki謓 nhi謒 v�  nh薾 ph莕 thng!", 0);
        return 0;
    end
    --ic_ActInviteCode_CB
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    DebugOutput("ic_ActInviteCode_Acfs()", szInviteCode);
    _ic_SetActInviteCode(szInviteCode); --记录激活被邀请的激活码，不能作为已激活标志
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_ActInviteCode_CB");
end

function ic_ActInviteCode_CB(nRet, nScore)
    DebugOutput("ic_ActInviteCode_CB()", nRet, nScore)
    if 1 == nRet then
        --记录已被邀请过
        IC_TASK_GROUP:SetTask(IC_TASK_GROUP.FinishInvite, 1);
        Say(IC_NPC_NAME .. "B筺  k輈h ho箃 th祅h c玭g m� m阨, h穣 nhanh ch鉵g ho祅 th祅h 甶襲 ki謓  nh薾 ph莕 thng d祅h cho ngi 頲 m阨!", 0);
    else
        Say(IC_NPC_NAME .. "K輈h ho箃 m� m阨 th蕋 b筰!", 0);
    end
end

function ic_QueryScore()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetInviteCode();
    if szInviteCode ~= _ic_generate_code() then
        Say(IC_NPC_NAME .. "B筺 v蒼 ch璦 nh薾 m� m阨 n祇!", 0)
        return 0;
    end
    --访问数据库
    --ic_QueryScore_CB
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_QueryScore_CB");
end

function ic_QueryScore_CB(nRet, nScore)
    --你目前所得的总积分值为xx
    if 1 == nRet and nScore >= 0 then
        Say(IC_NPC_NAME .. format("M� m阨 c馻 b筺 l� <color=gold>%q<color>, t鎛g 甶觤 t輈h l騳 hi謓 t筰 l� <color=gold>%d<color>", _ic_GetInviteCode(), nScore), 0);
    else
        fixUnknowError1711()
        Say(IC_NPC_NAME .. "Xem 甶觤 t輈h l騳 xu蕋 hi謓 l鏸, h穣 li猲 h� ph遪g ch╩ s鉩 kh竎h h祅g", 0);
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d InviteCode=%s InviteCodeOther=%s nRet=%d nScore=%d",
                GetAccount(), GetName(), GetPlayerRoute(), _ic_GetInviteCode(), _ic_GetActInviteCode(), nRet, nScore));
    end
end

function ic_GetAward()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
        "\nPh莕 thng cho ngi m阨/ic_GetYaoqingAward",
        "\nPh莕 thng cho ngi 頲 m阨/ic_GetShouyaoAward",
        "\n r髏 lui/nothing",
    }
    Say(IC_NPC_NAME .. "B筺 mu鑞 nh薾 ph莕 thng g�?", getn(tSay), tSay);
end

function ic_GetYaoqingAward()
    local szInviteCode = _ic_GetInviteCode();
    DebugOutput(szInviteCode, _ic_generate_code());
    if szInviteCode ~= _ic_generate_code() then
        Say(IC_NPC_NAME .. "B筺 v蒼 ch璦 nh薾 m� m阨, kh玭g th� nh薾 ph莕 thng 甶觤 t輈h l騳!", 0);
        return 0;
    end
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_GetYaoqingAward_CB")
end

function ic_GetYaoqingAward_CB(nRet, nScore)
    if 1 ~= nRet then
        fixUnknowError1711()
        Say(IC_NPC_NAME .. "Xem 甶觤 t輈h l騳 th蕋 b筰, t筸 th阨 kh玭g th� nh薾 ph莕 thng!", 0);
        return 0;
    end
    if nScore < 0 then
        Say(IC_NPC_NAME .. "觤 t輈h l騳 kh竎 thng, kh玭g th� nh薾 ph莕 thng.!", 0);
        return 0;
    end
    local tSay = {}
    for k, v in IC_YAOQING_AWARD do
        if v[1] == "yinjuan" or v[1] == "jinjuan" then
            tinsert(tSay, format("%s*%d ( t輈h l騳 %d 甶觤)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4], v[2], k, nScore));
        elseif v[1] == "item" then
            tinsert(tSay, format("%s*%d ( t輈h l騳 %d 甶觤)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4][4], v[2], k, nScore));
        elseif v[1] == "func" then
            tinsert(tSay, format("%s( t輈h l騳 %d 甶觤 t輈h l騳)/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[2], k, nScore));
        end
    end
    tinsert(tSay, "\n r髏 lui/nothing");
    Say(IC_NPC_NAME .. format("T鎛g 甶觤 t輈h l騳 hi謓 t筰 l� <color=gold>%q<color>, h穣 i ph莕 thng theo 甶觤 t輈h l騳!", nScore), getn(tSay), tSay);
end

function ic_GetYaoqingAward_do(index, nScore)
    if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, index) > 0 then
        Say(IC_NPC_NAME .. "Ph莕 thng n祔  nh薾 r錳", 0);
        return 0;
    end
    local tCell = IC_YAOQING_AWARD[index];
    if not tCell then
        return 0;
    end
    if nScore < tCell[2] then
        Say(IC_NPC_NAME .. format("T鎛g 甶觤 t輈h l騳 hi謓 t筰 l� <color=gold>%q<color>, kh玭g  <color=gold>%q<color>, t筸 th阨 kh玭g th� nh薾 ph莕 thng n祔!", nScore, tCell[2]), 0);
        return 0;
    end
    if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then
        return 0;
    end
    --记录领奖
	--Msg2Player(IC_TASK_GROUP.RecordAward, index)
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.RecordAward, index, 1);
    AddRuntimeStat(83, index, 0, 1)
    --领奖
    if tCell[1] == "yinjuan" then
        --ModifyYinJuan(tCell[4], 1);
    elseif tCell[1] == "jinjuan" then
        --ModifyJinJuan(tCell[4], 1);
    elseif tCell[1] == "func" then
        tCell[4]();
    elseif tCell[1] == "item" then
        gf_AddItemEx2(tCell[4], GetItemName(tCell[4][1], tCell[4][2], tCell[4][3]), "Ho箃 ng m� m阨", "Ph莕 thng 甶觤 t輈h l騳", (tCell[5] or 0), 1);
    end
	
	return 1
end

function ic_GetShouyaoAward()
	local tSay = {}
	local tAward = nil
	for i=1, getn(IC_BeiYAO_AWARD) do
		tinsert(tSay,format("%s(%s)/#ic_GetShouyaoAward_do(%d)",_icGetAwardDes(i), _icGetConditionDes(i), i) )
	end
	tinsert(tSay, "\n r髏 lui/nothing");
	Say(IC_NPC_NAME.."K輈h ho箃 m� m阨 m韎 nh薾 頲 ph莕 thng tng 鴑g!", getn(tSay), tSay);
end

-- function ic_GetShouyaoExtAward()
-- 	local tSay = {
-- 		format("2,000,000 EXP(完成任意3个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE6),
-- 		format("10,000,000 EXP(完成任意4个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE7),
-- 		format("20,000,000 EXP(完成任意5个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE8),
-- 	};
-- 	tinsert(tSay, "\n退出/nothing");
-- 	Say(IC_NPC_NAME.."激活邀请码才能领取相应的奖励！", getn(tSay), tSay);
-- end

function ic_GetShouyaoAward_do(nType)
    local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if 1 ~= nValue then
        Say(IC_NPC_NAME .. "B筺 v蒼 ch璦 ho祅 th祅h l阨 m阨 c馻 h秓 h鱱 ho芻 ngi kh竎, kh玭g th� nh薾 ph莕 thng.", 0);
        return 0;
    end
    if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetActInviteCode();
    if _ic_CheckInviteCode(szInviteCode) ~= 1 then
        Say(IC_NPC_NAME .. "M� m阨 c馻 b筺 k輈h ho箃 b� b蕋 thng, kh玭g th� nh薾 ph莕 thng!", 0);
        return 0;
    end
    if _ic_CheckAwardCondition(nType, 1) ~= 1 then
        return 0;
    end
	--Msg2Player(IC_TASK_GROUP.Recrod2Award, nType)
    DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
    if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
        Say(IC_NPC_NAME .. "B筺  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 l筰!", 0);
        return 0;
    end
    if nType > IC_FINISH_INVITE_TYPE1 and nType ~= IC_FINISH_INVITE_TYPE6 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType - 1) ~= 1 then
        Say(IC_NPC_NAME .. "V蒼 ch璦 nh薾 ph莕 thng c馻 nhi謒 v� trc , kh玭g th� nh薾 ph莕 thng hi謓 t筰!", 0);
        return 0;
    end

    --已贡献过积分但没有领奖
    local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType);
    if 0 ~= nOldType then
        ic_GetShouyaoAward_finish(nType);
        return 0;
    end
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    --贡献积分
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType);
    local nPoint = _get_award_point(nType)
    if nPoint > 0 then
        InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "ic_GetShouyaoAward_CB");
    else
        ic_GetShouyaoAward_finish(nType);
    end
end

function _get_award_point(nType)
	local tAward = IC_BeiYAO_AWARD[nType]
	local nRet = tAward[1] or 0
	return nRet
end

function ic_GetShouyaoAward_CB(nRet, nScore)
    if nRet ~= 1 then
        fixUnknowError1711()
        Say(IC_NPC_NAME .. "L鏸 ch璦 x竎 nh, c鑞g hi課 甶觤 t輈h l騳 cho ngi m阨 th蕋 b筰", 0);
        return 0;
    end
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData);
    if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
        return 0;
    end
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0);
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1);
    ic_GetShouyaoAward_finish(nType);
end

function ic_GetShouyaoAward_finish(nType)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	AddRuntimeStat(84, nType, 0, 1)
	local tAward = IC_BeiYAO_AWARD[nType]
	if not tAward then
		return 0;
	end

	if tAward[2] == "exp" then
		gf_Modify("Exp", tAward[3])
	elseif tAward[2] == "item" then
		local tCell = tAward[3]
		gf_AddItemEx2(tCell[2], tCell[1], "InvitCode", "Ph莕 thng 甶觤 t輈h l騳", (tCell[3] or 0), 1);
	else
		print("[ERROR] ShouyaoAward type error, nType = ", nType)
		return 0;
	end
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	return 1
end

function ic_GetYaoYangJiezi(index, nType)
    local tCell = IC_YAOYANG_JIEZI_1[index];
    if not tCell then
        return 0;
    end
    if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
        return 0;
    end
    gf_AddItemEx2(tCell[2], tCell[1], "InvitCode", "Trang s鴆 Di謚 Dng ", 0, 1);
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
end

--活动是否开启
function ic_IsOpen()
    return gf_CheckDuration(IC_START_TIME, IC_END_TIME);
end

function ic_player_login()
	if ic_IsOpen() == 1 then
		SendShowCDkeyIcon()
	end
end

--参与条件
function ic_CheckCondition()
    local nCount_CS = GetTranslifeCount()
    if nCount_CS < 1 then
        if GetLevel() < 90 then
            Talk(1, "", format("Ngi ch琲 <color=red>c蕄 %d<color> tr� l猲 m韎 頲 tham gia", 90));
            return 0;
        end
    end
    return 1;
end

--检查时间
function ic_CheckClickTime()
    if not G_IC_CLICK_TIME then
        G_IC_CLICK_TIME = {}
    end
    local szName = GetName();
    local nCurTime = GetTime();
    if not G_IC_CLICK_TIME[szName] then
        G_IC_CLICK_TIME[szName] = nCurTime;
        return 1;
    end
    local nPastTime = nCurTime - G_IC_CLICK_TIME[szName];
    if nPastTime < IC_CLICK_TIME then
        Msg2Player(format("Thao t竎 qu� nhi襲, %ds sau h穣 th� l筰", IC_CLICK_TIME - nPastTime));
        return 0;
    end
    G_IC_CLICK_TIME[szName] = nCurTime;
    return 1;
end

--生成邀请码
--要求全区服每个玩家邀请码不一样
--改盐能够复用
--返回10位固定邀请码字符串
function _ic_generate_code()
    local szAccount = GetAccount();
    local szName = GetName();
    local szCode = tostring(abs(String2Hash(szAccount .. szName .. IC_INVITE_CODE_SALT)));
    if strlen(szCode) < 10 then
        szCode = format("%010d", tonumber(szCode))
    else
        szCode = strsub(szCode, 1, 10)
    end
    return szCode;
end

--检查激活码合法性
function _ic_CheckInviteCode(szInviteCode)
    if strlen(szInviteCode) ~= 10 then
        return 0;
    end
    if tonumber(szInviteCode) == 0 then
        return 0;
    end
    for i = 1, strlen(szInviteCode) do
        local char = strsub(szInviteCode, i, i);
        local nNum = tonumber(char);
        if not nNum or (nNum < 0 or nNum > 9) then
            return 0;
        end
    end
    return 1;
end

--设置自己邀请码字符串
function _ic_SetInviteCode(szCode)
    if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
        WriteLog("[InviteCode] ERROR: _ic_SetInviteCode strlen(szCode) ~= 10");
        return
    end
    local nH16 = tonumber(strsub(szCode, 1, 5));
    local nL16 = tonumber(strsub(szCode, 6, 10));
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16H, nH16);
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16L, nL16);
end

--获取自己邀请码字符串
function _ic_GetInviteCode()
    local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16H);
    local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16L);
    local strH16 = format("%05d", nH16);
    local strL16 = format("%05d", nL16);
    if strlen(strH16) ~= 5 or strlen(strL16) ~= 5 then
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d strH16=%s strL16=%s", GetAccount(), GetName(), GetPlayerRoute(), strH16, strL16));
        return 0;
    end
    return strH16 .. strL16;
end

--设置已激活邀请码字符串
function _ic_SetActInviteCode(szCode)
    if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
        WriteLog("[InviteCode] ERROR: _ic_SetActInviteCode strlen(szCode) ~= 10");
        return
    end
    local nH16 = tonumber(strsub(szCode, 1, 5));
    local nL16 = tonumber(strsub(szCode, 6, 10));
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16H, nH16);
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16L, nL16);
end

--获取已激活邀请码字符串
function _ic_GetActInviteCode()
    local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16H);
    local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16L);
    local Icd16H = format("%05d", nH16);
    local Icd16L = format("%05d", nL16);
    if strlen(Icd16H) ~= 5 or strlen(Icd16L) ~= 5 then
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Icd16H=%s Icd16L=%s", GetAccount(), GetName(), GetPlayerRoute(), Icd16H, Icd16L));
        return 0;
    end
    return Icd16H .. Icd16L;
end

--检查受邀者领奖条件
function _ic_CheckAwardCondition(nType, bMsg)
	local tConditon = IC_BeiYAO_AWARD_CONDITION[nType]
	if not tConditon or not tConditon[3] then
		WriteLog(format("[InviteCode] ERROR INVITE_AWARD type:%d", nType))
		return 0
	end

	if tConditon[3](gf_UnPack(tConditon[2])) ~= 1 then
		if bMsg and bMsg == 1 then
			Say(IC_NPC_NAME..format("B筺 v蒼 ch璦 th醓 甶襲 ki謓 nh薾: <color=red>%s<color>", _icGetConditionDes(nType)), 0);
		end
		return 0 
	end

	return 1
end

function _ic_getFinisCount()
    local nRet = 0
    for i = 1, IC_FINISH_INVITE_TYPE5 do
        if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, i) ~= 0 then
            nRet = nRet + 1
        end
    end
    return nRet
end

--御街消费对外接口
function _ic_IbCcost(nValue)
    if ic_IsOpen() ~= 1 then
        return 0;
    end
    local szCode = _ic_GetActInviteCode();
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if tonumber(nValue) <= 0 or nType == 0 or tonumber(szCode) <= 0 then
        return 0;
    end
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.IBCost, IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) + tonumber(nValue));
    Msg2Player(format("Trong ho箃 ng m� m阨, ti猽 ph� tr猲 Ng� C竎 c馻 b筺  t╪g %d", tonumber(nValue)));
end

function _icGetConditionDes(nType)
	local szRet = ""
	local tConditon = IC_BeiYAO_AWARD_CONDITION[nType]
	if not tConditon then
		return szRet
	end

	if tConditon[2] == nil or getn(tConditon[2]) < 1 then
		szRet = tConditon[1]
	else
 		szRet = format(tConditon[1], gf_UnPack(tConditon[2]) )
	end
	return szRet
end

function _icGetAwardDes(nType)
	local szRet = ""
	local tAward = IC_BeiYAO_AWARD[nType]
	if not tAward then
		return szRet
	end

	if tAward[2] == "exp" then
		szRet = format("%d EXP", tAward[3] )
	elseif tAward[2] == "item" then
		szRet = tAward[3][1]
		local nLastSecond = tAward[3][3]
		if nLastSecond and nLastSecond > 0 then
			szRet = format("%s (%d ng祔)", szRet, floor(nLastSecond/(3600*24)) )
		end 
	end

	return szRet
end


------------------------
--活动界面操作接口
--author: 王乾
--date 	: 2020.7
------------------------
function RequestInviteData()
	local szMyCdoe, nScore;
	if ic_CheckCondition() ~= 1 then
		szMyCdoe = "C蕄 ch璦 t";
		SendInviteData(0, szMyCdoe)
		return 0;
	end
	local szInviteCode = _ic_GetInviteCode();
	if tonumber(szInviteCode) ~= 0 then
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "RequestInviteScore");
	else
		--访问数据库
		--ic_QueryScore_CB
		szInviteCode = _ic_generate_code();
		if ic_CheckClickTime() ~= 1 then
			return 0;
		end
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "RequestInviteScore");
	end
end

function RequestInviteScore(nRet, nScore)
    if ic_IsOpen() ~= 1 then
        return 0;
    end
	DebugOutput("RequestInviteScore()", nRet, nScore)
	if 1 == nRet then
		local szInviteCode = _ic_generate_code();
		_ic_SetInviteCode(szInviteCode);
		SendInviteData(nScore, szInviteCode)
	else
		Msg2Player("Nguy猲 nh﹏ ch璦 bi誸, nh薾 甶觤 t輈h l騳 th蕋 b筰.")
		SendInviteData(0, "Nh薾 th蕋 b筰")
	end
end

function SendInviteData(nScore, szMyCdoe)
	local tYaoqingAwardState = GetYaoqingAwardState(nScore)
	local tShouYaoAwardState = GetShouYaoAwardState()
	if not tYaoqingAwardState or not tShouYaoAwardState then
		return
	end
	local szName = GetName()
	G_PLAYER_SCORE_CASH[szName] = nScore
	SendInviteData2client(nScore, szMyCdoe, tYaoqingAwardState, tShouYaoAwardState)
end

function GetYaoqingAwardState(nScore)
	local nTab  = {0,0,0,0,0,0,0,0,}
	if ic_CheckCondition() ~= 1 then
		return nTab;
	end
	for k,v in IC_YAOQING_AWARD do
		if nScore >= v[2] then
			nTab[k] = 1;
		end
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, k) > 0 then
			nTab[k] = 2;
		end
	end
	return nTab
end

function GetShouYaoAwardState()
	local nTab  = {0,0,0,0,0,0,0,0,}
	if ic_CheckCondition() ~= 1 then
		return nTab;
	end
	local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 1 ~= nValue then
		return nTab;
	end
	for k,v in IC_YAOQING_AWARD do
		nTab[k] = checkAwardFinish(k);
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, k) ~= 0 then
			nTab[k] = 2
		end
	end
	return nTab
end

function checkAwardFinish(nType)
	if _ic_CheckAwardCondition(nType) ~= 1 then
		return 0 
	end

	return 1
end

function GetInviteAward(nTask, nType)
	if ic_IsOpen() ~= 1 then
		Talk(1, "", "Ho箃 ng  qu� h筺")
		return 0;
	end
	--Msg2Player(nTask, nType)
	if nType == 1 then
		GetYaoqingAward(nTask, G_PLAYER_SCORE_CASH[GetName()])
	elseif nType == 2 then
		GetShouyaoAward(nTask)
	end
end

function GetYaoqingAward(index, nScore)
	if not nScore then
		Say("觤 t輈h l騳 kh竎 thng, kh玭g th� nh薾 ph莕 thng.!", 0);
		return 0;
	end
	if ic_GetYaoqingAward_do(index, nScore) ~= 1 then
		return 0;
	end
	SendInviteData(nScore, _ic_GetInviteCode())
	return 1
end

function GetShouyaoAward(nType)
	local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 1 ~= nValue then
		Say(IC_NPC_NAME.."B筺 v蒼 ch璦 ho祅 th祅h l阨 m阨 c馻 h秓 h鱱 ho芻 ngi kh竎, kh玭g th� nh薾 ph莕 thng.", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	local szInviteCode = _ic_GetActInviteCode();
	if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."M� m阨 c馻 b筺 k輈h ho箃 b� b蕋 thng, kh玭g th� nh薾 ph莕 thng!", 0);
		return 0;
	end
	if checkAwardFinish(nType) ~= 1 then
		return 0;
	end
	--Msg2Player(IC_TASK_GROUP.Recrod2Award, nType)
	DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
	if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
		Say(IC_NPC_NAME.."B筺  nh薾 ph莕 thng n祔 r錳, kh玭g th� nh薾 l筰!", 0);
		return 0;
	end
	if nType > IC_FINISH_INVITE_TYPE1 and nType ~= IC_FINISH_INVITE_TYPE6 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType-1) ~= 1 then
		Say(IC_NPC_NAME.."V蒼 ch璦 nh薾 ph莕 thng c馻 nhi謒 v� trc , kh玭g th� nh薾 ph莕 thng hi謓 t筰!", 0);
		return 0;
	end
	
	--已贡献过积分但没有领奖
	local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType);
	if 0 ~= nOldType then
		return GetShouyaoAward_finish(nType);
	end
	--if ic_CheckClickTime() ~= 1 then
	--	return 0;
	--end
	--贡献积分
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType);
	local nPoint = _get_award_point(nType)
	if nPoint > 0 then
		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "GetShouyaoAward_CB");
	else
		return GetShouyaoAward_finish(nType);
	end
end

function GetShouyaoAward_CB(nRet, nScore)
	if nRet ~= 1 then
		fixUnknowError1711()
		Say(IC_NPC_NAME.."L鏸 ch璦 x竎 nh, c鑞g hi課 甶觤 t輈h l騳 cho ngi m阨 th蕋 b筰", 0);
		return 0;
	end
	local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData);
	if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
		return 0;
	end
	IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0);
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1);
	GetShouyaoAward_finish(nType);
end

function GetShouyaoAward_finish(nType)
	if ic_GetShouyaoAward_finish(nType) ~= 1 then
		return 0
	end

	SendInviteData(G_PLAYER_SCORE_CASH[GetName()] or 0, _ic_GetInviteCode())
	return 1
end