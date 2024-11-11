Include("\\script\\vng\\book15\\book15_define.lua");
Import("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 


szNpcName = "<color=green>V� L�m Truy�n K� 15: <color>"
function OnUse()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	local nDate = tonumber(date("%y%m%d"))
	local tbSayDialog = {};
	local nSaySize = 0;
	local nAccept_Mission = checkStatus_book15()
	local szSayHead = szNpcName.."Ta chuy�n ph� tr�ch nhi�m v� M�t �� Th�n B�, ch��ng tr�nh di�n ra t� ng�y 01-07-2020 ��n 07-10-2020.\n"
	if nFlag_Book15 == 0 then
		return 0
	end
	if nAccept_Mission == 0 then
		szSayHead = szSayHead.."<color=yellow>M�t t�i kho�n ch� c� m�t nh�n v�t (t�t c� server) c� th� tham gia nh�n Nhi�m v� M�t �� Th�n B�. B�n h�y suy ngh� c�n th�n: <color>"
		
		tinsert(tbSayDialog,"��ng � nh�n nhi�m v� M�t �� Th�n B�/get_mission")
	end
	if nAccept_Mission == 1 then
		local nCur_Lev_ByTsk = getLevelBook_book15()
		local nCur_Point = getPointBook_book15()
		local nCheckin = VNG_GetTaskPos(TSK_Book_CountMissDaily_1, 1, 1) --check �� checkin 1 l�n trong ng�y
--		local nUp_Next_Lev = nCur_Lev_ByTsk + 1
--		local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
		szSayHead =	szSayHead.." - C�p M�t �� Th�n B� hi�n t�i l�: <color=yellow>"..nCur_Lev_ByTsk.." / 200<color>\n"
		szSayHead =	szSayHead.." - S� �i�m kinh nghi�m M�t �� Th�n B� hi�n c� l�: <color=yellow>"..nCur_Point.."<color>\n"
--		szSayHead =	szSayHead.." - T�ng M�t �� Th�n B� l�n c�p <color=red>"..nUp_Next_Lev.."<color> c�n <color=red>"..nUp_Next_Point.."<color> �i�m kinh nghi�m M�t �� Th�n B�."
	
--	tinsert(tbSayDialog,"Test - Set �i�m nhi�m v�/test_test")
--	tinsert(tbSayDialog,"Test - View th�ng tin/show_regis")
		if nDate >= 200701 and nDate <= 201007 then
			if nCheckin < 1 then
				tinsert(tbSayDialog,"�i�m danh m�i ng�y/book15_DailyCheckin")
			end
			tinsert(tbSayDialog,"T�ng c�p M�t �� Th�n B�/book15_UpLevelSach")
			tinsert(tbSayDialog,"Xem t�nh h�nh nhi�m v� h�ng ng�y/book15_DailyMissionView")
		end
		if nDate >= 200701 and nDate <= 201021 then
			tinsert(tbSayDialog,"Nh�n th��ng theo c�p M�t �� Th�n B�/book15_GetAward")		
			tinsert(tbSayDialog,"Nh�n th��ng quay s� may m�n/book15_Lucky_GetAward")
		end
	end
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function dialog_over()
	return 0
end

function book15_UpLevelSach()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Point = getPointBook_book15()	
	if nCur_Lev_ByTsk >= nMax_Book15 then
		Talk(1, "", szNpcName.."C�p M�t �� Th�n B� c�a b�n �� ��t t�i �a. B�n h�y �i nh�n th��ng �i.")
		return 0
	end
	local nUp_Next_Lev = nCur_Lev_ByTsk + 1
	local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
	local szSayHead = szNpcName.."Ta chuy�n ph� tr�ch nhi�m v� v� M�t �� Th�n B�.\n"
	szSayHead =	szSayHead.." - C�p M�t �� Th�n B� hi�n t�i l�: <color=yellow>"..nCur_Lev_ByTsk.." / 200<color>\n"
	szSayHead =	szSayHead.." - S� �i�m kinh nghi�m M�t �� Th�n B� hi�n c� l�: <color=yellow>"..nCur_Point.."<color>\n"
	szSayHead =	szSayHead.." - T�ng M�t �� Th�n B� l�n c�p <color=red>"..nUp_Next_Lev.."<color> c�n <color=red>"..nUp_Next_Point.."<color> �i�m kinh nghi�m M�t �� Th�n B�."
	
	tinsert(tbSayDialog,"��ng � t�ng c�p M�t �� Th�n B�/confirm_book15_UpLevelSach")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_UpLevelSach()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Point = getPointBook_book15()
	local nUp_Next_Lev = nCur_Lev_ByTsk + 1
	
	if nUp_Next_Lev > nMax_Book15 then
		Talk(1, "", szNpcName.."C�p M�t �� Th�n B� c�a b�n �� ��t t�i �a. B�n h�y �i nh�n th��ng �i.")
		return 0
	end
	local nUp_Next_Point = tbBookLev[nUp_Next_Lev][1]
	local nNew_Point = nCur_Point - nUp_Next_Point
	local sAcc = GetAccount()
	local sRole = GetName()
	local sDate = date("%Y-%m-%d")
	local sTime = date("%H:%M:%S")
	local nCheck_Is_Exist = 0 -- 0: ch�a c� -- 1: �� c�
	if nCur_Point < nUp_Next_Point then
		Talk(1, "", szNpcName.."B�n kh�ng �� �i�m kinh nghi�m M�t �� Th�n B� �� t�ng c�p cho M�t �� Th�n B�.")
		return 0
	end
	
	if nNew_Point >= 0 then
		VNG_SetTaskPos(TSK_Book_Lev_Award, nCur_Lev_ByTsk + 1, 4, 2) --up level M�t �� Th�n B� +1 tr�n task
		SetTask(TSK_Book_CountPoint, nNew_Point)		--set �i�m t�ng sau khi tr� �i�m �� up level M�t �� Th�n B�
		
		nCur_Lev_ByTsk = getLevelBook_book15()
		----------
		--ghi file txt
			--update level cho acc � linux �� ��ng k� nhi�m v�
		LIB_txtData_book15:Init("book15_level.txt")
		LIB_txtData_book15:LoadMultiColumn()
		for i=1, getn(LIB_txtData_book15.tbTextData) do
			if sAcc == LIB_txtData_book15.tbTextData[i][1] then
				local nCurLev_inFile = LIB_txtData_book15.tbTextData[i][3]
				if tonumber(nCurLev_inFile) >= nCur_Lev_ByTsk then
					Talk(1, "", "L�i kh�ng ��ng b�")
					return 0
				end
			
				LIB_txtData_book15.tbTextData[i][3] = nCur_Lev_ByTsk
				LIB_txtData_book15.tbTextData[i][4] = sDate
				LIB_txtData_book15.tbTextData[i][5] = sTime
				nCheck_Is_Exist = 1
			end
		end
		LIB_txtData_book15:SaveMultiColumn()
			--update level cho acc kh�c linux �� ��ng k� nhi�m v�
		if nCheck_Is_Exist == 0 then
			local szData = sAcc.."	".. sRole .. "	" .. nCur_Lev_ByTsk .. "	" .. sDate .. "	" .. sTime
			LIB_txtData_book15:Init("book15_level.txt")
			LIB_txtData_book15:AddLine(szData)
		end
		----------
		nCur_Point = getPointBook_book15()
		Msg2Player("C�p M�t �� Th�n B� hi�n t�i c�a b�n l�: "..nCur_Lev_ByTsk)
		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Level M�t �� Th�n B�: "..nCur_Lev_ByTsk) 
		gf_WriteLogEx(szLogTitle_bk, szLogAction, 1, "Level M�t �� Th�n B�: "..nCur_Lev_ByTsk)		--l�u log bk 
		gf_WriteLogEx(szLogTitle_bk, szLogAction, 1, "Kinh nghi�m hi�n t�i: "..nCur_Point)		
	end
	book15_UpLevelSach()
end
function get_mission() --nh�n M�t �� Th�n B� l�n ��u
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nRoute = gf_CheckPlayerRoute()
	local nChuyenPhucSinh = gf_GetTransLevel()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."��i hi�p ch�a gia nh�p m�n ph�i n�o, n�n kh�ng th� nh�n nhi�m v� ���c.")
		return 0
	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1, "", szNpcName.."��i hi�p ch�a h�c ��y �� v� c�ng c�p 55, n�n kh�ng th� nh�n nhi�m v� ���c.");
--		return 0
--	end	
	if nChuyenPhucSinh < 690 then
		Talk(1, "", szNpcName.."��i hi�p ch�a �� chuy�n sinh 6 c�p 90, n�n kh�ng th� nh�n nhi�m v� ���c.");
		return 0
	end
	local sAcc = GetAccount()
	local sRole = GetName()
	local nFirst_Level = 0
	local sDate = date("%Y-%m-%d")
	local sTime = date("%H:%M:%S")
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission >= 1 then
		Talk(1, "", szNpcName.."Nh�n nhi�m v� r�i.")
		return 0
	end
	if nAccept_Mission == 0 then
		Talk(1, "", szNpcName.."B�n nh�n nhi�m v� M�t �� Th�n B� th�nh c�ng.")
--		PayExtPoint(EXT_BOOK15, GetExtPoint(EXT_BOOK15))
--		AddExtPoint(EXT_BOOK15, 1)	--set ExtPoint nh�n nhi�m v�
		VNG_SetExtBit(EXT_BOOK15, 1, 1)				--set ExtPoint nh�n nhi�m v�
		VNG_SetTaskPos(TSK_Book_Lev_Award, 1, 1, 1)	--set Task Nh�n nhi�m v�
		
		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Nh�n M�t �� Th�n B� th�nh c�ng")
		--ghi file txt
		local szData = sAcc.."	".. sRole .. "	" .. nFirst_Level .. "	" .. sDate .. "	" .. sTime
		LIB_txtData_book15:Init("book15_level.txt")
		LIB_txtData_book15:AddLine(szData)
	end
end
--chi ti�t nhi�m v� h�ng ng�y
function book15_DailyMissionView()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission < 1 then
		Talk(1, "", szNpcName.."B�n ch�a nh�n nhi�m v� M�t �� Th�n B�.")
		return 0
	end
	local szMsg = szNpcName .."Chi ti�t ho�n th�nh nhi�m v� m�i ng�y :\n"
	for i=1, getn(tbbook15_DailyConfig) do
		local nCount = VNG_GetTaskPos(tbbook15_DailyConfig[i][1],tbbook15_DailyConfig[i][4],tbbook15_DailyConfig[i][5])
		local nColor = "red"
		if nCount == tbbook15_DailyConfig[i][3] then
			nColor = "yellow"
		end
		szMsg = szMsg .. tbbook15_DailyConfig[i][2]..": ���c <color="..nColor..">".. VNG_GetTaskPos(tbbook15_DailyConfig[i][1],tbbook15_DailyConfig[i][4],tbbook15_DailyConfig[i][5]) .."<color> / <color=yellow>"..tbbook15_DailyConfig[i][3].."<color> l�n.\n"
	end
	Talk(1,"",szMsg)
end
--�i�m danh m�i ng�y
function book15_DailyCheckin()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	book15_DailyMissionComplete(1)
end
--ho�n th�nh nhi�m v� ng�y
function book15_DailyMissionComplete(nMissionID)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201007 then		
		nFlag_Book15 = 0
	end
	if nFlag_Book15 == 0 then
			return 0
		end
	local nAccept_Mission = checkStatus_book15()
	if nAccept_Mission < 1 then
--		Talk(1, "", szNpcName.."B�n ch�a nh�n nhi�m v� k� ni�m V� L�m Truy�n K� 15.")
		return 0
	end
	local tbMission = tbbook15_DailyConfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	local nExp = tbMission[6]
	local szMsg = tbMission[3]
	local szNameMiss = tbMission[2]
	local nCurPoint = getPointBook_book15()
	if nQty < tbMission[3] then
		VNG_SetTaskPos(tbMission[1], nQty + 1, tbMission[4], tbMission[5])
--		Talk(1,"",szNpcName.."B�n ho�n th�nh 1 l�n nhi�m v� "..szNameMiss.." c�a M�t �� Th�n B�.")
--		SetTask(TSK_Book_CountPoint,nCurPoint + nExp)	--set �i�m nhi�m v� v�o M�t �� Th�n B�
--		gf_WriteLogEx(szLogTitle, szLogAction, 1, "Exp M�t �� Th�n B�: "..nExp) 
--		Talk(1,"",szNpcName.."B�n nh�n ���c "..nExp.." �i�m kinh nghi�m M�t �� Th�n B�.")
--		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m M�t �� Th�n B�.")
		nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
		if nQty == tbMission[3] then
			SetTask(TSK_Book_CountPoint,nCurPoint + nExp)	--set �i�m nhi�m v� v�o M�t �� Th�n B�
			gf_WriteLogEx(szLogTitle, szLogAction, 1, "Exp M�t �� Th�n B�: "..nExp) 
	--		Talk(1,"",szNpcName.."B�n nh�n ���c "..nExp.." �i�m kinh nghi�m M�t �� Th�n B�.")
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m M�t �� Th�n B�.")
			Talk(1,"",szNpcName.."H�m nay b�n �� ho�n th�nh nhi�m v� "..szNameMiss.." h�ng ng�y. B�n nh�n ���c "..nExp.." �i�m kinh nghi�m M�t �� Th�n B�.")
			return 0
		end
	end
	
end

function book15_GetAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Ta chuy�n ph� tr�ch nhi�m v� M�t �� Th�n B�.\n"
	local nCur_Award_ByTsk = getAward_book15()
	local nCur_Lev_ByTsk = getLevelBook_book15()
	
	for i=1, getn(tbbook15_Award) do
		if nCur_Lev_ByTsk < i then
			break
		end
		if tbbook15_Award[i][1] == 1 and nCur_Award_ByTsk < i then
			tinsert(tbSayDialog, "Nh�n th��ng M�t �� Th�n B� c�p  "..i.."/#confirm_book15_GetAward("..i..")")		
		end
	end
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_GetAward(nType)
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return 0
	end
	local nCur_Lev_ByTsk = getLevelBook_book15()
	local nCur_Award_ByTsk = getAward_book15()
	if nCur_Lev_ByTsk < nType then
		Talk(1,"", szNpcName.."C�p M�t �� Th�n B� c�a b�n ch�a ��t c�p "..nType.." �� nh�n th��ng. H�y c� g�ng l�n.")
		return 0
	end
	if nCur_Award_ByTsk >= nType then
		Talk(1,"", szNpcName.."B�n �� nh�n ph�n th��ng c�p "..nType.." r�i. H�y ch�n ph�n th��ng kh�c.")
		return 0
	end
	local ncountCheck = 1
	for i=1, nCur_Lev_ByTsk do
		if i >= 190 then
			break
		end
		if tbbook15_Award[nCur_Award_ByTsk+1][1] == 0 then
			if tbbook15_Award[nCur_Award_ByTsk+2][1] == 0 then
				ncountCheck = 3
				break
			end
			ncountCheck = 2
		end
	end
	if nCur_Award_ByTsk + ncountCheck < nType then
		Talk(1,"", szNpcName.."B�n ch�a nh�n ph�n th��ng c�a c�p M�t �� Th�n B� tr��c ��. H�y ch�n ph�n th��ng kh�c.")
		return 0
	end
	if tbbook15_Award[nType][1] ~= 1 then
		gf_WriteLogEx(szLogTitle, "Fail Award", 1, "L�i ph�n th��ng c�p : "..nType) 
		return 0
	end
	VNG_SetTaskPos(TSK_Book_Lev_Award, nType, 7, 5)
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = szLogActionAward..nType
	LIB_Award:Award(tbbook15_Award[nType][2])	
	
end
function book15_Lucky_GetAward()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 201021 then		
		return 0
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nCount_Award_Web = VNG_GetTaskPos(TSK_Book_Lev_Award, 9, 8)
	if nCount_Award_Web >= 35 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n th��ng qu� nhi�u r�i, n�n kh�ng th� nh�n nhi�m v� ���c.");
		return 0
	end	
	local nChuyenPhucSinh = gf_GetTransLevel()
	if nChuyenPhucSinh < 690 then
		Talk(1, "", szNpcName.."��i hi�p ch�a �� chuy�n sinh 6 c�p 90, n�n kh�ng th� nh�n nhi�m v� ���c.");
		return 0
	end	
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local nAccept_Mission = checkStatus_book15()
	local szSayHead = szNpcName.."Ta chuy�n ph� tr�ch nhi�m v� M�t �� Th�n B�.\n"
	if nFlag_Book15 == 0 then
		return 0
	end
	local nLuck2, nLuck3, nLuck4, nLuck5, nLuck6, nLuck7 = checkAward_Lucky()
	if nLuck2 == 0 and nLuck3 == 0 and nLuck4 == 0 and nLuck5 == 0 and nLuck6 == 0 and nLuck7 == 0 then
		Talk(1,"", szNpcName.."Hi�n t�i b�n kh�ng c� ph�n th��ng n�o �� nh�n.")
		return 0
	end
	if nLuck2 == 1 then
		tinsert(tbSayDialog,"Thanh Long: 1 t� �i�m kinh nghi�m/#confirm_book15_Lucky_GetAward(2)")
	end	
	if nLuck3 == 1 then	
		tinsert(tbSayDialog,"C�n Kh�n: 1 s�ch b�n ��ng h�nh c�p 6 ng�u nhi�n/#confirm_book15_Lucky_GetAward(3)")
	end	
	if nLuck4 == 1 then
		tinsert(tbSayDialog,"Thi�n ��a: 1 t�i �� qu� c�p 2/#confirm_book15_Lucky_GetAward(4)")
	end
	if nLuck5 == 1 then
		tinsert(tbSayDialog,"Huy�n V�: 1 t�i �� qu� c�p 3/#confirm_book15_Lucky_GetAward(5)")
	end
	if nLuck6 == 1 then
		tinsert(tbSayDialog,"Chu T��c: 20 m�nh kim x� 6 ng�u nhi�n/#confirm_book15_Lucky_GetAward(6)")		
	end	
	if nLuck7 == 1 then	
		tinsert(tbSayDialog,"B�ch H�: 1 l�nh b�i trang s�c h�o hi�p v� h�/#confirm_book15_Lucky_GetAward(7)")
	end
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_book15_Lucky_GetAward(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� tham gia !!!")
		return 0
	end
	if nFlag_Book15 == 0 then
		return 0
	end
	local nCount_Award_Web = VNG_GetTaskPos(TSK_Book_Lev_Award, 9, 8)
	if nCount_Award_Web >= 35 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n th��ng qu� nhi�u r�i, n�n kh�ng th� nh�n nhi�m v� ���c.");
		return 0
	end	
	if checkStatus_book15() < 1 then
		return 0
	end
	if gf_JudgeRoomWeight(5,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return 0
	end
	local nLuck_Type = checkAward_Lucky_by_Type(nType)
	if nLuck_Type ~= 1 then
		gf_WriteLogEx(szLogTitle, "Fail Award Lucky", 1, "L�i ph�n th��ng lucky : "..nType) 
		return 0
	end
	if tbbook15_LuckyAward[nType][1] == 0 then
		return 0
	end
	VNG_SetTaskPos(TSK_Book_Lev_Award, nCount_Award_Web + 1, 9, 8)
	VNG_SetExtBit(EXT_BOOK15, nType, 0)
	
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = szLogActionAwardWeb..tbbook15_LuckyAward[nType][2]
	LIB_Award:Award(tbbook15_LuckyAward[nType][3])	
end
-----------------
function show_regis()
	do return 0 end
	LIB_txtData_book15:Init("book15_level.txt")
	LIB_txtData_book15:LoadMultiColumn()
	local szList = "\n"
	for i=1, getn(LIB_txtData_book15.tbTextData) do
			szList = szList .. LIB_txtData_book15.tbTextData[i][1] .. ": "..LIB_txtData_book15.tbTextData[i][3] .. "\n "
	end
	Talk(1,"", szNpcName.."�� ��ng k� g�m: "..szList)

end
function test_test()
	do return 0 end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Ta chuy�n ph� tr�ch nhi�m v� M�t �� Th�n B�.\n"
	
	for i=1, getn(tbbook15_DailyConfig) do
		tinsert(tbSayDialog, "- "..tbbook15_DailyConfig[i][2].."/#set_taskhoanthanh("..i..")")
	end
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function set_taskhoanthanh(nType)
	book15_DailyMissionComplete(nType)
--	VNG_SetTaskPos(tbbook15_DailyConfig[nType][1], tbbook15_DailyConfig[nType][3], tbbook15_DailyConfig[nType][4], tbbook15_DailyConfig[nType][5])
end
