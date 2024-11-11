Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	npc_talk_main()
end

function npc_talk_main()
	local tbSay = {}
	tinsert(tbSay, format("%s/about_update_lv2", "N�i dung c�n ch� � khi n�ng c�p"))
	tinsert(tbSay, format("%s/iwant_update_lv2", "Ta mu�n n�ng c�p"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Long ��nh<color>", "Mu�n n�ng c�p v� kh� H�a Ph�ng c�p 1, b�n chu�n b� �� nguy�n li�u ch�a?")
	Say(szMsg,getn(tbSay),tbSay)
end

function about_update_lv2()
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Long ��nh<color>", "N�ng c�p v� kh� H�a Ph�ng c�p 1 th�nh v� kh� H�a Ph�ng c�p 2,c�n trang b� v� kh� H�a Ph�ng +7 tr� l�n c�p 1 tr�n ng��i, mang theo H�a Di�m Th�ch.")
	Say(szMsg,getn(tbSay),tbSay)
end

function iwant_update_lv2()
	if check_condition()~=1 then return end
	
	local tbSay = {}
	tinsert(tbSay, format("%s/confirm_update_lv2", "Ta mu�n n�ng c�p"))
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>H�a Long ��nh<color>", "N�ng c�p v� kh� H�a Ph�ng c�p 1 l�n c�p 2, c�n trang b� v� kh� H�a Ph�ng c�p 1 tr�n ng��i, mang theo H�a Di�m Th�ch, c�n c�n n�p 6 H�n Tinh Thi�t, 6 Thi�n Ma T� Tinh, 10 Thi�n Cang L�nh, 20 Thi�n M�n Kim L�nh.")
	Say(szMsg,getn(tbSay),tbSay)
end

function confirm_update_lv2()
	--print("confirm_update_lv2")
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3052, "N�ng c�p v� kh� H�a Ph�ng c�p 1"))
end

function check_condition()
	if tGtTask:check_cur_task(264) ~= 1 and tGtTask:check_task_isfinish(264) ~= 1 then
		Talk(1,"","Hi�n t�i kh�ng th� n�ng c�p v� kh� H�a Ph�ng c�p 2!")
		return 0
	end
	return 1
end
