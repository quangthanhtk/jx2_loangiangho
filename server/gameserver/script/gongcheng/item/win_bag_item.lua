Import("\\script\\lib\\globalfunctions.lua");
-- tb_exp = {
-- 	[0] = 0,
-- 	[1] = 5000,
-- 	[2] = 50000,
-- 	[3] = 200000,
-- 	[4] = 500000,
-- 	[5] = 1000000,
-- 	[6] = 2000000,
-- 	[70] = 3000000,
-- 	[71] = 3500000,
-- 	[72] = 4000000,
-- 	[73] = 4500000,
-- 	[74] = 5000000,
-- 	[75] = 5500000,
-- 	[76] = 6000000,
-- 	[77] = 6500000,
-- 	[78] = 7000000,
-- 	[79] = 7500000,
-- 	[80] = 8000000,
-- 	[81] = 8500000,
-- 	[82] = 9000000,
-- 	[83] = 9500000,
-- 	[84] = 10000000,
-- 	[85] = 10500000,
-- 	[86] = 11000000,
-- 	[87] = 11500000,
-- 	[88] = 12000000,
-- 	[89] = 12500000,
-- 	[90] = 13000000,
-- 	[91] = 13500000,
-- 	[92] = 14000000,
-- 	[93] = 14500000,
-- 	[94] = 15000000,
-- 	[95] = 15500000,
-- 	[96] = 16000000,
-- 	[97] = 16500000,
-- 	[98] = 17000000,
-- 	[99] = 17500000,
-- };

const_exp = 20000000
award_ornament = {
	{0,119,13,"L­u Quang (§á)"},
	{0,121,13,"Tinh Th¸i (§á)"},
	{0,120,13,"Trî Phông T­êng Loan (§á)"},
}

function OnUse(nItemIdx)
	local nWeek = GetWeekSequence(1,0);
	if GetTask(1043) < nWeek then
		SetTask(1043,nWeek);
		SetTask(1044,0);
	end
	if GetTask(1043) >= nWeek and GetTask(1044) >= 2 then
		Talk(1,"","Mçi ng­êi mçi tuÇn chØ cã thÓ dïng 2 lÇn C«ng Thµnh ChiÕn LÔ Bao, tuÇn nµy b¹n ®· sö dông 2 lÇn.");
		return
	end
	if gf_JudgeRoomWeight(4, 0) == 0 then
		Talk(1,"","Chç trèng hµnh trang hoÆc søc nÆng cña b¹n kh«ng ®ñ, mêi b¹n kiÓm tra l¹i.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(1044,GetTask(1044)+1);
		-- local nLevel = GetLevel();
		-- if nLevel < 70 then
		-- 	nLevel = floor(nLevel / 10);
		-- end
		-- if nLevel ~= 0 then
		-- 	local nExp = tb_exp[nLevel];
		-- 	ModifyExp(nExp);
		-- 	Msg2Player("Äã»ñµÃ"..nExp.."µã¾­Ñé");
		-- 	Talk(1,"","ÕâÊÇÄã±¾ÖÜµÚ"..GetTask(1044).."´ÎÊ¹ÓÃ¹¥³ÇÕ½Àñ°ü£¨°üÀ¨Ê¤¸ºÀñ°ü£©£¬Ã¿ÈËÃ¿ÖÜÖ»ÄÜÊ¹ÓÃÁ½´Î¹¥³ÇÕ½Àñ°ü¡£");
		-- end
		
		gf_AddItemEx({2,1,31241,1}, "HuyÕt Bå §Ò");
		for i =1 ,getn(award_ornament) do 
			local item = award_ornament[i]
			local nRet, nItemIdx = gf_AddItemEx({item[1],item[2],item[3]+GetBody()-1,1}, item[4]);
			SetItemExpireTime(nItemIdx,7*24*3600)
		end
		ModifyExp(const_exp);
		Msg2Player("B¹n nhËn ®­îc "..const_exp.." ®iÓm kinh nghiÖm");
		Talk(1,"","Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..GetTask(1044).." lÇn dïng C«ng Thµnh ChiÕn LÔ Bao (gåm Th¾ng B¹i LÔ Bao), Mçi ng­êi mçi tuÇn chØ cã thÓ dïng 2 lÇn C«ng Thµnh ChiÕn LÔ Bao.");
	end;
end;

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄÐòÊý
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ÐÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄÐòÊý
	return nWeekSeq;
end;