
--====Edit by PhucNG 28-01-2015=======

--Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\longhu\\prize.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online\\chuyen_sinh\\translife_head.lua") 
szNPCName = "<color=green>Long H� S�<color>: "
--TASKTEMP_BHTA9 = 118

tba1moreBangHoiTA13 = {
	[2] = {"ٰ�ACE��"},
	[22] = {"�Champ"},
	[89] = {"*B52*"},
}
tba2moreBangHoiTA13 = {
	[89] = {"T�Ngh�a"},
}
tbBangHoiTA13 = {
	[2] = {"�Legend"},
	[3] = {"H�cPhong"},
	[22] = {"Holywar"},
	[39] = {"�CowBoy"},
	[89] = {"HPStar"},

	
--	[39] = {"L��i-B�a"},
--	[68] = {"*T�nS�t*"},	
--	[92] = {"/T�nS�t\"},
--	[92] = {"*-H�n-*"},

--	[2] = {"��i�o�n�"},
--	[7] = {"S�tTh�"},
--	[50] = {"-��i �ng"},
--	[92] = {"*��iLi�u"},
--	[43] = {"Vip"},
--	[68] = {"*AE*VIP*"},

--	[9] = {"*M�*"},
--	[24] = {"-Ng�Long"},
--	[62] = {"Huynh*��"},
--	[14] = {"���razy�"},
--	[26] = {"s2T�nhC�"},
--	[39] = {"��BMT��"},
--	[50] = {"-��i �ng"},
--	[1] = {"�Tri�K�"},
--	[2] = {"Vip"},
--	[22] = {"Holywar"},
}

tbVoteItems = {
	--PhucNG [1]=ID Item, [2]= Item Name, [3]= Vote Point, [4] = EXP
	[1] = {5, "5 v�ng", 1, 3000000, 0 },
	[2] = {500, "500 v�ng", 100, 300000000, 0 },
	[3] = {{2,1,30370,1}, "1 Thi�n M�n Kim L�nh", 800, 2000000000 },
	[4] = {{2,95,204,1}, "1 Thi�n Cang L�nh", 800, 2000000000 },
}

tbCCHH = {
	{1,800,"Ng� Hoa T� Nguy�n T�n(s�c m�nh)",{1,0,261,1},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (n�i c�ng)",{1,0,262,1},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (g�n c�t)",{1,0,263,1},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (th�n ph�p)",{1,0,264,1},0},
	{1,800,"Ng� Hoa T� Nguy�n T�n (nhanh nh�n)",{1,0,265,1},0},
	{1,600,"Th�t Hoa T� Nguy�n T�n (l�c c�n)",{1,0,266,1},0},
	{1,600,"Th�t Hoa T� Nguy�n T�n (l�c th�n)",{1,0,267,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (l�c ��ng)",{1,0,268,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (l�c n�i)",{1,0,269,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (n�i c�n)",{1,0,270,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (n�i th�n)",{1,0,271,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (n�i ��ng)",{1,0,272,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (th�n c�n)",{1,0,273,1},0},
	{1,500,"Th�t Hoa T� Nguy�n T�n (th�n ��ng)",{1,0,274,1},0},
	{1,300,"B�nh �t B�t B�o",{2,1,1123,1},0},
	{1,300,"B�nh �t ch�n g�",{2,1,1124,1},0},
	{1,300,"B�nh �t H��ng Ng�i",{2,1,1125,1},0},	
	{1,200,"T�y T�y Linh ��n",{2,0,137,1},30 * 24 *3600},
	{1,200,"B�t B�o T�y T�y ��n",{2,0,138,1},30 * 24 *3600},
}


function jybh_check_skill_level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0;
		end;
	end;
end;


function main()
	local nDate = tonumber(date("%Y%m%d"));
	local serverID = GetGlbValue(1023)
--	if nDate > 120415 then
--		Talk(1,"","<color=green>Long H� S�<color>: Ho�t ��ng Bang H�i Tinh Anh �� k�t th�c.");
--		return
--	end

--	if beadroll.tongName == "" then
--		beadroll:load()
--	end

	local tSel = {}
	if nDate <= 20180925 then
--		if serverID ~= 100 and serverID ~= 101 then
 			tinsert(tSel, "Nh�nh mi�n B�c - ��ng k� thi ��u Long Tranh H� ��u 7/FormDangKyTeamHN")
			tinsert(tSel, "Nh�nh mi�n Nam - ��ng k� thi ��u Long Tranh H� ��u 7/FormDangKyTeamHCM")
--		end
 	end
-- 	if nDate <= 20140815 then
-- 		tinsert(tSel, "Ta mu�n ��ng k� tranh t�i Long Tranh H� ��u/ThiDauOffLine_DangKy_Form")
-- 	end
	-- if nDate == 20130605 then
		-- tinsert(tSel, "Nh�n th��ng kinh nghi�m Bang H�i Tinh Anh/ExpBonusBHTA9")
	-- end
	
	--========== N�p Tinh Anh L�nh K� ==========--
	if nDate >= 20191126 and nDate <= 20191127 then
--		tinsert(tSel, "T�m hi�u th�ng tin ��ng k� gi�i ��u Bang H�i Tinh Anh	/#about(1)")
		tinsert(tSel, "Nh�n Tinh Anh L�nh K�/getFlags")
		tinsert(tSel, "N�p Tinh Anh L�nh K�/#giveFlag(1)")
		tinsert(tSel, "N�p Tinh Anh L�nh K�(Nguy�n so�i)/#giveFlag(2)")
		tinsert(tSel, "Xem danh s�ch ��ng k� thi ��u/viewList")
--		tinsert(tSel, "������ȡxxxx����/getAward")
	end
	
	--========== B�nh ch�n BHTA ==============--
	if nDate >= 20191119 and nDate <= 20191124 then
		tinsert(tSel,"B�nh ch�n Bang H�i Tinh Anh 22/BinhChonBHTA_CC_Form")
		tinsert(tSel,"Xem s� l��t b�nh ch�n bang h�i/ViewVote")
		-- tinsert(tSel,"B�nh ch�n bang h�i gi�i Si�u C�p/BinhChonBHTA_SC_Form")
	end
--================ ��ng k� BHTA
	if nDate >= 20190503 and nDate <= 20190508 then		
		tinsert(tSel,"��ng k� tham gia Bang H�i Tinh Anh 21/DangKyThamGiaBHTA_Form")
		tinsert(tSel,"Ta mu�n xem t�nh h�nh b�o danh Bang H�i Tinh Anh 21/DangKyThamGiaBHTA_view")		
	end
	
	tinsert(tSel, "Ta ch� gh� th�m th�i!/nothing")

	Say("<color=green>Long H� S�<color>: Ta chuy�n ph� tr�ch gi�i ��u Bang H�i Tinh Anh , c�c h� c�n h�i ta vi�c g�?", getn(tSel), tSel);

end


function DangKyThamGiaBHTA_Form()
	local szTong = GetTongName()
	local szTongLevel = GetTongLevel()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nPhe = "Tong"
	if GetTask(701) < 0 then
		nPhe = "Lieu"
	end
		
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNPCName.."C�c h� ch�a gia nh�p h� ph�i.")
		return 0
	end
	
	if gf_CheckLevel(10,1) ~= 1 then
		Talk(1,"",szNPCName.."C�c h� c�n ��t �t nh�t chuy�n sinh 10 �� ��ng k� tham gia Bang H�i Tinh Anh!")
		return
	end
	
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C�c h� kh�ng n�m trong danh s�ch ��ng k� tham gia Tinh Anh K� H�i!")
		-- return
	-- end	

	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNPCName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	
	-- if GetTongLevel() < 5 then
		-- Talk(1,"",szNPCName.."Bang h�i c�c h� ch�a ��t ��n c�p 5, kh�ng th� ��ng k�.")
		-- return 0
	-- end
	
	if gf_GetTaskByte(2280,1) ~= GetGlbValue(1023) then
		Talk(1,"",szNPCName.."C�c h� kh�ng ph�i th�n d�n b�n qu�c, kh�ng ���c ��ng k� tham gia.")
		return 0
	end
	
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < 43200   then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 1 ng�y, kh�ng th� ��i di�n bang h�i ��ng k�.")
		return 0
	end
	
	LIB_txtData:Init("danhsachbhta21.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng ���c ��ng k� th�m l�n n�a.")
		return 0
	end

	-- local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	"..GetLevel().."	"..nPhucSinh.."	"..nPhe.."	"..date("%Y-%m-%d %H:%M:%S")
	-- local nResult = LIB_txtData:AddLine(szLogAward)
	-- Talk(1,"",szNPCName.."Bang h�i c�c h� b�o danh Bang H�i Tinh Anh 13 th�nh c�ng, xin ch�c m�ng!")
	
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n b�o danh tham gia v�ng server/DangKyThamGiaBHTA_Confirm")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szNPCName.."Gi�i ��u Bang H�i Tinh Anh s�p b�t ��u kh�i tranh, ��i hi�p h�y nhanh ch�ng ��n b�o danh cho bang h�i c�a m�nh !!!!", getn(tbSay), tbSay);
end


function DangKyThamGiaBHTA_Confirm()

	local szTong = GetTongName()
	local szTongLevel = GetTongLevel()
	local szAcc = GetAccount()
	local szRole = GetName()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nPhe = "Tong"
	if GetTask(701) < 0 then
		nPhe = "Lieu"
	end
	-- if nOption > 1 then
		-- szGiai = "SIEUCAP"
	-- end
	
	if szTong == "" or szTong == nil then
		return 0
	end
	
	local tbMaterial = {
		[1] = {item={{gdp={2,1,539,5}, name="��i h�ng bao ho�ng kim"}}},
		-- [2] = {item={{gdp={2,1,539,48}, name="��i h�ng bao ho�ng kim"}}},
	}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	LIB_txtData:Init("danhsachbhta21.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng ���c ��ng k� th�m l�n n�a.")
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[1])
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	"..GetLevel().."	"..nPhucSinh.."	"..nPhe.."	"..date("%Y-%m-%d %H:%M:%S")
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNPCName.."Bang h�i c�c h� b�o danh BHTA 21 th�nh c�ng, xin ch�c m�ng.")
	AddGlobalNews("Ch�c m�ng bang h�i "..szTong.." b�o danh th�nh c�ng Bang H�i Tinh Anh 21.")
end


function DangKyThamGiaBHTA_view()
	local nTongLevel = IsTongMember() or 0
	local szTong = GetTongName()
	local nTongRegisgter = getn(LIB_txtData.tbTextData) or 0
	local tbSayDialog = szNPCName .. "Hi�n t�i c� " .. nTongRegisgter .. " bang h�i ��ng k� tham gia Bang H�i Tinh Anh 21 l�: \n"
	if nTongLevel < 1 then
		Talk(1, "",szNPCName.."C�c h� ch�a gia nh�p bang h�i, kh�ng th� xem t�nh h�nh ��ng k�.");
		return 0
	end	
	
	LIB_txtData:Init("danhsachbhta21.txt")
	LIB_txtData:LoadMultiColumn()
	
	if (nTongRegisgter == nil or nTongRegisgter == 0) then
		Talk(1,"","Hi�n t�i ch�a c� bang h�i n�o ��ng k� tham gia")
	else
		for i = 1, nTongRegisgter do
			tbSayDialog = tbSayDialog .. LIB_txtData.tbTextData[i][1] .. ", "
		end
		Talk(1,"",tbSayDialog)
	end	

end


function show()
	local tSel = {}
	tinsert(tSel, "Xem k�t qu� b�nh ch�n gi�i Si�u C�p/#show_list7(1)")
	tinsert(tSel, "Xem k�t qu� b�nh ch�n gi�i Cao C�p/#show_list7(2)")

	Say("<color=green>Long H� S�<color>: Ta chuy�n ph� tr�ch gi�i ��u Bang H�i Tinh Anh, c�c h� c�n h�i ta vi�c g�?", getn(tSel), tSel);	
end


function about(page)
	local msgs = {
		{
		"<color=green>Long H� S�<color>: T� <color=yellow>20-10-2014 ��n h�t 22-10-2014<color>, c�c bang ch� c�a bang h�i ��i di�n cho m�i c�m m�y ch� c� th� ��n g�p Long S� �� nh�n 42 <color=red>Tinh Anh L�nh K�<color>.\n",
		"Bang ch� c� tr�ch nhi�m ph�n ph�t <color=red>Tinh Anh L�nh K�<color>cho c�c th�nh vi�n tham gia gi�i ��u Bang H�i Tinh Anh. C�c th�nh vi�n c�a bang h�i khi ��ng k� ph�i c� �t nh�t 1 <color=red>Tinh Anh L�nh K�<color> trong h�nh trang c�a m�nh, v� ph�i gia nh�p Bang �t nh�t 3 ng�y.\n",   
		},
		{
		"Ch� �: \n",
		" - Ch� c� bang ch� c�a bang h�i ��i di�n cho m�i m�y ch� m�i c� th� nh�n Tinh Anh L�nh K� \n",                         
		" - M�i bang h�i ch� c� th� nh�n t�i �a 42 Tinh Anh L�nh K� t� Long H� S�.\n",
		},                         
		{
		" - M�i Tinh Anh L�nh K� l� 1 t�m v� �� ��ng k� tham gia gi�i ��u Bang H�i Tinh Anh. V� v�y, bang ch� ph�i c� tr�ch nhi�m khi ph�n ph�t Tinh Anh L�nh K� cho c�c th�nh vi�n tham gia thi ��u gi�i\n",         
		" - Khi n�p th�nh c�ng 1 Tinh Anh L�nh K� cho Long H� S�, h� th�ng s� t� ��ng ghi nh�n c�c th�ng tin c�a nh�n v�t\n",                
		" - Danh s�ch nh�n v�t n�p Tinh Anh L�nh K� l� danh s�ch ��i di�n cho m�y ch� tham gia thi ��u gi�i Bang H�i Tinh Anh\n",                
		" - M�i nh�n v�t ch� c� th� n�p t�i �a 1 Tinh Anh L�nh K� cho Long H� S�.\n",                        
		},
	}
	local tCallback = {"#about(2)","#about(3)", "main"};
	local msg = "";
	for k,v in msgs[page] do
		msg = msg .. v;
	end
	Talk(1, tCallback[page], msg);
end

function getFlags()
	local szName = GetTongName() or ""
	local szAcc = GetAccount()
	local szRole = GetName()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	--bang th� 2 trong c�ng server
	if nServerID == 2 and szName == "ٰ�ACE��" then
		more_getFlags()
		return 0
	end
	if nServerID == 22 and szName == "�Champ" then
		more_getFlags()
		return 0
	end
	if nServerID == 89 and szName == "*B52*" then
		more_getFlags()
		return 0
	end
	--bang th� 3 trong c�ng server
	if nServerID == 89 and szName == "T�Ngh�a" then
		more1_getFlags()
		return 0
	end
	------	
	if tbBangHoiTA13[nServerID] == nil or tbBangHoiTA13[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	-- local tbAcc = {"mylinh1015","chipvitbietkhoc1990"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C�c h� kh�ng n�m trong danh s�ch ��ng k� tham gia Tinh Anh K� H�i!")
		-- return
	-- end	
	
	--C� c�ng qu�c t�ch v�i server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."Bang ch� ph�i c� c�ng qu�c t�ch server m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>")
		return
	end
	
	local nTongMember = IsTongMember()
	if nTongMember ~= 1 then
		Talk(1, "", szNPCName.."Ch� c� bang ch� c�a bang h�i ��i di�n cho m�y ch� m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>");
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,300," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang!")
   		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  1 then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		return 0
	end
	-- local nLastAssignTime = GetLastAssignTime()
	-- local nNow = GetTime()
	-- if (nNow - nLastAssignTime) < 604800   then
		-- Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		-- return 0
	-- end
	
	local nCountTALK = gf_GetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK)
	if nCountTALK >= 42 then
		Talk(1,"",szNPCName.."Qu� bang �� nh�n �� 42 Tinh Anh L�nh K�!")
		return 0
	end	
	
	gf_AddItemEx2({2,0,30000,1}, "Tinh Anh L�nh K�", "BHTA21", "nh�n", 7 * 24 * 3600)
	gf_SetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK, nCountTALK + 1)
	main()
end

function giveFlag(nChoice)
	local szAcc = GetAccount()
	local szRole = GetName()
	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szPhe = "Tong"
	--bang th� 2 trong c�ng server
	if nServerID == 2 and szName == "ٰ�ACE��" then
		more_giveFlag(nChoice)
		return 0
	end
	if nServerID == 22 and szName == "�Champ" then
		more_giveFlag(nChoice)
		return 0
	end
	if nServerID == 89 and szName == "*B52*" then
		more_giveFlag(nChoice)
		return 0
	end
	--bang th� 3 trong c�ng server
	if nServerID == 89 and szName == "T�Ngh�a" then
		more1_giveFlag(nChoice)
		return 0
	end
	------			
	if gf_CheckLevel(9,92) ~= 1 then
		Talk(1,"",szNPCName.."C�c h� kh�ng �� chuy�n sinh 9 c�p 92 �� n�p tinh anh l�nh k�!")
		return
	end
	
	--C� c�ng qu�c t�ch v�i server?
--	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
--		Talk(1, "", szNPCName.."Ch� c� ng��i c�ng qu�c t�ch m�i c� th� n�p <color=red>Tinh Anh L�nh K�<color>")
--		return
--	end
	
	--� trong bang h�i �t nh�t 1 ng�y
	 local nJoinTime = GetJoinTongTime();	
	 local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	 if nDayCount <  1 then
		 Talk(1,"",szNPCName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		 return 0
	end	
	
	--Get Phe Tong Lieu
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	--Check �� ��ng k� ch�a
	if gf_GetTaskByte(TASK_BHTA6, 3) == 1 then
		Talk(1,"",szNPCName.."C�c h� �� ��ng k� r�i, kh�ng th� ��ng k� th�m n�a.")
		return 0
	end
	--C� tinh anh l�nh k� kh�ng?
	if GetItemCount(2,0,30000) == 0 then
		Talk(1,"",szNPCName.."C�c h� l� ai? Trong tay kh�ng c� Tinh Anh L�nh K�, ch� ��n xem n�o nhi�t �?")
		return 0
	end
	--C� trong danh s�ch bang h�i tham gia kh�ng?
	if tbBangHoiTA13[nServerID] == nil or tbBangHoiTA13[nServerID][1] ~= szName then
		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		return 0
	end
	
	-- local tbTongName = {"-Ng�Long","S�tTh�"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szName == tbTongName[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		-- return
	-- end	
	
	-------------
	-- if jybh_check_skill_level() ~= 1 then
		-- Talk(1,"","<color=green>Long H� S�<color>: C�c h� ch�a �� c�c �i�u ki�n c�n thi�t �� tham gia gi�i ��u Bang H�i Tinh Anh");
		-- return
	-- end	
	-------------
	
	--Check ��ng k� v� s� l��ng �� ��ng k�
	LIB_txtData:Init("20191120BaoDanhBHTA22a.txt")
	LIB_txtData:LoadMultiColumn()
	local nMember = 0
	local nRegCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		nMember = nMember + 1
		if LIB_txtData.tbTextData[i][1] == GetAccount() then
			nRegCheck = 1
		end
	end
	if nRegCheck == 1 then
		Talk(1,"",szNPCName.."C�c h� �� c� t�n trong danh s�ch thi ��u, kh�ng c�n ��ng k� n�a nh�.")
		return 0
	end
	if nMember >= 42 then
		Talk(1,"",szNPCName.."Ta �� c� trong tay danh s�ch 42 ng��i tham d�, r�t ti�c c�c h� �� ��n tr�...")
		return 0
	end
	
	--Check S� l��ng h� ph�i �� ��ng k�
	local nHePhai = GetPlayerRoute()
	LIB_txtData:Init("20191120CheckRouteBHTAa.txt")
	LIB_txtData:LoadData()
	local nRouteCount = LIB_txtData.tbTextData[tonumber(nHePhai )]
	if nRouteCount >= 5 then
		Talk(1, "", szNPCName.."�� �� 5 cao th� thu�c h� ph�i nh� c�c h�, kh�ng th� ��ng k� th�m!");
		return 0
	end
	
	--Check ��ng k� d�nh cho Nguy�n So�i
	local nTeamSize = GetTeamSize()
	local nCountNguyenSoai = 0
	LIB_txtData:Init("20191120BaoDanhBHTA22a.txt")
	LIB_txtData:LoadMultiColumn()
	if nChoice == 2 then
----		Check so luong Nguyen Soai �� ��ng k�
		for i = 1, getn(LIB_txtData.tbTextData) do
			if LIB_txtData.tbTextData[i][8] == "NguyenSoai" then
				nCountNguyenSoai = nCountNguyenSoai + 1
			end
		end
		
		if nCountNguyenSoai >= 2 then
			Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� �� 2 Nguy�n So�i.")
			return 0
		end
		
----		Check t� ��i v�i bang ch� khi ��ng k�
		if nTeamSize > 3 then
			Talk(1,"",szNPCName.."T� ��i ch� ���c t�i �a 3 ng��i v�i t�i �a 2 ng��i s� h�u trang b� Nguy�n So�i")
			return 0
		else
			if IsTongMaster() == 0 then
				local nOldIndex = PlayerIndex
				local nTongMaster = 0
				for i = 1, nTeamSize do
					PlayerIndex = GetTeamMember(i)
					if IsTongMaster() == 1 then
						nTongMaster = 1
						break
					end
				end
				PlayerIndex = nOldIndex
				
				if nTongMaster == 0 then
					Talk(1,"",szNPCName.."C�c h� c�n t� ��i v�i bang ch�")
					return 0
				end		
			end
		end
	end	
	
	----------------------------------
	if DelItem(2,0,30000,1) == 1 then
		gf_SetTaskByte(TASK_BHTA6, 3, 1) -- Set �� ��ng k�
		LIB_txtData:Init("20191120CheckRouteBHTAa.txt")
		LIB_txtData:LoadData()
		LIB_txtData:AddValue(tonumber(nHePhai),1) -- Write log s� l��ng c�c h� ph�i
		
		LIB_txtData:Init("20191120BaoDanhBHTA22a.txt")
		LIB_txtData:LoadMultiColumn()
		
		local szData
		if nChoice == 1 then
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."Thuong"
		else
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."NguyenSoai"
		end
		
		LIB_txtData:AddLine(szData)
		local nRet, nItem = gf_AddItemEx({2,0,30001,1,1},"V� l�m th�p nh� s�");
		gf_SetItemExpireTime(nItem, 2019,12,31,24);		
		gf_WriteLogEx("BHTA21","nhan",1,"VolamThapNhiSu")
		Talk(1, "", szNPCName.."Ch�c m�ng ��i hi�p �� b�o danh Bang H�i Tinh Anh th�nh c�ng. H�y c� g�ng l�n nh�!");
		Msg2Global("Ch�c m�ng ��i hi�p "..GetName().." �� b�o danh Bang H�i Tinh Anh th�nh c�ng.")
		AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh <color> th�nh c�ng.")
	end
end

function viewList()
	local szTong = GetTongName()
---
	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	
	--bang th� 2 trong c�ng server
	if nServerID == 2 and szName == "ٰ�ACE��" then
			LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
			LIB_txtData:LoadMultiColumn()
			local szList = ""
			local nCount = 0
			for i=1, getn(LIB_txtData.tbTextData) do
				szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
				nCount = nCount + 1
			end
			Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
		return 0
	end	
	if nServerID == 22 and szName == "�Champ" then
			LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
			LIB_txtData:LoadMultiColumn()
			local szList = ""
			local nCount = 0
			for i=1, getn(LIB_txtData.tbTextData) do
				szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
				nCount = nCount + 1
			end
			Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
		return 0
	end	
	if nServerID == 89 and szName == "*B52*" then
			LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
			LIB_txtData:LoadMultiColumn()
			local szList = ""
			local nCount = 0
			for i=1, getn(LIB_txtData.tbTextData) do
				szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
				nCount = nCount + 1
			end
			Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
		return 0
	end	
	--bang th� 3 trong c�ng server
	if nServerID == 89 and szName == "T�Ngh�a" then
			LIB_txtData:Init("20191120BaoDanhBHTA22a2.txt")
			LIB_txtData:LoadMultiColumn()
			local szList = ""
			local nCount = 0
			for i=1, getn(LIB_txtData.tbTextData) do
				szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
				nCount = nCount + 1
			end
			Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
		return 0
	end	
----
	LIB_txtData:Init("20191120BaoDanhBHTA22a.txt")
	LIB_txtData:LoadMultiColumn()
	local szList = ""
	local nCount = 0
	for i=1, getn(LIB_txtData.tbTextData) do
			szList = szList .. LIB_txtData.tbTextData[i][3] .. ", "
			nCount = nCount + 1
	end
	Talk(1,"", szNPCName.."Bang h�i <color=yellow>"..szTong.."<color> �� ��ng k� <color=yellow>"..nCount.."<color> th�nh vi�n g�m: "..szList)
end

--======================== Binh chon giai cao cap ========================
function BinhChonBHTA_CC_Form()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	if gf_CheckLevel(0,79) ~= 1 then
		Talk(1,"",szNPCName.."C�c h� c�n ��t c�p 79 tr� l�n m�i c� th� �ng h� Bang H�i Tinh Anh!")
		return
	end
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local tbSay = {}
		
	tbSay[0] = szNPCName.."C�c h� h�y b�nh ch�n bang h�i ��i di�n qu�c gia tham gia thi ��u."
	if tbBangHoiTA13[nServerID] ~= nil then		
		tinsert(tbSay,"B�nh ch�n cho bang "..tbBangHoiTA13[nServerID][1].."/aBinhChonBHTA_CC_Step2")		
		if nServerID == 2 then
			tinsert(tbSay,"B�nh ch�n cho bang ACE/a1moreBinhChonBHTA_CC_Step2")		
		end
		if nServerID == 22 then
			tinsert(tbSay,"B�nh ch�n cho bang champ/a1moreBinhChonBHTA_CC_Step2")			
		end
		if nServerID == 89 then
			tinsert(tbSay,"B�nh ch�n cho bang *B52*/a1moreBinhChonBHTA_CC_Step2")			
			tinsert(tbSay,"B�nh ch�n cho bang T�Ngh�a/a2moreBinhChonBHTA_CC_Step2")	
		end
	else
		tinsert(tbSay,"Kh�ng c� bang h�i n�o ��ng k� tham gia/gf_DoNothing")
	end	
	
	gf_PageSay(tbSay, 1, 6);
end

function ViewVote()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local nCounta = 0
	local nCountmorea1 = 0
	local nCountmorea2 = 0

	LIB_txtData:Init("20191118binhchonbhta22a.txt")
	LIB_txtData:LoadMultiColumn()	
	local nCounta = LIB_txtData.tbTextData[1][2] or 0
	if nCounta == nil then
		nCounta = 0
	end
	if nServerID == 2 or nServerID == 22 or nServerID == 89 then
		LIB_txtData:Init("20191118binhchonbhta22a1.txt")
		LIB_txtData:LoadMultiColumn()	
		nCountmorea1 = LIB_txtData.tbTextData[1][2] or 0	
		if nCountmorea1 == nil then
			nCountmorea1 = 0
		end
	end
	if nServerID == 89 then
		LIB_txtData:Init("20191118binhchonbhta22a2.txt")
		LIB_txtData:LoadMultiColumn()	
		nCountmorea2 = LIB_txtData.tbTextData[1][2] or 0	
		if nCountmorea2 == nil then
			nCountmorea2 = 0
		end
	end
	if tbBangHoiTA13[nServerID] ~= nil then
		local szTalk = szNPCName.."\nBang h�i "..tbBangHoiTA13[nServerID][1].." �� c� "..nCounta.." �i�m t�ch l�y."	
		if nServerID == 2 then
			szTalk = szTalk .."\nBang h�i ACE �� c� "..nCountmorea1.." �i�m t�ch l�y."	
		end
		if nServerID == 22 then
			szTalk = szTalk .."\nBang h�i champ �� c� "..nCountmorea1.." �i�m t�ch l�y."	
		end
		if nServerID == 89 then
			szTalk = szTalk .."\nBang h�i *B52* �� c� "..nCountmorea1.." �i�m t�ch l�y."	
			szTalk = szTalk .."\nBang h�i T�Ngh�a �� c� "..nCountmorea2.." �i�m t�ch l�y."	
		end
		Talk(1,"", szTalk)
	else	
		Talk(1,"","Ch�a c� bang h�i n�o ���c b�nh ch�n")
	end	
end
function aBinhChonBHTA_CC_Step2()
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	tinsert(tbSay, "N�p 5 v�ng: 1 �i�m/#aBinhChonBHTA_Step3(1)")
	tinsert(tbSay, "N�p 500 v�ng: 100 �i�m/#aBinhChonBHTA_Step3(2)")
	tinsert(tbSay, "N�p 1 Thi�n M�n Kim L�nh: 800 �i�m/#aBinhChonBHTA_Step3(3)")
	tinsert(tbSay, "N�p 1 Thi�n Cang L�nh: 800 �i�m/#aBinhChonBHTA_Step3(4)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."C�c h� mu�n b�nh ch�n cho bang "..tbBangHoiTA13[nServerID][1].." b�ng h�nh th�c n�o?", getn(tbSay), tbSay)
end
function a1moreBinhChonBHTA_CC_Step2()	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	
	local nServerID = GetGlbValue(1023)
	local nString = "ACE"
	if nServerID == 22 then
		nString = "champ"
	elseif nServerID == 89 then
		nString = "*B52*"
	end
	local tbSay = {}
	tinsert(tbSay, "N�p 5 v�ng: 1 �i�m/#a1moreBinhChonBHTA_Step3(1)")
	tinsert(tbSay, "N�p 500 v�ng: 100 �i�m/#a1moreBinhChonBHTA_Step3(2)")
	tinsert(tbSay, "N�p 1 Thi�n M�n Kim L�nh: 800 �i�m/#a1moreBinhChonBHTA_Step3(3)")
	tinsert(tbSay, "N�p 1 Thi�n Cang L�nh: 800 �i�m/#a1moreBinhChonBHTA_Step3(4)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."C�c h� mu�n b�nh ch�n cho bang "..nString.." b�ng h�nh th�c n�o?", getn(tbSay), tbSay)
end
function a2moreBinhChonBHTA_CC_Step2()
--	do return 0 end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end
	
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	tinsert(tbSay, "N�p 5 v�ng: 1 �i�m/#a2moreBinhChonBHTA_Step3(1)")
	tinsert(tbSay, "N�p 500 v�ng: 100 �i�m/#a2moreBinhChonBHTA_Step3(2)")
	tinsert(tbSay, "N�p 1 Thi�n M�n Kim L�nh: 800 �i�m/#a2moreBinhChonBHTA_Step3(3)")
	tinsert(tbSay, "N�p 1 Thi�n Cang L�nh: 800 �i�m/#a2moreBinhChonBHTA_Step3(4)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."C�c h� mu�n b�nh ch�n cho bang T�Ngh�a b�ng h�nh th�c n�o?", getn(tbSay), tbSay)
end

function aBinhChonBHTA_Step3(nOption)
	if nOption == 4 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("aBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 3 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("aBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 2 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/500)
		local nMax = min(nMoney, 500)
		local szFunc = format("aBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, 1, "S� l�n n�p 100 �i�m?");
	elseif nOption == 1 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/5)
		local nMax = min(nMoney, 100)
		local szFunc = format("aBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� �i�m mu�n n�p?");
	end
end

function a1moreBinhChonBHTA_Step3(nOption)
	if nOption == 4 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("a1moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 3 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("a1moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 2 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/500)
		local nMax = min(nMoney, 500)
		local szFunc = format("a1moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, 1, "S� l�n n�p 100 �i�m?");
	elseif nOption == 1 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/5)
		local nMax = min(nMoney, 100)
		local szFunc = format("a1moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� �i�m mu�n n�p?");
	end
end
function a2moreBinhChonBHTA_Step3(nOption)
--	do return 0 end

	if nOption == 4 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("a2moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 3 then
		local nItem = GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3])
		local nMax = min(nItem, 1)
		local szFunc = format("a2moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� v�t ph�m mu�n n�p?");
	elseif nOption == 2 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/500)
		local nMax = min(nMoney, 500)
		local szFunc = format("a2moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, 1, "S� l�n n�p 100 �i�m?");
	elseif nOption == 1 then
		local nMoney1 = floor(GetCash()/10000)
		local nMoney = floor(nMoney1/5)
		local nMax = min(nMoney, 100)
		local szFunc = format("a2moreBinhChonBHTA_Step3_01_%d", nOption)
		AskClientForNumber(szFunc, 1, nMax, "S� �i�m mu�n n�p?");
	end
end

function aBinhChonBHTA_Step3_01_1(nNum)
	return aBinhChonBHTA_Step3_Final(1,nNum)
end
function aBinhChonBHTA_Step3_01_2(nNum)
	return aBinhChonBHTA_Step3_Final(2,nNum)
end
function aBinhChonBHTA_Step3_01_3(nNum)
	return aBinhChonBHTA_Step3_Final(3,nNum)
end
function aBinhChonBHTA_Step3_01_4(nNum)
	return aBinhChonBHTA_Step3_Final(4,nNum)
end
----
function a1moreBinhChonBHTA_Step3_01_1(nNum)
	return a1moreBinhChonBHTA_Step3_Final(1,nNum)
end
function a1moreBinhChonBHTA_Step3_01_2(nNum)
	return a1moreBinhChonBHTA_Step3_Final(2,nNum)
end
function a1moreBinhChonBHTA_Step3_01_3(nNum)
	return a1moreBinhChonBHTA_Step3_Final(3,nNum)
end
function a1moreBinhChonBHTA_Step3_01_4(nNum)
	return a1moreBinhChonBHTA_Step3_Final(4,nNum)
end
----
function a2moreBinhChonBHTA_Step3_01_1(nNum)
	return a2moreBinhChonBHTA_Step3_Final(1,nNum)
end
function a2moreBinhChonBHTA_Step3_01_2(nNum)
	return a2moreBinhChonBHTA_Step3_Final(2,nNum)
end
function a2moreBinhChonBHTA_Step3_01_3(nNum)
	return a2moreBinhChonBHTA_Step3_Final(3,nNum)
end
function a2moreBinhChonBHTA_Step3_01_4(nNum)
	return a2moreBinhChonBHTA_Step3_Final(4,nNum)
end
-----
function aBinhChonBHTA_Step3_Final(nOption,nNum)
	local nVoteBHTA = GetTask(TSK_CUOCCHIENHOAHONG)
	if nVoteBHTA >= 8000 then
		Talk(1,"",szNPCName.."C�c h� �� b�nh ch�n �� s� l��ng trong m�a gi�i BHTA 22.")
		return 0
	end
	
	if (nVoteBHTA + tbVoteItems[nOption][3]*nNum) > 8000 then
		Talk(1,"",szNPCName.."C�c h� kh�ng th� n�p qu� s� l��ng t�i �a l� 8000 �i�m t�ch l�y!")
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end

	local nServerID = GetGlbValue(1023)
	
	if type(tbVoteItems[nOption][1]) == "table" then
		if GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3]) < (tbVoteItems[nOption][1][4] * nNum) then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� "..tbVoteItems[nOption][1][4].." "..tbVoteItems[nOption][2]..", h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	elseif type(tbVoteItems[nOption][1]) == "number" then
		if GetCash() < tbVoteItems[nOption][1]*10000*nNum then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� �� v�ng �� vote "..nNum.." �i�m, h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	end
	
	if gf_Judge_Room_Weight(1,100," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang �� ti�p t�c b�nh ch�n!")
   		return 0
	end

	LIB_txtData:Init("20191118binhchonbhta22a.txt")
	if LIB_txtData:AddValue(1,tbVoteItems[nOption][3] * nNum) == 1 then
		if type(tbVoteItems[nOption][1]) == "table" then
			DelItem(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3], tbVoteItems[nOption][1][4] * nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i "..tbBangHoiTA13[nServerID][1].." nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			--Cuoc Chien Hoa Hong			
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		else
			Pay(tbVoteItems[nOption][1]*10000*nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i "..tbBangHoiTA13[nServerID][1].." nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		end	
	end
	
	aBinhChonBHTA_CC_Step2(1)
end
function a1moreBinhChonBHTA_Step3_Final(nOption,nNum)
	local nVoteBHTA = GetTask(TSK_CUOCCHIENHOAHONG)
	if nVoteBHTA >= 8000 then
		Talk(1,"",szNPCName.."C�c h� �� b�nh ch�n �� s� l��ng trong m�a gi�i BHTA 22.")
		return 0
	end
	
	if (nVoteBHTA + tbVoteItems[nOption][3]*nNum) > 8000 then
		Talk(1,"",szNPCName.."C�c h� kh�ng th� n�p qu� s� l��ng t�i �a l� 8000 �i�m t�ch l�y!")
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end

	local nServerID = GetGlbValue(1023)
	local nString = "ACE"
	if nServerID == 22 then
		nString = "champ"
	elseif nServerID == 89 then
		nString = "*B52*"
	end
	if type(tbVoteItems[nOption][1]) == "table" then
		if GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3]) < (tbVoteItems[nOption][1][4] * nNum) then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� "..tbVoteItems[nOption][1][4].." "..tbVoteItems[nOption][2]..", h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	elseif type(tbVoteItems[nOption][1]) == "number" then
		if GetCash() < tbVoteItems[nOption][1]*10000*nNum then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� �� v�ng �� vote "..nNum.." �i�m, h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	end
	
	if gf_Judge_Room_Weight(1,100," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang �� ti�p t�c b�nh ch�n!")
   		return 0
	end

	LIB_txtData:Init("20191118binhchonbhta22a1.txt")
	if LIB_txtData:AddValue(1,tbVoteItems[nOption][3] * nNum) == 1 then
		if type(tbVoteItems[nOption][1]) == "table" then
			DelItem(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3], tbVoteItems[nOption][1][4] * nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i "..nString.." nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			--Cuoc Chien Hoa Hong			
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		else
			Pay(tbVoteItems[nOption][1]*10000*nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i "..nString.." nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		end	
	end
	
	a1moreBinhChonBHTA_CC_Step2(1)
end
-----
function a2moreBinhChonBHTA_Step3_Final(nOption,nNum)
--	do return 0 end
	local nVoteBHTA = GetTask(TSK_CUOCCHIENHOAHONG)
	if nVoteBHTA >= 8000 then
		Talk(1,"",szNPCName.."C�c h� �� b�nh ch�n �� s� l��ng trong m�a gi�i BHTA 22.")
		return 0
	end
	
	if (nVoteBHTA + tbVoteItems[nOption][3]*nNum) > 8000 then
		Talk(1,"",szNPCName.."C�c h� kh�ng th� n�p qu� s� l��ng t�i �a l� 8000 �i�m t�ch l�y!")
		return
	end
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 300 then
		Talk(1,"", szNPCName.."C�c h� vui l�ng ��n Th�nh �� b�nh ch�n nh�!")
		return 0
	end

	local nServerID = GetGlbValue(1023)
	
	if type(tbVoteItems[nOption][1]) == "table" then
		if GetItemCount(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3]) < (tbVoteItems[nOption][1][4] * nNum) then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� "..tbVoteItems[nOption][1][4].." "..tbVoteItems[nOption][2]..", h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	elseif type(tbVoteItems[nOption][1]) == "number" then
		if GetCash() < tbVoteItems[nOption][1]*10000*nNum then
			Talk(1,"",szNPCName.."C�c h� kh�ng c� �� v�ng �� vote "..nNum.." �i�m, h�y chu�n b� �� r�i ��n ��y nh�.")
			return 0
		end
	end
	
	if gf_Judge_Room_Weight(1,100," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang �� ti�p t�c b�nh ch�n!")
   		return 0
	end

	LIB_txtData:Init("20191118binhchonbhta22a2.txt")
	if LIB_txtData:AddValue(1,tbVoteItems[nOption][3] * nNum) == 1 then
		if type(tbVoteItems[nOption][1]) == "table" then
			DelItem(tbVoteItems[nOption][1][1], tbVoteItems[nOption][1][2], tbVoteItems[nOption][1][3], tbVoteItems[nOption][1][4] * nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i T�Ngh�a nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			--Cuoc Chien Hoa Hong			
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		else
			Pay(tbVoteItems[nOption][1]*10000*nNum)
			ModifyExp(tbVoteItems[nOption][4] * nNum)
			Msg2Player("Bang h�i T�Ngh�a nh�n ���c "..(tbVoteItems[nOption][3] * nNum).." �i�m b�nh ch�n .")
			SetTask(TSK_CUOCCHIENHOAHONG, GetTask(TSK_CUOCCHIENHOAHONG) + tbVoteItems[nOption][3]*nNum)
		end	
	end
	
	a2moreBinhChonBHTA_CC_Step2(1)
end
-----
function ExpBonusBHTA9()
	if GetExtPoint(2) == 0 then
		Talk(1,"",szNPCName .."C�c h� kh�ng c� trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng r�i.")
		return 0
	end
	local nExpBonus = tbExpBonusBHTA9[GetExtPoint(2)] or 0
	if nExpBonus > 0 then
		local tbAward = {nCheckExp = 0, nExp = nExpBonus}
		LIB_Award:Award(tbAward )
		PayExtPoint(2, GetExtPoint(2))
		gf_WriteLogEx("NHAN THUONG BHTA9", "nh�n th�nh c�ng", 1, "Nh�n th��ng BHTA9")
	end
end


function CheckRule()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 3 then
		Talk(1,"","T� ��i ph�i c� ��ng 3 th�nh vi�n, kh�ng h�n kh�ng k�m.")
		return 0
	end
	if GetItemCount(2,1,539) < 3 then
		Talk(1,"","Kh�ng c� �� 3 Ho�ng Kim ��i H�ng Bao.");
		return 0
	end
	local tbMember = {[1] = {}, [2] = {}, [3] = {}, [4]={}, [5]={}}
	local tbRoute = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	nOldPlayerIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		tbMember[i]["name"] = GetName()
		tbMember[i]["route"] = GetPlayerRoute()
		tbMember[i]["task"] = GetTask(TASK_LHTH)
		tbMember[i]["chuyensinh"] = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
		tbMember[i]["level"] = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()		
		tbRoute[GetPlayerRoute()] = tbRoute[GetPlayerRoute()] + 1
	end
	PlayerIndex = nOldPlayerIndex
	
	-- Check cac dieu kien dang ky
	for i=1, getn(tbRoute) do
		if tbRoute[i] > 1 then
			Talk(1,"","T� ��i ph�i c� 4 h� ph�i kh�c nhau m�i ���c ��ng k�.");
			return 0
		end
	end

	for i=1, 3 do
		if tbMember[i]["route"] == 0 then
			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " ch�a gia nh�p h� ph�i.")
			return 0
		end
--		if tbMember[i]["task"] == 1 then
--			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " �� ��ng k� thi ��u r�i.")
--			return 0
--		end
		if tbMember[i]["level"] < 896 then
			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " kh�ng �� �i�u ki�n chuy�n sinh v� ��ng c�p.")
			return 0
		end
--		if tbMember[i]["chuyensinh"] < 3  then
--			Talk(1,"","Th�nh vi�n " .. tbMember[i]["name"] .. " kh�ng �� �i�u ki�n chuy�n sinh.")
--			return 0
--		end
	end
	
	return 1
end


function  FormDangKyTeamHN()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i ���c ph�p ��ng k�.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung5all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25]=1, [26]=1, [27]=1, [29] = 1,[30] = 1,[31] = 1,[32] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end
	end
	PlayerIndex = nOldPlayer
	if nCheckMsg == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n �� ��ng k� tham gia r�i")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n ch�a gia nh�p h� ph�i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHN","T�n ��i.",2,32,"T�n ��i: (2-32 k� t�)");
	end
end


function KiemTraDangKyHN(szTeamName)

	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","T�n ��i ch� ���c ch�a c�c k� t� t� A ��n Z (���c ph�p c� ch� hoa & ch� th��ng) v� ch� s� t� 0 ��n 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung7all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","T�n ��i " .. szTeamName .. " �� c� ng��i ��ng k�.")
			return 0
		end
	end

	local szLocation = "HN"
	if CheckRule() == 1 then
		if DelItem(2,1,539,4) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� 4 Ho�ng Kim ��i H�ng Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","��ng k� nh�nh Mi�n B�c th�nh c�ng, c�c h� �� l� th�nh vi�n c�a ��i " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function  FormDangKyTeamHCM()
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i ���c ph�p ��ng k�.")
		return 0
	end
	LIB_txtData:Init("longhotranhhung7all.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nTeam = GetTeamSize()
	if nTeam ~= 4 then
		Talk(1,"","Ch� ���c ��ng k� t� ��i 4 ng��i tham gia thi ��u.")
		return 0
	end
	local nCheckMsg = 0
	local nJoint = 0
	local nOldPlayer = PlayerIndex
	for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
			local szAccount = GetAccount()
			for j = 1, getn(LIB_txtData.tbTextData) do
				if tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][4]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][8]) or tostring(szAccount) == tostring(LIB_txtData.tbTextData[j][12]) then
					nCheckMsg = 1
				end
			end
			local tRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25]=1, [26]=1, [27]=1,[29] = 1,[30] = 1,[31] = 1,[32] = 1,}
			local nRoute = GetPlayerRoute()
			if tRoute[nRoute] ~= 1 then
				nJoint = 1
			end	
	end
	PlayerIndex = nOldPlayer	
	if nCheckMsg == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n �� ��ng k� tham gia r�i")
		return 0
	end	
	if nJoint == 1 then
		Talk(1, "", "Trong t� ��i c� th�nh vi�n ch�a gia nh�p h� ph�i")
		return 0
	end	
	-- Dang ky
	if CheckRule() == 1 then
		AskClientForString("KiemTraDangKyHCM","T�n ��i.",2,32,"T�n ��i: (2-32 k� t�)");
	end
end


function KiemTraDangKyHCM(szTeamName)
	if LIB_txtData:CheckString(szTeamName) > 0 then
		Talk(1,"","T�n ��i ch� ���c ch�a c�c k� t� t� A ��n Z (���c ph�p c� ch� hoa & ch� th��ng) v� ch� s� t� 0 ��n 9.")
		return 0
	end
	
	LIB_txtData:Init("longhotranhhung7all.txt")
	LIB_txtData:LoadMultiColumn()
	
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szTeamName) == tostring(LIB_txtData.tbTextData[i][2]) then
			Talk(1,"","T�n ��i " .. szTeamName .. " �� c� ng��i ��ng k�.")
			return 0
		end
	end

	local szLocation = "HCM"
	if CheckRule() == 1 then
		if DelItem(2,1,539,4) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� 4 Ho�ng Kim ��i H�ng Bao !!!")
			return 0
		end
		local szData = GetGlbValue(1023) .. "	" .. szTeamName .. "	" .. date("%Y%m%d%H%M%S") .. "	"
		local nTeam = GetTeamSize()
		nOldPlayer = PlayerIndex
		for i=1, nTeam do
			PlayerIndex = GetTeamMember(i)
--			SetTask(TASK_LHTH,1)
			szData = szData .. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" .. szLocation .. "	"
			Talk(1,"","��ng k� nh�nh Mi�n Nam th�nh c�ng, c�c h� �� l� th�nh vi�n c�a ��i " .. szTeamName)
		end
		PlayerIndex = nOldPlayer
		LIB_txtData:AddLine(szData)
	end
end

function ThiDauOffLine_DangKy_Form()
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n ��ng k� ��u t�i H� N�i/#ThiDauOffLine_DangKy(1)")
	tinsert(tbSay, "Ta mu�n ��ng k� ��u t�i th�nh ph� H� Ch� Minh/#ThiDauOffLine_DangKy(2)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNPCName.."Gi�i ��u l�n n�y chia l�m 2 khu v�c H� N�i v� Th�nh ph� H� Ch� Minh. C�c h� h�y ch�n ��a �i�m ph� h�p v�i c�c h�.", getn(tbSay), tbSay)
end

function ThiDauOffLine_DangKy(nOption)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0);
	local nLevel = nChuyenSinh*100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local szAccount = GetAccount()
	local szLocation = "HN"
	if nOption ~= 1 then
		szLocation = "HCM"
	end
--	if nRoute ~= 23 then
--		Talk(1,"",szNPCName.."Ta r�t ti�c, gi�i ��u n�y ch� d�nh ri�ng cho h� ph�i C�n L�n Thi�n S�.")
--		return 0
--	end
	if nLevel < 93 then
		Talk(1,"",szNPCName.."C�c h� ch�a �� c�p �� tr�ng sinh ho�c ��ng c�p, h�y c� g�ng th�m.")
		return 0
	end
	if GetItemCount(2,1,30230) < 3000 then
		Talk(1,"",szNPCName.."Ta c�n 3000 xu v�t ph�m l�m tin, c�c h� h�y chu�n b� �� nh�.")
		return 0
	end
	LIB_txtData:Init("offlineconlon.txt")
	LIB_txtData:LoadMultiColumn()
	for i = 1, getn(LIB_txtData.tbTextData) do
		if tostring(szAccount) == tostring(LIB_txtData.tbTextData[i][1]) then
			Talk(1,"","C�c h� �� c� t�n trong danh s�ch, kh�ng c�n ��ng k� n�a.")
			return 0
		end
	end
	if DelItem(2,1,30230,3000) == 1 then
		local szData = szAccount .. "	" .. GetName() .. "	" .. GetGlbValue(1023) .. "	" .. GetLevel().."	" .. nChuyenSinh.."	" .. date("%Y%m%d%H%M%S").."	"..szLocation
		LIB_txtData:AddLine(szData)
		Talk(1,"",szNPCName.."��ng k� th�nh c�ng, c�c h� vui l�ng ch� th�ng b�o k�t qu�.")
	end
end

function nothing()
end

function more_getFlags()
	local szName = GetTongName() or ""
	local szAcc = GetAccount()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)

--	if tbmoreBangHoiTA13[nServerID] == nil or tbmoreBangHoiTA13[nServerID][1] ~= szName then
--		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
--		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
--		return 0
--	end
	
	-- local tbAcc = {"mylinh1015","chipvitbietkhoc1990"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C�c h� kh�ng n�m trong danh s�ch ��ng k� tham gia Tinh Anh K� H�i!")
		-- return
	-- end	
	
	--C� c�ng qu�c t�ch v�i server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."Bang ch� ph�i c� c�ng qu�c t�ch server m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>")
		return
	end
	
	local nTongMember = IsTongMember()
	if nTongMember ~= 1 then
		Talk(1, "", szNPCName.."Ch� c� bang ch� c�a bang h�i ��i di�n cho m�y ch� m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>");
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,300," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang!")
   		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  1 then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		return 0
	end
	-- local nLastAssignTime = GetLastAssignTime()
	-- local nNow = GetTime()
	-- if (nNow - nLastAssignTime) < 604800   then
		-- Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		-- return 0
	-- end
	
	local nCountTALK = gf_GetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK)
	if nCountTALK >= 42 then
		Talk(1,"",szNPCName.."Qu� bang �� nh�n �� 42 Tinh Anh L�nh K�!")
		return 0
	end	
	
	gf_AddItemEx2({2,0,30000,1}, "Tinh Anh L�nh K�", "BHTA21", "nh�n", 7 * 24 * 3600)
	gf_SetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK, nCountTALK + 1)
	main()
end
function more_giveFlag(nChoice)

	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szPhe = "Tong"
		
	if gf_CheckLevel(9,92) ~= 1 then
		Talk(1,"",szNPCName.."C�c h� kh�ng �� chuy�n sinh 9 c�p 92 �� n�p tinh anh l�nh k�!")
		return
	end
	
	--C� c�ng qu�c t�ch v�i server?
--	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
--		Talk(1, "", szNPCName.."Ch� c� ng��i c�ng qu�c t�ch m�i c� th� n�p <color=red>Tinh Anh L�nh K�<color>")
--		return
--	end
	
	--� trong bang h�i �t nh�t 1 ng�y
	 local nJoinTime = GetJoinTongTime();	
	 local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	 if nDayCount <  1 then
		 Talk(1,"",szNPCName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		 return 0
	end	
	
	--Get Phe Tong Lieu
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	--Check �� ��ng k� ch�a
	if gf_GetTaskByte(TASK_BHTA6, 3) == 1 then
		Talk(1,"",szNPCName.."C�c h� �� ��ng k� r�i, kh�ng th� ��ng k� th�m n�a.")
		return 0
	end
	--C� tinh anh l�nh k� kh�ng?
	if GetItemCount(2,0,30000) == 0 then
		Talk(1,"",szNPCName.."C�c h� l� ai? Trong tay kh�ng c� Tinh Anh L�nh K�, ch� ��n xem n�o nhi�t �?")
		return 0
	end
	--C� trong danh s�ch bang h�i tham gia kh�ng?
--	if tba1moreBangHoiTA13[nServerID] == nil or tba1moreBangHoiTA13[nServerID][1] ~= szName then
--		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
--		return 0
--	end
	
	-- local tbTongName = {"-Ng�Long","S�tTh�"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szName == tbTongName[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		-- return
	-- end	
	
	-------------
	-- if jybh_check_skill_level() ~= 1 then
		-- Talk(1,"","<color=green>Long H� S�<color>: C�c h� ch�a �� c�c �i�u ki�n c�n thi�t �� tham gia gi�i ��u Bang H�i Tinh Anh");
		-- return
	-- end	
	-------------
	
	--Check ��ng k� v� s� l��ng �� ��ng k�
	LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
	LIB_txtData:LoadMultiColumn()
	local nMember = 0
	local nRegCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		nMember = nMember + 1
		if LIB_txtData.tbTextData[i][1] == GetAccount() then
			nRegCheck = 1
		end
	end
	if nRegCheck == 1 then
		Talk(1,"",szNPCName.."C�c h� �� c� t�n trong danh s�ch thi ��u, kh�ng c�n ��ng k� n�a nh�.")
		return 0
	end
	if nMember >= 42 then
		Talk(1,"",szNPCName.."Ta �� c� trong tay danh s�ch 42 ng��i tham d�, r�t ti�c c�c h� �� ��n tr�...")
		return 0
	end
	
	--Check S� l��ng h� ph�i �� ��ng k�
	local nHePhai = GetPlayerRoute()
	LIB_txtData:Init("20191120CheckRouteBHTAa1.txt")
	LIB_txtData:LoadData()
	local nRouteCount = LIB_txtData.tbTextData[tonumber(nHePhai )]
	if nRouteCount >= 5 then
		Talk(1, "", szNPCName.."�� �� 5 cao th� thu�c h� ph�i nh� c�c h�, kh�ng th� ��ng k� th�m!");
		return 0
	end
	
	--Check ��ng k� d�nh cho Nguy�n So�i
	local nTeamSize = GetTeamSize()
	local nCountNguyenSoai = 0
	LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
	LIB_txtData:LoadMultiColumn()
	if nChoice == 2 then
----		Check so luong Nguyen Soai �� ��ng k�
		for i = 1, getn(LIB_txtData.tbTextData) do
			if LIB_txtData.tbTextData[i][8] == "NguyenSoai" then
				nCountNguyenSoai = nCountNguyenSoai + 1
			end
		end
		
		if nCountNguyenSoai >= 2 then
			Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� �� 2 Nguy�n So�i.")
			return 0
		end
		
----		Check t� ��i v�i bang ch� khi ��ng k�
		if nTeamSize > 3 then
			Talk(1,"",szNPCName.."T� ��i ch� ���c t�i �a 3 ng��i v�i t�i �a 2 ng��i s� h�u trang b� Nguy�n So�i")
			return 0
		else
			if IsTongMaster() == 0 then
				local nOldIndex = PlayerIndex
				local nTongMaster = 0
				for i = 1, nTeamSize do
					PlayerIndex = GetTeamMember(i)
					if IsTongMaster() == 1 then
						nTongMaster = 1
						break
					end
				end
				PlayerIndex = nOldIndex
				
				if nTongMaster == 0 then
					Talk(1,"",szNPCName.."C�c h� c�n t� ��i v�i bang ch�")
					return 0
				end		
			end
		end
	end	
	
	----------------------------------
	if DelItem(2,0,30000,1) == 1 then
		gf_SetTaskByte(TASK_BHTA6, 3, 1) -- Set �� ��ng k�
		LIB_txtData:Init("20191120CheckRouteBHTAa1.txt")
		LIB_txtData:LoadData()
		LIB_txtData:AddValue(tonumber(nHePhai),1) -- Write log s� l��ng c�c h� ph�i
		
		LIB_txtData:Init("20191120BaoDanhBHTA22a1.txt")
		LIB_txtData:LoadMultiColumn()
		
		local szData
		if nChoice == 1 then
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."Thuong"
		else
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."NguyenSoai"
		end
		
		LIB_txtData:AddLine(szData)
		local nRet, nItem = gf_AddItemEx({2,0,30001,1,1},"V� l�m th�p nh� s�");
		gf_SetItemExpireTime(nItem, 2019,12,31,24);		
		gf_WriteLogEx("BHTA21","nhan",1,"VolamThapNhiSu")
		Talk(1, "", szNPCName.."Ch�c m�ng ��i hi�p �� b�o danh Bang H�i Tinh Anh th�nh c�ng. H�y c� g�ng l�n nh�!");
		Msg2Global("Ch�c m�ng ��i hi�p "..GetName().." �� b�o danh Bang H�i Tinh Anh th�nh c�ng.")
		AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh <color> th�nh c�ng.")
	end
end
------------------
function more1_getFlags()
	local szName = GetTongName() or ""
	local szAcc = GetAccount()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)

--	if tbmoreBangHoiTA13[nServerID] == nil or tbmoreBangHoiTA13[nServerID][1] ~= szName then
--		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
--		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
--		return 0
--	end
	
	-- local tbAcc = {"mylinh1015","chipvitbietkhoc1990"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szAcc == tbAcc[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"",szNPCName.."C�c h� kh�ng n�m trong danh s�ch ��ng k� tham gia Tinh Anh K� H�i!")
		-- return
	-- end	
	
	--C� c�ng qu�c t�ch v�i server?
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
		Talk(1, "", szNPCName.."Bang ch� ph�i c� c�ng qu�c t�ch server m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>")
		return
	end
	
	local nTongMember = IsTongMember()
	if nTongMember ~= 1 then
		Talk(1, "", szNPCName.."Ch� c� bang ch� c�a bang h�i ��i di�n cho m�y ch� m�i c� th� nh�n <color=red>Tinh Anh L�nh K�<color>");
		Msg2Player("B�n kh�ng �� �i�u ki�n nh�n.")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,300," ") ~= 1 then
		Talk(1,"",szNPCName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang!")
   		return 0
	end
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  2 then
		Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		return 0
	end
	-- local nLastAssignTime = GetLastAssignTime()
	-- local nNow = GetTime()
	-- if (nNow - nLastAssignTime) < 604800   then
		-- Talk(1,"",szNPCName.."Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		-- return 0
	-- end
	
	local nCountTALK = gf_GetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK)
	if nCountTALK >= 42 then
		Talk(1,"",szNPCName.."Qu� bang �� nh�n �� 42 Tinh Anh L�nh K�!")
		return 0
	end	
	
	gf_AddItemEx2({2,0,30000,1}, "Tinh Anh L�nh K�", "BHTA21", "nh�n", 4 * 24 * 3600)
	gf_SetTaskByte(TASK_BHTA6, BYTE_BHTA6_GET_TALK, nCountTALK + 1)
	main()
end
function more1_giveFlag(nChoice)

	local szName = GetTongName() or ""
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	local szPhe = "Tong"
		
	if gf_CheckLevel(9,92) ~= 1 then
		Talk(1,"",szNPCName.."C�c h� kh�ng �� chuy�n sinh 9 c�p 92 �� n�p tinh anh l�nh k�!")
		return
	end
	
	--C� c�ng qu�c t�ch v�i server?
--	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= nServerID then
--		Talk(1, "", szNPCName.."Ch� c� ng��i c�ng qu�c t�ch m�i c� th� n�p <color=red>Tinh Anh L�nh K�<color>")
--		return
--	end
	
	--� trong bang h�i �t nh�t 1 ng�y
	 local nJoinTime = GetJoinTongTime();	
	 local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	 if nDayCount <  1 then
		 Talk(1,"",szNPCName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n Tinh Anh L�nh K�!")
		 return 0
	end	
	
	--Get Phe Tong Lieu
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	--Check �� ��ng k� ch�a
	if gf_GetTaskByte(TASK_BHTA6, 3) == 1 then
		Talk(1,"",szNPCName.."C�c h� �� ��ng k� r�i, kh�ng th� ��ng k� th�m n�a.")
		return 0
	end
	--C� tinh anh l�nh k� kh�ng?
	if GetItemCount(2,0,30000) == 0 then
		Talk(1,"",szNPCName.."C�c h� l� ai? Trong tay kh�ng c� Tinh Anh L�nh K�, ch� ��n xem n�o nhi�t �?")
		return 0
	end
	--C� trong danh s�ch bang h�i tham gia kh�ng?
--	if tbmoreBangHoiTA13[nServerID] == nil or tbmoreBangHoiTA13[nServerID][1] ~= szName then
--		Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
--		return 0
--	end
	
	-- local tbTongName = {"-Ng�Long","S�tTh�"}
	-- local nCheck = 0
	-- for i =1,2 do
		-- if szName == tbTongName[i] then
			-- nCheck = 1
		-- end
	-- end
	
	-- if nCheck == 0 then
		-- Talk(1,"", szNPCName.."C�c h� kh�ng thu�c danh s�ch bang h�i tham gia thi ��u!")
		-- return
	-- end	
	
	-------------
	-- if jybh_check_skill_level() ~= 1 then
		-- Talk(1,"","<color=green>Long H� S�<color>: C�c h� ch�a �� c�c �i�u ki�n c�n thi�t �� tham gia gi�i ��u Bang H�i Tinh Anh");
		-- return
	-- end	
	-------------
	
	--Check ��ng k� v� s� l��ng �� ��ng k�
	LIB_txtData:Init("20191120BaoDanhBHTA22a2.txt")
	LIB_txtData:LoadMultiColumn()
	local nMember = 0
	local nRegCheck = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		nMember = nMember + 1
		if LIB_txtData.tbTextData[i][1] == GetAccount() then
			nRegCheck = 1
		end
	end
	if nRegCheck == 1 then
		Talk(1,"",szNPCName.."C�c h� �� c� t�n trong danh s�ch thi ��u, kh�ng c�n ��ng k� n�a nh�.")
		return 0
	end
	if nMember >= 42 then
		Talk(1,"",szNPCName.."Ta �� c� trong tay danh s�ch 42 ng��i tham d�, r�t ti�c c�c h� �� ��n tr�...")
		return 0
	end
	
	--Check S� l��ng h� ph�i �� ��ng k�
	local nHePhai = GetPlayerRoute()
	LIB_txtData:Init("20191120CheckRouteBHTAa2.txt")
	LIB_txtData:LoadData()
	local nRouteCount = LIB_txtData.tbTextData[tonumber(nHePhai )]
	if nRouteCount >= 5 then
		Talk(1, "", szNPCName.."�� �� 5 cao th� thu�c h� ph�i nh� c�c h�, kh�ng th� ��ng k� th�m!");
		return 0
	end
	
	--Check ��ng k� d�nh cho Nguy�n So�i
	local nTeamSize = GetTeamSize()
	local nCountNguyenSoai = 0
	LIB_txtData:Init("20191120BaoDanhBHTA22a2.txt")
	LIB_txtData:LoadMultiColumn()
	if nChoice == 2 then
----		Check so luong Nguyen Soai �� ��ng k�
		for i = 1, getn(LIB_txtData.tbTextData) do
			if LIB_txtData.tbTextData[i][8] == "NguyenSoai" then
				nCountNguyenSoai = nCountNguyenSoai + 1
			end
		end
		
		if nCountNguyenSoai >= 2 then
			Talk(1,"",szNPCName.."Bang h�i c�c h� �� ��ng k� �� 2 Nguy�n So�i.")
			return 0
		end
		
----		Check t� ��i v�i bang ch� khi ��ng k�
		if nTeamSize > 3 then
			Talk(1,"",szNPCName.."T� ��i ch� ���c t�i �a 3 ng��i v�i t�i �a 2 ng��i s� h�u trang b� Nguy�n So�i")
			return 0
		else
			if IsTongMaster() == 0 then
				local nOldIndex = PlayerIndex
				local nTongMaster = 0
				for i = 1, nTeamSize do
					PlayerIndex = GetTeamMember(i)
					if IsTongMaster() == 1 then
						nTongMaster = 1
						break
					end
				end
				PlayerIndex = nOldIndex
				
				if nTongMaster == 0 then
					Talk(1,"",szNPCName.."C�c h� c�n t� ��i v�i bang ch�")
					return 0
				end		
			end
		end
	end	
	
	----------------------------------
	if DelItem(2,0,30000,1) == 1 then
		gf_SetTaskByte(TASK_BHTA6, 3, 1) -- Set �� ��ng k�
		LIB_txtData:Init("20191120CheckRouteBHTAa2.txt")
		LIB_txtData:LoadData()
		LIB_txtData:AddValue(tonumber(nHePhai),1) -- Write log s� l��ng c�c h� ph�i
		
		LIB_txtData:Init("20191120BaoDanhBHTA22a2.txt")
		LIB_txtData:LoadMultiColumn()
		
		local szData
		if nChoice == 1 then
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."Thuong"
		else
			szData = GetTongName().."	".. GetAccount() .. "	" .. GetName() .. "	" .. GetPlayerRoute() .. "	" ..GetLevel().."	"..gf_GetPlayerRebornCount().."	".. szPhe .. "	".."NguyenSoai"
		end
		
		LIB_txtData:AddLine(szData)
		local nRet, nItem = gf_AddItemEx({2,0,30001,1,1},"V� l�m th�p nh� s�");
		gf_SetItemExpireTime(nItem, 2019,12,31,24);		
		gf_WriteLogEx("BHTA21","nhan",1,"VolamThapNhiSu")
		Talk(1, "", szNPCName.."Ch�c m�ng ��i hi�p �� b�o danh Bang H�i Tinh Anh th�nh c�ng. H�y c� g�ng l�n nh�!");
		Msg2Global("Ch�c m�ng ��i hi�p "..GetName().." �� b�o danh Bang H�i Tinh Anh th�nh c�ng.")
		AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh <color> th�nh c�ng.")
	end
end