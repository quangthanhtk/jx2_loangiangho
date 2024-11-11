--���˻��ʹ
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tExchangeOly = {
	gtNormalExchange:new(), --�һ����������ֳ�
	gtNormalExchange:new(), --�һ�����С����
}

tExchangeOly[1].tConsume = {
	{"Thi�n Cang L�nh", 2,  95,  204, 1}, --
	{"Thi�n M�n Kim L�nh", 2,  1,  30370, 1}, --
	{"�i�m Phong Hoa", -8, 0, 0, 600 }, --
	{"Chi�n Xe T�n c� th�i h�n", -1000, exchg_op_update_equip, {10, {0,  105,  30052, 1}}, 1 },--10=horse
}
tExchangeOly[1].tAward = {
	{"Chi�n Xe T�n v�nh vi�n", 0,  105,  30052, 1}, --
}
tExchangeOly[1].nBatchExchange = 1

tExchangeOly[2].tConsume = {
	{"Thi�n Cang L�nh", 2,  95,  204, 1}, --
	{"Thi�n M�n Kim L�nh", 2,  1,  30370, 1}, --
	{"�i�m Phong Hoa", -8, 0, 0, 600 }, --
	{"Th� �en nh� c� th�i h�n", -1000, exchg_op_update_equip, {10, {0,  105,  30039, 1}}, 1 },--10=horse
}
tExchangeOly[2].tAward = {
	{"Th� �en nh� v�nh vi�n", 0,  105,  30039, 1}, --
}
tExchangeOly[2].nBatchExchange = 1

function do_exchange_oly(nIndex)
	tExchangeOly[nIndex]:npc_talk_main("��i S� ho�t ��ng", nIndex)
end

tbSay_201207 = {
	"Gi�i thi�u ho�t ��ng/introduce_201207",
	format("Gh�p %s/combining_flame_201207", WuCai_ShenHuoZhong[5]),
	format("�o�n s� nh�n %s/guess_flame_201207", Flame_Table[4][5]),
	format("��n H�a V�c C�u Ch�u thu th�p %s/goto_caji_map_201207", HuoZhongName),
	format("��n Thi�n S� B� C�nh thu th�p %s/goto_tianshimijing", HuoZhongName),
	"R�t th��ng H�nh V�n/oly_lucky_star_201207",
	format("%s%s/#do_exchange_oly(1)", "��i ", tExchangeOly[1].tAward[1][1]),
	format("%s%s/#do_exchange_oly(2)", "��i ", tExchangeOly[2].tAward[1][1]),
}

sTitle_201207 = format("l�i ��n m�a thu ho�ch m�a m�ng, %s, nh�n th��ng l�n. Nh�n v�t h�n c�p 59 m�i c� th� tham gia.", "Vui ch�i H�a ��n m�a thu");

Activity_Ds_Name = "<color=green>��i S� ho�t ��ng: <color>";

sTitle_201207_1 = format("Tuy�n Ch�u (165/192), Th�nh �� (180/179), ��i L� (231/222), T��ng D��ng (178/175), Ph�ng T��ng (221/195), Bi�n Kinh (183/173) m�i th�nh c� 1 c�i%s", HuoTanNpcName);

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		format("%s ch�ng lo�i v� ngu�n g�c/source_201207", HuoZhongName),
		format("S� l�n d�ng 5 lo�i %s th�p l�a v� ph�n th��ng/danse_award_201207", HuoZhongName),
		format("S� l�n d�ng %s th�p l�a v� ph�n th��ng/wucai_award_201207", WuCai_ShenHuoZhong[5]),
		"R�t th��ng H�nh V�n Tinh m�i ng�y/lucky_star_201207",
		"H�ng ng�y th�p l�a g�i BOSS/lucky_call_boss",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = format("  \n%s: BOSS trong �i L��ng S�n, V�n Ki�m Tr�ng sinh ra;  \n%s: Th�i H� Huy�n C�nh, T�i Nguy�n Chi�n sinh ra;  \n%s: ��a Huy�n Cung, Th�i Nh�t Th�p, Th� Luy�n T� Linh sinh ra;  \n%s: Qu� M�n H�i L�ng thu th�p U Minh Hoa (Qu�i t� vong c� x�c su�t r�i ra), v� qu�i trong Thi�n S� B� C�nh r�i ra;  \n%s: �o�n s� sinh ra;  \n%s: T�m S� Gi� Ho�t ��ng �� gh�p ho�c trong Qu� M�n H�i L�ng ti�u di�t qu�i nh� k�ch ho�t Minh H�a Qu� Linh c� x�c su�t nh�n ���c\n",
		Flame_Table[5][5], Flame_Table[3][5], Flame_Table[1][5], Flame_Table[2][5], Flame_Table[4][5], WuCai_ShenHuoZhong[5]);
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S� l�n: %s trong m�i th�nh m�i ng�y c� th� th�p s�ng 3 l�n. ph�n th��ng: \n   s� l�n th�p l�a t�ch l�y+1;\n   exp <color=green>%d<color>?\n      ��o c� qu� hi�m ng�u nhi�n v.v", HuoZhongName, OLY_EXP_2);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = " "..format("Gi�i th��ng: \n   s� l�n th�p s�ng t�ch l�y+1; \n   s� l�n th�p s�ng t�ch l�y trong ng�y server+3; \n   exp <color=green>%d<color>v,v.", OLY_EXP_3);
	local tbSay = {
		"S� l�n th�p s�ng c�ng d�n c� l�i �ch g� kh�ng?/fire_used_201207",
		"\n tr� v� t�ng tr��c/introduce_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."��t ��n s� l�n th�p s�ng t�ch l�y kh�c nhau khi nh�n th��ng s� nh�n ���c ph�n th��ng phong ph�! ch� �: sau khi nh�n th��ng cao nh�t, s� l�n th�p s�ng t�ch l�y s� reset 0, c� th� b�t ��u t�ch l�y l�i.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		format("S� d�ng %s (Ng� C�c c� b�n) gh�p th�nh/combining_1_201207", WuCai_Shenshi[5]),
		--format("�õ�ɫ%s�ͽ�ϳ�/combining_2_201207", HuoZhongName),
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..format("B�n mu�n gh�p %s b�ng c�ch n�o?", WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("S� d�ng %d c�i %s+%d c�i %s gh�p th�nh/#begin_combining_1(1)",Compose_ShengHuo_Num_1, Flame_Table[1][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d�ng %d c�i %s+%d c�i %s gh�p th�nh/#begin_combining_1(2)",Compose_ShengHuo_Num_1, Flame_Table[2][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d�ng %d c�i %s+%d c�i %s gh�p th�nh/#begin_combining_1(3)",Compose_ShengHuo_Num_1, Flame_Table[3][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d�ng %d c�i %s+%d c�i %s gh�p th�nh/#begin_combining_1(4)",Compose_ShengHuo_Num_1, Flame_Table[4][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("S� d�ng %d c�i %s+%d c�i %s gh�p th�nh/#begin_combining_1(5)",Compose_ShengHuo_Num_1, Flame_Table[5][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Ra kh�i/nothing",
	}
	Say(Activity_Ds_Name..format("5 %s b�t k� + 1 %s (Ng� C�c c� b�n) = 1 %s", HuoZhongName, WuCai_Shenshi[5], WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("D�ng %d c�i %s + %d v�ng �� gh�p/#begin_combining_2(1)",Compose_ShengHuo_Num_2, Flame_Table[1][5], Compose_Coin_Num_2),
		format("D�ng %d c�i %s + %d v�ng �� gh�p/#begin_combining_2(2)",Compose_ShengHuo_Num_2, Flame_Table[2][5], Compose_Coin_Num_2),
		format("D�ng %d c�i %s + %d v�ng �� gh�p/#begin_combining_2(3)",Compose_ShengHuo_Num_2, Flame_Table[3][5], Compose_Coin_Num_2),
		format("D�ng %d c�i %s + %d v�ng �� gh�p/#begin_combining_2(4)",Compose_ShengHuo_Num_2, Flame_Table[4][5], Compose_Coin_Num_2),
		format("D�ng %d c�i %s + %d v�ng �� gh�p/#begin_combining_2(5)",Compose_ShengHuo_Num_2, Flame_Table[5][5], Compose_Coin_Num_2),
		"\n tr� v� t�ng tr��c/combining_flame_201207",
		"Ra kh�i/nothing",
	}
	Say(Activity_Ds_Name..format("9 %s b�t k� + 30 v�ng = 1 %s", HuoZhongName, WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbBody = "T�i h� ra 1 ch� s� (t� 1-100) �� c�c h� �o�n 5 l�n, s� l�n �o�n tr�ng c�ng �t th� ph�n th��ng c�ng l�n. S� l�n tham gia tr� ch�i m�i ng�y l� t�y �, nh�ng ch� ���c nh�n th��ng 3 l�n.";
	local tbSay = {
		"H�y b�t ��u �i /oly_begin_guess",
		"Nh�n ph�n th��ng l�n tr��c/oly_get_last_guess_award",
		"\n r�t lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."S� l�n th�p s�ng ��t 6 l�n/ng�y, s� c� th� tham gia ho�t ��ng R�t Th�m May M�n:\n   C�ch th�c: Nh�p 1 con s� trong kho�ng 1-9999;\n   Quy tr�nh nh�n th��ng: 21:00 h�ng ng�y m� th��ng, t� 21:00-21:30 ng��i ch�i tr�ng th��ng ph�i ��n ch� c�a ta �� ��ng k� tr�ng th��ng, 10 ng��i ch�i ��u ti�n ��ng k� c� th� chia ��u ph�n th��ng. Sau 21:30 c� th� nh�n th��ng, ��n 22:00 th� k�t th�c nh�n th��ng, qu� gi� s� kh�ng th� nh�n.\n   Ph�n th��ng: M�i ng�y 50 Thi�n Ki�u L�nh, trong ng�y kh�ng ai tr�ng th��ng (nh�n th��ng), th� ph�n th��ng s� t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c.\n   Ch� �: Con s� may m�n ch� c� hi�u l�c trong ng�y.";
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..format("Trong ng�y, khi s� l�n th�p l�a c�a server ��t 5000 l�n, v�o l�c 20:00 s� xu�t hi�n Ph� Th�y B�ng Gi� � T�y Th�nh ��, sau khi ti�u di�t s� nh�n ���c nhi�u ph�n th��ng. D�ng %s th��ng �� th�p l�a, s� l�n th�p l�a c�a server +1, n�u d�ng %s th�p l�a, th� s� l�n th�p l�a c�a server +3.", HuoZhongName, WuCai_ShenHuoZhong[5]);
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "S� l�n th�p s�ng ��t 6 l�n/ng�y, s� c� th� tham gia ho�t ��ng R�t Th�m May M�n.\n    Ph�n th��ng t�ch l�y hi�n t�i l�: <color=green>%d Thi�n Ki�u L�nh<color>;\n    Con s� may m�n h�m nay l�: <color=green>%s<color>;\n    Con s� may m�n c�a b�n l�: <color=green>%d<color>;\n    Ph�n th��ng: M�i ng�y 50 Thi�n Ki�u L�nh, trong ng�y kh�ng ai tr�ng th��ng (nh�n th��ng), th� ph�n th��ng s� t�ch l�y cho ��n khi c� ng��i tr�ng th��ng ho�c ho�t ��ng k�t th�c.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
		nMyluckNum = tonumber(strNum)
	end
	tinsert(tbSay,"Tho�t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh�p ch� s� may m�n c�a c�c h�");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --����ʱ��
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch� s� may m�n c�a c�c h� l� %d",nNum));
	else
		Msg2Player("B�y gi� kh�ng th� nh�p ch� s� may m�n , h�y quay l�i v�o ng�y mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"��ng �/sure_201207",
		"Tho�t/nothing",
	}
	Say(Activity_Ds_Name..format("Quy�t ��nh ��n b�n �� thu th�p �� t�m %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
		"��ng �/sure_goto_tianshimijing",
		"Ra kh�i/nothing",
	}
	Say(Activity_Ds_Name..format("Quy�t ��nh ��n b�n �� thu th�p �� t�m %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--�Ǽ�
function register_mylucknum_201207()
	if gf_JudgeRoomWeight(1, 100, "") == 1 then
		ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
	end
end

--�콱
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C�c h� ch�a ��ng k� kh�ng th� nh�n ph�n th��ng");
	end
	--�콱
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end
