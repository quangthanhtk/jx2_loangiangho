Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Cæ L·o Tµ<color>: "

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = szNpcName.."Th«ng tin chi tiÕt ho¹t ®éng <color=yello>\"Sinh Tö V« Ng· 3\"<color>, ®ång ®¹o cã thÓ xem thªm t¹i trang chñ."
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20151003 then	
		local nTypeMission = VNG_GetTaskPos(TSK_SINHTULAN3A092015,1,1) 
		if GetTask(TSK_SINHTULAN3A092015) == 0 then	
			tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 3 tõ ChuyÓn Sinh 5 cÊp 99 (tèn 5 ®¹i ng©n phiÕu + 500 vµng)/#STVN3_NhanNhiemVu(1)")
			tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 3 tõ Phôc Sinh 1 cÊp 96 (tèn 5 hoµng kim ®¹i ng©n phiÕu + 5000 vµng)/#STVN3_NhanNhiemVu(2)")
			tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 3 tõ Phôc Sinh 1 cÊp 97 (tèn 3 hoµng kim ®¹i ng©n phiÕu + 3000 vµng)/#STVN3_NhanNhiemVu(3)")
			tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 3 tõ Phôc Sinh 1 cÊp 98 (tèn 2 hoµng kim ®¹i ng©n phiÕu + 1500 vµng)/#STVN3_NhanNhiemVu(4)")
			tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 3 tõ Phôc Sinh 1 cÊp 99 (tèn 1 ®¹i ng©n phiÕu + 500 vµng)/#STVN3_NhanNhiemVu(5)")
		end		
		if nTypeMission > 1 and nTypeMission <= 5 then
			local nCheck1 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,3,3) 
			local nCheck2 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,4,4) 
			local nCheck3 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,5,5) 
			local nCheck4 = VNG_GetTaskPos(TSK_SINHTULAN3C092015,6,6) 
			if nCheck1 < 1 then
				tinsert(tbSayDialog,"Nép thªm 1 Cöu Thiªn V« Cùc §¬n/#STVN_submit_nguyenlieu(1)")
			end
			if nCheck2 < 1 then
				tinsert(tbSayDialog,"Nép thªm 20000 Bét M×/#STVN_submit_nguyenlieu(2)")
			end
			if nCheck3 < 1 then
				tinsert(tbSayDialog,"Nép thªm 20000 Nh©n B¸nh/#STVN_submit_nguyenlieu(3)")
			end
			if nCheck4 < 1 then
				tinsert(tbSayDialog,"Nép thªm 10000 Nh©n B¸nh §Æc BiÖt/#STVN_submit_nguyenlieu(4)")
			end
		end
		local nCheckStatus = CheckStatus_SinhTu3()
		if nCheckStatus < 2 then		
			tinsert(tbSayDialog,"TiÕn ®é hoµn thµnh nhiÖm vô/STVN3_TienDoNhiemVu")
			tinsert(tbSayDialog,"Hoµn thµnh nhiÖm vô Sinh Tö V« Ng·/STVN3_HoanThanhNhiemVu")
		end
	end
	--tinsert(tbSayDialog,"NhËn nhiÖm vô Sinh Tö V« Ng· 2/STVN2_NhanNhiemVu")
	--tinsert(tbSayDialog,"TiÕn ®é hoµn thµnh nhiÖm vô/STVN2_TienDoNhiemVu")
	--tinsert(tbSayDialog,"Hoµn thµnh nhiÖm vô Sinh Tö V« Ng· 2/STVN_Active")
	--tinsert(tbSayDialog,"§iÓm tÝch cùc cña b¶n th©n/menu_point")		
	--tinsert(tbSayDialog,"NhËn th­ëng mçi ngµy/Award_Daily_Menu")
	--tinsert(tbSayDialog,"NhËn th­ëng Th¨ng TiÕn (theo ®¼ng cÊp)/menu_award")
	--tinsert(tbSayDialog,"Xem thêi gian cßn l¹i ®Ó nhËn th­ëng/show_time")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/gf_DoNothing"	)
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

