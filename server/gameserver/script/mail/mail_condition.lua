--脚本名称：邮件条件
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-09-29
--代码修改记录

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
	ShowMailMessage("Ch� tr鑞g t骾 kh玭g  5 �");
	return 0;
end

function check_room_1()
	if GetFreeItemRoom() >= 1 then
		return 1;
	end
	ShowMailMessage("Ch� tr鑞g t骾 c馻 b筺 kh玭g  1 �");
	return 0;
end
function check_room_4()
	if GetFreeItemRoom() >= 4 then
		return 1;
	end
	ShowMailMessage("Ch� tr鑞g t骾 c馻 b筺 kh玭g  4 �");
	return 0;
end

function checkLiangshanAward()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage("Ch� tr鑞g t骾 kh玭g  3 � ho芻 s鴆 n苙g kh玭g  100");
		return 0;
	end
	return 1;
end

function wb_achievement_check()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr鑞g t骾 kh玭g  %d � ho芻 s鴆 n苙g kh玭g  %d",3, 100));
		return 0;
	end
	return 1;
end

function wb_daily_tickey_check()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr鑞g t骾 kh玭g  %d � ho芻 s鴆 n苙g kh玭g  %d",3, 100));
		return 0;
	end
	return 1;
end

function check_master_prentice_award()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr鑞g t骾 kh玭g  %d � ho芻 s鴆 n苙g kh玭g  %d",2, 100));
		return 0;
	end
	if gf_CheckPlayerRoute() ~= 1 then
		ShowMailMessage("Trc ti猲 h穣 gia nh藀 l璾 ph竔");
		return 0;
	end
	return 1;
end

function check_2013_QingMing_award()
	if gf_JudgeRoomWeight(1, 10) ~= 1 then
		ShowMailMessage("Ch� tr鑞g t骾 kh玭g  1 � ho芻 s鴆 n苙g kh玭g  10");
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
		ShowMailMessage(format("Ch� tr鑞g t骾 kh玭g  %d � ho芻 s鴆 n苙g kh玭g  %d",3, 300));
		return 0;
	end
	return 1;
end
