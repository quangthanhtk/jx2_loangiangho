
-- �ù���Ŀ��Ϊʵ���������Ա���ܻ�Ծ�ȡ�
-- ��relay��������ȡDB����ʱ��ִ��һ�Ρ�
-- ���ǵ�ʵ����������������û��ÿ������������ٶ�ʱ����һ��

eMAIL_ATTACHMENT_T_NONE			= 0;	-- ��
eMAIL_ATTACHMENT_T_TEXT			= 1;	-- �ı�
eMAIL_ATTACHMENT_T_ITEM			= 2;	-- ����
eMAIL_ATTACHMENT_T_SCRIPT		= 3;	-- �ű�
eMAIL_ATTACHMENT_T_COIN			= 4;	-- ��Ϸ��
eMAIL_ATTACHMENT_T_GOLD_TICKET	= 5;	-- ��ȯ
-- �ʼ���������
eMAIL_CONDIFION_T_NONE			= 0;	-- ��
eMAIL_CONDIFION_T_RECEIVE		= 1;	-- �Ƿ���Խ����ʼ������� --������Ⱥ�ʼ�
eMAIL_CONDIFION_T_TAKEOUT		= 2;	-- �Ƿ����ȡ������������

function TaskShedule()
	TaskName("TongTotem");	
	WeeklyCheck(); -- ����ʱ��ִ��һ��
	DailyLogTongInfo();
	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(0, 0);   
	-- ִ�����޴�
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
	-- ������Ա���;����ź�
	local tWarnningText = {
		"Do ng�n qu� bang h�i kh�ng ��, �� ��ng Bang c�a b�n �� b� t� ��ng h� c�p. Mong c�c b�n ch� �.",
		"Ng�n qu� bang h�i kh�ng ��, hi�n �ang v�o th�i k� xem x�t gi�i t�n bang. N�u tu�n sau v�n kh�ng th� chi tr�, bang s� b� gi�i t�n.",
		"Do ng�n qu� bang h�i c� kh�ng �� duy tr� bang h�i, bang h�i c�a b�n �� b� gi�i t�n!",
	}
	local tMailInfo			= {
		szTo				= szName,
		szFrom				= "H� th�ng",
		szTitle				= "Nh�c nh� xem x�t bang h�i",
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
			szContent	= "Nh�c nh� xem x�t bang h�i",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function SendTongGiftMail(szName,nType)
	-- ������Ա���;����ź�
	local tGift =  {
		{2, 1, 31208, "Ph�c l�i bang"},
		{2, 1, 31209, "Ph�c l�i bang"},
		{2, 1, 31210, "Ph�c l�i bang"},
	}
	if nType > getn(tGift) or nType < 1 then
		return 
	end
	local szMailScript = format("AddItem(%d,%d,%d,1)",tGift[nType][1],tGift[nType][2],tGift[nType][3]);
    local tMailInfo			= {
		szTo				= szName,
		szFrom				= "Qu�n gia Bang h�i",
		szTitle				= tGift[nType][4],
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "Bang ch� ph�i ta ��n ph�t th��ng cho c�c v� �� thay l�i c�m �n!",
		},
        {
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= szMailScript,
		},
	};
	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "Ph�c l�i bang",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end