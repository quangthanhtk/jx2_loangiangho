--½Å±¾Ãû³Æ£ºÓÊ¼þÌõ¼þ
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-09-29
--´úÂëÐÞ¸Ä¼ÇÂ¼

Include("\\script\\mail\\mail_head.lua");
Include("\\script\\mail\\mail_gmc.lua");
Import("\\script\\lib\\globalfunctions.lua");

function check_test()
	return GetLevel() > 70;
end

function check_test2()
	if GetFreeItemRoom() > 5 then
		return 1;
	end
	ShowMailMessage("Chç trèng tói kh«ng ®ñ 5 «");
	return 0;
end

function check_room_1()
	if GetFreeItemRoom() >= 1 then
		return 1;
	end
	ShowMailMessage("Chç trèng tói cña b¹n kh«ng ®ñ 1 «");
	return 0;
end
function check_room_4()
	if GetFreeItemRoom() >= 4 then
		return 1;
	end
	ShowMailMessage("Chç trèng tói cña b¹n kh«ng ®ñ 4 «");
	return 0;
end

function checkLiangshanAward()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage("Chç trèng tói kh«ng ®ñ 3 « hoÆc søc nÆng kh«ng ®ñ 100");
		return 0;
	end
	return 1;
end

function wb_achievement_check()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage(format("Chç trèng tói kh«ng ®ñ %d « hoÆc søc nÆng kh«ng ®ñ %d",3, 100));
		return 0;
	end
	return 1;
end

function wb_daily_tickey_check()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Chç trèng tói kh«ng ®ñ %d « hoÆc søc nÆng kh«ng ®ñ %d",3, 100));
		return 0;
	end
	return 1;
end

function check_master_prentice_award()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Chç trèng tói kh«ng ®ñ %d « hoÆc søc nÆng kh«ng ®ñ %d",2, 100));
		return 0;
	end
	if gf_CheckPlayerRoute() ~= 1 then
		ShowMailMessage("Tr­íc tiªn h·y gia nhËp l­u ph¸i");
		return 0;
	end
	return 1;
end

function check_2013_QingMing_award()
	if gf_JudgeRoomWeight(1, 10) ~= 1 then
		ShowMailMessage("Chç trèng tói kh«ng ®ñ 1 « hoÆc søc nÆng kh«ng ®ñ 10");
		return 0;
	end
	return 1;
end

function check_point_card()
	SendScript2Client("OpenGiveMoneyUrl()");
	return 1;
end

function checkNormal()
	if gf_JudgeRoomWeight(3, 300) ~= 1 then
		ShowMailMessage(format("Chç trèng tói kh«ng ®ñ %d « hoÆc søc nÆng kh«ng ®ñ %d",3, 300));
		return 0;
	end
	return 1;
end
