
-- 该过程目的为实现清理帮会成员的周活跃度。
-- 在relay启动并读取DB数据时会执行一次。
-- 考虑到实际外网服务器可能没有每日重启，因此再定时处理一次

eMAIL_ATTACHMENT_T_NONE			= 0;	-- 空
eMAIL_ATTACHMENT_T_TEXT			= 1;	-- 文本
eMAIL_ATTACHMENT_T_ITEM			= 2;	-- 道具
eMAIL_ATTACHMENT_T_SCRIPT		= 3;	-- 脚本
eMAIL_ATTACHMENT_T_COIN			= 4;	-- 游戏币
eMAIL_ATTACHMENT_T_GOLD_TICKET	= 5;	-- 金券
-- 邮件条件类型
eMAIL_CONDIFION_T_NONE			= 0;	-- 空
eMAIL_CONDIFION_T_RECEIVE		= 1;	-- 是否可以接收邮件的条件 --仅用于群邮件
eMAIL_CONDIFION_T_TAKEOUT		= 2;	-- 是否可以取出附件的条件

function TaskShedule()
	TaskName("TongTotem");	
	WeeklyCheck(); -- 启动时先执行一次
	DailyLogTongInfo();
	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(0, 0);   
	-- 执行无限次
	TaskCountLimit(0);
end



function TaskContent()
	WeeklyCheck()
end

function DailyLogTongInfo()
	DoLogTotemInfo(1)
	DoLogTotemInfo(2)
end

function WeeklyCheck()
	local szClrDate = date("%Y%W");
	ResetTongLivenessPerWeek(tonumber(szClrDate));
end

function SendWarnningMail(szName, nType)
	-- 给帮会成员发送警告信函
	local tWarnningText = {
		"Do ng﹏ qu� bang h閕 kh玭g , у Щng Bang c馻 b筺  b� t� ng h� c蕄. Mong c竎 b筺 ch� �.",
		"Ng﹏ qu� bang h閕 kh玭g , hi謓 產ng v祇 th阨 k� xem x衪 gi秈 t竛 bang. N誹 tu莕 sau v蒼 kh玭g th� chi tr�, bang s� b� gi秈 t竛.",
		"Do ng﹏ qu� bang h閕 c� kh玭g  duy tr� bang h閕, bang h閕 c馻 b筺  b� gi秈 t竛!",
	}
	local tMailInfo			= {
		szTo				= szName,
		szFrom				= "H� th鑞g",
		szTitle				= "Nh綾 nh� xem x衪 bang h閕",
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= tWarnningText[nType+1],
		},
	};
	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "Nh綾 nh� xem x衪 bang h閕",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function SendTongGiftMail(szName,nType)
	-- 给帮会成员发送警告信函
	local tGift =  {
		{2, 1, 31208, "Ph骳 l頸 bang"},
		{2, 1, 31209, "Ph骳 l頸 bang"},
		{2, 1, 31210, "Ph骳 l頸 bang"},
	}
	if nType > getn(tGift) or nType < 1 then
		return 
	end
	local szMailScript = format("AddItem(%d,%d,%d,1)",tGift[nType][1],tGift[nType][2],tGift[nType][3]);
    local tMailInfo			= {
		szTo				= szName,
		szFrom				= "Qu秐 gia Bang h閕",
		szTitle				= tGift[nType][4],
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "Bang ch� ph竔 ta n ph竧 thng cho c竎 v�  thay l阨 c竚 琻!",
		},
        {
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= szMailScript,
		},
	};
	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "Ph骳 l頸 bang",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end