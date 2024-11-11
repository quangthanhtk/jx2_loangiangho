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
	
	if script==nil or script == "" then --��������
		tMailAttachmentInfo[2] = nil
		tMailConditionInfo = {}
	end

	local nResult = SendOneGroupMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo)
	WriteLog(format("[Mail] sendGroupMail szFrom=%s szTitle=%s script=%s szContent=%s nResult=%d", szFrom, szTitle, script or "", szContent, nResult))
	OutputMsg(format("[Mail] sendGroupMail szFrom=%s szTitle=%s nResult=%d", szFrom, szTitle, nResult))
end

function TaskShedule()
	-- ��������
	TaskName("MailSender");

	-- ִֻ��1��
	TaskCountLimit(1);

	OutputMsg(format("MailSender Init Success!"));
end;

function TaskContent()
--	local szContent = format("%s\n%s\n%s\n%s\n%s\n%s\n%s"
--		, "�װ��ĸ�λ����"
--		, "    ���Ǻã�"
--		, "    Ϊ�˸����ṩ���ø���ݵ���Ϸ����������ʽ���ʼ�ϵͳ��ʽ�����ˡ�"
--		, "    Ŀǰ������ʱ��֧�����֮���ʼĸ����ͽ�Ǯ��������ϸ����ʹ��ָ����������������Ͻǵ��ʺŰ�ť�����˽⣬��л�����������Խ�����Ե2��֧�֣�ף����Ϸ��� ��"
--		, "    ����"
--		, "        ����"
--		, "            ������Ե2�з��Ŷ�")
--	sendGroupMail(20170430, 30170430, "������Ե2�з��Ŷ�", "�ʼ�ϵͳȫ������", szContent, nil, nil)--����
--
--	szContent = format("%s\n%s\n%s\n%s\n%s\n%s"
--		, "�װ��ĸ�λ����"
--		, "    ���Ǻã�"
--		, "    Ϊ��ף����ϵͳ��ʽ���ߣ��������������ͬ��֮Ը*7����л�����������Խ�����Ե2��֧�֣�ף����Ϸ��죡"
--		, "    ����"
--		, "        ����"
--		, "            ������Ե2�з��Ŷ�")
--	sendGroupMail(20170430, 20170430, "������Ե2�з��Ŷ�", "�ʼ�ϵͳȫ������", szContent, "AddItem(2,1,30913,7,4)", "checkNormal")--������
end;

