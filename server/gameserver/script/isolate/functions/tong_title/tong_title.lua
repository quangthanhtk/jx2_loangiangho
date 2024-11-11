Include("\\script\\isolate\\functions\\tong_title\\head.lua")
Include("\\script\\global\\playertitle.lua")

function tong_title_talk_main()
	if isolate_in_date() ~= 1 then
		Talk(1, "", "T�nh n�ng t�m th�i ch�a m�")
		return 0
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --�ڿ���� ��������
		return 0
	end
	local szTitle = format("%s", "C� th� gi�p g� ���c b�n ?")
	local tbSay = {}

	tinsert(tbSay, format("%s/change_tong_title", "K�ch ho�t danh hi�u bang h�i"))
	tinsert(tbSay, format("%s/update_tong_title_max_lv", "Nh�n danh hi�u"))
	tinsert(tbSay, format("%s/view_tong_title_attr", "Ki�m tra thu�c t�nh danh hi�u"))

	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))

	Say(szTitle, getn(tbSay), tbSay)
end

function view_tong_title_attr(nLv)
	local szTitle = ""
	local tbSay = {}
	if not nLv then
		szTitle = format("C�n ki�m tra danh hi�u n�o?")
		for i = 1,getn(t_tong_title_cfg) do
			tinsert(tbSay, format("%s/#view_tong_title_attr(%d)", _get_tong_title_name(i), i))
		end
		tinsert(tbSay, format("%s/tong_title_talk_main", "tr� l�i"))
	else
		local t = t_tong_title_cfg[nLv]
		local tPara = tTongTitlePara[nLv]
		if t then
			local nRate = tPara[5] * 100 / DROP_RATE_MAX_RAND
			local szHead = format("<color=yellow>%s<color>thu�c t�nh danh h�i nh� sau", _get_tong_title_name(nLv))
			szTitle = format("%s:\n    %s: %d\n    %s: %d\n    %s: %d\n    %s: %d\n    %s: %d%s", szHead
			, "V� c� t�ng", t[2]
			, "Sinh l�c t�ng", t[3]
			, "Ph�ng th� b�o k�ch t�ng", t[4]
			, "Gi�m th��ng b�o k�ch t�ng", t[5]
			, "X�c su�t nh�n Hi�p Ngh�a Chi Ch�ng khi ��nh qu�i 3 phe t�ng", nRate, "%"
			)
		end
		tinsert(tbSay, format("%s/view_tong_title_attr", "tr� l�i"))
	end
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function update_tong_title_max_lv(bConfirm)
	local nNewLv = get_tong_title_max_lv() + 1
	if nNewLv > TONG_TITLE_MAX_LV then
		Talk(1, "", "Danh hi�u hi�n t�i �� ��t ��ng c�p l�n nh�t.")
		return 0
	end
	local tPara = tTongTitlePara[nNewLv]
	if tPara then
		local gxd,tjzy,gold = unpack(tPara)

		if not bConfirm or bConfirm ~= 1 then
			local szTitle = ""
			if nNewLv == 1 then
				szTitle = format("Hi�n nay ch�a nh�n danh hi�u, nh�n ���c 1 c�p c�n ti�u hao <color=yellow>[%d %s#%d %s, %d %s]<color> , c� x�c nh�n?",
						gxd, "�� c�ng hi�n Bang h�i", tjzy, "��ng T� Chi Nguy�n", gold, " Kim ")
			else
				szTitle = format("Hi�n nay ��ng c�p danh hi�u l� %d, t�ng l�n c�p ti�p theo c�n ti�u hao <color=yellow>[%d %s,%d %s, %d %s]<color>, x�c nh�n n�ng c�p?",
						nNewLv - 1, gxd, "�� c�ng hi�n Bang h�i", tjzy, "��ng T� Chi Nguy�n", gold, " Kim ")
			end
			local tbSay = {}

			tinsert(tbSay, format("%s/#update_tong_title_max_lv(1)", "��ng �"))
			tinsert(tbSay, format("%s/tong_title_talk_main", "tr� l�i"))
			tinsert(tbSay, format("%s/nothing", "Ra kh�i"))

			Say(szTitle, getn(tbSay), tbSay)
			return 0
		end

		local money = gold * 10000
		if get_tong_gxd() < gxd then
			Talk(1, "", format("�� c�ng hi�n Bang h�i kh�ng �� %d", gxd))
			return 0
		end
		if GetItemCount(TJZY_G,TJZY_D,TJZY_P) < tjzy then
			Talk(1, "", format("��ng T� Chi Nguy�n kh�ng �� %d", tjzy))
			return 0
		end
		if GetCash() < money then
			Talk(1, "", format("V�ng kh�ng �� %d", gold))
			return 0
		end
		if dec_tong_gxd(gxd) < 0 then return 0 end
		if DelItem(TJZY_G,TJZY_D,TJZY_P, tjzy) ~= 1 then return 0 end
		if Pay(money) ~= 1 then return 0 end

		set_tong_title_max_lv(nNewLv)

		local szMsg = format("Ch�c m�ng danh hi�u Bang h�i th�ng ��n %d c�p", nNewLv)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		return 1
	end
end


function change_tong_title(nLv, bConfirm)
	local nMax = get_tong_title_max_lv()
	local nCur = get_tong_title_lv()
	if 0 == nMax then
		--Talk(1, "", "��δ�����κγƺ�")
		return 0
	end

	if nMax > 0 and (not nLv or nLv < 0) then
		local szTitle = format("Hi�n nay  �� k�ch ho�t <color=yellow>%s<color>, c�n ��i m�y c�p(<color=yellow>��i qua danh hi�u c�p cao h�n th�c hi�n ti�u hao ng�y<color>)?", _get_tong_title_name(nCur))
		local tbSay = {}

		for i=1, nMax do
			if i ~= nCur then
				local szSel = format("��i h�t th�nh %s", _get_tong_title_name(i))
				tinsert(tbSay, format("%s/#change_tong_title(%d)", szSel, i))
			end
		end
		tinsert(tbSay, format("%s/tong_title_talk_main", "tr� l�i"))
		tinsert(tbSay, format("%s/nothing", "Ra kh�i"))

		Say(szTitle, getn(tbSay), tbSay)
		return 0
	end

	if nLv >= 0 and nLv <= nMax then
		if not bConfirm then
			local gxd = get_daily_consume(nLv)
			if get_tong_gxd() < gxd and nLv > nCur then
				Talk(1, "", format("�� c�ng hi�n Bang h�i kh�ng �� %d", gxd))
				return 0
			else
				local szTitle = ""
				if nLv > nCur then
					szTitle = format("B�y gi� �� k�ch ho�t <color=yellow>%s<color>, thay ��i th�nh %s c�n <color=yellow>ti�u hao %d �i�m c�ng hi�m bang h�i <color> ", _get_tong_title_name(nCur), _get_tong_title_name(nLv), gxd)
				else
					szTitle = format("Hi�n nay �� k�ch ho�t<color=yellow>%s<color>, l�n n�y ��i h�t th�nh %s kh�ng c�n ti�u hao (%s), x�c nh�n ��i h�t kh�ng?", _get_tong_title_name(nCur), (nLv), "<color=yellow>nh�ng l�n sau ��i l�i c�n ti�u hao �� c�ng hi�n cho bang h�i<color>")
				end

				local tbSay = {}
				tinsert(tbSay, format("%s/#change_tong_title(%d, 1)", "X�c nh�n ��i h�t", nLv))
				tinsert(tbSay, format("%s/#change_tong_title(%d)", "tr� l�i", -1))
				tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
				Say(szTitle, getn(tbSay), tbSay)
				return 0
			end
		end

		for i = 1, TONG_TITLE_MAX_LV do
			RemoveTitle(TONG_TITLE_G, i)
		end
		set_tong_title_lv(nLv)
		if nLv > 0 and daily_consume(nCur)==1 then
			AddTitle(TONG_TITLE_G, nLv)
			SetCurTitle(TONG_TITLE_G, nLv)
			local szMsg = format("Ch�c m�ng th�nh c�ng c�t ��i ��n c�p %d danh hi�u bang h�i.", nLv)
			Msg2Player(szMsg)
		end
	else
		assert("error")
	end
end

function _get_tong_title_name(nLv)
	local szRet = ""
	local t = t_tong_title_cfg[nLv]
	if t then
		szRet = format("%s(c�p %d)", t[1], nLv)
	end
	return szRet
end


function daily_consume(nLastLv)

	fix_cdkey_bug_20160719()

	local nCur = get_tong_title_lv()
	if nLastLv and nLastLv > nCur then return 1 end --�ϴεȼ��ȵ�ǰ�ȼ��� �Ͳ���������

	local gxd = get_daily_consume(nCur)
	if gxd > 0 then
		if get_tong_gxd() < gxd then
			change_tong_title(0, 1)
			Talk(1, "", format("�� c�ng hi�n bang h�i kh�ng �� %d, danh hi�u bang h�i �� l�a ch�n b� m�t hi�u l�c.", gxd))
			return 0
		end
		if dec_tong_gxd(gxd) < 0 then return 0 end

		Msg2Player(format("�� duy tr� danh hi�u bang h�i hi�n t�i, th�nh c�ng ti�u hao %d �i�m �� c�ng hi�n bang h�i", gxd))
		return 1
	end
	return 0
end

function get_daily_consume(nLv)
	local tPara = tTongTitlePara[nLv]
	local gxd = 0
	if tPara then
		gxd = tPara[4]
	end
	return gxd
end

--������һ��3���ƺţ�������ߵȼ����ܻ��ǵͼ���fixit
function fix_cdkey_bug_20160719()
	local nTitleCnt = 0
	local nMaxTitleLv = get_tong_title_max_lv()
	for i = 1, TONG_TITLE_MAX_LV do
		if IsTitleExist(TONG_TITLE_G, i) == 1 then
			nTitleCnt = nTitleCnt + 1
			if i > nMaxTitleLv then
				nMaxTitleLv = i
			end
		end
	end
	if nTitleCnt > 1 then
		force_give_max_lv(nMaxTitleLv)
		WriteGsLog(6, format("[TongTitle] %s fixcdkey bug20160719 nTitleCnt=%d nMaxTitleLv=%d", GetName(), nTitleCnt, nMaxTitleLv))
	end
end
function force_give_max_lv(nLv)
	if nLv > TONG_TITLE_MAX_LV then
		error(nLv)
		return
	end
	local nMax = get_tong_title_max_lv()
	if nMax <= nLv then
		for i = 1, TONG_TITLE_MAX_LV do
			RemoveTitle(TONG_TITLE_G, i)
		end
		set_tong_title_max_lv(nLv)
		set_tong_title_lv(nLv)
		AddTitle(TONG_TITLE_G, nLv)
		SetCurTitle(TONG_TITLE_G, nLv)
		if nLv > nMax then
			local szMsg = format("Ch�c m�ng b�n �� nh�n ���c danh hi�u bang h�i c�p %d", nLv)
			Msg2Player(szMsg)
		end
	else
		local szMsg = format("B�n �� c� danh hi�u bang h�i c�p cao h�n, kh�ng c�n nh�n danh hi�u c�p %d n�y", nLv)
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
	end
end