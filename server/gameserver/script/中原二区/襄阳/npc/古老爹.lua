Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>C� L�o T�<color>: "

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Th�ng tin chi ti�t ho�t ��ng <color=yello>\"Sinh T� V� Ng� 3\"<color>, ��ng ��o c� th� xem th�m t�i trang ch�."
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20151003 then	
		local nTypeMission = VNG_GetTaskPos(TSK_SINHTULAN3A092015,1,1) 
		if GetTask(TSK_SINHTULAN3A092015) == 0 then	
			tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 3 t� Chuy�n Sinh 5 c�p 99 (t�n 5 ��i ng�n phi�u + 500 v�ng)/#STVN3_NhanNhiemVu(1)")
			tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 3 t� Ph�c Sinh 1 c�p 96 (t�n 5 ho�ng kim ��i ng�n phi�u + 5000 v�ng)/#STVN3_NhanNhiemVu(2)")
			tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 3 t� Ph�c Sinh 1 c�p 97 (t�n 3 ho�ng kim ��i ng�n phi�u + 3000 v�ng)/#STVN3_NhanNhiemVu(3)")
			tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 3 t� Ph�c Sinh 1 c�p 98 (t�n 2 ho�ng kim ��i ng�n phi�u + 1500 v�ng)/#STVN3_NhanNhiemVu(4)")
			tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 3 t� Ph�c Sinh 1 c�p 99 (t�n 1 ��i ng�n phi�u + 500 v�ng)/#STVN3_NhanNhiemVu(5)")
		end		
		if nTypeMission > 1 and nTypeMission <= 5 then
			local nCheck1 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,3,3) 
			local nCheck2 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,4,4) 
			local nCheck3 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,5,5) 
			local nCheck4 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,6,6) 
			if nCheck1 < 1 then
				tinsert(tbSayDialog,"N�p th�m 1 C�u Thi�n V� C�c ��n/#STVN_submit_nguyenlieu(1)")
			end
			if nCheck2 < 1 then
				tinsert(tbSayDialog,"N�p th�m 20000 B�t M�/#STVN_submit_nguyenlieu(2)")
			end
			if nCheck3 < 1 then
				tinsert(tbSayDialog,"N�p th�m 20000 Nh�n B�nh/#STVN_submit_nguyenlieu(3)")
			end
			if nCheck4 < 1 then
				tinsert(tbSayDialog,"N�p th�m 10000 Nh�n B�nh ��c Bi�t/#STVN_submit_nguyenlieu(4)")
			end
		end
		local nCheckStatus = CheckStatus_SinhTu3()
		if nCheckStatus < 2 then		
			tinsert(tbSayDialog,"Ti�n �� ho�n th�nh nhi�m v�/STVN3_TienDoNhiemVu")
			tinsert(tbSayDialog,"Ho�n th�nh nhi�m v� Sinh T� V� Ng�/STVN3_HoanThanhNhiemVu")
		end
	end
	--tinsert(tbSayDialog,"Nh�n nhi�m v� Sinh T� V� Ng� 2/STVN2_NhanNhiemVu")
	--tinsert(tbSayDialog,"Ti�n �� ho�n th�nh nhi�m v�/STVN2_TienDoNhiemVu")
	--tinsert(tbSayDialog,"Ho�n th�nh nhi�m v� Sinh T� V� Ng� 2/STVN_Active")
	--tinsert(tbSayDialog,"�i�m t�ch c�c c�a b�n th�n/menu_point")		
	--tinsert(tbSayDialog,"Nh�n th��ng m�i ng�y/Award_Daily_Menu")
	--tinsert(tbSayDialog,"Nh�n th��ng Th�ng Ti�n (theo ��ng c�p)/menu_award")
	--tinsert(tbSayDialog,"Xem th�i gian c�n l�i �� nh�n th��ng/show_time")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/gf_DoNothing"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

