Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\eventkimxalienserver.lua")
Include("\\script\\online_activites\\201502\\wupanguo.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua")
Include("\\script\\vng\\lasa\\\la_sa.lua")
LASA_FILE = "\\script\\vng\\lasa\\\la_sa.lua"
LASA_FILE1 = "\\script\\vng\\lasa\\\la_sa1.lua"
szNpcName = "<color=green>La Sa<color>: "
DuaTop_StartDate = 20150121
DuaTop_EndDate = 20150228
NewServer_Id = 94
Max_Vote_Point = 200
tbVoteMaterials = {
	[1] = {1, {nExp = 10000000}, "10 triÖu ®iÓm kinh nghiÖm(1 ®iÓm tÝch lòy)"},
	[2] = {10,{nExp = 100000000}, "100 triÖu ®iÓm kinh nghiÖm(10 ®iÓm tÝch lòy)"},
	[3] = {1, {item={{gdp={2,1,30499,1}}}}, "1 Hu©n Ch­¬ng Anh Hïng(1 ®iÓm tÝch lòy)"},
	[4] = {2, {item={{gdp={2,1,30614,1}}}}, "1 L«i Hæ Tinh Ph¸ch(2 ®iÓm tÝch lòy)"},
	[5] = {1, {item={{gdp={2,2,8,5}},{gdp={2,1,30230,6}}}}, "5 Thiªn Th¹ch vµ 6 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
	[6] = {1, {item={{gdp={2,1,270,1}},{gdp={2,1,30230,1}}}}, "1 B¹ch cÇu hoµn vµ 1 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
	[7] = {2, {item={{gdp={2,1,1007,1}},{gdp={2,1,30230,2}}}}, "1 §¹i b¹ch cÇu hoµn vµ 2 Xu VËt PhÈm(2 ®iÓm tÝch lòy)"},
	[8] = {3, {item={{gdp={2,1,1008,1}}}}, "1 B¹ch cÇu tiªn ®¬n(3 ®iÓm tÝch lòy)"},
	[9] = {1, {item={{gdp={2,1,30762,300}},{gdp={2,1,30230,1}}}}, "300 L¸ Dong vµ 1 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
	[10] = {1, {item={{gdp={2,1,30763,300}},{gdp={2,1,30230,1}}}}, "300 G¹o NÕp vµ 1 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
	[11] = {1, {item={{gdp={2,1,30764,50}},{gdp={2,1,30230,1}}}}, "50 §Ëu Xanh Nh©n ThÞt vµ 1 Xu VËt PhÈm(1 ®iÓm tÝch lòy)"},
}

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b¸n Socola lÔ t×nh nh©n",2,"Ta ®Õn mua Socola lÔ t×nh nh©n/buy_chocolate","Ta chØ ghÐ ch¬i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:tÆng Hoµng Kim Phi Phong cho tÊt c¶ n÷ sinh trong thµnh (<color=green>®· sö dông phÇn th­ëng cuèi cña event 8 thang 3 sÏ nhËn ®­îc phÇn th­ëng cuçi phong phó h¬n<color>)",2,"Mêi SaSa thay ta tÆng Phi Phong cho c¸c chÞ em phô n÷ trong thµnh (tiªu hao 8 Phi Phong Hoµng Kim + 3 vµng)/deal_send","Ta chØ ghÐ ch¬i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi¸ng sinh vui vÎ!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	
	
	--»î¶¯µÄ
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {84, 124, 127, 136};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	
	if gf_CheckEventDateEx(147) == 1 then
		for i = 1, getn(WPG_DIALOG) do
			tinsert(tSay,WPG_DIALOG[i])
		end		
	end
	
	--Event Dua Top Bang Hoi Lien Server 21/01/2015 - 28/02/2015
	if GetGlbValue(GLB_TSK_SERVER_ID) ~= NewServer_Id and GetGlbValue(GLB_TSK_SERVER_ID) ~= 93 then
		--DuaTop_Main()
		if nDate >= DuaTop_StartDate and nDate <= DuaTop_EndDate then
			tinsert(tSay,"Bang chñ ®¹i diÖn Bang Héi ®¨ng ký tham gia/DuaTop_DangKy")
			tinsert(tSay,"Xem th«ng tin c¸c Bang Héi tham gia trong m¸y chñ/DuaTop_ViewListBangHoi")
			tinsert(tSay,"ñng hé c¸c Bang Héi/DuaTop_UngHo")
			tinsert(tSay,"Xem tÝch lòy b¶n th©n/DuaTop_ViewPersonalPoint")
			tinsert(tSay,"Xem tÝch lòy c¸c Bang Héi/DuaTop_ViewBangHoiPoint")		
		end	
	end
	
	if nDate >= 20130416 and nDate <= 20130421 then
		tinsert(tSay, "Ta muèn ®æi nguyªn liÖu lÊy kinh nghiÖm/Trade_Material2Exp_Menu")
		tinsert(tSay, "Ta muèn ®æi c¸c lo¹i nguyªn liÖu lÊy phÇn th­ëng/Trade_Material2Item_Menu")
	end
	if nDate >= 20131012 and nDate <= 20131024 then
		tinsert(tSay, "§ua top Trang bÞ Kim Xµ Nguyªn So¸i/EventKimXaLienServer_Menu")
	end
	if nDate == 20131027 then
		tinsert(tSay, "Bang chñ nhËn th­ëng ®ua top Kim Xµ Nguyªn So¸i/EventKimXaLienServer_NhanThuong_Form")
	end
	
	local nHour = tonumber(date("%H"))
	if nDate >= 20150426 and nDate <= 20150427 then
		if nHour >= 21 and nHour <= 22 then
			tinsert(tSay,"Ta muèn quay sè nhËn th­ëng /QuaySo8t3_01");
		end
--		tinsert(tSay,"Ta muèn nhËn quµ Quèc TÕ Phô N÷ 8 th¸ng 3/Award8t3");
	end
	if nDate >= 20150426 and nDate <= 20150430 then
		if nHour >= 21 then
			tinsert(tSay,"NhËn nhiÖm ThÇn Tèc Xuyªn §ªm (h»ng ngµy) /NhiemVuTrongCay");
			tinsert(tSay,"NhËn th­ëng nhiÖm vô ThÇn Tèc Xuyªn §ªm (h»ng ngµy)/NhiemVuTrongCay_award");	
		end
	end
	if nDate >= 20151118 and nDate <= 20151130 then
		tinsert(tSay,"Ta muèn ghÐp mËt tÞch siªu cÊp 20% (dïng 3 mËt tÞch cïng hÖ ph¸i + 3 ChiÕn thÇn hoµn)/#change_MatTich20(1)");
		tinsert(tSay,"Ta muèn ghÐp mËt tÞch siªu cÊp 20% (dïng 5 mËt tÞch kh«ng cïng hÖ ph¸i + 3 ChiÕn thÇn hoµn)/#change_MatTich20(2)");
	end
	if nDate >= 20151118 and nDate <= 20161031 then
		tinsert(tSay,"§æi ngo¹i trang B¨ng §iÓu (vÜnh cöu) /change_ChimBang");
	end
	if nDate <= 20200630 then
		tinsert(tSay,"Ta muèn mua nguyªn liÖu ®Ó ghÐp event/buy_nguyenlieu_lasa")
	end	
	
	if nDate <= 20200731 then
		tinsert(tSay, "§æi 1 Kû YÕu hoÆc 1 L­u Bót (tiªu hao 10 vµng)/#_gold_exchange_talk(1)")
		tinsert(tSay, "§æi 10 Kû YÕu hoÆc 10 L­u Bót (tiªu hao 100 vµng)/#_gold_exchange_talk(2)")
		tinsert(tSay, "§æi 100 Kû YÕu hoÆc 100 L­u Bót (tiªu hao 1000 vµng)/#_gold_exchange_talk(3)")
--		tinsert(tSay, "§æi 1000 b¸nh trung thu (B¸nh th­êng hoÆc B¸nh §Æc BiÖt)(tiªu hao b»ng vµng)/#_gold_exchange_talk(4)")
	end
	tinsert(tSay, "\nKÕt thóc ®èi tho¹i/do_nothing");
	Say("<color=green>La Sa<color>: §æi 1 Kû YÕu hoÆc 1 L­u Bót: tiªu hao 10 Bót Mùc + 10 TËp Vë + 10 Vµng!", getn(tSay), tSay);
end

function do_nothing()
end

function DuaTop_NhanThuong(nRank)
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local szTongName = GetTongName()
	local isTong = IsTongMaster()
	
	local nCheck = 0
	local nPoint = 0
	for i = 1, getn(LIB_txtData.tbTextData) do
		if szTongName == LIB_txtData.tbTextData[i][1] then
			nPoint = LIB_txtData.tbTextData[i][5]
			nCheck = 1
			break
		end
	end
		
	if nCheck <= 0 then
		Talk(1,"","C¸c h¹ kh«ng cã trong danh s¸ch bang héi nhËn th­ëng!")
		return
	end
	
	if isTong ~= 1 then
		Talk(1,"","C¸c h¹ kh«ng ph¶i bang chñ, kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	local nNhanThuong = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,2,0)
	if nNhanThuong >= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng. Kh«ng thÓ nhËn ®­îc n÷a!")
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(7*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn th­ëng!")
		return 0
	end
	
	if nPoint < 30000 then
		Talk(1,"","§iÓm tÝch lòy d­íi 30,000 ®iÓm. Bang héi kh«ng thÓ nhËn th­ëng!")
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn th­ëng.");
		return
	end
	
	if gf_Judge_Room_Weight(15, 700) == 0 then
		Talk(1,"", szNpcName.."H·y chuÈn bÞ Ýt nhÊt 15 « trèng vµ 700 søc lùc råi quay l¹i ®©y nhËn th­ëng !")
		return 0
	end
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*60*60}}}
	local nRoute = GetPlayerRoute()
	if nRank == 1 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank1"
		TraoChienCuong(15)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(11)
		LIB_Award:Award({item = {{gdp={0,112,225,3}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,3}, name="Bao Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,300}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,5}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30014,2,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B¸o Vµng"}}})
	elseif nRank == 2 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank2"
		TraoChienCuong(13)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(7)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(2,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,1}, name="Bao Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,200}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,3}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B¸o §en"}}})
	elseif nRank == 3 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank3"
		TraoChienCuong(10)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(0)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="MËt TÞch Tiªu Dao Toµn ¶nh"}}})
		TraoMatTichCaoCap(2,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,3356,6}, name="Tói Thiªn Th¹ch Tinh Th¹ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,100}, name="Thiªn Kiªu LÖnh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,1}, name="Hßa ThÞ BÝch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B¸o §en"}}})
	end
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,2,1)
	Msg2Player("C¸c h¹ ®· nhËn th­ëng thµnh c«ng")
end

function DuaTop_ViewPersonalPoint()
	local nPoint = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	Talk(1,"",szNpcName.."H«m nay c¸c h¹ ®· ñng hé ®­îc tæng céng <color=red>"..nPoint.."<color> ®iÓm")
end

function DuaTop_ViewBangHoiPoint()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local msgs = {"","","",""}
		
	for i = 1, getn(LIB_txtData.tbTextData) do
		if i <= 50 then
			msgs[1] = msgs[1] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> ®iÓm), "
		elseif i <= 100 then
			msgs[2] = msgs[2] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> ®iÓm), "
		end
	end	
	
	if msgs[1] == "" then
		Talk(1,"",szNpcName.."HiÖn t¹i kh«ng cã bang héi nµo ®¨ng ký tham gia!")
		return
	end
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_UngHo()
	local nConfirmCDKey = GetTask(2840) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 100 then
		Talk(1,"", szNpcName.."C¸c h¹ vui lßng ®Õn TuyÒn Ch©u ñng hé nhÐ!")
		return 
	end
	
	if IsPlayerDeath() == 1 then
		Talk(1,"",szNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ nhËn th­ëng.")	
		return
	end
	
	-- Check Kich ho¹t Khiªu ChiÕn LÖnh
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t Khiªu ChiÕn LÖnh, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	-- Check kÝch ho¹t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t thÎ th¸ng, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end

	--Check gia nhËp m«n ph¸i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ñng hé Bang Héi!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a ®ñ level 90. H·y vÒ nhµ luyÖn thªm råi quay l¹i ®©y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a n©ng cÊp tèi ®· kÜ n¨ng cÊp 55!")
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	if LIB_txtData.tbTextData == nil then
		Talk(1,"","Kh«ng cã bang héi nµo ®¨ng ký tham gia!")
		return
	end	
	
	local tbSay = {}
	tbSay[0] = szNpcName.."C¸c h¹ h·y lùa chän bang héi muèn b×nh chän: "
	for i = 1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay,"Ta muèn b×nh chän bang héi "..LIB_txtData.tbTextData[i][1].."/#DuaTop_UngHo_01("..i..")")
	end
	
	gf_PageSay(tbSay, 1, 6);
end

function DuaTop_UngHo_01(nBang)
	local tbSay = {}
	for i = 1, getn(tbVoteMaterials) do
		tinsert(tbSay,format(tbVoteMaterials[i][3].."/#DuaTop_UngHo_02(%d,%d)",i,nBang))
	end
	tinsert(tbSay,"Rêi Khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn b×nh chän b»ng h×nh thøc nµo?",getn(tbSay),tbSay)
end

function DuaTop_UngHo_02(nType,nBang)
	
	local nPointVote = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	if nPointVote + tbVoteMaterials[nType][1] > Max_Vote_Point then
		Talk(1,"","C¸c h¹ chØ ®­îc nép tèi ®a "..Max_Vote_Point.." ®iÓm trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end
	
	if LIB_Award:CheckMaterial(tbVoteMaterials[nType][2]) ~= 1 then
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,nPointVote + tbVoteMaterials[nType][1])
	LIB_txtData.tbTextData[nBang][5] = LIB_txtData.tbTextData[nBang][5] + tbVoteMaterials[nType][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[5]) > tonumber(y[5]) end)
	LIB_txtData:SaveMultiColumn()
	LIB_Award:PayMaterial(tbVoteMaterials[nType][2])
	Msg2Player("C¸c h¹ ®· b×nh chän thµnh c«ng cho bang héi "..LIB_txtData.tbTextData[nBang][1])
	AddGlobalNews("Sù kiÖn §ua Top Bang Héi Liªn Server: Bang Héi "..LIB_txtData.tbTextData[nBang][1].." ®· ®­îc b×nh chän "..tbVoteMaterials[nType][1].." ®iÓm!")
	DuaTop_UngHo_01(nBang)
end

function DuaTop_ViewListBangHoi()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = getn(LIB_txtData.tbTextData)
	local msgs = {
		szNpcName.."HiÖn t¹i ®· cã "..nCount.." bang héi tham gia sù kiÖn: \n",
		"","","",
	}
	
	for i = 1, nCount do
		if i <= 40 then
			msgs[1] = msgs[1] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		elseif i <= 80 then
			msgs[2] = msgs[2] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		end
	end	
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_DangKy()
	local szTong = GetTongName()
	local szAccount = GetAccount()
	local nLevel = GetLevel()
	local szName = GetName()
	local nPoint = 0
	local nConfirmCDKey = GetTask(2840) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	--Check Kich ho¹t Khiªu chiÕn lÖnh
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t Khiªu ChiÕn LÖnh, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	--Check kÝch ho¹t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a kÝch ho¹t thÎ Xö n÷, kh«ng thÓ ®¨ng ký tham gia!")
		return
	end
	
	--Check cã ph¶i bang chñ?
	local isTong = IsTongMaster()
	if isTong ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i bang chñ. Kh«ng thÓ ®¨ng ký tham gia Bang Héi ®ua top!")
		return
	end
	
	--Check gia nhËp m«n ph¸i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ñng hé Bang Héi!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a ®ñ level 90. H·y vÒ nhµ luyÖn thªm råi quay l¹i ®©y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a n©ng cÊp tèi ®· kÜ n¨ng cÊp 55!")
		return
	end
	
	--Check Cïng server
	if gf_GetTaskByte(TSK_SERVER_ID,1) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ph¶i thÇn d©n bæn quèc, kh«ng ®­îc ®¨ng ký tham gia!")
		return 0
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0	
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNpcName.."Bang héi c¸c h¹ ®· ®¨ng ký thµnh c«ng, kh«ng ®­îc ®¨ng ký thªm lÇn n÷a!")
		return 0
	end
	
	local szLog = szTong.."	"..szAccount.."	"..szName.."	"..nLevel.."	".. nPoint
	LIB_txtData:AddLine(szLog)
	Talk(1,"",szNpcName.."Bang héi c¸c h¹ b¸o danh sù kiÖn §ua Top Bang Héi Liªn Server thµnh c«ng, xin chóc mõng.")
	AddGlobalNews("Chóc mõng bang héi "..szTong.." b¸o danh thµnh c«ng sù kiÖn §ua Top Bang Héi Liªn Server!")
end

function QuaySo8t3_01()
	AskClientForNumber("QuaySo8t3_02",1,10,"NhËp sè lÇn quay")
end

function QuaySo8t3_02(nQuay)
	local QuaySo83 = {	
		{1,500,"M¶nh Thiªn Th¹ch",{2,2,7,1},0},	
		{1,500,"B¸nh Ýt B¸t B¶o",{2,1,1125,2},0},
		{1,1000,"Cöu ChuyÓn Håi Hån §¬n",{1,0,32,5},0},	
		{1,600,"L«i Hæ Tinh Ph¸ch",{2,1,30614,1},0},
		{1,600,"Hu©n ch­¬ng anh hïng",{2,1,30499,4},0},	
		{1,1,"Hßa ThÞ BÝch",{2,1,1001,1},24*3600*7},		
		{1,500,"Tµng R­¬ng",{2,1,30341,1},0},			
		{1,100,"Trøng Linh Thó-Cao",{2,1,30728,1},0},
		{2,2300,10000000,"Kinh NghiÖm",0},
		{2,1546,15000000,"Kinh NghiÖm",0},
		{1,700,"Bµn Long bÝch",{2,1,1000,1},24*3600*7},
		{1,600,"Thiªn Kiªu LÖnh",{2,97,236,1},0},
		{1,50,"Bao Thiªn Kiªu LÖnh Nhá",{2,95,2086,1},0},
		{1,700,"TÈy Tñy Linh §¬n",{2,0,137,1},30 * 24 *3600},
		{1,300,"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1},24*3600*7},	
		{1,1,"Trøng Bæn §iÓu",{2,1,30787,1},0},	
	}
	
	local QuaySo83_02 = {
		[1] = {0,105,10110,1,1,-1,-1,-1,-1,-1,-1,-1,0},
		[2] = {0,105,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0},
	}
	
	if gf_Judge_Room_Weight(10, 50,1) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < (29 * nQuay) then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®em ®ñ "..(29 * nQuay).." Xu vËt phÈm")
		return
	end
	
	if GetOnlineTime() < nQuay * 3600 then
		Talk(1,"",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ "..nQuay.." giê")
		return
	end
	
	local szFileName = "quayso"..date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	LIB_txtData:LoadMultiColumn()	
	
	for i = 1,nQuay do
		local nRand = random(1,10000)
		if DelItem(2,1,30230,29) == 1 then
			SetOnlineTime(3600,2)
			local nRnd = random(1,2)
			local nNum = tonumber(LIB_txtData.tbTextData[nRnd][2])
			if nRand == 540 or nRand == 345 then
				if nRnd == 1 then
					if nNum > 0 then
						gf_AddItemEx2({0,105,10110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Tiªn Du KiÕm", "QuaySoThang4", "nhËn th­ëng ", 0, 1)
						LIB_txtData.tbTextData[nRnd][2] = tonumber(LIB_txtData.tbTextData[nRnd][2]) - 1
						LIB_txtData:SaveMultiColumn()
					else
						gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
					end
				else
					if nNum > 0 then
						gf_AddItemEx2({0,105,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, "B¸o §en B¶o B¶o", "QuaySoThang4", "nhËn th­ëng ", 0, 1)
						LIB_txtData.tbTextData[nRnd][2] = tonumber(LIB_txtData.tbTextData[nRnd][2]) - 1
						LIB_txtData:SaveMultiColumn()
					else
						gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
					end
				end
			else
				gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
			end
			gf_WriteLogEx("QuaySoThang4", "NhanThuong", 0, "VatPhamQuaySo");		
		end
	end
end

function Award8t3()
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		Talk(1, "", "B¹n ch­a ®¹t cÊp 90 nªn kh«ng thÓ nhËn th­ëng.")	
		return 0;
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "B¹n ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if GetSex() ~= 2 then		
		Talk(1, "", "Ngµy Phô N÷ nªn chØ cã Phô N÷ míi ®­îc nhËn th­ëng.")
		return 0
	end
	if GetTask(2731) >=1 then
		Talk(1, "", "B¹n ®· nhËn th­ëng råi.")
		return 0
	end
	SetTask(2731,1)
	gf_ModifyExp(10000000);
	AwardGenuineQi(9999);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho¹t ®éng chµo mõng 8/3 n¨m 2015");
	gf_AddItemEx2({2, 1, 30499, 10, 4}, "Hu©n ch­¬ng anh hïng", "Ho¹t ®éng chµo mõng 8/3 n¨m 2015", "Hu©n ch­¬ng anh hïng", 0, 1);
	local tAward = {
		{1, 14000, "Thá ®en", {0, 105, 30039, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "NguyÖt L­îng Thè", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 15998, "§éc Gi¸c Thó B¶o B¶o", {0, 105, 30032, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "Hång Mao Ng­u B¶o B¶o", {0, 105, 30023, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B¸o Vµng B¶o B¶o", {0, 105, 30046, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B¸o Tr¾ng B¶o B¶o", {0, 105, 30047, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B¸o §en B¶o B¶o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 1, "B¸o §en B¶o B¶o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "NguyÖt L­îng Thè", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Hoat dong mung 8/3 nam 2015", "Tói quµ 8/3");	
end

function NhiemVuTrongCay()
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 1 then
		Talk(1,"",szNpcName.."C¸c h· ®· nhËn nhiÖm vô råi. H·y mau chãng ®i thu ho¹ch c¸c lo¹i c©y mau lªn, ®õng chËm trÔ!")
		return
	end
	
	gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,3,1)
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn nhiÖm vô thµnh c«ng. H·y mau chãng ®i thu ho¹ch c¸c lo¹i c©y mau lªn, ®õng chËm trÔ!")
end

function NhiemVuTrongCay_award()
	--Byte 1,2 : So lÇn. Byte 3: nhËn nv, Byte 4: nhËn th­ëng
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a nhËn nhiÖm vô mµ muèn nhËn th­ëng sao?")
		return
	end
	
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,4) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng ngµy h«m nay råi!")
		return
	end
		
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,1) < 6 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a thu ho¹ch ®ñ 6 c©y tø linh!")
		return
	end
	
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,2) < 8 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a thu ho¹ch ®ñ 8 c©y b¸t nh· nhá!")
		return
	end
			
	if gf_Judge_Room_Weight(1, 100, 1) ~= 1 then
		return 0;
	end
	
	if GetItemCount(2,1,30230) < 8 then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®em ®ñ 8 Xu vËt phÈm")
		return
	end
	
	if DelItem(2,1,30230,8) == 1 then		
		gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,4,1)
		--Award
		ModifyExp(21000000)
		gf_AddItemEx2({2, 0, 1082, 15}, "M¶nh Th¸i DÞch", "NhiemVuTrongCay_042015", "M¶nh Th¸i DÞch", 0, 1);
		--ModifyYinJuan(100, 1) -- Ng©n PhiÕu
		gf_WriteLogEx("NhiemVuTrongCay_042015", "NhanThuong", 0, "VatPhamNhiemVuTrongCay");	
	end
end

function change_MatTich20(nType)
	if nType == 1 then
		PutinItemBox("§æi mËt tÞch 20%" ,3 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", LASA_FILE, 1)
	elseif nType == 2 then
		PutinItemBox("§æi mËt tÞch 20%" ,5 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", LASA_FILE1, 1)
	end
end
function change_ChimBang()
	local nBody = GetBody()
	local tChimBang = {
					[1] = {0,120,255},
					[2] = {0,120,256},
					[3] = {0,120,257},
					[4] = {0,120,258},
				}
	if gf_Judge_Room_Weight(1, 100, 1) ~= 1 then
		return 0;
	end			
	if GetItemCount(tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3]) < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng cã mang theo B¨ng §iÓu ®Ó ®æi.")
		return 0
	end
	if DelItem(tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3],1) == 1 then
		gf_AddItemEx2({tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3],1}, "B¨ng §iÓu", "DOI NGOAI TRANG CHIM BANG", "Chimbang", 0, 1);
		gf_WriteLogEx("DOINGOAITRANGCHIMBANG", "change", 0, "chim bang");	
	end
end
function buy_nguyenlieu_lasa()
	local tSay = {};
--	tinsert(tSay, "Ta muèn mua 2000 giÊy xu©n ®á (tiªu hao 15 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu_lasa(1)")
	tinsert(tSay, "Ta muèn mua 2000 DiÒu GiÊy (tiªu hao 80 vµng)/#finish_buy_nguyenlieu_lasa(2)")
--	tinsert(tSay, "Ta muèn mua 2000 mùc tµu (tiªu hao 15 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu_lasa(3)")
	tinsert(tSay, "Ta muèn mua 2000 Con Quay (tiªu hao 100 vµng)/#finish_buy_nguyenlieu_lasa(4)")
--	tinsert(tSay, "Ta muèn mua 2000 §¹i C¸t (tiªu hao 50 Tiªu Dao Ngäc)/#finish_buy_nguyenlieu_lasa(5)")
	tinsert(tSay, "Ta muèn mua 2000 Robot (tiªu hao 120 vµng)/#finish_buy_nguyenlieu_lasa(6)")
	tinsert(tSay, "Tho¸t/nothing")
	local szHeader = "<color=green>Gi¸o SÜ:<color>HiÖn t¹i ta cã rÊt nhiÒu nguyªn liÖu event:"
	Say(szHeader, getn(tSay), tSay);
end
function finish_buy_nguyenlieu_lasa(nType)
	local tnguyenlieu = {--x, x, sè l­îng tiªu dao ngäc, vµng
--				[1] = {31018, "X¹ h­¬ng", 15, 0},	
				[2] = {13, "DiÒu GiÊy", 0, 80},	
--				[3] = {31019, "Tói Th¬m", 15, 0},	
				[4] = {14, "Con Quay", 0, 100},	
--				[5] = {31020, "Tói Th¬m §Æc BiÖt", 50, 0},	
				[6] = {15, "Robot", 0, 120},	
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
	gf_AddItemEx2({2,200,tnguyenlieu[nType][1],2000}, "nguyªn liÖu", "MUA NGUYEN LIEU THANG 2020", "Mua nguyªn liÖu")
end

--------------------

function _gold_exchange_talk(nType)
	local tType = {
					[1] = {1},
					[2] = {10},
					[3] = {100},
--					[4] = {1000},
				}

	if gf_Judge_Room_Weight(4, 300 , "") ~= 1 then
			return 0
	end
	if GetItemCount(2, 200, 19) < 10*tType[nType][1] then
		Talk(1, "", "B¹n kh«ng mang ®ñ Bót Mùc, h·y kiÓm tra l¹i.")
		return 0
	end
	if GetItemCount(2, 200, 20) < 10*tType[nType][1] then
		Talk(1, "", "B¹n kh«ng mang ®ñ TËp Vë, h·y kiÓm tra l¹i.")
		return 0
	end
	if GetCash() < 100000*tType[nType][1] then
		Talk(1, "", "B¹n kh«ng mang ®ñ vµng, h·y kiÓm tra l¹i.")
		return 0
	end
	local nItem1 = 0
	local nItem2 = 0
	for i=1,tType[nType][1] do
		if random(100)<=50 then--50%³É¹¦ÂÊ
			nItem1 = nItem1 + 1
		else
			nItem2 = nItem2 + 1
		end
	end
	if DelItem(2, 200, 19, 10*tType[nType][1]) == 1 and DelItem(2, 200, 20, 10*tType[nType][1]) == 1 and Pay(100000*tType[nType][1]) == 1 then
		gf_AddItemEx2({2, 200, 22,nItem1}, "Kû YÕu", "PHAN THUONG EVENT MO RONG", "nhËn më réng event b»ng vµng")
		gf_AddItemEx2({2, 200, 23,nItem2}, "L­u Bót", "PHAN THUONG EVENT MO RONG", "nhËn më réng event b»ng vµng")
	else
		gf_WriteLogEx("PHAN THUONG EVENT MO RONG", "thÊt b¹i", 1, "§æi thÊt b¹i")	
	end
end