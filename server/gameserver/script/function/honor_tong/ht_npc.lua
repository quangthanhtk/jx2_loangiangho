Include("\\script\\function\\honor_tong\\ht_head.lua")
Include("\\script\\lib\\talktmp.lua")

HTN_DIALOG = {
	"Gi�i thi�u Bang H�i Vinh Danh/htn_Infomation",
	"��ng k� tham gia Bang H�i Vinh Danh/htn_SignTong",
	"C�ng hi�n x�y d�ng bang h�i/htn_BuildTong",
	"Nh�n ph�n th��ng x�p h�ng/htn_RankAward",
	"Xem �i�m c�ng hi�n bang ph�i v� x�p h�ng/htn_TongRank",
	--"�����ʸ����Ǽ�/htn_Gongcheng",
};

HTN_TITLE = "V� danh d� c�a bang h�i, c�c th�nh vi�n h�y nhanh ch�ng h�nh ��ng n�o!";

function htn_Infomation()
	local tSay = {
		"�i�u ki�n tham gia /htn_Info_JoinCondition",
		"L�m sao c�ng hi�n x�y d�ng bang h�i/htn_Info_BuildTong",
		"L�m sao nh�n ���c nguy�n li�u/htn_Info_GetMaterial",
		"Ph�n th��ng x�p h�ng bang h�i/htn_Info_TongRank",
		"\nT�i h� ch� xem qua th�i/nothing",
	}
	Say(HT_NPC..format("%s mu�n t�m hi�u th�ng tin g�?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function htn_Info_JoinCondition()
	local tbBody = "\n";
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph�n h�i", "htn_Infomation"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_Info_BuildTong()
	local tbBody = "Th�nh vi�n bang h�i c� th� ��n ch� ��i S� Ho�t ��ng �� n�p [M�nh L�nh B�i Bang H�i]*1, [XU ��o c�]*1, m�i l�n c�ng hi�n x�y d�ng bang h�i s� nh�n ���c ph�n th��ng EXP v� ��o c�, ��ng th�i bang h�i c�ng th�m 1 �i�m c�ng hi�n, �i�m c�ng hi�n quy�t ��nh th� h�ng c�a bang h�i, h�ng cao s� nh�n ���c ph�n th��ng th�m.";
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph�n h�i", "htn_Infomation"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_Info_GetMaterial()
	local tDialog = {
		"Tham gia Y�n Ti�c Bang H�i nh�n ���c M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"M� R��ng V�ng ��i Chi�n (BOSS th� gi�i):  nh�n ���c 05 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"M� ��i Chi�n B�o H�p (BOSS th� gi�i):  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"�i Th�i Nh�t Th�p:  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"�i Th�i Nh�t Th�p-Anh H�ng:  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"�i V�n Ki�m Tr�ng:  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"�i ��a Huy�n Cung:  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"�i L��ng S�n B�c:  nh�n ���c 01 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"V��t �i T� Quang C�c nh�n ���c 02 M�nh L�nh B�i Bang H�i/htn_Info_GetMaterial",
		"tr� l�i/htn_Infomation",
		"Ra kh�i/nothing",
	}
	Say(HT_NPC.."D��i ��y l� nh�ng c�ch �� nh�n ���c M�nh L�nh B�i Bang H�i: ", getn(tDialog), tDialog);
end

function htn_Info_TongRank()
	local tbBody = format("�i�m c�ng hi�n bang h�i ��t %d �i�m s� nh�n ���c nhi�u EXP v� V� L�m Tri�u T�p L�nh, V� L�m Tri�u T�p L�nh d�ng �� tri�u h�i BOSS ��ng Ph��ng B�t B�i, ��nh b�i BOSS nh�n ���c R��ng V�ng Bang Ph�i, m� r��ng s� nh�n ���c ph�n th��ng c�c ph�m, ngo�i ra bang h�i h�ng 1 c�n nh�n ���c danh hi�u <color=gold>Bang Ch� Vinh D�<color> v� <color=gold>Bang H�i Vinh Danh<color>", HT_TONG_VALUE_LIMIT);
	local tbSay = {};
	tbSay.msg = HT_NPC..tbBody;
	tbSay.sel = {
		{"\n Ph�n h�i", "htn_Infomation"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function htn_SignTong()
	local tSay = {
		"Ta mu�n ��ng k� Bang H�i Vinh Danh/htn_SignTong_Deal",
		"\nT�i h� ch� xem qua th�i/nothing",
	}
	Say(HT_NPC..format("Ch� c� bang ch� m�i c� th� ��ng k� ho�t ��ng Bang H�i Vinh Danh, %s mu�n ��ng k� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function htn_SignTong_Deal()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() ~= 1 then
		Say(HT_NPC.."Hi�n t�i kh�ng ph�i l� th�i gian ��ng k�, tu�n sau h�y quay l�i!", 0);
		return 0;
	end
	if GetTongDuty() ~= 1 then
		Say(HT_NPC..format("%s kh�ng ph�i bang ch�, kh�ng th� ��ng k� ho�t ��ng Bang H�i Vinh Danh!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetCash() < HT_COST_GOLD*10000 then
		Say(HT_NPC..format("Trong t�i kh�ng �� %d v�ng", HT_COST_GOLD), 0)
		return 0;
	end
	return ht_SignTong();
end

function htn_BuildTong()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() ~= 1 then
		Say(HT_NPC.."Hi�n t�i kh�ng ph�i l� th�i gian giao n�p, tu�n sau h�y quay l�i!", 0);
		return 0;
	end
	ht_buildTong_AskforClient();
end

function htn_TongRank()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	ht_TongRank_Show();
end

function htn_RankAward()
	if ht_CheckCondition() ~= 1 then
		return 0;
	end
	if ht_GetTimeFunc() == 1 then
		Say(HT_NPC.."Hi�n t�i l� th�i gian c�ng hi�n x�y d�ng bang h�i, kh�ng th� nh�n th��ng x�p h�ng bang h�i!", 0);
		return 0;
	end
	if ht_GetTimeFunc() == 2 then
		Say(HT_NPC.."H� th�ng �ang c�p nh�t b�ng x�p h�ng �i�m c�ng hi�n bang h�i, h�y quay l�i sau!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	ht_GetRankAward();
end

--function htn_Gongcheng()
--	local tSay = {
--		"��Ҫ���̵Ǽ�/ht_SignGongcheng",
--		"��ֻ�ǿ�������/nothing",
--	}
--	Say(HT_NPC.."ֻ���ڴ˳ɹ��ǼǺ���ܲμ�������ɶ���̨�ϰ���еĹ����ʸ���,����Ҫ�Ǽ���", getn(tSay), tSay);
--end