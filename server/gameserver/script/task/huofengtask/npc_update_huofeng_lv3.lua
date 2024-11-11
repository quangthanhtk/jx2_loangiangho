Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	if check_condition(0)==1 then 
		--tinsert(tbSay, format("%s/call_fight_npc", "�ٻ��̽���"))
		tinsert(tbSay, format("%s/update_lv3", "Th�ng c�p v� kh�")) 
	end
	tinsert(tbSay, format("%s/iwant_leave", "R�i kh�i V�n Linh ��i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", "Ch�o m�ng ��n v�i V�n Linh ��i. Ch�c b�n n�ng c�p v� kh� th�nh c�ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

T_NEED_ITEM = {
	{"Thi�n Ki�u L�nh",2,97,236,1},
}

function update_lv3()
	local tbSay = {}
	tinsert(tbSay, format("%s/about_update_lv3", "N�i dung c�n ch� � khi n�ng c�p"))
	tinsert(tbSay, format("%s/about_huanghuozhixin", "Ngu�n g�c c�a Hoang H�a Chi T�m"))
	tinsert(tbSay, format("%s/about_huanghuoliujin", "Ngu�n g�c c�a Hoang H�a L�u Kim"))
	tinsert(tbSay, format("%s/iwant_update_lv2", "Ta mu�n n�ng c�p v� kh� H�a Ph�ng c�p 2 "))
	tinsert(tbSay, format("%s/iwant_update_lv3", "Ta mu�n n�ng c�p v� kh� H�a Ph�ng c�p 3 "))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", "Ch�o m�ng ��n v�i V�n Linh ��i. Ch�c b�n n�ng c�p v� kh� th�nh c�ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

function about_update_lv3()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szTemp = "N�ng c�p v� kh� H�a Ph�ng c�p 2 th�nh v� kh� H�a Ph�ng c�p 3,c�n trang b� v� kh� H�a Ph�ng +7 tr� l�n c�p 2 tr�n ng��i"
	--szTemp = format("%s\n%s", szTemp, "��������������10����20���Ž��200�׻����ǣ�3�Ļ�֮��")
	--szTemp = format("%s\n%s", szTemp, "Ԫ˧����������30����60���Ž��600�׻����ǣ�9�Ļ�֮��")
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_leave()
	local tbSay = {}
	tinsert(tbSay, format("%s/sure_leave", "R�i kh�i"))
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szTemp = "X�c nh�n r�i kh�i V�n Linh ��i quay v� C�n L�n kh�ng??"
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function sure_leave()
	if GetTeamSize() > 1 then
    	if GetName() ~= GetCaptainName() then
    		Talk(1,"",g_NpcName.."Ch� c� ��i tr��ng m�i ���c thao t�c");
    		return 0;
    	end
	end
	gf_TeamOperateEX(do_leave)
end

function do_leave()
	NewWorld(509, 1586, 3117)
	SetFightState(0)
end

function about_huanghuozhixin()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szTemp = "M�i nh�n v�t c�n ho�n th�nh nhi�m v� s� thi v� kh� H�a Ph�ng tr��c, sao �� v�o V�n Linh ��i s� d�ng ��o c� Hoang H�a L�u Kim, tri�u h�i boss Hoang H�a L�u Kim (Ch�n th�n). Sau khi ��nh b�i Hoang H�a L�u Kim (Ch�n th�n), s� nh�n ���c 1 Hoang H�a Chi T�m. M�i nh�n v�t trong v�ng 1 tu�n ti�u di�t Hoang H�a L�u Kim (Ch�n th�n) s� nh�n ���c 1 Hoang H�a Chi T�m, tu�n �� s� kh�ng th� nh�n ���c Hoang H�a Chi T�m n�a."
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function about_huanghuoliujin()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szTemp = "Tham gia Th�i Nh�t Th�p-Th��ng ho�c Anh H�ng, ti�u di�t boss Hoang H�a L�u Kim s� c� c� h�i nh�n ���c ��o c� Hoang H�a L�u Kim."
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", szTemp)
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_update_lv2()
	if check_condition(1)~=1 then return end
	
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv2", "Ta mu�n n�ng c�p"))
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", "N�ng c�p v� kh� h�a ph�ng c�p 1 th�nh v� kh� h�a ph�ng c�p 2, c�n trang b� v� kh� h�a ph�ng c�p 1 tr�n ng��i.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv2()
	--print("confirm_update_lv2")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3054, "N�ng c�p v� kh� H�a Ph�ng c�p 1"))
end

function iwant_update_lv3()
	if check_condition(1)~=1 then return end
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv3", "Ta mu�n n�ng c�p"))
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Ph�ng T�<color>", "Ch�c b�n ch� t�o v� kh� th�nh c�ng.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv3()
	--print("confirm_update_lv3")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3053, "N�ng c�p v� kh� H�a Ph�ng c�p 2"))
end

function check_condition(bNotify)
	if tGtTask:check_task_isfinish(270) ~= 1 then
		if bNotify==1 then
			Talk(1,"","Ho�n th�nh chu�i nhi�m v� H�a Ph�ng m�i ���c n�ng c�p!")
		end
		return 0
	end
	return 1
end
