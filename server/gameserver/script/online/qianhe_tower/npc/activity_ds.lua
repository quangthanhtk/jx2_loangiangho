Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

Qht_Dialog_Table = {
	"Gi�i thi�u n�i dung ho�t ��ng/qht_ds_introduce",
	"Gi�i thi�u ph�n th��ng ho�t ��ng/qht_ds_awardinfo",
	"T�i h� ph�i v�o Thi�n T�m Huy�n C�nh/qht_ds_goto",
	"D�ng H� ph� ��i ph�n th��ng/qht_ds_ibshop",
}

Qht_Npc_Name = "<color=green> ��i S� ho�t ��ng: <color>";

Qht_Title = Qht_Npc_Name.."Thi�n T�m Th�p T�ng Huy�n C�, k�ch chi�n boss tranh �o�t m�nh, ph�n th��ng h�p d�n ��i b�n ��n l�y!";

function qht_ds_introduce()
	local strTitle = "Ho�t ��ng Thi�n T�m Huy�n C�nh ch� y�u nh� sau \n";
	strTitle = strTitle..format("Th�i gian ho�t ��ng: %s ~ %s\n", qht_get_date(QIANHE_START_TIME), qht_get_date(QIANHE_END_TIME));
	strTitle = strTitle.."Thi�n T�m Huy�n C�nh, L��ng S�n, V�n Ki�m Tr�ng, ��a Huy�n Cung,Th�i Nh�t Th�p\n";
	strTitle = strTitle.."�i�u ki�n tham gia: Nh�n v�t ��t c�p 85, �� gia nh�p l�u ph�i, v� h�c k� n�ng c�p 55\n";
	local tbSay = {
		"Gi�i thi�u Thi�n T�m Huy�n C�nh/qht_ds_introduce_hj",
		"C�ch th�c nh�n v� c�ng d�ng c�a H� ph�/qht_ds_introduce_hf",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_introduce_hj()
	local strTitle = "Thi�n T�m Huy�n C�nh l� t� thay ��i huy�n �o c�a Thi�n T�m ��i L� m� ��n, ���c chia l� 3 t�ng, ��n t�ng c�ng cao th� qu�i v�t c�ng m�nh, b�o r��ng nh�n ���c c�ng ngon. N�u � m�i t�ng t� vong th� s� b� truy�n ra Thi�n T�m Huy�n C�nh, v� v�y c�n ph�i c�n th�n.";
	strTitle = strTitle.."Ph�n th��ng l�n Thi�n T�m Th�p l�n n�y c�: Thi�n Cang L�nh, Thi�n M�n Kim L�nh, Ma Dao Th�ch c�p 1, �� qu� c�p 1-4, T�y T�m Th�ch, Luy�n L� Thi�t, C� Linh Th�ch, C� Linh Ng�c, Hi�p Ngh�a Chi Ch�ng, B�o B�o B�o �en, B�o B�o B�o v�ng v.v";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_introduce_hf()
	local strTitle = "Nh�p chu�t ph�i v�o c�c lo�i H� Ph� c� th� m� c�a ti�m t��ng �ng �� ��i ph�n th��ng.\nNgu�n ch� y�u sinh ra H� Ph�:\n  1. M� r��ng trong Thi�n T�m Huy�n C�nh, ti�u di�t qu�i v� boss ��u s� nh�n ���c M�nh H� Ph�, Kim H� Ph�.\n  2. D�ng M�nh H� Ph� v� B� Kim Th�ch �� gh�p th�nh Kim H� Ph�.\n  3. ��nh b�i boss trong L��ng S�n, V�n Ki�m Tr�ng, Th�ng Thi�n Huy�n C�nh, ��a Huy�n Cung, Th�i Nh�t Th�p ��u c� c� h�i nh�n ���c H� Ph�, �i c�ng cao th� t� l� boss r�i ra Kim H� Ph� c�ng cao."
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_awardinfo()
	local strTitle = "Ph�n th��ng c�a ho�t ��ng l�n n�y c� 4 ph�n.\n 1.Trong Thi�n T�m Th�p ��nh b�i ��ch, m� b�o r��ng c� th� nh�n ���c ph�n th��ng\n 2.S� d�ng Kim V�n H� Ph� ho�n ��i ph�n th��ng trong c�a h�ng ho�n ��i t��ng �ng\n. 3.12h30, 22h m�i ng�y c�c t�ng trong Thi�n T�m Huy�n C�nh s� xu�t hi�n m�t boss Ho�ng Kim, ph�n th��ng m� boss ho�ng kim r�t ra � t�ng c�ng cao th� c�ng ngon\n. 4.��nh b�i boss Ho�ng Kim c� th� nh�n ���c Bang Ph�i Chi�n C�, Bang Ph�i Chi�n C� c� th� xu�t hi�n � c�c th�nh ch�nh, th�nh vi�n to�n bang ph�i ph� h�p �i�u ki�n ��u c� th� nh�n ���c ph�n th��ng t� chi�n c�.\n  ";
	strTitle = strTitle.."Ph�n th��ng c�a ho�t ��ng n�y c�: Thi�n Cang L�nh, Thi�n M�n Kim L�nh, B�o th�ch c�p 1-4, Thi�n Ki�u L�nh, Thi�t Huy�t Bang Ph�i Chi�n C�...";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function qht_ds_goto()
	local strTitle = "Ng��i c� th� v�o Thi�n T�m Huy�n C�nh 1 m�nh ho�c t� ��i �� �i v�o."--"����һ��þ���ѣ��������þ���Ҫ����1��ͭ�ƻ���/�ˣ���������þ���Ҫ����1�����ƻ���/�ˡ�";
	local tbSay = {
		"V�o Thi�n T�m Huy�n C�nh t�ng 1/#qht_ds_goto_qht(1)",
		--"����ǧѰ�þ�����/#qht_ds_goto_qht(2)",
		--"����ǧѰ�þ�����/#qht_ds_goto_qht(3)",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop()
	local strTitle = "C�c h� mu�n m� c�a ti�m ��i n�o v�y?";
	local tbSay = {
		--"ͭ�ƻ����̵�/qht_ds_ibshop_tw",
		--"���ƻ����̵�/qht_ds_ibshop_yw",
		"C�a ti�m Kim H� ph�/qht_ds_ibshop_jw",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop_tw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3022);
end

function qht_ds_ibshop_yw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3023);
end

function qht_ds_ibshop_jw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3024);
end