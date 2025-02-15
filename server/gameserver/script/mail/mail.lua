--脚本名称：邮件测试
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-09-29
--代码修改记录

Import("\\script\\lib\\define.lua");
Include("\\script\\mail\\mail_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\settings\\static_script\\lib\\item_define.lua")

function check_mail_can_send()
	if MAXNUM_MAIL_LIMIT_LEVEL > GetLevel() then
		ShowMailMessage(format("<color=red>[G鰅 th蕋 b筰]<color> Ngi ch琲 < c蕄 %d kh玭g 頲 g鰅 th�!", MAXNUM_MAIL_LIMIT_LEVEL));
		return 0;
	end

	if MAXNUM_MAIL_LIMIT_SEND  <= GetTask(TASKID_MAIL_SEND_COUNT) then
		ShowMailMessage("<color=red>[G鰅 th蕋 b筰]<color> H玬 nay b筺 kh玭g th� ti誴 t鬰 g鰅 th�!");
		return 0;
	end

	return 1;
end

function check_item_can_send(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx)
	if g == item_equip and d == enumBD_LEFT_PEARL then
		ShowMailMessage("<color=red>[Th蕋 B筰]<color> Thng H秈 Ch﹗ t筸 kh玭g th� g鰅 qua th�!");
		return 0;
	end
	return 1;
end

function send_result(nRet)
	if 1 ~= nRet then
		return
	end

	SetTask(TASKID_MAIL_SEND_COUNT, GetTask(TASKID_MAIL_SEND_COUNT) + 1, TASK_MAIL_ACCESSCODE);

	local nCount = GetTask(TASKID_MAIL_SEND_COUNT);
	if MAXNUM_MAIL_LIMIT_SEND <= nCount then
		Msg2Player("H玬 nay b筺 kh玭g th� ti誴 t鬰 g鰅 th�!");
	else
		Msg2Player(format("H玬 nay b筺 c遪 頲 g鰅 th猰 %d th�", (MAXNUM_MAIL_LIMIT_SEND - nCount)));
	end
end

function send_mail_test()
	local tMailInfo			= {
		szTo				= "",
		szFrom				= "H� th鑞g",
		szTitle				= "test",
		byPRI				= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "",
		},
		{
			nType		= eMAIL_ATTACHMENT_T_COIN,
			szContent	= 10000,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_GOLD_TICKET,
			szContent	= 100,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= "AddItem(0, 105, 1, 1, 4)",
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "check_test2",
		},
	};

	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function send_group_mail_test(nLv)
	local tMailInfo = {
		szTitle					= "G鰅 ph莕 thng",
		szFrom					= "H� th鑞g",
		ulLiveTime				= MkTime(2012,12,12),
		byPRI					= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "test",
		},
		{
			nType		= eMAIL_ATTACHMENT_T_COIN,
			szContent	= 10000,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_GOLD_TICKET,
			szContent	= 100,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= "AddItem(0, 105, 1, 1, 4)",
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_RECEIVE,
			szContent	= "check_test",
		},
	};

	SendOneGroupMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function Test_Mail()
	local szSay = {
		"G鰅 1 th�	/send_mail_test",
		"G鰅 1 th� cho nh鉳	/send_group_mail_test",
		"Ra kh醝			/nothing",
	};

	Say("Mu鑞 ki觤 tra g�?",getn(szSay),szSay);
end
