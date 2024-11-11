--���npc�Ի�ѡ��
Include("\\script\\online_activites\\201506cn\\head.lua")
Include("\\script\\online_activites\\201506cn\\main.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\globalfunctions.lua")

m_szNpcName ="��i S� ho�t ��ng"
SZ_SHOP_NPC_NAME="Ch� t�u l�u"
SZ_NPC_TITLE_1506="M�t tin ��n lan truy�n kh�p Bi�n Kinh: Thi�n �m Gi�o sau khi b�i tr�n � Huy�t B�c L�nh �� r�t v� T�y V�c, ph� ho�i 3 n��c T�y H�, Th� Ph�n v� ��i L�, do Thi�n �m Gi�o v� c�ng cao c��ng n�n ba n��c ��nh ph�i nh�n nh�n; khi m�a h� ��n, nh�n d�p T�t �oan Ng�c� ba n��c vi�n c� ��n trung nguy�n n�p c�ng ph�m, b� m�t ph�i s� gi� ��n V� L�m Minh c�u c�u, kh�ng ng� gi�a ���ng �� b� Thi�n �m Gi�o ng�y trang th�nh s�n t�c c��p m�t th�."
T_MAIN_DIALOG_1506={
	format("%s/act_1", "Ho�t ��ng M�a h� n�ng b�ng"),
	format("%s/act_2", "Ho�t ��ng b�nh ch�ng th�m ngon"),
}

tExchange = {
	gtNormalExchange:new(),--������
	gtNormalExchange:new(),--Բ����
	gtNormalExchange:new(),--����Ʒ
	gtNormalExchange:new(),--��������
}
tExchange[1].tConsume ={
	{"C�ng Ph�m T�y V�c", 2, 1, 30871, 10},
	{"V�ng", -1, -1, -1, 2},
}
tExchange[1].tAward ={
	{"H�p Qu� B�nh Vu�ng", 2, 1, 30872, 1},
}
tExchange[1].do_exchange_callback = function()
	gf_WriteLogEx("HoatDongKS_Thang6", "��i th�nh c�ng", 1, "1 H�p Qu� B�nh Vu�ng")
end

tExchange[2].tConsume ={
	{"C�ng Ph�m T�y V�c", 2, 1, 30871, 1},
	{"H��ng Li�u T�y V�c", 2, 1, 30874, 1},
}
tExchange[2].tAward ={
	{"H�p Qu� B�nh Tr�n", 2, 1, 30873, 1},
}
tExchange[3].tConsume ={
	{"V�ng", -1, -1, -1, 1},
}
tExchange[3].tAward ={
	{"C�ng Ph�m T�y V�c", 2, 1, 30871, 1},
}
tExchange[4].tConsume ={
	{"M�t Th� T�y V�c", 2, 1, 30870, 1},
}
tExchange[4].tAward ={
	{"M�nh Thi�n Cang", 2, 1, 30390, 25},
	{"C�ng Ph�m T�y V�c", 2, 1, 30871, 100},
	{"Luy�n", -2, 0, 0, 1000},
}
tExchange[4].tRoomWeight = {2,100}

--��¥�ϰ�Ի����
function npc_talk_shop_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", SZ_SHOP_NPC_NAME, "Tay ngh� c�a b�n ti�m n�i ti�ng kh�p th�nh n�y, ch� c�n ��i hi�p cung c�p nguy�n li�u th� b�n ti�m c� th� l�m ra c�c lo�i b�nh ch�ng th�m ngon")
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Ch� t�o H�p Qu� B�nh Vu�ng", 1))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Ch� t�o H�p Qu� B�nh Tr�n", 2))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Mua C�ng Ph�m T�y V�c", 3))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end
--��������
function do_exchange(nType)
	tExchange[nType]:npc_talk_main(SZ_SHOP_NPC_NAME, nType)
end

function npc_talk_main_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", m_szNpcName, "M�t tin ��n lan truy�n kh�p Bi�n Kinh: Thi�n �m Gi�o sau khi b�i tr�n � Huy�t B�c L�nh �� r�t v� T�y V�c, ph� ho�i 3 n��c T�y H�, Th� Ph�n v� ��i L�, do Thi�n �m Gi�o v� c�ng cao c��ng n�n ba n��c ��nh ph�i nh�n nh�n; khi m�a h� ��n, nh�n d�p T�t �oan Ng�c� ba n��c vi�n c� ��n trung nguy�n n�p c�ng ph�m, b� m�t ph�i s� gi� ��n V� L�m Minh c�u c�u, kh�ng ng� gi�a ���ng �� b� Thi�n �m Gi�o ng�y trang th�nh s�n t�c c��p m�t th�.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1", "Ho�t ��ng M�a h� n�ng b�ng"))
	tinsert(tbSay, format("%s/act_2", "Ho�t ��ng b�nh ch�ng th�m ngon"))
	
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1()
	local szTitle = format("%s:%s", m_szNpcName, "G�n ��y �i�m Th��ng S�n, Thanh Th�nh S�n v� D��c V��ng C�c c� r�t nhi�u nh�n v�t th�n b� ng�y trang th�nh ng��i b�n ��a, V� L�m Minh nghi ng� do Thi�n �m Gi�o �� ng�y trang th�nh, c� li�n quan ��n vi�c c��p v�t ph�m, ��c bi�t th�ng b�o cho ��i S� Ho�t ��ng tri�u t�p c�c hi�p kh�ch �i ti�u di�t, n�u ph�t hi�n M�t Th� T�y V�c h�y mang v� cho ��i S� Ho�t ��ng �� nh�n ph�n th��ng, khi truy �u�i Ng��i Th�n B� nh�n ���c c�c c�ng ph�m ��u thu�c v� c�c hi�p kh�ch.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "N�p M�t Th� T�y V�c"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "V� trang tr��c"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1_award()
	local nResult = tExchange[4]:do_exchange(1, 1)
	if 1 == nResult then
		Talk(1, "", "��i hi�p qu� th�t gan d�, ch� trong th�i gian ng�n �� l�y ���c M�t Th� T�y V�c.")
	end
end

function act_2()
	local szTitle = format("%s:%s", m_szNpcName, "C�ng Ph�m T�y V�c m� c�c ��i hi�p �o�t v� �� b� hao h�t m�t m�t �t, nh�ng c�ng kh�ng l�m kh� ���c Ch� T�u L�u, h�y �i t�m �ng �y �� nh� l�m ra b�nh ch�ng �oan Ng� th�m ngon. N�u ��i hi�p c� th�m nguy�n li�u th� Ch� T�u L�u s� l�m ra b�nh ch�ng ngon h�n n�a. Trong t�i ��i hi�p kh�ng c� c�ng ph�m �? H�nh nh� Ch� T�u L�u c�ng c� b�n, h�y ��n �� mua r�i l�m b�nh c�ng ���c.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "N�p M�t Th� T�y V�c"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "V� trang tr��c"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end
