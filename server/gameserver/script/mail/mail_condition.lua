--�ű����ƣ��ʼ�����
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-09-29
--�����޸ļ�¼

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
	ShowMailMessage("Ch� tr�ng t�i kh�ng �� 5 �");
	return 0;
end

function check_room_1()
	if GetFreeItemRoom() >= 1 then
		return 1;
	end
	ShowMailMessage("Ch� tr�ng t�i c�a b�n kh�ng �� 1 �");
	return 0;
end
function check_room_4()
	if GetFreeItemRoom() >= 4 then
		return 1;
	end
	ShowMailMessage("Ch� tr�ng t�i c�a b�n kh�ng �� 4 �");
	return 0;
end

function checkLiangshanAward()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage("Ch� tr�ng t�i kh�ng �� 3 � ho�c s�c n�ng kh�ng �� 100");
		return 0;
	end
	return 1;
end

function wb_achievement_check()
	if gf_JudgeRoomWeight(3, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr�ng t�i kh�ng �� %d � ho�c s�c n�ng kh�ng �� %d",3, 100));
		return 0;
	end
	return 1;
end

function wb_daily_tickey_check()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr�ng t�i kh�ng �� %d � ho�c s�c n�ng kh�ng �� %d",3, 100));
		return 0;
	end
	return 1;
end

function check_master_prentice_award()
	if gf_JudgeRoomWeight(2, 100) ~= 1 then
		ShowMailMessage(format("Ch� tr�ng t�i kh�ng �� %d � ho�c s�c n�ng kh�ng �� %d",2, 100));
		return 0;
	end
	if gf_CheckPlayerRoute() ~= 1 then
		ShowMailMessage("Tr��c ti�n h�y gia nh�p l�u ph�i");
		return 0;
	end
	return 1;
end

function check_2013_QingMing_award()
	if gf_JudgeRoomWeight(1, 10) ~= 1 then
		ShowMailMessage("Ch� tr�ng t�i kh�ng �� 1 � ho�c s�c n�ng kh�ng �� 10");
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
		ShowMailMessage(format("Ch� tr�ng t�i kh�ng �� %d � ho�c s�c n�ng kh�ng �� %d",3, 300));
		return 0;
	end
	return 1;
end
