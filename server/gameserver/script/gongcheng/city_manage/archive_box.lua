-- ³É¶¼Ö®Ó¡
Import("\\script\\lib\\string.lua")

tCityName =
{
	[300] = "Thµnh §«",
	[100] = "TuyÒn Ch©u",
	[350] = "T­¬ng D­¬ng",
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	if GetTeamSize() == 0 then
		Say("Tr­íc khi sö dông Thµnh §« Ên xin h·y tæ ®éi víi ng­êi cÇn thao t¸c!", 0)
		return
	end
	local nshi = GetItemParam(nItemIdx, 1)
	local nti = GetItemParam(nItemIdx, 2)
	
	Say("B¹n muèn nhËn chøc vô ë thµnh nµo?\nCã thÓ nhËn chøc <color=yellow>"..(1 - nshi).."<color> qu©n s­ vµ <color=yellow>"..(4 - nti).." <color> danh bé\n<color=green>Qu©n s­<color>: Qu©n s­ cã thÓ thay ®æi thuÕ suÊt vµ l·nh thuÕ.\n<color=green>Danh bé<color>: cã thÓ truy n· ng­êi ch¬i cã trÞ PK!", 3, "Bæ nhiÖm qu©n s­/#renming_shi_ye("..nItemIdx..")", "Bæ nhiÖm danh bé/#renming_ti_xia("..nItemIdx..")", "Kh«ng lµm/no_say")
end

function renming_shi_ye(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Thµnh §« Ên chØ t¹i "..tCityName[nItemMapID].."Sö dông ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö "..tCityName[nItemMapID].." thµnh chñ, kh«ng thÓ sö dông Thµnh §« Ên!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("Mét thµnh thÞ chØ cã thÓ bæ nhiÖm 1 qu©n s­", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = sf_Replace(szName, "/" ,"-")
				szName = sf_Replace(szName, "|" ,"-")
				szName = sf_Replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_shi_ye("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "Kh«ng lµm/no_say"
	PlayerIndex = nOldPlayer
	Say("C¸c h¹ ®Þnh bæ nhiÖm ai lµm qu©n s­?\nChó ý:  Tªn ng­êi ch¬i cã ký tù ®Æc biÖt sÏ ®æi thµnh <color=yellow>\"-\"<color>", getn(tTab), tTab)
end

function yes_renming_shi_ye(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Thµnh §« Ên chØ t¹i "..tCityName[nItemMapID].."Sö dông ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö "..tCityName[nItemMapID].." thµnh chñ, kh«ng thÓ sö dông Thµnh §« Ên!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("Mét thµnh thÞ chØ cã thÓ bæ nhiÖm 1 qu©n s­", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		local szTongName = GetTongName()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- ÒÑÓÐÖ°Î»»òÈë°ï²»×ã7ÌìÕß²»ÄÜ¸øÓÚ
			szName = sf_Replace(szName, "/" ,"-")
			szName = sf_Replace(szName, "|" ,"-")
			szName = sf_Replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","Kh«ng thÓ nhËn chøc <color=yellow>"..szName.."<color> thµnh qu©n s­, xin mêi x¸c nhËn."..szName.."HiÖn ch­a cã chøc vô hoÆc nhËp bang ch­a ®ñ 7 ngµy")
			return
		end
		local nRet, nShiyeItemIndex = AddItem(2,1,1204,1,1)
		if nRet == 1 then
			SetItemParam(nShiyeItemIndex, 0, nItemMapID)		-- ÄÄ¸ö³ÇÊÐµÄ
			SetItemExpireTime(nShiyeItemIndex, nExpireTime)		-- ÎïÆ·µ½ÆÚÊ±¼ä
			SaveNow()											-- µÃµ½ÎïÆ·µÄÈË±£´æÒ»ÏÂ
			WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..GetTongName().."-"..szName.." ®· ®­îc bæ nhiÖm thµnh Qu©n S­")
			PlayerIndex = nOldPlayer
			szName = sf_Replace(szName, "/" ,"-")
			szName = sf_Replace(szName, "|" ,"-")
			szName = sf_Replace(szName, ":" ,"-")
			SetItemParam(nItemIdx, 1, 1)
			Talk(1,"","B¹n nhËn chøc "..szName.." lµ qu©n s­")
			SendTongMessage(GetName().."®©m"..szName.." bæ nhiÖm thµnh qu©n s­")
			-- Èç¹ûÒÑ¾­ÈÎÃüÍêËùÓÐÃû¶îÁË£¬¾ÍÉ¾µô×Ô¼º
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- ¸øÎïÆ·µÄÈËÒ²±£´æÒ»ÏÂ
		else
			Talk(1,"","Hµnh trang ®· ®Çy hoÆc søc lùc kh«ng ®ñ")
		end
	end
end

function renming_ti_xia(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Thµnh §« Ên chØ t¹i "..tCityName[nItemMapID].."Sö dông ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö "..tCityName[nItemMapID].." thµnh chñ, kh«ng thÓ sö dông Thµnh §« Ên!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("Mét thµnh thÞ chØ ®­îc bæ nhiÖm 4 danh bé", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = sf_Replace(szName, "/" ,"-")
				szName = sf_Replace(szName, "|" ,"-")
				szName = sf_Replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_ti_xia("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "Kh«ng lµm/no_say"
	PlayerIndex = nOldPlayer
	Say("C¸c h¹ ®Þnh bæ nhiÖm ai lµm danh bé?\nChó ý: Tªn ng­êi ch¬i cã ký tù ®Æc biÖt sÏ ®æi thµnh <color=yellow>\"-\"<color>", getn(tTab), tTab)	
end

function yes_renming_ti_xia(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Thµnh §« Ên chØ t¹i "..tCityName[nItemMapID].."Sö dông ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö "..tCityName[nItemMapID].." thµnh chñ, kh«ng thÓ sö dông Thµnh §« Ên!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("Mét thµnh thÞ chØ ®­îc bæ nhiÖm 4 danh bé", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- ÒÑÓÐÖ°Î»»òÈë°ï²»×ã7ÌìÕß²»ÄÜ¸øÓÚ
			szName = sf_Replace(szName, "/" ,"-")
			szName = sf_Replace(szName, "|" ,"-")
			szName = sf_Replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","Kh«ng thÓ nhËn chøc <color=yellow>"..szName.."<color> thµnh danh bé, xin mêi x¸c nhËn"..szName.."HiÖn ch­a cã chøc vô hoÆc nhËp bang ch­a ®ñ 7 ngµy")
			return
		end
		local nRet, nTixiaItemIndex = AddItem(2,1,1205,1,1)
		if nRet == 1 then
			SetItemParam(nTixiaItemIndex, 0, nItemMapID)		-- ÄÄ¸ö³ÇÊÐµÄ
			SetItemExpireTime(nTixiaItemIndex, nExpireTime)		-- ÎïÆ·µ½ÆÚÊ±¼ä
			SaveNow()											-- µÃµ½ÎïÆ·µÄÈË±£´æÒ»ÏÂ
			WriteLog("C«ng thµnh chiÕn-Qu¶n lý:"..GetTongName().."-"..szName.." ®­îc bæ nhiÖm lµm danh bé")
			PlayerIndex = nOldPlayer
			szName = sf_Replace(szName, "/" ,"-")
			szName = sf_Replace(szName, "|" ,"-")
			szName = sf_Replace(szName, ":" ,"-")
			nCount = nCount + 1
			SetItemParam(nItemIdx, 2, nCount)
			Talk(1,"","B¹n nhËn chøc "..szName.." lµ danh bé")
			SendTongMessage(GetName().."®©m"..szName.." bæ nhiÖm lµ danh bé")
			-- Èç¹ûÒÑ¾­ÈÎÃüÍêËùÓÐÃû¶îÁË£¬¾ÍÉ¾µô×Ô¼º
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- ¸øÎïÆ·µÄÈËÒ²±£´æÒ»ÏÂ
		else
			Talk(1,"","Hµnh trang ®· ®Çy hoÆc søc lùc kh«ng ®ñ")
		end
	end
end

function no_say()
end