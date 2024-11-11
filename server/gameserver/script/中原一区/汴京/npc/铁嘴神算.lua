
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\top_server\\npc_top.lua");

szNpcName =  "<color=green>Th�y B�i<color>: "
function main()	

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}	
	
	if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
		if nDate >= 20141206 and nDate <= 20141207 then
			tinsert(tbSay, "Th�nh vi�n nh�n th��ng bang h�i h�ng 1,2,3/TopBangHoi_NhanThuong_ThanhVien")
			tinsert(tbSay,"R�i kh�i/gf_DoNothing")
			Say(szNpcName.."H� tr� nh�n th��ng �ua top bang h�i \n", getn(tbSay), tbSay)
		end
		
		if nDate > 20141207 then
			if (nState==11) then
				task_011();
				return
			else
				Talk(1,"","Gi�p th�n m�ng 5 th�ng 1, kinh tr�p, tr�i l�nh, c� ng��i d��i qu� l�n, th�ch h�p c��i h�i, k� th� m�c, h��ng ��ng nam t�t!");
			end	
		end
	else		
		if (nState==11) then
			task_011();
			return
		else
			Talk(1,"","Gi�p th�n m�ng 5 th�ng 1, kinh tr�p, tr�i l�nh, c� ng��i d��i qu� l�n, th�ch h�p c��i h�i, k� th� m�c, h��ng ��ng nam t�t!");
		end		
	end	
end;

function TopBangHoi_NhanThuong_ThanhVien()
	local tbNhanThuong = {
		"5��cxxLoveCu�ng",	
		"oLove��S�tVNGo",	
		"S�cL�L�nDame",	
		"StzHonDaCiVic",	
		"ZzCoiSieuNhanzZ",	
		"s2B�mC�i",	
		"oS2oM�aC�t9x",	
		"Ti�nLongH�aPh�ng",	
		"Ti�nLongH�aPh�ng",	
		"CXaVoTinhxxx",	
		"Kh�ngBi�t��tT�n",	
		"JaVoAnhTh�i�nZ",	
		"VoDang1102",	
		"LinhSika",	
		"CloudofTsu",	
		"ZzCoiSieuNhanzZ",	
		"GiangHoLangTu",	
		"s2B�mC�i",	
		"StzHonDaCiVic",	
		"B�ngV�T�nh",	
		"zzChuBizz",	
		"NSMxYeuStingRuaZ",	
		"zTuoiDayThio",	
		"Zz�ngTr�u",	
		"zHiImGosu",	
		"GietNguoiKia",	
		"izC�iDJxT�c��S2i",	
		"Thi�nS�n��ngL�o",	
	}
	
	local bFound = 0
	for i = 1, getn(tbNhanThuong) do		
		if tbNhanThuong[i] == GetName() then	
			bFound = 1
			break
		end	
	end
	
	if bFound == 0 then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� t�n trong danh s�ch nh�n th��ng!")
		return
	end
	
	if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng, kh�ng th� nh�n th�m l�n n�a.")
		return 0
	end
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� 90, kh�ng th� nh�n th��ng!")
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	
	local tbAward1 = {
		item = {
			{gdp={2,1,30499,10}}, -- Hu�n ch��ng anh h�ng
			{gdp={2,1,30535,20,4}}, -- Thi�t tinh c�p 3
			{gdp={2,1,1008,4,4}, nExpired=7*24*3600}, -- B�ch C�u Ti�n ��n
			{gdp={0,105,30027,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H�c H�
		},
		nExp = 200000000,
	}
	
	LIB_Award:Award(tbAward1)
	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	Talk(1,"",szNpcName.."Nh�n th�nh c�ng ph�n t��ng d�nh cho th�nh vi�n bang h�i!")
	gf_WriteLogEx("NHAN THUONG DUA TOP", "Nh�n", 1, "Ph�n th��ng th�nh vi�n bang h�i")
end