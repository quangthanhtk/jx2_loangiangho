--主活动npc对话选项
Include("\\script\\online_activites\\201506cn\\head.lua")
Include("\\script\\online_activites\\201506cn\\main.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\globalfunctions.lua")

m_szNpcName ="Чi S� ho箃 ng"
SZ_SHOP_NPC_NAME="Ch� t鰑 l莡"
SZ_NPC_TITLE_1506="M閠 tin n lan truy襫 kh緋 Bi謓 Kinh: Thi猲  Gi竜 sau khi b筰 tr薾 � Huy誸 B筩 L躰h  r髏 v� T﹜ V鵦, ph� ho筰 3 nc T﹜ H�, Th� Ph錸 v� Чi L�, do Thi猲  Gi竜 v� c玭g cao cng n猲 ba nc nh ph秈 nh蒼 nh辬; khi m颽 h� n, nh﹏ d辮 T誸 an Ng鋍� ba nc vi謓 c� n trung nguy猲 n閜 c鑞g ph萴, b� m藅 ph竔 s� gi� n V� L﹎ Minh c莡 c鴘, kh玭g ng� gi鱝 阯g  b� Thi猲  Gi竜 ng魕 trang th祅h s琻 t芻 cp m蕋 th�."
T_MAIN_DIALOG_1506={
	format("%s/act_1", "Ho箃 ng M颽 h� n鉵g b醤g"),
	format("%s/act_2", "Ho箃 ng b竛h ch璶g th琺 ngon"),
}

tExchange = {
	gtNormalExchange:new(),--方粽子
	gtNormalExchange:new(),--圆粽子
	gtNormalExchange:new(),--西域贡品
	gtNormalExchange:new(),--西域密信
}
tExchange[1].tConsume ={
	{"C鑞g Ph萴 T﹜ V鵦", 2, 1, 30871, 10},
	{"V祅g", -1, -1, -1, 2},
}
tExchange[1].tAward ={
	{"H閜 Qu� B竛h Vu玭g", 2, 1, 30872, 1},
}
tExchange[1].do_exchange_callback = function()
	gf_WriteLogEx("HoatDongKS_Thang6", "i th祅h c玭g", 1, "1 H閜 Qu� B竛h Vu玭g")
end

tExchange[2].tConsume ={
	{"C鑞g Ph萴 T﹜ V鵦", 2, 1, 30871, 1},
	{"Hng Li謚 T﹜ V鵦", 2, 1, 30874, 1},
}
tExchange[2].tAward ={
	{"H閜 Qu� B竛h Tr遪", 2, 1, 30873, 1},
}
tExchange[3].tConsume ={
	{"V祅g", -1, -1, -1, 1},
}
tExchange[3].tAward ={
	{"C鑞g Ph萴 T﹜ V鵦", 2, 1, 30871, 1},
}
tExchange[4].tConsume ={
	{"M藅 Th� T﹜ V鵦", 2, 1, 30870, 1},
}
tExchange[4].tAward ={
	{"M秐h Thi猲 Cang", 2, 1, 30390, 25},
	{"C鑞g Ph萴 T﹜ V鵦", 2, 1, 30871, 100},
	{"Luy謓", -2, 0, 0, 1000},
}
tExchange[4].tRoomWeight = {2,100}

--酒楼老板对话入口
function npc_talk_shop_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", SZ_SHOP_NPC_NAME, "Tay ngh� c馻 b鎛 ti謒 n鎖 ti課g kh緋 th祅h n祔, ch� c莕 i hi謕 cung c蕄 nguy猲 li謚 th� b鎛 ti謒 c� th� l祄 ra c竎 lo筰 b竛h ch璶g th琺 ngon")
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Ch� t筼 H閜 Qu� B竛h Vu玭g", 1))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Ch� t筼 H閜 Qu� B竛h Tr遪", 2))
	tinsert(tbSay, format("%s/#do_exchange(%d)", "Mua C鑞g Ph萴 T﹜ V鵦", 3))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end
--制作粽子
function do_exchange(nType)
	tExchange[nType]:npc_talk_main(SZ_SHOP_NPC_NAME, nType)
end

function npc_talk_main_1506()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("%s:%s", m_szNpcName, "M閠 tin n lan truy襫 kh緋 Bi謓 Kinh: Thi猲  Gi竜 sau khi b筰 tr薾 � Huy誸 B筩 L躰h  r髏 v� T﹜ V鵦, ph� ho筰 3 nc T﹜ H�, Th� Ph錸 v� Чi L�, do Thi猲  Gi竜 v� c玭g cao cng n猲 ba nc nh ph秈 nh蒼 nh辬; khi m颽 h� n, nh﹏ d辮 T誸 an Ng鋍� ba nc vi謓 c� n trung nguy猲 n閜 c鑞g ph萴, b� m藅 ph竔 s� gi� n V� L﹎ Minh c莡 c鴘, kh玭g ng� gi鱝 阯g  b� Thi猲  Gi竜 ng魕 trang th祅h s琻 t芻 cp m蕋 th�.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1", "Ho箃 ng M颽 h� n鉵g b醤g"))
	tinsert(tbSay, format("%s/act_2", "Ho箃 ng b竛h ch璶g th琺 ngon"))
	
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1()
	local szTitle = format("%s:%s", m_szNpcName, "G莕 y 觤 Thng S琻, Thanh Th祅h S琻 v� Dc Vng C鑓 c� r蕋 nhi襲 nh﹏ v藅 th莕 b� ng魕 trang th祅h ngi b秐 a, V� L﹎ Minh nghi ng� do Thi猲  Gi竜 у ng魕 trang th祅h, c� li猲 quan n vi謈 cp v藅 ph萴, c bi謙 th玭g b竜 cho Чi S� Ho箃 чng tri謚 t藀 c竎 hi謕 kh竎h 甶 ti猽 di謙, n誹 ph竧 hi謓 M藅 Th� T﹜ V鵦 h穣 mang v� cho Чi S� Ho箃 чng  nh薾 ph莕 thng, khi truy 畊鎖 Ngi Th莕 B� nh薾 頲 c竎 c鑞g ph萴 u thu閏 v� c竎 hi謕 kh竎h.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "N閜 M藅 Th� T﹜ V鵦"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "V� trang trc"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function act_1_award()
	local nResult = tExchange[4]:do_exchange(1, 1)
	if 1 == nResult then
		Talk(1, "", "Чi hi謕 qu� th藅 gan d�, ch� trong th阨 gian ng緉  l蕐 頲 M藅 Th� T﹜ V鵦.")
	end
end

function act_2()
	local szTitle = format("%s:%s", m_szNpcName, "C鑞g Ph萴 T﹜ V鵦 m� c竎 i hi謕 畂箃 v�  b� hao h魌 m蕋 m閠 輙, nh璶g c騨g kh玭g l祄 kh� 頲 Ch� T鰑 L莡, h穣 甶 t譵 玭g 蕐  nh� l祄 ra b竛h ch璶g an Ng� th琺 ngon. N誹 i hi謕 c� th猰 nguy猲 li謚 th� Ch� T鰑 L莡 s� l祄 ra b竛h ch璶g ngon h琻 n鱝. Trong t骾 i hi謕 kh玭g c� c鑞g ph萴 �? H譶h nh� Ch� T鰑 L莡 c騨g c� b竛, h穣 n  mua r錳 l祄 b竛h c騨g 頲.")
	local tbSay = {}
	tinsert(tbSay, format("%s/act_1_award", "N閜 M藅 Th� T﹜ V鵦"))
	tinsert(tbSay, format("%s/npc_talk_main_1506", "V� trang trc"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	
	Say(szTitle, getn(tbSay), tbSay)
end
