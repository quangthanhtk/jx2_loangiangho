--½Å±¾Ãû³Æ£ºÓÊ¼þ²âÊÔ
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-09-29
--´úÂëÐÞ¸Ä¼ÇÂ¼

Import("\\script\\lib\\define.lua");
Include("\\script\\mail\\mail_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\settings\\static_script\\lib\\item_define.lua")

function check_mail_can_send()
	if MAXNUM_MAIL_LIMIT_LEVEL > GetLevel() then
		ShowMailMessage(format("<color=red>[Göi thÊt b¹i]<color> Ng­êi ch¬i < cÊp %d kh«ng ®­îc göi th­!", MAXNUM_MAIL_LIMIT_LEVEL));
		return 0;
	end

	if MAXNUM_MAIL_LIMIT_SEND  <= GetTask(TASKID_MAIL_SEND_COUNT) then
		ShowMailMessage("<color=red>[Göi thÊt b¹i]<color> H«m nay b¹n kh«ng thÓ tiÕp tôc göi th­!");
		return 0;
	end

	return 1;
end

function check_item_can_send(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx)
	if g == item_equip and d == enumBD_LEFT_PEARL then
		ShowMailMessage("<color=red>[ThÊt B¹i]<color> Th­¬ng H¶i Ch©u t¹m kh«ng thÓ göi qua th­!");
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
		Msg2Player("H«m nay b¹n kh«ng thÓ tiÕp tôc göi th­!");
	else
		Msg2Player(format("H«m nay b¹n cßn ®­îc göi thªm %d th­", (MAXNUM_MAIL_LIMIT_SEND - nCount)));
	end
end

function send_mail_test()
	local tMailInfo			= {
		szTo				= "",
		szFrom				= "HÖ thèng",
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
		szTitle					= "Göi phÇn th­ëng",
		szFrom					= "HÖ thèng",
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
		"Göi 1 th­	/send_mail_test",
		"Göi 1 th­ cho nhãm	/send_group_mail_test",
		"Ra khái			/nothing",
	};

	Say("Muèn kiÓm tra g×?",getn(szSay),szSay);
end
