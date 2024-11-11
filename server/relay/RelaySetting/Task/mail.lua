Include("\\RelaySetting\\Task\\mail_head.lua");

function sendGroupMail(nEffectTime, nLiveTime, szFrom, szTitle, szContent, script, check)
	if tonumber(date("%Y%m%d")) > nEffectTime then
		return
	end
	
	local t = nLiveTime
	local d = mod(nLiveTime,100)
	t = floor(t/100)
	local m = mod(nLiveTime,100)
	t = floor(t/100)
	local y = mod(nLiveTime,10000)
	local tMailInfo = {
		szTitle					= szTitle,
		szFrom					= szFrom,
		ulLiveTime				= MkTime(y,m,d),
		byPRI					= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= script,
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check or "checkNormal",
		},
	};
	
	if script==nil or script == "" then --不带附件
		tMailAttachmentInfo[2] = nil
		tMailConditionInfo = {}
	end

	local nResult = SendOneGroupMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo)
	WriteLog(format("[Mail] sendGroupMail szFrom=%s szTitle=%s script=%s szContent=%s nResult=%d", szFrom, szTitle, script or "", szContent, nResult))
	OutputMsg(format("[Mail] sendGroupMail szFrom=%s szTitle=%s nResult=%d", szFrom, szTitle, nResult))
end

function TaskShedule()
	-- 任务名字
	TaskName("MailSender");

	-- 只执行1次
	TaskCountLimit(1);

	OutputMsg(format("MailSender Init Success!"));
end;

function TaskContent()
--	local szContent = format("%s\n%s\n%s\n%s\n%s\n%s\n%s"
--		, "亲爱的各位大侠"
--		, "    你们好！"
--		, "    为了给您提供更好更便捷的游戏服务，我们正式将邮件系统正式上线了。"
--		, "    目前邮箱暂时不支持玩家之间邮寄附件和金钱，更多详细邮箱使用指南请点击邮箱界面右上角的问号按钮进行了解，感谢您长期以来对剑侠情缘2的支持，祝您游戏愉快 ！"
--		, "    此致"
--		, "        敬礼！"
--		, "            剑侠情缘2研发团队")
--	sendGroupMail(20170430, 30170430, "剑侠情缘2研发团队", "邮件系统全新上线", szContent, nil, nil)--永久
--
--	szContent = format("%s\n%s\n%s\n%s\n%s\n%s"
--		, "亲爱的各位大侠"
--		, "    你们好！"
--		, "    为庆祝邮箱系统正式上线，我们在这里奉上同济之愿*7，感谢您长期以来对剑侠情缘2的支持，祝您游戏愉快！"
--		, "    此致"
--		, "        敬礼！"
--		, "            剑侠情缘2研发团队")
--	sendGroupMail(20170430, 20170430, "剑侠情缘2研发团队", "邮件系统全新上线", szContent, "AddItem(2,1,30913,7,4)", "checkNormal")--有期限
end;

