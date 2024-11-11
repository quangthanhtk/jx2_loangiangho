--
-- Author: Zheng Jinke
-- Date: 2015-12-28 12:23:38
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")

function handle_on_npc_talk_hdds()
	--local npcname = Get
	local talk_str = "<color=gold>��i S� Ho�t ��ng:<color> Ch�o ��n t�n xu�t, r�t nhi�u ph�c l�i �ang ch� ��i b�n!"
	local talk_tb = {}
	local state = nil;
	if get_task("id_get_lishi")==1 then 
		state= "�� l�nh "
	else 
		state="Ch�a nh�n" 
	end
	tinsert(talk_tb,format("%s/do_introduce", "Gi�i thi�u ho�t ��ng"))
	tinsert(talk_tb,format("%s(%s)/do_get_award", "L� X� ��i C�t",state))
	tinsert(talk_tb,format("%s/fenghua_point", "H��ng d�n �i�m Phong Hoa"))
	tinsert(talk_tb,format("%s/nothing","Kh�ng c� g�"))
	Say(talk_str,getn(talk_tb), talk_tb)
end
function do_introduce( )
	local Title = ""
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce_taozhi", "Nh�nh ��o C�t T��ng"))
	tinsert(tbSay,format("%s/do_introduce_hongbao", "L� X� ��i C�t"))
	tinsert(tbSay,format("%s/do_introduce_box", "R��ng Th�n T�i"))
	tinsert(tbSay,format("%s/do_introduce_jbp", "T� B�o B�n"))
	tinsert(tbSay,format("%s/handle_on_npc_talk_hdds", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_taozhi(  )
	-- body
	local Title = "<color=gold>��i S� Ho�t ��ng:<color> Trong th�i gian ho�t ��ng, xung quanh qu�ng tr��ng Tuy�n Ch�u, Th�nh ��, Bi�n Kinh, T��ng D��ng s� xu�t hi�n m�t c�m c�y ��o, c�c ��i hi�p c� th� �i h�i l�c, t��ng t�c v�i c�y ��o �� h�i Nh�nh ��o C�t T��ng, nh�p chu�t ph�i v�o Nh�nh ��o C�t T��ng s� nh�n ���c ph�n th��ng phong ph� v� �i�m t�ch l�y, �i�m d�ng �� ��i ngo�i trang tuy�t ��p trong C�a H�ng Phong Hoa; <color=red>m�i ng��i ch� ���c h�i t�i �a 10 l�n/ng�y.<color>"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_hongbao(  )
	-- body
	local Title = "<color=gold>��i S� Ho�t ��ng:<color> M�t n�m m�i l�i ��n r�i, ch�c c�c v� ��i hi�p s�c kh�e d�i d�o, v�n s� nh� �, s� nghi�p thu�n l�i, gia ��nh h�nh ph�c! Trong th�i gian ho�t ��ng m�i v� ��i hi�p c� th� ��n ch� ta �� nh�n 1 l�n L� X� May M�n, ��i hi�p n�o may m�n s� nh�n ���c ph�n th��ng phong ph�! <color=red>(Trong th�i gian ho�t ��ng ch� ���c nh�n 1 l�n duy nh�t)<color>"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_box(  )
	-- body
	local Title = "<color=gold>��i S� Ho�t ��ng:<color> Trong th�i gian ho�t ��ng n�m m�i, h�ng ng�y v�o l�c 12:30, 16:30, 20:30 t�i b�n th�nh ch�nh Th�nh ��, Bi�n Kinh, Tuy�n Ch�u, T��ng D��ng s� xu�t hi�n 6 R��ng Th�n T�i, trong �� ch� c� 1 c�i l� R��ng Th�n T�i th�t, ��i hi�p t�m ���c r��ng th�t s� nh�n ���c ph�n th��ng phong ph�; n�u trong v�ng 30 ph�t v�n ch�a t�m ���c r��ng th�t th� t�t c� r��ng s� bi�n m�t, ho�t ��ng k�t th�c."
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp(  )
	-- body
	local Title = "<color=gold>��i S� Ho�t ��ng:<color> Ch�c m�ng n�m m�i, ph�t t�i ph�t l�c! Kh�ng kh� nh�n nh�p c�a nh�n gian khi�n cho Th�n T�i kh�ng th� c�m l�ng m� h� ph�m �� g�p vui, ��ng th�i Th�n T�i c�ng mang theo T� B�o B�n trong truy�n thuy�t xu�ng nh�n gian, t��ng truy�n ch� c�n b� ��ng Ti�n C�t T��ng v�o T� B�o B�n s� c� th� b�t ��u t� b�o!"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce_jbp_detail", "H��ng d�n T� B�o B�n"))
	tinsert(tbSay,format("%s/do_introduce_jbp_place", "V� tr� c�a T� B�o B�n"))
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp_detail(  )
	local Title = format("<color=gold>��i S� Ho�t ��ng:<color> Nh�p v�o T� B�o B�n-Tr�ng ti�n h�nh t� b�o, mang ��ng Ti�n C�t T��ng b� v�o T� B�o B�n, s� nh�n ���c �i�m Phong Hoa. Sau khi b� v�o T� B�o B�n s� t�ch t� ph�c kh�, th�i gian chu�n b� l� 1 ph�t, sau 1 ph�t, t�t c� ng��i ch�i kh�c ��u c� th� nh�p v�o T� B�o B�n �� nh�n �i�m ph�c l�i.\nM�i khi b� v�o <color=red>1<color> ��ng Ti�n C�t T��ng, T� B�o B�n s� t�ch l�y <color=red>10<color> l�n nh�n �i�m t�ch l�y ph�c l�i.\nNh�n �i�m t�ch l�y T� B�o B�n c�a ng��i kh�c c� th�i gian gi�n c�ch l� <color=red>1<color> ph�t.\nM�i ng�y, m�i ng�y ch� ���c b� t�i �a <color=red>%d<color> ��ng Ti�n C�t T��ng �� ti�n h�nh t� b�o.\nM�i ng�y, m�i ng�y ch� ���c nh�n t�i �a <color=red>%d<color> l�n �i�m ph�c l�i.", PUTCOIN_LIMIT, GET_JBP_LIMIT )
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp_place(  )
	local Title = "	Th�nh ��: 221/221    213/217    234/217    232/226    210/229\nBi�n Kinh: 172/180    157/170    183/173    183/183    162/184\nTuy�n Ch�u: 175/186    169/180    190/180    188/190    169/190\nT��ng D��ng: 183/184    168/179    191/179    186/189    171/190"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)
end
function fenghua_point( )
	local fenghuaPoint = GetTask(3407)
	local pos1,pos2 = 110,110
	local Title = format("<color=gold>��i S� Ho�t ��ng:<color> C�c ��i hi�p h�y ��n <color=gold>[Th�nh ��: 219/220] [Bi�n Kinh: 175/178] [Tuy�n Ch�u: 179/185]<color> g�p ��i S� Phong Hoa �� v�o C�a H�ng Phong Hoa, ti�u hao �i�m Phong Hoa �� ��i ngo�i trang tuy�t ��p.\n\n�i�m Phong Hoa: <color=red>%d<color>",fenghuaPoint)
	local tbSay = {}
	tinsert(tbSay,format("%s/handle_on_npc_talk_hdds", "tr� l�i"))
	Say(Title,getn(tbSay),tbSay)	
end
