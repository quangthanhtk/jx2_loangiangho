
-- ¸Ã¹ý³ÌÄ¿µÄÎªÊµÏÖÇåÀí°ï»á³ÉÔ±µÄÖÜ»îÔ¾¶È¡£
-- ÔÚrelayÆô¶¯²¢¶ÁÈ¡DBÊý¾ÝÊ±»áÖ´ÐÐÒ»´Î¡£
-- ¿¼ÂÇµ½Êµ¼ÊÍâÍø·þÎñÆ÷¿ÉÄÜÃ»ÓÐÃ¿ÈÕÖØÆô£¬Òò´ËÔÙ¶¨Ê±´¦ÀíÒ»´Î

eMAIL_ATTACHMENT_T_NONE			= 0;	-- ¿Õ
eMAIL_ATTACHMENT_T_TEXT			= 1;	-- ÎÄ±¾
eMAIL_ATTACHMENT_T_ITEM			= 2;	-- µÀ¾ß
eMAIL_ATTACHMENT_T_SCRIPT		= 3;	-- ½Å±¾
eMAIL_ATTACHMENT_T_COIN			= 4;	-- ÓÎÏ·±Ò
eMAIL_ATTACHMENT_T_GOLD_TICKET	= 5;	-- ½ðÈ¯
-- ÓÊ¼þÌõ¼þÀàÐÍ
eMAIL_CONDIFION_T_NONE			= 0;	-- ¿Õ
eMAIL_CONDIFION_T_RECEIVE		= 1;	-- ÊÇ·ñ¿ÉÒÔ½ÓÊÕÓÊ¼þµÄÌõ¼þ --½öÓÃÓÚÈºÓÊ¼þ
eMAIL_CONDIFION_T_TAKEOUT		= 2;	-- ÊÇ·ñ¿ÉÒÔÈ¡³ö¸½¼þµÄÌõ¼þ

function TaskShedule()
	TaskName("TongTotem");	
	WeeklyCheck(); -- Æô¶¯Ê±ÏÈÖ´ÐÐÒ»´Î
	DailyLogTongInfo();
	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(0, 0);   
	-- Ö´ÐÐÎÞÏÞ´Î
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
	-- ¸ø°ï»á³ÉÔ±·¢ËÍ¾¯¸æÐÅº¯
	local tWarnningText = {
		"Do ng©n quü bang héi kh«ng ®ñ, §å §»ng Bang cña b¹n ®· bÞ tù ®éng h¹ cÊp. Mong c¸c b¹n chó ý.",
		"Ng©n quü bang héi kh«ng ®ñ, hiÖn ®ang vµo thêi kú xem xÐt gi¶i t¸n bang. NÕu tuÇn sau vÉn kh«ng thÓ chi tr¶, bang sÏ bÞ gi¶i t¸n.",
		"Do ng©n quü bang héi cø kh«ng ®ñ duy tr× bang héi, bang héi cña b¹n ®· bÞ gi¶i t¸n!",
	}
	local tMailInfo			= {
		szTo				= szName,
		szFrom				= "HÖ thèng",
		szTitle				= "Nh¾c nhë xem xÐt bang héi",
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
			szContent	= "Nh¾c nhë xem xÐt bang héi",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function SendTongGiftMail(szName,nType)
	-- ¸ø°ï»á³ÉÔ±·¢ËÍ¾¯¸æÐÅº¯
	local tGift =  {
		{2, 1, 31208, "Phóc lîi bang"},
		{2, 1, 31209, "Phóc lîi bang"},
		{2, 1, 31210, "Phóc lîi bang"},
	}
	if nType > getn(tGift) or nType < 1 then
		return 
	end
	local szMailScript = format("AddItem(%d,%d,%d,1)",tGift[nType][1],tGift[nType][2],tGift[nType][3]);
    local tMailInfo			= {
		szTo				= szName,
		szFrom				= "Qu¶n gia Bang héi",
		szTitle				= tGift[nType][4],
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "Bang chñ ph¸i ta ®Õn ph¸t th­ëng cho c¸c vÞ ®Ó thay lêi c¸m ¬n!",
		},
        {
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= szMailScript,
		},
	};
	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "Phóc lîi bang",
		},
	};
	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end