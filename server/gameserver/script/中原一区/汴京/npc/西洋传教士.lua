Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\config\\vng_feature.lua") 

VUKHI_HH_HHVH_FILE = "\\script\\vng\\weapon_upgrade\\vkhhtohhvh.lua"; --®æi vò khÝ hµo hiÖp thµnh hµo hiÖp v« h¹
VUKHI_HHVH_TO_AMHUYET_FILE = "\\script\\vng\\weapon_upgrade\\vkhhvhtoamhuyet.lua"; --®æi vò khÝ hµo hiÖp v« h¹ thµnh Èm huyÕt
TRANGSUC_HHVH_TO_AMHUYET_FILE = "\\script\\vng\\weapon_upgrade\\trangsuchhvhtoamhuyet.lua"; --®æi trang søc hµo hiÖp v« h¹ thµnh Èm huyÕt
szNpcName = "<color=green>Gi¸o SÜ: <color>"
szBang = {	
	[1] = {"B¹ch Hæ","1:1.78"},
	[2] = {"§¹i ¦ng","1:2"},
	[3] = {"Kú Hæ","1:1.96"},
	[4] = {"M·nh Hæ","1:1.96"},
	[5] = {"Ngò Hæ","1:1.74"},
	[6] = {"Phôc Hæ","1:1.97"},
	[7] = {"ThÇn Long","1:1.66"},
	[8] = {"Thiªn Long","1:1.96"},
	[9] = {"XÝch Long","1:1.97"},
}
	
function main()
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {102, 104, 106, 108, 113, 143};
	for k, v in tActivityID do
		if 200 == GetWorldPos() then
			tSay = aah_GetSayDialog(tonumber(v));
		end
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20141103 and nDate <= 20141108 then
		tinsert(tSay,"Ta muèn xem t×nh tr¹ng ®Æt c­îc/show_DuDoan")
		--Event Dù ®o¸n BHTA12
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 0 then		
			for i = 1, getn(szBang) do
				tinsert(tSay,"Ta muèn ®¸nh c­îc Bang Héi "..szBang[i][1].."(tèn Thiªn Kiªu LÖnh - Tû lÖ "..szBang[i][2]..")/#DuDoan_02("..i..")")
			end			
		else
			local nBangHoi = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
			tinsert(tSay,"Ta muèn ®¸nh c­îc Bang Héi "..szBang[nBangHoi][1].."(tèn Thiªn Kiªu LÖnh - Tû lÖ "..szBang[nBangHoi][2]..")/#DuDoan_02("..nBangHoi..")")
		end
	end
	
	if nDate <= 20141128 then
		tinsert(tSay,"Ta muèn nhËn th­ëng dù ®o¸n BHTA12/GetReward")
	end
	if nDate <= 20160624 then
		local nExt_Survey = GetExtPoint(EXT_SURVEY2016)
		if nExt_Survey < 1 then
			tinsert(tSay,"Ta muèn nhËn th­ëng Kh¶o S¸t/Award_Survey")
		end
	end
	if nDate <= 20161118 then
		tinsert(tSay,"§æi §ång TiÒn ThÇn Kú lÊy Tô Tµi Th¹ch/change_dongtien_tutaithach")
	end
	if nDate <= 20161231 then
--		tinsert(tSay,"NhËn th­ëng Kinh M¹ch §ång Nh©n/EventKinhMachDongNhan_092015")
--		tinsert(tSay,"NhËn th­ëng MËt TÞch Tiªu Dao/EventphuThang9_092015")
--		tinsert(tSay,"Nép 24 Hép Quµ B¹c + 69 tiªu dao ngäc/#EventPhuThangMenu_do(1)")
--		tinsert(tSay,"Nép 24 Hép Quµ Vµng + 69 tiªu dao ngäc/#EventPhuThangMenu_do(2)")
		tinsert(tSay,"Ta muèn mua nguyªn liÖu ®Ó ghÐp event/buy_nguyenlieu")
	end
	if nDate >= 20190723 and nDate <= 20191130 then
		tinsert(tSay,"Ta muèn ®æi Hµo HiÖp Giíi/#change_HaoHiep(1)")
		tinsert(tSay,"Ta muèn ®æi Hµo HiÖp Béi/#change_HaoHiep(2)")
		tinsert(tSay,"Ta muèn ®æi Hµo HiÖp Giíi V« H¹/#upgrade_HaoHiep_VHHH(1)")
		tinsert(tSay,"Ta muèn ®æi Hµo HiÖp Béi V« H¹/#upgrade_HaoHiep_VHHH(2)")
		tinsert(tSay,"Ta muèn ®æi Vò KhÝ Hµo HiÖp th­êng/upgrade_VuKhi_HaoHiep")
		tinsert(tSay,"Ta muèn ®æi Vò KhÝ Hµo HiÖp V« H¹/upgrade_VuKhi_HaoHiep_VHHH")
	end
	if nDate >= 20200214 and nDate <= 20200314 then
		tinsert(tSay,"N©ng cÊp Vò KhÝ Èm HuyÕt (10 TMKL, 10 TCL, 1 vò khÝ HHVH)/#updateAmHuyet_choose2020(1)")
		tinsert(tSay,"N©ng cÊp T¶ Giíi Èm HuyÕt (8 TMKL, 8 TCL, 1 nhÉn HHVH hoÆc 1 béi HHVH)/#updateAmHuyet_choose2020(2)")
		tinsert(tSay,"N©ng cÊp H÷u Giíi Èm HuyÕt (8 TMKL, 8 TCL, 1 nhÉn HHVH hoÆc 1 béi HHVH)/#updateAmHuyet_choose2020(3)")
		tinsert(tSay,"N©ng cÊp Trôy Èm HuyÕt (8 TMKL, 8 TCL, 1 nhÉn HHVH hoÆc 1 béi HHVH)/#updateAmHuyet_choose2020(4)")
		tinsert(tSay,"N©ng cÊp Béi Èm HuyÕt (8 TMKL, 8 TCL, 1 nhÉn HHVH hoÆc 1 béi HHVH)/#updateAmHuyet_choose2020(5)")
	end
	tinsert(tSay, "Tho¸t/nothing")
	local msg = "<color=green>Gi¸o SÜ: <color>N©ng cÊp trang bÞ Èm HuyÕt cÇn tiªu hao: Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, vµ trang bÞ Hµo HiÖp V« H¹"
	local szHeader = "<color=green>Gi¸o SÜ:<color>§¹i hiÖp muèn ®æi trang bÞ Hµo HiÖp cÇn cã:\n"..
								"<color=yellow>- §æi Hµo HiÖp Giíi (Béi): <color>1 TMKL, 1 TCL\n"..
								"<color=yellow>- §æi Hµo HiÖp Giíi (Béi) V« H¹: <color>1 Hµo HiÖp Giíi (Béi), 4 TMKL, 4 TCL\n"..
								"<color=yellow>- §æi Vò KhÝ Hµo HiÖp th­êng: <color>1 TMKL, 1 TCL\n"..
								"<color=yellow>- §æi Vò KhÝ Hµo HiÖp V« H¹: <color>1 Vò KhÝ Hµo HiÖp th­êng, 5 TMKL, 5 TCL"
	Say(msg, getn(tSay), tSay);
end

function show_DuDoan()
	local nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	Talk(1,"",szNpcName.."C¸c h¹ ®· dù ®o¸n ®­îc <color=yellow>"..gf_GetTaskByte(TSK_DUDOAN_BHTA12,3).." Thiªn Kiªu LÖnh<color> cho bang héi <color=yellow>"..szBang[nBang][1].."<color>")
end

function DuDoan_02(nBang)
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"", szNpcName.."C¸c h¹ cÇn ®¹t Ýt nhÊt chuyÓn sinh 5 cÊp 90 ®Ó ®­îc dù ®o¸n!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) >= 50 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· dù ®o¸n ®ñ sè l­îng. Kh«ng thÓ tiÕp tôc tham gia!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= 0 then
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= nBang then
			Talk(1,"",szNpcName.."C¸c h¹ chØ ®­îc dù ®o¸n 1 bang duy nhÊt")
			return
		end
	end	
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ dù ®o¸n!")
		return
	end	
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 
	end

	local tSay = {}
	tinsert(tSay,format("Ta muèn ®Æt c­îc 5 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,5))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 10 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,10))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 15 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,15))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 20 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,20))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 50 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,50))
	tinsert(tSay, "Tho¸t/nothing")
	Say(szNpcName.."C¸c h¹ muèn ®Æt c­îc thÕ nµo?", getn(tSay), tSay);
end

function DuDoan_01(nBang,nDatCuoc)

	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc > 50 then
		Talk(1,"",szNpcName.."C¸c h¹ chØ ®­îc dù ®o¸n tèi ®a <color=yellow>50<color> Thiªn Kiªu LÖnh!")
		return
	end

	if GetItemCount(2,97,236) < nDatCuoc then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®em ®ñ sè l­îng Thiªn Kiªu LÖnh!")
		return
	end
	
	if DelItem(2,97,236,nDatCuoc) == 1 then		
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,nBang)
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,3,gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc)
		gf_WriteLogEx("DU DOAN BHTA12", "du doan thanh cong", nDatCuoc, "du doan "..szBang[nBang][1])	
		Talk(1,"",szNpcName.."C¸c h¹ ®· ®Æt c­îc thµnh c«ng <color=yellow>"..nDatCuoc.."<color> cho bang héi <color=yellow>"..szBang[nBang][1].."<color>")
		return
	else
		Talk(1,"",szNpcName.."§Æt c­îc kh«ng thµnh c«ng, xin vui lßng thùc hiÖn l¹i!")
		return
	end
end

function GetReward()
	nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	nBinhChon = gf_GetTaskByte(TSK_DUDOAN_BHTA12,3)
	nNhanThuong = floor(gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) * 1.74)
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 10 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng råi, thËt lµ tham qu¸ mµ!")
		return
	end
	
	if nBang ~= 5 or nBinhChon == 0 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng tham gia b×nh chän hoÆc b×nh chän bang héi kh¸c!")
		return
	end
	
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	
	gf_AddItemEx2({2,97,236,nNhanThuong,4}, "Thiªn Kiªu LÖnh", "Dù ®o¸n BHTA12", "PhÇn th­ëng Thiªn Kiªu LÖnh", 0, 1)
	gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,10)
	gf_WriteLogEx("NHAN THUONG DU DOAN BHTA12", "Thanh Cong", 1, "Nhan thuong")
end

function EventphuThang9_092015()
	local tSay = {};
	
	tinsert(tSay,"Nép 24 N­íc Hoa th­êng + 69 tiªu dao ngäc/#EventPhuThangMenu_do(1)")
	tinsert(tSay,"Nép 24 N­íc Hoa kh« + 69 tiªu dao ngäc/#EventPhuThangMenu_do(2)")
	tinsert(tSay, "Tho¸t/nothing")
	Say("<color=green>Gi¸o SÜ:<color>Ta cã vµi mãn ®å quý, ®¹i hiÖp cã muèn nhËn kh«ng ?!", getn(tSay), tSay);
end
function EventPhuThangMenu_do(nType)
	local tnguyenlieu = {
				[1] = {30936, "Hép Quµ B¹c"},	-- VÞ trÝ 1
				[2] = {30937, "Hép Quµ Vµng"},	-- VÞ trÝ 2
			}
			
	local nCheck = VNG_GetTaskPos(TSK_EVENT_112015, nType, nType)	
	if nCheck >= 3 then
		Talk(1, "", szNpcName.."H«m nay ®¹i hiÖp ®· nép "..nCheck.." lÇn lo¹i "..tnguyenlieu[nType][2].." råi. H·y quay l¹i vµo ngµy mai.")
		return 0
	end
	if gf_Judge_Room_Weight(3,300) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	if GetItemCount(2,1,tnguyenlieu[nType][1]) < 24 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 24 " ..tnguyenlieu[nType][2])
		return 0
	end
	if GetItemCount(2,1,30603) < 69 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 69 Tiªu Dao Ngäc.")
		return 0
	end
	if DelItem(2,1,tnguyenlieu[nType][1],24) == 1 and DelItem(2,1,30603,69) == 1 then
		--SetTask(TSK_EVENTTHANG9,SetBit(GetTask(TSK_EVENTTHANG9),nType,1));
		VNG_SetTaskPos(TSK_EVENT_112015, nCheck+1, nType, nType)	
		if nType == 1 then
			AwardGenuineQi(5000)
		elseif nType == 2 then
			gf_AddItemEx2({2,1,30730,2,4}, "2 kinh mach dong nhan", "EVENT PHU THANG 11/2015 bk", "PhÇn th­ëng")
		end
--		gf_AddItemEx2({2,1,30669,50,4}, "50 m¶nh mËt tÞch", "EVENT PHU THANG 9/2015 bk", "PhÇn th­ëng")
--		gf_AddItemEx2({2,97,236,2,4}, "2 thiªn kiªu lÖnh", "EVENT PHU THANG 9/2015 bk", "PhÇn th­ëng")
		gf_WriteLogEx("EVENT PHU THANG 11/2015", "Thanh Cong", 1, "NhËn th­ëng lo¹i "..nType)
	end
end

function EventKinhMachDongNhan_092015()
	local tSay = {};
	
	tinsert(tSay,"Nép 36 B¸nh Trung Thu th­êng + 72 tiªu dao ngäc/#EventKinhMachDongNhan_092015_do(1)")
	tinsert(tSay,"Nép 36 B¸nh Trung Thu ®Æc biÖt + 72 tiªu dao ngäc/#EventKinhMachDongNhan_092015_do(2)")
	tinsert(tSay, "Tho¸t/nothing")
	Say("<color=green>Gi¸o SÜ:<color>Ta cã vµi mãn ®å quý, ®¹i hiÖp cã muèn nhËn kh«ng ?!", getn(tSay), tSay);
end
function EventKinhMachDongNhan_092015_do(nType)
	local tnguyenlieu = {
				[1] = {30919, "B¸nh Trung Thu th­êng"},	-- Byte 1
				[2] = {30920, "B¸nh Trung Thu ®Æc biÖt"},	-- Byte 2
			}
	local nCheck = GetByte(GetTask(TSK_KINHMACH_THANG9),nType)
	if nCheck >= 3 then
		Talk(1, "", szNpcName.."H«m nay ®¹i hiÖp ®· ®æi 3 lÇn Kinh M¹ch §ång Nh©n råi. H·y quay l¹i vµo ngµy mai.")
		return 0
	end
	if gf_Judge_Room_Weight(3,300) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	if GetItemCount(2,1,tnguyenlieu[nType][1]) < 36 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 36 " ..tnguyenlieu[nType][2])
		return 0
	end
	if GetItemCount(2,1,30603) < 72 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 72 Tiªu Dao Ngäc.")
		return 0
	end
	if DelItem(2,1,tnguyenlieu[nType][1],36) == 1 and DelItem(2,1,30603,72) == 1 then
		SetTask(TSK_KINHMACH_THANG9,SetByte(GetTask(TSK_KINHMACH_THANG9),nType,nCheck+1));
		gf_AddItemEx2({2,1,30730,4,4}, "4 kinh mach dong nhan", "EVENT KINH MACH DONG NHAN THANG 9/2015 bk", "PhÇn th­ëng")
		ModifyExp(10000000) --10 triÖu kinh nghiÖm
		gf_WriteLogEx("EVENT KINH MACH DONG NHAN THANG 9/2015", "Thanh Cong", 1, "NhËn th­ëng lo¹i "..nType)
	end
end
function buy_nguyenlieu()
	local tSay = {};
--	tinsert(tSay, "Ta muèn mua 2000 giÊy xu©n ®á (tiªu hao 15 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu(1)")
	tinsert(tSay, "Ta muèn mua 2000 C©y Th«ng Gi¸o Héi (tiªu hao 90 vµng)/#finish_buy_nguyenlieu(2)")
--	tinsert(tSay, "Ta muèn mua 2000 mùc tµu (tiªu hao 15 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu(3)")
	tinsert(tSay, "Ta muèn mua 2000 vËt Trang TrÝ (tiªu hao 180 vµng)/#finish_buy_nguyenlieu(4)")
--	tinsert(tSay, "Ta muèn mua 2000 §¹i C¸t (tiªu hao 50 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu(5)")
	tinsert(tSay, "Ta muèn mua 2000 Ng«i Sao Gi¸ng Sinh (tiªu hao 300 vµng)/#finish_buy_nguyenlieu(6)")
	tinsert(tSay, "Tho¸t/nothing")
	local szHeader = "<color=green>Gi¸o SÜ:<color>HiÖn t¹i ta cã rÊt nhiÒu nguyªn liÖu event:"
	Say(szHeader, getn(tSay), tSay);
end
function finish_buy_nguyenlieu(nType)
	local tnguyenlieu = {--x, x, sè l­îng tiªu dao ngäc, vµng
				[1] = {31018, "giÊy xu©n ®á", 15, 0},	
				[2] = {49, "c©y th«ng gi¸o héi", 0, 90},	
				[3] = {31019, "mùc tµu", 15, 0},	
				[4] = {50, "vËt trang trÝ", 0, 180},	
				[5] = {31020, "§¹i C¸t", 50, 0},	
				[6] = {51, "ng«i sao gi¸ng sinh", 0, 300},	
			}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
--	if GetItemCount(2,1,30603) < tnguyenlieu[nType][3] then
--		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ "..tnguyenlieu[nType][3].." Tiªu Dao Ngäc.")
--		return 0
--	end
	if GetCash() < tnguyenlieu[nType][4]*10000 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ "..tnguyenlieu[nType][4].." Vµng.")
		return 0
	end
	if nType == 1 or nType == 3 or nType == 5 then
		if  DelItem(2,1,30603,tnguyenlieu[nType][3]) ~= 1 then
			Talk(1, "", "X¶y ra lçi 1")
			return 0
		end
	elseif nType == 2 or nType == 4 or nType == 6 then
		if Pay(tnguyenlieu[nType][4]*10000) ~= 1 then
			Talk(1, "", "X¶y ra lçi 2")
			return 0
		end
	end
	gf_AddItemEx2({2,200,tnguyenlieu[nType][1],2000}, "nguyªn liÖu", "MUA NGUYEN LIEU THANG 2016", "Mua nguyªn liÖu")
end
function Award_Survey()
	local tbdanhsach1 = {--acc
	
								}
	local tbdanhsach2 = {--acc								
							
								}							
	local tbdanhsach3 = {--acc
							
								}
															
	local nExt_Survey = GetExtPoint(EXT_SURVEY2016)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20160624 then
		Talk(1, "", szNpcName.."HÕt thêi gian nhËn th­ëng")
		return 0
	end
	if nExt_Survey >= 1 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn th­ëng survey råi")
		return 0
	end							
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	local nAcc = GetAccount()
	local nCheck = 0
	for i = 1, getn(tbdanhsach1) do
		if tbdanhsach1[i] ==  nAcc then
			nCheck = 1
			break
		end
	end
	for i = 1, getn(tbdanhsach2) do
		if nCheck == 1 then
			break
		else
			if tbdanhsach2[i] ==  nAcc then
				nCheck = 1
				break
			end
		end
	end
	for i = 1, getn(tbdanhsach3) do
		if nCheck == 1 then
			break
		else
			if tbdanhsach3[i] ==  nAcc then
				nCheck = 1
				break
			end
		end
	end
	if nCheck == 1 then
		AddExtPoint(EXT_SURVEY2016, 1)
		gf_AddItemEx2({0,105,160,1,4,-1,-1,-1,-1,-1,-1,-1}, "Tam vi tuyet ho", "PHAT THUONG SURVEY 2016", "Ph¸t th­ëng survey",7*24*3600)
	else
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng")
		return 0
	end
end

function change_dongtien_tutaithach()
	local nCount = GetItemCount(2,1,31007)
	if nCount <= 0 then
		Talk(1, "", "B¹n khéng cã §ång TiÒn ThÇn Kú nµo ®Ó ®æi.")
		return 0
	end
	if DelItem(2,1,31007,nCount) == 1 then
		gf_AddItemEx2({2,1,31170,nCount}, "dong tien - tu tai thach", "DOI DONG TIEN", "§æi ®ång tiÒn")
	end
end
function change_HaoHiep(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, Cöu Thiªn V« Cùc §¬n
								[1] = {{2,1,30370,1}, {2,95,204,1},{2,1,1006,0},31126}, 
								[2] = {{2,1,30370,1}, {2,95,204,1},{2,1,1006,0},31127}, 
							}
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3])
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
--	if nCount3 < nNguyenLieu[nType][3][4] then
--		Talk(1, "", "B¹n kh«ng cã ®ñ Cöu Thiªn V« Cùc §¬n ®Ó ®æi trang bÞ Hµo HiÖp.")
--		return 0
--	end	
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3],nNguyenLieu[nType][3][4])		
	if nDelItem1 == 1 and nDelItem2 == 1 then --and nDelItem3 == 1 then
		gf_AddItemEx2({0,102,nNguyenLieu[nType][4],1}, "Nang cap hao hiep", "NANG CAP HAO HIEP BK", "N©ng cÊp hµo hiÖp")
		gf_WriteLogEx("NANG CAP HAO HIEP", "Thanh Cong", 1, "§æi lo¹i "..nType)
	else
		gf_WriteLogEx("NANG CAP HAO HIEP", "That bai", 1, "§æi lo¹i "..nType)
	end
end
function upgrade_HaoHiep_VHHH(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, Linh KhÝ Rùc Rì, Cöu Thiªn V« Cùc §¬n, Hµo HiÖp Giíi (Béi)
								[1] = {{2,1,30370,4}, {2,95,204,4}, {2,1,31122,0}, {2,1,1006,0},{0,102,31126,1},"Hµo HiÖp Giíi", 30974}, 
								[2] = {{2,1,30370,4}, {2,95,204,4}, {2,1,31122,0}, {2,1,1006,0},{0,102,31127,1},"Hµo HiÖp Béi", 30974}, 
							}
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3])
--	local nCount4 = GetItemCount(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3])
	local nCount5 = GetItemCount(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3])
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ Hµo HiÖp V« H¹.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ Hµo HiÖp V« H¹.")
		return 0
	end		
--	if nCount3 < nNguyenLieu[nType][3][4] then
--		Talk(1, "", "B¹n kh«ng cã ®ñ Linh KhÝ Rùc Rì ®Ó ®æi trang bÞ Hµo HiÖp V« H¹.")
--		return 0
--	end				
--	if nCount4 < nNguyenLieu[nType][4][4] then
--		Talk(1, "", "B¹n kh«ng cã ®ñ Cöu Thiªn V« Cùc §¬n ®Ó ®æi trang bÞ Hµo HiÖp V« H¹.")
--		return 0
--	end	
	if nCount5 < nNguyenLieu[nType][5][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ "..nNguyenLieu[nType][6].." ®Ó ®æi trang bÞ Hµo HiÖp V« H¹.")
		return 0
	end	
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3],nNguyenLieu[nType][3][4])		
	local nDelItem4 = DelItem(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3],nNguyenLieu[nType][4][4])	
	local nDelItem5 = DelItem(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3],nNguyenLieu[nType][5][4])	
	if nDelItem1 == 1 and nDelItem2 == 1 and nDelItem4 == 1 and nDelItem5 == 1 then
		gf_AddItemEx2({2,1,nNguyenLieu[nType][7],1}, "Nang cap hao hiep", "NANG CAP HAO HIEP VO HA BK", "N©ng cÊp hµo hiÖp")
		gf_WriteLogEx("NANG CAP HAO HIEP VO HA", "Thanh Cong", 1, "§æi lo¹i "..nType)
	else
		gf_WriteLogEx("NANG CAP HAO HIEP VO HA", "That bai", 1, "§æi lo¹i "..nType)
	end
end
function upgrade_VuKhi_HaoHiep()
	local tbVKHaoHiepThuong = {
		[2] = {{0,3,30724,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 2"},
		[3] = {{0,8,30725,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 4"},
		[4] = {{0,0,30726,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 3"},
		[6] = {{0,1,30727,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 6"},
		[8] = {{0,2,30728,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 8"},
		[9] = {{0,10,30729,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 9"},
		[11] = {{0,0,30730,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 11"},
		[12] = {{0,5,30731,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 12"},
		[14] = {{0,2,30732,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 14"},
		[15] = {{0,9,30733,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 15"},
		[17] = {{0,6,30734,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 17"},
		[18] = {{0,4,30735,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 18"},
		[20] = {{0,7,30736,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 20"},
		[21] = {{0,11,30737,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 21"},
		[23] = {{0,2,30738,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 23"},
		[25] = {{0,3,30739,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 25"},
		[26] = {{0,9,30740,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 26"},
		[27] = {{0,11,30741,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 27"},
		[29] = {{0,13,30742,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 29"},
		[30] = {{0,12,30743,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 30"},
		[31] = {{0,14,32162,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 6"},
		[32] = {{0,2,32190,1,1,-1,-1,-1,-1,-1,-1,-1}, "Vò KhÝ Hµo HiÖp Th­êng 23"},
	}
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, Cöu Thiªn V« Cùc §¬n
								[1] = {{2,1,30370,1}, {2,95,204,1}, {2,1,1006,0}}, 
							}
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1,[31]=1,[32]=1}						
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3])
	local nRoute = GetPlayerRoute()
	if tbRoute[nRoute] ~= 1 then
		Talk(1,"",strNpcName .. "C¸c h¹ ch­a chän hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if nCount1 < nNguyenLieu[1][1][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
	if nCount2 < nNguyenLieu[1][2][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
--	if nCount3 < nNguyenLieu[1][3][4] then
--		Talk(1, "", "B¹n kh«ng cã ®ñ Cöu Thiªn V« Cùc §¬n ®Ó ®æi trang bÞ Hµo HiÖp.")
--		return 0
--	end	
	local nDelItem1 = DelItem(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3],nNguyenLieu[1][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3],nNguyenLieu[1][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3],nNguyenLieu[1][3][4])		
	if nDelItem1 == 1 and nDelItem2 == 1 then 	--and nDelItem3 == 1 then	
		gf_AddItemEx2(tbVKHaoHiepThuong[nRoute][1], tbVKHaoHiepThuong[nRoute][2], "NANG CAP VU KHI HAO HIEP 1 BK", "nhËn trang bÞ")
		gf_WriteLogEx("NANG CAP HAO HIEP", "Thanh Cong", 1, "§æi thµnh c«ng")
	else
		gf_WriteLogEx("NANG CAP HAO HIEP", "That bai", 1, "§æi thµnh c«ng")
	end
end
function upgrade_VuKhi_HaoHiep_VHHH()
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, Cöu Thiªn V« Cùc §¬n
								[1] = {{2,1,30370,5}, {2,95,204,5}, {2,1,1006,0}}, 
							}
	local nCount1 = GetItemCount(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3])
	local nCount3 = GetItemCount(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3])
	if nCount1 < nNguyenLieu[1][1][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
	if nCount2 < nNguyenLieu[1][2][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end						
	if nCount3 < nNguyenLieu[1][3][4] then
		Talk(1, "", "B¹n kh«ng cã ®ñ Cöu Thiªn V« Cùc §¬n ®Ó ®æi trang bÞ Hµo HiÖp.")
		return 0
	end		
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", VUKHI_HH_HHVH_FILE, 1)
end

function updateAmHuyet_choose2020(nType)
	local nNguyenLieu = {--Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh
								[1] = {{2,1,30370,10}, {2,95,204,10}}, 
								[2] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[3] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[4] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[5] = {{2,1,30370,8 }, {2,95,204,8 }}, 
							}
	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", szNpcName.."B¹n kh«ng cã ®ñ Thiªn M«n Kim LÖnh ®Ó ®æi trang bÞ Èm HuyÕt.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", szNpcName.."B¹n kh«ng cã ®ñ Thiªn Cang LÖnh ®Ó ®æi trang bÞ Èm HuyÕt.")
		return 0
	end						
	if nType == 1 then
		PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", VUKHI_HHVH_TO_AMHUYET_FILE, 1)	
	else
		VNG_SetTaskPos(TSK_Type_HHVHtoAMHUYET, nType,6,6)
		PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", TRANGSUC_HHVH_TO_AMHUYET_FILE, 1)	
	end
end



