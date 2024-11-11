--�ű����ƣ��ʼ�����
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-09-29
--�����޸ļ�¼

Import("\\script\\lib\\define.lua");
Include("\\script\\mail\\mail_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\settings\\static_script\\lib\\item_define.lua")

function check_mail_can_send()
	if MAXNUM_MAIL_LIMIT_LEVEL > GetLevel() then
		ShowMailMessage(format("<color=red>[G�i th�t b�i]<color> Ng��i ch�i < c�p %d kh�ng ���c g�i th�!", MAXNUM_MAIL_LIMIT_LEVEL));
		return 0;
	end

	if MAXNUM_MAIL_LIMIT_SEND  <= GetTask(TASKID_MAIL_SEND_COUNT) then
		ShowMailMessage("<color=red>[G�i th�t b�i]<color> H�m nay b�n kh�ng th� ti�p t�c g�i th�!");
		return 0;
	end

	return 1;
end

function check_item_can_send(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx)
	if g == item_equip and d == enumBD_LEFT_PEARL then
		ShowMailMessage("<color=red>[Th�t B�i]<color> Th��ng H�i Ch�u t�m kh�ng th� g�i qua th�!");
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
		Msg2Player("H�m nay b�n kh�ng th� ti�p t�c g�i th�!");
	else
		Msg2Player(format("H�m nay b�n c�n ���c g�i th�m %d th�", (MAXNUM_MAIL_LIMIT_SEND - nCount)));
	end
end

function send_mail_test()
	local tMailInfo			= {
		szTo				= "",
		szFrom				= "H� th�ng",
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
		szTitle					= "G�i ph�n th��ng",
		szFrom					= "H� th�ng",
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
		"G�i 1 th�	/send_mail_test",
		"G�i 1 th� cho nh�m	/send_group_mail_test",
		"Ra kh�i			/nothing",
	};

	Say("Mu�n ki�m tra g�?",getn(szSay),szSay);
end
