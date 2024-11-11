Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\online_activites\\activity_head.lua")


TUI_HAT_GIONG_NopCount = 6

function main()
	local nDate =  tonumber(date("%y%m%d%H"))
--	if nDate < 120312 or nDate > 120408 then
--		Talk(1, "", "�� h�t h�n t�ng qu� cho ch� em Ph� N�!")
--		return
--	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ho�t ��ng n�p t�i h�t gi�ng:"
	local tbSayDialog = {};
	local nSaySize = 0;
--	tinsert(tbSayDialog, "Ta mu�n nh�n th��ng tr�ng c�y (ti�u hao 1 t�i h�t gi�ng + 20 l� th�y)/nop_hatgiong")
	-- if (nDate >= 12082010 or GetAccount() == "pemiliem") and nDate < 12083100 then
		-- tinsert(tbSayDialog, "Ta ��n b�nh ch�n giai nh�n/VoteMynu_Form")
	-- end
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
	
end

function nop_hatgiong()
	do return 0 end
	
	local nLevel = GetLevel();
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","Nh�n v�t c�p <color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c <color=green>1<color> k� n�ng c�p <color=green>55<color> m�i c� th� tham gia");
		return 0;
	end

	VietResetDate() -- reset gi� tr� m�i ng�y
	if mod(GetTask(TSK_COUNT_EVERYDAY),100) >= TUI_HAT_GIONG_NopCount then
		Talk(1,"",format("M�i ng�y gi�i h�n n�p <color=green>%d<color> l�n T�i H�t Gi�ng",TUI_HAT_GIONG_NopCount));
		return 0;
	end
	if GetItemCount(2,1,30087) < 1 then 
		Talk(1,"","��i hi�p kh�ng c� T�i H�t Gi�ng �� ��i th��ng !!!")
		return 0;
	end
	if GetItemCount(2,0,351) < 20 then 
		Talk(1,"","��i hi�p kh�ng c� �� 20 L� Th�y �� ��i th��ng !!!")
		return 0;
	end
	if DelItem(2,1,30087,1) == 1 and DelItem(2,0,351,20) == 1 then
		SetTask(TSK_COUNT_EVERYDAY, GetTask(TSK_COUNT_EVERYDAY)+1);
		ModifyExp(6600000)
 		gf_WriteLogEx("NOP TUI HAT GIONG", "n�p th�nh c�ng", 1, "N�p t�i h�t gi�ng")
	end	
end

-- Binh chon My nu
function VoteMynu_Form()
local nDate =  tonumber(date("%y%m%d"))
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>C�c h� h�y b�nh ch�n cho giai nh�n m�nh y�u th�ch nh�."
	local tbDanhSachMyNu = {
			[1] = {"Nguy�n Th� Qu�nh Anh",7},
			[2] = {"L� Ng�c Huy�n Tr�m",2},
			[3] = {"L� Ph��ng Th�y",5},
			[4] = {"Tr�n Th� Huy�n Trang",1},
			[5] = {"Nguy�n Mai Chinh",3},
			[6] = {"��m Th� H� Trang",6},
			[7] = {"B�i Th�ch Nh� �",9},	
			[8] = {"Nguy�n Th� Kim Nguy�n",4},
			[9] = {"Tr�nh Th� Ph��ng Oanh",8},
		}
	LIB_txtData:Init("hotgirl.txt")
	LIB_txtData:LoadData()
	
	local tbSayDialog = {};
	for i=getn(tbDanhSachMyNu),1,-1 do
		local nVoteListID = tbDanhSachMyNu[i][2]
		tinsert(tbSayDialog,1,"Ta mu�n b�nh ch�n cho M� n� " .. tbDanhSachMyNu[i][1] .. " (" ..LIB_txtData.tbTextData[nVoteListID]  .. " l�n ch�n)/#VoteMynu(" .. nVoteListID .. ")")
	end
	tinsert(tbSayDialog, "Ta ch� gh� ngang/do_nothing")
	Say(szHeader, getn(tbSayDialog), tbSayDialog)	
end


function VoteMynu(nID)
	if GetAccount() == "pg1team002" or GetAccount() == "pg1team007" then
		LIB_txtData:Init("hotgirl.txt")
		LIB_txtData:AddValue(nID,1)
		VoteMynu_Form()
	else
		if gf_Judge_Room_Weight(2, 500,"") == 0 then
			Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�");
			return 0
		end
		local nTraicay = 0
		for i=30164, 30183 do
			if GetItemCount(2,1,i) >= 10 then
				nTraicay = i
				break
			end
		end
		if nTraicay == 0 then
			Talk(1,"","C�c h� kh�ng �em �� tr�i c�y, h�y chu�n b� ��y �� r�i ��n g�p ta nh�!")
			return 0
		end
		if DelItem(2,1,nTraicay,10) == 1 then
			LIB_txtData:Init("hotgirl.txt")
			LIB_txtData:AddValue(nID,1)
			TraoThuongVoteMyNu()
			VoteMynu_Form()
		end
	end
end

function TraoThuongVoteMyNu()
	local tbAward1 = {item = {{gdp={2,1,30367,1}, name="T�i ti�n"}}}
	local tbAward2 = {item = {{gdp={2,1,30367,2}, name="T�i ti�n"}}}
	local tbAward3 = { item = {{gdp={2,1,30367,3}, name="T�i ti�n"}}}
	local tbAward4 = {item = {{gdp={2,1,30367,4}, name="T�i ti�n"}}}
	local tbAward5 = {item = {{gdp={2,1,30367,5}, name="T�i ti�n"}}}
	local tbAward6 = {item = {{gdp={2,0,504,1}, name="C�y B�t Nh� nh�", nExpired = 7*24*60*60}}}
	local tbAward7 = {item = {{gdp={2,0,398,1}, name="C�y B�t Nh� l�n", nExpired = 7*24*60*60}}}
	local tbAward8 = {item = {{gdp={2,1,30269,1}, name="C�y T� Linh", nExpired = 7*24*60*60}}}
	local tbAward9 = {item = {{gdp={1,0,6,1}, name="H�c Ng�c �o�n T�c Cao"}}}
	local tbAward10 = {item = {{gdp={2,1,3356,1}, name="T�i Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*60*60}}}
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*60*60}}}
	local tbAward12 = {item = {{gdp={2,1,30406,1}, name="Thi�n Huy�n Kh�c B�n c�p 1"}}}
	local tbAward13 = {item = {{gdp={2,1,30407,1}, name="Thi�n Huy�n Kh�c B�n c�p 2"}}}
	local tbAward14 = {item = {{gdp={2,1,30408,1}, name="Thi�n Huy�n Kh�c B�n c�p 3"}}}
	local tbAward15 = {item = {{gdp={2,1,30346,1}, name="M�nh B�ch Kim"}}}
	local tbAward16 = {item = {{gdp={2,95,204,1}, name="Thi�n Cang L�nh"}}}
	local tbAward17 = {item = {{gdp={2,1,1068,1}, name="Thi�n Thi�n Th�ch Linh Th�ch", nExpired = 7*24*60*60}}}
	local tbAward18 = {item = {{gdp={2,1,1067,1}, name="��nh H�n Thi�n Thi�n Th�ch Th�n Th�ch", nExpired = 7*24*60*60}}}
	local tbAward19 = {item = {{gdp={2,1,1113,1}, name="��i ��nh H�n", nExpired = 7*24*60*60}}}
	local tbAwardExp = {nExp = 250000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 45.730},
		[2] = {[1] = tbAward2, nRate = 11.433},
		[3] = {[1] = tbAward3, nRate = 3.000},
		[4] = {[1] = tbAward4, nRate = 2.000},
		[5] = {[1] = tbAward5, nRate = 1.000},
		[6] = {[1] = tbAward6, nRate = 1.000},
		[7] = {[1] = tbAward7, nRate = 1.000},
		[8] = {[1] = tbAward8, nRate = 1.000},
		[9] = {[1] = tbAward9, nRate = 30.000},
		[10] = {[1] = tbAward10, nRate = 0.500},
		[11] = {[1] = tbAward11, nRate = 0.001},
		[12] = {[1] = tbAward12, nRate = 3.000},
		[13] = {[1] = tbAward13, nRate = 0.330},
		[14] = {[1] = tbAward14, nRate = 0.001},
		[15] = {[1] = tbAward15, nRate = 0.001},
		[16] = {[1] = tbAward16, nRate = 0.001},
		[17] = {[1] = tbAward17, nRate = 0.001},
		[18] = {[1] = tbAward18, nRate = 0.001},
		[19] = {[1] = tbAward19, nRate = 0.001},
	}
	LIB_Award.szLogTitle = "BINH CHON GIAI NHAN"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAwardExp)
	LIB_Award:AwardByRate(tbAwardSet)
end

tbMatTichCaoCap = {
	[2] = {0, 107, 30001, "Kim Cang B�t Nh� Ch�n Quy�n (Cao c�p)", 2},
	[3] = {0, 107, 30003, "V� Tr�n B� �� Ch�n Quy�n (Cao c�p)", 3},
	[4] = {0, 107, 30002, "Ti�m Long T�c Di�t Ch�n Quy�n (Cao c�p)", 4},
	[6] = {0, 107, 30004, "Thi�n La Li�n Ch�u Ch�n Quy�n (Cao c�p)", 6},
	[8] = {0, 107, 30005, "Nh� � Kim ��nh Ch�n Quy�n (Cao c�p)", 8},
	[9] = {0, 107, 30006, "B�ch H�i Tuy�t �m Ch�n Quy�n (Cao c�p)", 9},
	[11] = {0, 107, 30007, "H�n ��n Tr�n Nh�c Ch�n Quy�n (Cao c�p)", 11},
	[12] = {0, 107, 30008, "Qu� Thi�n Du Long Ch�n Quy�n (Cao c�p)", 12},
	[14] = {0, 107, 30009, "Huy�n �nh M� T�ng Ch�n Quy�n (Cao c�p)", 14},
	[15] = {0, 107, 30010, "Qu�n T� ��i Phong Ch�n Quy�n (Cao c�p)", 15},
	[17] = {0, 107, 30011, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n (Cao c�p)", 17},
	[18] = {0, 107, 30012, "Xuy�n V�n L�c H�ng Ch�n Quy�n (Cao c�p)", 18},
	[20] = {0, 107, 30013, "Huy�n Minh Phong Ma Ch�n Quy�n (Cao c�p)", 20},
	[21] = {0, 107, 30014, "Linh C� Huy�n T� Ch�n Quy�n (Cao c�p)", 21},
	[23] = {0, 107, 30015, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)", 23},
	[25] = {0, 107, 30035, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)", 25},
	[26] = {0, 107, 30036, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)", 26},
	[27] = {0, 107, 30037, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)", 27},
	[29] = {0, 107, 30016, "H�ng Tr�n T�y M�ng Ch�n Quy�n (Cao c�p)", 29},
	[30] = {0, 107, 30017, "Phong Hoa Thi�n Di�p Ch�n Quy�n (Cao c�p)", 30},	
	[31] = {0, 107, 30041, "M� Tung Ch�n Quy�n (Cao c�p)", 31},
	[32] = {0, 107, 30043, "Thi�n Phong Ch�n Quy�n (Cao c�p)", 32},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	local nRoute = GetPlayerRoute()
    if param ~= 1 then
        return 0;
    end
	if gf_Judge_Room_Weight(2, 100,"") == 0 then
			Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�");
			return 0
		end    
    if genre ~= 0 or detail ~= 107 or particular < 30001 or particular > 300017 then
        Talk(1, "", "Ch� c� th� b� v�o m�t t�ch cao c�p");
        return 0;
    end
    if particular ~= tbMatTichCaoCap[nRoute][3] then
    	Talk(1, "", "Ch� c� th� b� v�o m�t t�ch c�ng h� ph�i");
        return 0;
    end 
    if GetItemSpecialAttr(idx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m n�y l� v�t ph�m kh�a, kh�ng th� th�c hi�n ��i ���c!");
		return 0;
	end
    return 1;
end
function GetMatTichCaoCap20(nQty,nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[26] = {0,107,220,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[27] = {0,107,221,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"M� Tung Ch�n Quy�n"},
		[32] = {0,107,235,2,"Thi�n Phong Ch�n Quy�n"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end
function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
        return 0;
    end
    local t = GetPutinItem()
    if getn(t) ~= 3 then		-- ������
    	Talk(1, "", "S� l��ng m�t t�ch kh�ng ��ng")
        return 0;
    end
    if GetItemCount(2,1,1005) < 3 then
        Talk(1, "", "��i hi�p kh�ng mang �� 3 Chi�n Th�n Ho�n");
        return 0;
    end
    local nResult = 1;
	local nResult1 = 1;
	local nRoute = GetPlayerRoute()
	if DelItem(2,1,1005,3) ~= 1 then
	    nResult = 0;
	end
	for i = 1, getn(t) do
		if DelItemByIndex(t[i][1], -1) ~= 1 then
		    nResult1 = 0;
		end
    end
    if nResult == 1 and nResult1 == 1 then
    	gf_WriteLogEx("DOI MAT TICH 20%", "ho�n th�nh", 1, "��i th�nh c�ng 1 m�t t�ch h� ph�i"..nRoute)
        GetMatTichCaoCap20(1,nRoute)
    end
end
