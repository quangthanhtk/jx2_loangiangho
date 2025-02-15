Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\task_access_code_def.lua")

TSK_ACCESS_CORE         = 42;		-- 下面三个变量的访问代码
TSK_TUPU1               = 3467;		-- 变量1-3，用来保存图谱碎片和锻造图谱在图谱包中的数量
TSK_TUPU2               = 3468;		-- 其中3号变量第3个字节用来存储锻造图谱数量
TSK_TUPU3               = 3469;
G_MAX_TUPU_STORE		= 99;		-- 图谱包中每一个物品的最大存储数额，设定值99，程序上限255
COMPOSE_COST			= 1;		-- 设置话费多少个各种碎片可以合成一个锻造图谱


g_szItemNameTupuBox		= "T骾 у Ph�";
g_szTitle			    = "<color=green>T骾 у Ph�:<color>";

g_tTupu = {
	--  {g,d,p,存放的tskid,存放的byte,名称}
	[1]={2,1,31131,TSK_TUPU1,1,"M秐h у Ph� 1"},
	[2]={2,1,31132,TSK_TUPU1,2,"M秐h у Ph� 2"},
	[3]={2,1,31133,TSK_TUPU1,3,"M秐h у Ph� 3"},
	[4]={2,1,31134,TSK_TUPU1,4,"M秐h у Ph� 4"},
	[5]={2,1,31135,TSK_TUPU2,1,"M秐h у Ph� 5"},
	[6]={2,1,31136,TSK_TUPU2,2,"M秐h у Ph� 6"},
	[7]={2,1,31137,TSK_TUPU2,3,"M秐h у Ph� 7"},
	[8]={2,1,31138,TSK_TUPU2,4,"M秐h у Ph� 8"},
	[9]={2,1,31139,TSK_TUPU3,1,"M秐h у Ph� 9"},
	[10]={2,1,31140,TSK_TUPU3,2,"M秐h у Ph� 10"},
	[11]={2,1,31141,TSK_TUPU3,3,"у Ph� Ch� T筼"},
}

function test1()
	for i = 1,10 do
		local tAward = g_tTupu[i];
		AddItem(tAward[1],tAward[2],tAward[3],99); 
	end
end

function OnUse()
    local szTitle = format("%s%s", g_szTitle, "Ch鋘 thao t竎 mu鑞 th鵦 hi謓")
	local tbSay = {}
	tinsert(tbSay, format("%s/_checkin_all_tupu", "C蕋 v祇 t骾 t蕋 c� M秐h у Ph�"))
	tinsert(tbSay, format("%s/_checkout_tupu", "Ta mu鑞 l蕐 ra у Ph� Ch� T筼"))
	tinsert(tbSay, format("%s/_compose_tupu", "Ta mu鑞 gh衟 у Ph� Ch� T筼"))
	-- tinsert(tbSay, format("%s/test1", "[Debug]我要锻造图谱"))
	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _checkout_tupu()
	local nHas = _get_storage_by_idx(11);
	if nHas <= 0 then
		Talk(1,"OnUse","Trong T骾 у Ph� hi謓 kh玭g c� у Ph� Ch� T筼.")
		return 0;
	end
	local szStr = format("L蕐 ra bao nhi猽?",nHas)
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
		gf_AddItemEx({tAward[1],tAward[2],tAward[3],nNum}, "у Ph� Ch� T筼");
	else
		_modify_storage_by_idx(11,nNum)
		Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0;
	end
end

function _compose_tupu()
	print("\n\nhere");
	local szTitle = format("%s, h穣 ch鋘 thao t竎 mu鑞 th鵦 hi謓", g_szTitle)
	local tbSay = {}
	for i=1,10,2 do
		local nCnt1 = _get_storage_by_idx(i);
		local nCnt2 = _get_storage_by_idx(i+1);
		szTitle = szTitle..format("\n%s ( c� <color=yellow>%-2d<color>)        %s ( c� <color=yellow>%-2d<color>)", g_tTupu[i][6],nCnt1,g_tTupu[i+1][6],nCnt2)
	end
	local nCnt = _get_storage_by_idx(11);
	tinsert(tbSay,format("Gh衟 у Ph� Ch� T筼 ( c� %d)/_compose_tupu_confirm",nCnt))
	tinsert(tbSay,"tr� l筰/OnUse")
	Say(szTitle, getn(tbSay), tbSay)
end

function _compose_tupu_confirm()
	local nMax = 99;
	for i=1,10 do
		local nCnt = _get_storage_by_idx(i);
		if nCnt < COMPOSE_COST then 
			Talk(1,"_compose_tupu","M秐h у Ph� hi謓 c� trong T骾 у Ph� kh玭g th� gh衟 th祅h 1 у Ph� Ch� T筼.")
			return 0;
		end 
		nMax = min(nMax,nCnt);
	end
	AskClientForNumber("_compose_tupu_callback", 1, nMax/COMPOSE_COST, "Gh衟 bao nhi猽?");
end

function _compose_tupu_callback(nNum)
	local nRes = G_MAX_TUPU_STORE - _get_storage_by_idx(11);
	if nNum > nRes then
		nNum = nRes;
		Msg2Player(format("у Ph� Ch� T筼 trong %s  t t鑙 產 %d.", g_szItemNameTupuBox, G_MAX_TUPU_STORE))
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
	Msg2Player( format("B筺  gh衟 %d у Ph� Ch� T筼, 產ng c蕋 trong T骾 у Ph� c馻 b筺.",nNum))
end

function _is_tupusuipian(nG,nD,nP)  -- 检测是否是图谱碎片，是则返回是哪一种，否则返回0
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
		local szTitle = format("%s, m鏸 lo筰 у Ph� t鑙 產 頲 l璾 tr� %d c竔, x竎 nh c蕋 v祇?", g_szTitle, G_MAX_TUPU_STORE);
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#_checkin_all_tupu(1)", "уng �"))
    	tinsert(tbSay, format("%s/OnUse", "tr� l筰"))
    	tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
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
		Talk(1,"OnUse","T骾 hi謓 kh玭g c� M秐h у Ph�");
		return 0; 
	end
	for i=1,10 do
		if tFull[i]==1 then
			Msg2Player(format("%s ch鴄 %s  t t鑙 產 %d.", g_szItemNameTupuBox, g_tTupu[i][6], G_MAX_TUPU_STORE))
		end
	end
end
