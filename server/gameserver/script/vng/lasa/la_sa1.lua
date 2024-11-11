Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\online_activites\\activity_head.lua")

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
--    if particular ~= tbMatTichCaoCap[nRoute][3] then
--   	Talk(1, "", "Ch� c� th� b� v�o m�t t�ch c�ng h� ph�i");
--        return 0;
--   end 
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
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
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
    if getn(t) ~= 5 then		-- ������
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
