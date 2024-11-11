Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\task_access_code_def.lua")

TSK_ACCESS_CORE         = 42;		-- �������������ķ��ʴ���
TSK_TUPU1               = 3467;		-- ����1-3����������ͼ����Ƭ�Ͷ���ͼ����ͼ�װ��е�����
TSK_TUPU2               = 3468;		-- ����3�ű�����3���ֽ������洢����ͼ������
TSK_TUPU3               = 3469;
G_MAX_TUPU_STORE		= 99;		-- ͼ�װ���ÿһ����Ʒ�����洢����趨ֵ99����������255
COMPOSE_COST			= 1;		-- ���û��Ѷ��ٸ�������Ƭ���Ժϳ�һ������ͼ��


g_szItemNameTupuBox		= "T�i �� Ph�";
g_szTitle			    = "<color=green>T�i �� Ph�:<color>";

g_tTupu = {
	--  {g,d,p,��ŵ�tskid,��ŵ�byte,����}
	[1]={2,1,31131,TSK_TUPU1,1,"M�nh �� Ph� 1"},
	[2]={2,1,31132,TSK_TUPU1,2,"M�nh �� Ph� 2"},
	[3]={2,1,31133,TSK_TUPU1,3,"M�nh �� Ph� 3"},
	[4]={2,1,31134,TSK_TUPU1,4,"M�nh �� Ph� 4"},
	[5]={2,1,31135,TSK_TUPU2,1,"M�nh �� Ph� 5"},
	[6]={2,1,31136,TSK_TUPU2,2,"M�nh �� Ph� 6"},
	[7]={2,1,31137,TSK_TUPU2,3,"M�nh �� Ph� 7"},
	[8]={2,1,31138,TSK_TUPU2,4,"M�nh �� Ph� 8"},
	[9]={2,1,31139,TSK_TUPU3,1,"M�nh �� Ph� 9"},
	[10]={2,1,31140,TSK_TUPU3,2,"M�nh �� Ph� 10"},
	[11]={2,1,31141,TSK_TUPU3,3,"�� Ph� Ch� T�o"},
}

function test1()
	for i = 1,10 do
		local tAward = g_tTupu[i];
		AddItem(tAward[1],tAward[2],tAward[3],99); 
	end
end

function OnUse()
    local szTitle = format("%s%s", g_szTitle, "Ch�n thao t�c mu�n th�c hi�n")
	local tbSay = {}
	tinsert(tbSay, format("%s/_checkin_all_tupu", "C�t v�o t�i t�t c� M�nh �� Ph�"))
	tinsert(tbSay, format("%s/_checkout_tupu", "Ta mu�n l�y ra �� Ph� Ch� T�o"))
	tinsert(tbSay, format("%s/_compose_tupu", "Ta mu�n gh�p �� Ph� Ch� T�o"))
	-- tinsert(tbSay, format("%s/test1", "[Debug]��Ҫ����ͼ��"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_tupu()
	local nHas = _get_storage_by_idx(11);
	if nHas <= 0 then
		Talk(1,"OnUse","Trong T�i �� Ph� hi�n kh�ng c� �� Ph� Ch� T�o.")
		return 0;
	end
	local szStr = format("L�y ra bao nhi�u?",nHas)
	AskClientForNumber("_checkout_tupu_confirm",1,nHas,szStr)
end

function _checkout_tupu_confirm(nNum)
	local nHas = _get_storage_by_idx(11);
	if nNum > nHas then
		print("error _checkout_tupu_confirm") 
		return 0;
	end
	if _modify_storage_by_idx(11,-nNum) ~= 1 then
		print("error _checkout_tupu_confirm") 
		return 0;
	end
	local tAward = g_tTupu[11];
	if gf_Judge_Room_Weight(1, 0) == 1 then
		gf_AddItemEx({tAward[1],tAward[2],tAward[3],nNum}, "�� Ph� Ch� T�o");
	else
		_modify_storage_by_idx(11,nNum)
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0;
	end
end

function _compose_tupu()
	print("\n\nhere");
	local szTitle = format("%s, h�y ch�n thao t�c mu�n th�c hi�n", g_szTitle)
	local tbSay = {}
	for i=1,10,2 do
		local nCnt1 = _get_storage_by_idx(i);
		local nCnt2 = _get_storage_by_idx(i+1);
		szTitle = szTitle..format("\n%s (�� c� <color=yellow>%-2d<color>)        %s (�� c� <color=yellow>%-2d<color>)", g_tTupu[i][6],nCnt1,g_tTupu[i+1][6],nCnt2)
	end
	local nCnt = _get_storage_by_idx(11);
	tinsert(tbSay,format("Gh�p �� Ph� Ch� T�o (�� c� %d)/_compose_tupu_confirm",nCnt))
	tinsert(tbSay,"tr� l�i/OnUse")
	Say(szTitle, getn(tbSay), tbSay)
end

function _compose_tupu_confirm()
	local nMax = 99;
	for i=1,10 do
		local nCnt = _get_storage_by_idx(i);
		if nCnt < COMPOSE_COST then 
			Talk(1,"_compose_tupu","M�nh �� Ph� hi�n c� trong T�i �� Ph� kh�ng th� gh�p th�nh 1 �� Ph� Ch� T�o.")
			return 0;
		end 
		nMax = min(nMax,nCnt);
	end
	AskClientForNumber("_compose_tupu_callback", 1, nMax/COMPOSE_COST, "Gh�p bao nhi�u?");
end

function _compose_tupu_callback(nNum)
	local nRes = G_MAX_TUPU_STORE - _get_storage_by_idx(11);
	if nNum > nRes then
		nNum = nRes;
		Msg2Player(format("�� Ph� Ch� T�o trong %s �� ��t t�i �a %d.", g_szItemNameTupuBox, G_MAX_TUPU_STORE))
	end
	if nNum <= 0 then
		return 0; 
	end
	local nCnt = nNum * COMPOSE_COST;
	for i = 1,10 do
		local nCur =  _get_storage_by_idx(i);
		if nCnt > nCur then
			print("error _compose_tupu_callback(nNum)")
			return 0;
		end
		if _modify_storage_by_idx(i,-nCnt) ~= 1 then
			print("error _compose_tupu_callback(nNum) modify storage error")
			return 0;
		end
	end
	_modify_storage_by_idx(11,nNum);
	Msg2Player( format("B�n �� gh�p %d �� Ph� Ch� T�o, �ang c�t trong T�i �� Ph� c�a b�n.",nNum))
end

function _is_tupusuipian(nG,nD,nP)  -- ����Ƿ���ͼ����Ƭ�����򷵻�����һ�֣����򷵻�0
	for i = 1,10 do 
		local tSuiPian =  g_tTupu[i];
		if (nG==tSuiPian[1]) and (nD==tSuiPian[2]) and (nP==tSuiPian[3]) then
			return i;
		end
	end
	return 0;
end

function _modify_storage_by_idx(nidx,nCnt)
	local tSuiPian = g_tTupu[nidx];
	if tSuiPian == nil then 
		return -1;
	end
	local nHas = gf_SafeGetTaskByte(tSuiPian[4],tSuiPian[5]);
	if nHas + nCnt > G_MAX_TUPU_STORE then
		print("error in function _modify_storage_by_idx(nidx,nCnt)");
		return -1;
	end
	gf_SafeSetTaskByte(tSuiPian[4], tSuiPian[5], nHas + nCnt, TSK_ACCESS_CORE)
	return 1;
end

function _get_storage_by_idx(idx)
	print("\nidx:",idx)
	local tSuiPian = g_tTupu[idx];
	if tSuiPian == nil then 
		return -1;
	end
	return gf_SafeGetTaskByte(tSuiPian[4],tSuiPian[5]);
end

function _checkin_all_tupu(bConfirm)
	local bHasSuipian = 0;
	if not bConfirm then
		local szTitle = format("%s, m�i lo�i �� Ph� t�i �a ���c l�u tr� %d c�i, x�c ��nh c�t v�o?", g_szTitle, G_MAX_TUPU_STORE);
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#_checkin_all_tupu(1)", "��ng �"))
    	tinsert(tbSay, format("%s/OnUse", "tr� l�i"))
    	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	local tItems = GetRoomItems(pos_equiproom)
	local tFull = {0,0,0,0,0,0,0,0,0,0};
	for i, item_idx in tItems do
		local nG, nD, nP	= GetItemInfoByIndex(item_idx);
		local nType 		= _is_tupusuipian(nG,nD,nP);
		if nType ~= 0 then
			bHasSuipian = 1;
			local nStorage = _get_storage_by_idx(nType)
			local nRes = G_MAX_TUPU_STORE - nStorage;
			local nCnt = GetItemCount(nG, nD, nP);
			print("nRes = ",nRes);
			if nRes <= 0 then
				tFull[nType] = 1;
			else
				nCnt = min(nCnt,nRes);
				if DelItem(nG, nD, nP, nCnt) == 1 then
					_modify_storage_by_idx(nType,nCnt);
				end
			end
		end
	end
	if bHasSuipian == 0 then
		Talk(1,"OnUse","T�i hi�n kh�ng c� M�nh �� Ph�");
		return 0; 
	end
	for i=1,10 do
		if tFull[i]==1 then
			Msg2Player(format("%s ch�a %s �� ��t t�i �a %d.", g_szItemNameTupuBox, g_tTupu[i][6], G_MAX_TUPU_STORE))
		end
	end
end
