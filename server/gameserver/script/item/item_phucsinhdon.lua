--�������ű�
Import("\\script\\lib\\globalfunctions.lua")

--tinsert(tbSay, format("%s/on_use_fusheng", "ȷ��ʹ��"))

fsd_task_id = 3284
fsd_task_acc = 36

fsd_this_item={
	{"Ph�c Sinh ��n (Nguy�n li�u)",2, 1, 30812},
	{"Ph�c Sinh ��n (Tu luy�n)",2, 1, 30813},
	{"Ph�c Sinh ��n",2, 1, 30814},
}
fsd_max_xiulan_daily=10
fsd_max_xiulan=100
fsd_taiyisuipian = {"Th�i D�ch H�n Nguy�n C�ng ��",2, 0, 1082}
fsd_taiyihunyuan = {"Th�i D�ch H�n Nguy�n Ph�",2, 0, 1083, 4}
fsd_tNeed = {
	--���� ̫����Ƭ ��Ϊ ����
	{1000000000,100,7000, 1},
	{2000000000,200,8000, 2},
	{5000000000,500,9000, 5},
	{10000000000,1000,10000, 10},
}

--����
function on_use_xiulian(nItemIdx)
	if get_trans_level() < 699 then
		Talk(1,"","Ch�a ��t chuy�n sinh 6 c�p 99!")
		return
	end
	
	local szTitle = format("Ta c� th� gi�p ng��i tu luy�n Ph�c Sinh ��n, nguy�n li�u sau khi tu luy�n s� kh�a,\n�� t�ch l�y tu luy�n <color=yellow>%d/%d<color> �i�m, h�m nay c�n ���c tu luy�n <color=yellow>%d/%d<color> �i�m", 
		fsd_get_xiulian(), fsd_max_xiulan, fsd_get_left_xiulian_cap(), fsd_max_xiulan_daily)
	local tbSay = {}
	for i=1,getn(fsd_tNeed) do
		t = fsd_tNeed[i]
		local szWord = format("Ta mu�n tu luy�n %d �i�m", t[4])
		tinsert(tbSay, format("%s/#do_xiulian(%d,%d)", szWord, nItemIdx, i))
	end

	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

--ת��
function on_use_fusheng(nItemIdx)
--	local szTitle = format("��t chuy�n sinh 6 c�p 99, ti�u hao 1 Ph�c Sinh ��n, %d %s, c� th� t�ng l�n chuy�n sinh 7 c�p 10.", fsd_taiyihunyuan[5], fsd_taiyihunyuan[1])
--	tinsert(tbSay, format("%s/#on_use_fusheng_sure(%d)", "S� d�ng", nItemIdx))
--	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
--	Say(szTitle, getn(tbSay), tbSay)
	Talk(1,"","C�c h� h�y ��n B�c ��u L�o Nh�n � Tuy�n Ch�u �� c� th� ph�c sinh")
end

--��ȡ����ֵ
function fsd_get_xiulian()
	return gf_SafeGetTaskByte(fsd_task_id, 2)
end
--��ȡ��������ֵ
function fsd_get_today_xiulian()
	return gf_SafeGetTaskByte(fsd_task_id, 1)
end
function fsd_set_xiulian(nValue)
	return gf_SafeSetTaskByte(fsd_task_id, 2, nValue, fsd_task_acc)
end
function fsd_set_today_xiulian(nValue)
	return gf_SafeSetTaskByte(fsd_task_id, 1, nValue, fsd_task_acc)
end
function fsd_get_left_xiulian_cap()
	local left_today = fsd_max_xiulan_daily - fsd_get_today_xiulian()
	local left_all = fsd_max_xiulan - fsd_get_xiulian()
	local ret = min(left_all, left_today)
	return ret
end

function do_xiulian(nItemIdx, nType)
	t = fsd_tNeed[nType]
	if not t then
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 and nW ~= 500 and nW ~= 400 and nW ~= 200 and nW ~= 350 and nW ~= 150 and nW ~= 100 then
		Talk(1,"","Ch� c� th� tu luy�n � th�t ��i th�nh th�!")
		return 0
	end

	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i �� b� tr�ng th��ng kh�ng th� tu luy�n")
		return
	end	
	
	if GetFightState() ~= 0 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� tu luy�n!")
		return
	end

	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� tu luy�n Ph�c Sinh ��n!")
		return
	end
	
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end

	local szTitle = format("Tu luy�n %d �i�m c�n ti�u hao %s EXP, %d Th�i D�ch H�n Nguy�n C�ng �� Gi�m, %d tu vi, ��ng � kh�ng?", t[4], show_large_int(t[1]), t[2], t[3])
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_xiulian_sure(%d,%d)", "��ng � tu luy�n", nItemIdx, nType))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))

	Say(szTitle, getn(tbSay), tbSay)
end

function show_large_int(nValue)
	local strRet = ""
	local n = nValue
	while n >= 0 do
		if n >= 1000 then
			strRet = format("%s,000", strRet)
			n = floor(n/1000)
		else
			strRet = format("%d%s", n, strRet)
			n = -1
		end
	end
	return strRet
end

function do_xiulian_sure(nItemIdx, nType)
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 and nW ~= 500 and nW ~= 400 and nW ~= 200 and nW ~= 350 and nW ~= 150 and nW ~= 100 then
		Talk(1,"","Ch� c� th� tu luy�n � th�t ��i th�nh th�!")
		return 0
	end

	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i �� b� tr�ng th��ng kh�ng th� tu luy�n")
		return
	end	
	
	if GetFightState() ~= 0 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� tu luy�n!")
		return
	end

	t = fsd_tNeed[nType]
	if not t then
		return 0
	end
	local nPoint = t[4]
	if 1 == check_and_give_fushengdan(0, nItemIdx) then --�ȿ�����ǰ��û����������û�쵽���������
		return 0
	end
	
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� tu luy�n Ph�c Sinh ��n!")
		return
	end
	
	if fsd_get_left_xiulian_cap() < nPoint then
		Talk(1, "", "M�i ng�y ch� c� th� tu luy�n t�i �a 10 �i�m!")
		return 0
	end
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end
	if check_and_consume(nType, 1, 1) ~= 1 then
		return 0
	end
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	local tCaiLiao = fsd_this_item[1]
	if p == tCaiLiao[4] then
		local tXiuLian = fsd_this_item[2]
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
			return 0
		end
		AddItem(tXiuLian[2], tXiuLian[3], tXiuLian[4], 1)
	end
	--SetItemSpecialAttr(nItemIdx, "BIND", 1)--��
	fsd_set_xiulian(fsd_get_xiulian()+nPoint)
	fsd_set_today_xiulian(fsd_get_today_xiulian()+nPoint)
	check_and_give_fushengdan(nPoint,nItemIdx)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	
	return 1
end

function check_and_give_fushengdan(nPoint, nItemIdx)
	if fsd_get_xiulian() >= fsd_max_xiulan then
		if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
			return 0
		end
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
			return 0
		end
		local t = fsd_this_item[3]
		local _,idx = AddItem(t[2], t[3], t[4], 1)
		if idx > 0 then
			fsd_set_xiulian(0)
		end
		local szTitle = format("Ch�c m�ng t�ch l�y ���c %d �i�m tu luy�n, nh�n ���c 1 %s", fsd_max_xiulan, t[1])
		Talk(1,"",szTitle)
		return 1
	else
		if nPoint > 0 then
			local szTitle = format("Ch�c m�ng th�nh c�ng nh�n ���c %d �i�m tu luy�n, �� t�ch l�y %d/%d �i�m tu luy�n, h�m nay c�n ���c tu luy�n %d/%d �i�m", 
			nPoint, fsd_get_xiulian(), fsd_max_xiulan, fsd_get_left_xiulian_cap(), fsd_max_xiulan_daily)
			Talk(1,"",szTitle)
		end
		return 0
	end
end


function on_use_fusheng_sure(nItemIdx)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c s� d�ng Ph�c Sinh ��n")
		return
	end	

	if get_trans_level() ~= 699 then
		Talk(1,"","Ch� c� chuy�n sinh 6 c�p 99 m�i ���c d�ng Ph�c Sinh ��n!")
		return 0
	end
	if GetItemCount(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4]) < fsd_taiyihunyuan[5] then
		Talk(1, "", format("%s kh�ng �� %d", fsd_taiyihunyuan[1], fsd_taiyihunyuan[5]))
		return 0
	end
	if nItemIdx and nItemIdx > 0 then
		if DelItemByIndex(nItemIdx, -1) ~= 1 then
    		return 0
    	end
	else
		local t = fsd_this_item[3]
		if DelItem(t[2], t[3], t[4], 1)~= 1 then
			return 0
		end
	end
	
	if DelItem(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4], fsd_taiyihunyuan[5])~= 1 then
		return 0
	end
	PlayerReborn(2, random(1,4))
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
	local szTitle = format("Ch�c m�ng b�n ��t chuy�n sinh 7 c�p 10, h�y ��ng nh�p l�i!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "��ng nh�p l�i"))
	Say(szTitle, getn(tbSay), tbSay)
	return 1
end

function fsd_offline()
	ExitGame()
end

function check_and_consume(nType, bDel, bNotify)
	t = fsd_tNeed[nType]
	if not t then
		return
	end
	if GetExp() < t[1] then
		if 1==bNotify then
			Talk(1, "", format("%s kh�ng �� %s", "Kinh nghi�m", show_large_int(t[1])))
		end
		return 0
	end
	if GetItemCount(fsd_taiyisuipian[2], fsd_taiyisuipian[3], fsd_taiyisuipian[4]) < t[2] then
		if 1==bNotify then
			Talk(1, "", format("%s kh�ng �� %d", fsd_taiyisuipian[1], t[2]))
		end
		return 0
	end
	if GetPopur() < t[3] then
		if 1==bNotify then
			Talk(1, "", format("%s kh�ng �� %d", "Luy�n", t[3]))
		end
		return 0
	end
	if bDel and bDel == 1 then
		ModifyPopur(-1*t[3])
		DelItem(fsd_taiyisuipian[2], fsd_taiyisuipian[3], fsd_taiyisuipian[4], t[2])
		big_del_exp(t[1])
	end
	return 1
end

function big_del_exp(nValue)
	if GetExp() < nValue then
		return 0
	end
	local nExp = nValue
	while nExp > 0 do
		local nDelExp = 2000000000
		if nExp > nDelExp then
			nExp = nExp - nDelExp
		else
			nDelExp = nExp
			nExp = 0
		end
		ModifyExp(-1*nDelExp)
	end
	return 1
end

--ÿ������
function on_daily_clear()
	fsd_set_today_xiulian(0)
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end
