--=============================================
--create by baiyun 2009.11.17
--describe:Խ�ϰ�12�·ݻ ���Ҵ��¼�
--=============================================

Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua") -- IP bonus
Include("\\script\\online\\viet_event\\shop_tieuquyen\\tieuquyen_npc.lua");
Include("\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
Include("\\script\\task\\faction_boss\\wulinmeng_teshi.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\viet_event\\firework_10\\head.lua");			-- include file ph�o hoa 20-11-2010
Include("\\script\\online\\viet_event\\firework_10\\head1.lua");
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_qiannian.lua");
Include("\\script\\online\\viet_event\\bhta4\\register5.lua")
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua");
Include("\\script\\online_activites\\2011_09\\activity_02\\head.lua");
Include("\\script\\online_activites\\2011_10\\activity_04\\plant_flower.lua");
Include("\\script\\online_activites\\2011_10\\activity_02\\send_flowers.lua");
Include("\\script\\online_activites\\2011_11\\activity_03\\send_gift.lua");
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua");
--Include("\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua");
--Include("\\script\\online_activites\\2011_12\\lilishishi\\send_gift.lua");
--Include("\\script\\online_activites\\2011_12\\wupanguo\\silin_dogz.lua");
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua") 
Include("\\script\\online\\viet_event\\platinum_card\\npc_platinum.lua")
Include("\\script\\online\\viet_event\\vipcare\\vipcare.lua");
Include("\\script\\online\\viet_event\\denbuthang4\\denbuthang4.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online_activites\\201211\\christmas_tree.lua") 
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
Include("\\script\\online_activites\\201309\\plant_flower.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\award\\traothuong3ty.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\function\\vip_card\\ac_head.lua")
Include("\\script\\online_activites\\201410\\plant_flower.lua")
Include("\\script\\online_activites\\201501\\item_shijinzongzi.lua")
Include("\\script\\online_activites\\201501\\gouhuo.lua")
Include("\\script\\online_activites\\201502\\item_xunchun.lua")
Include("\\script\\online_activites\\201503\\shangpinxiangshui.lua")
Include("\\script\\function\\weaponeffect_new\\main.lua")
Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')
Import("\\script\\isolate\\online_activites\\monthly_goals\\mg_head.lua")

function SelectSay()	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
	local nDate = tonumber(date("%Y%m%d"))
	local szNationality = get_nationality_name(GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR))
   	
     --tbSayDialog, szSayHead = get_tbJNDialog_info(tbSayDialog, szSayHead)
     --szSayHead = szSayHead..format(" B�n �ang l� th�n d�n c�a <color=yellow>%s qu�c<color>.", szNationality)

	if VET_CheckIpBonus() == 1 then
		szSayHead = szSayHead..". Hi�n �ang ch�i t�i <color=yellow>Ph�ng M�y Th�n Thi�n<color>."
	end
		--����vip�¿�
	--if vc_IsVipCardOpen() ~= 0 then
	--	tinsert(tbSayDialog, vc_GetMainTitle()) 
	--end
	--------------------------------
	--Nh�n th��ng l�i trang b� di�u d��ng b� l�i event th�ng 3/2014
	if nDate >= 20140329 and nDate <= 20140405 then
		local nCheck_ext = GetExtPoint(5)
		if nCheck_ext == 1 then
			tinsert(tbSayDialog, "Nh�n th��ng l�i event th�ng 3/get_award201403")
		end
	end
	--tinsert(tbSayDialog, format("S� ki�n %s/monthlyEvent_OnNpcTalk", g_monthlyEvent_Name)) --LongDaiKa: ��ng event h�ng th�ng
	----------------------------------
--	if nDate >= 20120611 and nDate <= 20120718 then
--		tinsert(tbSayDialog, "M� R��ng Th�n T�i ��n Phi�n B�n M�i/get_Invite")
--	end	
--  	if nDate >= 20120308 and nDate <= 20120508 then
--		tinsert(tbSayDialog, "Nh�n th��ng T�n Th� L�nh /get_NewRegis")
--	end
--   	-- Event th�ng 11
--     if nDate >= 20111111 and nDate <= 20111212 then
--    		tinsert(tbSayDialog, VET_201111_STRING_LIST[1].."/active_fire_for_warm")
--		tinsert(tbSayDialog, VET_201111_STRING_LIST[2].."/buy_match")
--		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TWO[1].."/send_flower")
--	end
--
--	if nDate >= 20110722 and nDate <= 20110821 then
--  		tinsert(tbSayDialog, "Ch�o m�ng s� ki�n Kem SoCola /ChangeSoCola")
--  	end
--  	if nDate >= 20110617 and nDate <= 20110710 then
--   		tinsert(tbSayDialog, "��i Sinh t� tr�i c�y (c�n 5 tr�i c�y m�a h� + 2 V�t ph�m Xu)/VET_201102_Operating_SinhTo")
--   	end
--    if nDate >= 20110422 and nDate <= 20110616 then
--    		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
--    		tinsert(tbSayDialog,gf_VnGetChangeSaySel("201104LiberationChg2").."/#VET201104CHG(2)")
--    		tinsert(tbSayDialog, "��i B� Hoa Chi�n Th�ng (c�n 5 Hoa Chi�n Th�ng + 2 V�t ph�m Xu)/VET_201104_304_MassExchange")
--    		tinsert(tbSayDialog, "N�p b� hoa chi�n th�ng/VET_201104_give_Winflower")
--    end
--    
--     if nDate >= 20110121 and nDate <= 20110220 then
--     		tinsert(tbSayDialog, PB_menu[7])
--     end
     


--	if nDate >= 20110304 and nDate <= 20110410 then
--		  tinsert(tbSayDialog, "T�ng k�o S�c�la m�ng ng�y qu�c t� ph� n� 8/3 (c�n 10 S�c�la)/VET_201102_give_chocolate");
--	end
--	
--	--Event th�ng 12
--	if nDate >= 20111216 and nDate <= 20120108 then
--    		tinsert(tbSayDialog, tSTRING_201111_ACTIVITY_TB[1].."/send_gift")
--    		tinsert(tbSayDialog, format(tSTRING_DECORATETREE_TABLE[1],VET_201111_TREE_VALUE).."/sale_christmas_tree")
--	end
--

--	-- ****************** Event Ph�o hoa 20101116 ******************
--	if nDate >= 20110405 and nDate <= 20110421 then
--		tinsert ( tbSayDialog, "Nh�n bao l� x�/VET_201102_give_dahongbao" )
--	end	
--	-- ****************** Nh�n max event � m�c 4000******************
--	if nDate >= 20120727 and nDate <= 20120812 then		
--		tinsert ( tbSayDialog, "Nh�n th��ng s� d�ng lo�i t�i �a v�t ph�m event/prize_max_event_thang7" )
--	end
--	
--
--	if nDate >= 20100917 and nDate <= 20101024 then
--		tinsert(tbSayDialog,"Nh�n v�t ph�m K� Ni�m 1000 N�m Th�ng Long/get_1000_tl")
--	end
	
--	if CheckTongJoinRoseWar() == 1 and nDate <= 20110410 then
--		-- ��i hoa h�ng v�ng t� hoa h�ng ph�n
--		tinsert(tbSayDialog, "Ta mu�n ��i Hoa H�ng V�ng (5 Hoa H�ng Ph�n + 2 Xu)/bhta5_exchange_rose")
--		tinsert(tbSayDialog, "Ta mu�n ��i Hoa H�ng V�ng (5 Hoa H�ng Ph�n + 7 V�ng)/bhta5_exchange_rose2")
--		-- S� d�ng hoa h�ng v�ng
--		tinsert(tbSayDialog,"S� d�ng hoa h�ng v�ng/UseYellowRose")
--	end
   	if nDate >= 20140318 and nDate <= 20140320 then
		tinsert(tbSayDialog, "Trao gi�i li xi 3 t�/TraoThuong2Ty_Menu")
	end
	local tbFeatureMenu = FeatureMenu()
	if nDate >= 20151008 and nDate <= 20151031 then
--		tinsert(tbSayDialog, "Mua 1000 H� Keo (ti�u hao 79 v�ng)/#nguyenlieu_thang4(1)")
--		tinsert(tbSayDialog, "Mua 1000 Gi�y Ng� S�c (ti�u hao 79 v�ng)/#nguyenlieu_thang4(2)")
		tinsert(tbSayDialog, "Event Ch�nh Th�ng 10/EventMenu")
--		tinsert(tbSayDialog, "Ho�t ��ng Th� Th�ng 9/ac_MainDialog")
		--tinsert(tbSayDialog, "Event M�m Hoa Th�ng 10/EventMenu_MamHoa")
	end
	if nDate >= 20130919 and nDate <= 20131013 then	
--		tinsert(tbSayDialog, "Event M�m C�y/Event_Tree_Thang5")
	end
	if nDate >= 20130919 and nDate <= 20131013 then
		tinsert(tbSayDialog, "Event Hoa H�ng/VET_201309_AdditionDialog")
	--	tinsert(tbSayDialog, "Mua c�y th�ng Noel (gi� 68 v�ng/1c�y)/buy_christmas_tree_coin")	
	--	tinsert(tbSayDialog, "Mua c�y th�ng Noel (gi� 19 Xu v�t ph�m/1c�y)/buy_christmas_tree_xu")			
	end
	if nDate >= 20130910 and nDate <= 20130915 then
		tinsert(tbSayDialog, "Nh�n 1000 nguy�n li�u Event ( ti�u hao 100 v� l�m b�o h�p + 100 v�ng )/EventThang8_HoTro1")
		tinsert(tbSayDialog, "Nh�n 1000 nguy�n li�u Event ( ti�u hao 39 xu v�t ph�m )/EventThang8_HoTro2")
	end
	
	for i=1,getn(tbFeatureMenu) do
		tinsert(tbSayDialog, tbFeatureMenu[i])
	end
	--tinsert(tbSayDialog,1,"V� Kh� U�n Linh/WEfMainDialog")

	if mg_CheckOpen() == 1 then
		tinsert(tbSayDialog,"Hi�p Kh�ch H�nh/_OpenMonthlyGoals")
	end

	tinsert(tbSayDialog,"\nK�t th�c ��i tho�i/dialog_over"	)

	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function _OpenMonthlyGoals()
	SendScript2Client("Open([[MonthlyGoals]]);");
end

function Event_Tree_Thang5()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
	tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/do_nothing"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function EventMenu_MamHoa()

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
	
	tbSayDialog,szSayHead = VET_201410_AdditionDialog(tbSayDialog, szSayHead);
	
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function EventMenu()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
	tbSayDialog, szSayHead = get_tbJNDialog_info(VET_JN_ACTIVITY_TABLE)
--	tbSayDialog,szSayHead = VET_201501_AdditionDialog(tbSayDialog, szSayHead);
--	tbSayDialog,szSayHead = VET_201501_AddGouHuoDialog(tbSayDialog, szSayHead);
--	tbSayDialog,szSayHead = VET_201502_AdditionDialog(tbSayDialog, szSayHead);
--	tbSayDialog,szSayHead = VET_201503_AdditionDialog(tbSayDialog, szSayHead);
	
	local szNationality = get_nationality_name(GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR))
     szSayHead = szSayHead..format(". B�n �ang l� th�n d�n c�a <color=yellow>%s qu�c<color>.", szNationality)
	if VET_CheckIpBonus() == 1 then
		szSayHead = szSayHead..". Hi�n �ang ch�i t�i <color=yellow>Ph�ng M�y Th�n Thi�n<color>."
	end
	
	-- if GetTask(2766) == 4000 and GetTask(2767) == 4000 and GetTask(2768) == 4000 and gf_GetTaskByte(2731,1) == 0 then
		-- gf_SetTaskByte(2731, 1, 1)
	-- end

	-- if gf_GetTaskByte(2731,1) == 1 then
		-- tinsert(tbSayDialog,"Nh�n ph�n th��ng 4000 Nh�nh ��o,400 Nh�nh Mai,4000 N� T�m Xu�n/#EventT201502_Max4000_Menu(1)")
	-- end
	
	-- if GetTask(2766) == 4000 and gf_GetTaskByte(2731,2) == 0 then
		-- tinsert(tbSayDialog,"Nh�n ph�n th��ng 4000 Nh�nh ��o/#EventT201502_Max4000_Menu(2)")
	-- end
	-- if GetTask(2767) == 4000 and gf_GetTaskByte(2731,3) == 0 then
		-- tinsert(tbSayDialog,"Nh�n ph�n th��ng 4000 Nh�nh Mai/#EventT201502_Max4000_Menu(3)")
	-- end
	-- if GetTask(2768) == 4000 and gf_GetTaskByte(2731,4) == 0 then
		-- tinsert(tbSayDialog,"Nh�n ph�n th��ng 4000 N� T�m Xu�n/#EventT201502_Max4000_Menu(4)")
	-- end
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function FeatureMenu()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%Y%m%d%H"))

--     tbSayDialog, szSayHead = VET_201012_03_JingNangDaShiJiangDialog(szSayDialog, szSayHead); 
    	  	 
--	tinsert(tbSayDialog,"Mua 10 L� Th�y = 1 v�ng/BuyWater")
--	tinsert(tbSayDialog, "Mua thu�c tr� b�nh/NT_Dialog2")
	
-- Den bu thang 4
--	if nDate>=20120510 and nDate<=20120512 then
--		tinsert(tbSayDialog,"��n b� th�ng 4/DenBuThang4")
--	end
	-- ****************** Quay s� Ingame th�ng 2012******************
	if nDate >= 20131219 and nDate < 20140101 then
		tinsert(tbSayDialog,"Nh�n th��ng may m�n/lucky_award")		
	end	
	-- Vipcare thang 4
	if nDate>=20120420 and nDate<=20120722 then
		tinsert(tbSayDialog, "Ta mu�n nh�n th��ng VIP/VipCareAward");
	end

--     if nDate >= 20110826 and nDate <= 20111002 then
--  		--tinsert(tbSayDialog, "N��ng b�nh Trung Thu /#VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead)")
--  		tinsert(tbSayDialog, VET_201108_STRING_LIST[14].."/active_show")
--		tinsert(tbSayDialog, VET_201108_STRING_LIST[1].."/active_oven")
--		tinsert(tbSayDialog, VET_201108_STRING_LIST[2].."/buy_match_201108")
--  	end
  	
--	if nDate >= 20110624 and nDate <= 20110703 and (nNation == 10 or nNation == 52 or nNation == 17 or nNation == 3) then
--		tinsert(tbSayDialog,"Ta mu�n s� nh�n ph�n th��ng vinh d� server trong cu�c thi Karaoke/reward_karaoke_2011")
--	end
--	
--	if nDate >= 20100917 and nDate <= 20100924 and (nNation == 6 or nNation == 4 or nNation == 51 or nNation == 3) then
--		tinsert(tbSayDialog,"Ta mu�n s� d�ng ph�o hoa th�n t��ng V� L�m 2/use_firework1")
--	end
--	
--	if nDate >= 20110422 and nDate <= 20110529 then
--    		szSayHead = VET_STR_201104_LIBERATION_OPERATING_DLG[4]
--    		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[1])
--		tinsert(tbSayDialog,VET_STR_201104_LIBERATION_OPERATING_DLG[2])
--    	end
--	
--	 if nDate >= 20110401 and nDate <= 20110417 then
--    		szSayHead = VET_TB_201103_OPERATING_DLG[1]
--    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[5],"VET_201103_Operating_SetAwardModeDlg"))
--    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[4],"VET_201103_Operating_GetFinalAwardDlg"))
--     end
--     
--     if nDate >= 20110125 and nDate <= 20110327 then
--     		szSayHead = "Ho�t ��ng th�ng 3 di�n ra trong th�i gian t� ng�y 25 th�ng 2 n�m 2011 ��n 24 gi� ng�y 27 th�ng 3 n�m 2011, n�i dung chi ti�t t�i trang ch�."
--     		tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[5],"VET_201102_Operating_SetAwardModeDlg"))
--     	end
     	--tinsert(tbSayDialog,"Nh�n th��ng Ho�ng Kim L�nh B�i/golden_award")	
 --    if nDate >= 20121129 then
--		tinsert(tbSayDialog,"Nh�n th��ng L�i H� L�nh/platinum_award")	
--	end
	--Ph�o hoa m�ng phi�n b�n m�i th�ng 9
	--if nDate >= 20110820 and nDate <= 20191231 then
		tinsert ( tbSayDialog, "Nh�n Ph�o Hoa Chi�n Th�ng/Confirm_VET_201106_Give_Fire" )	--VET_201106_Give_Fire
	--end
--	tinsert(tbSayDialog,"Ta mu�n ��i 1 ��i Ng�n Phi�u l�y 100 v�t ph�m Xu/exchange_xu")	
--	tinsert(tbSayDialog,"Nh�n th��ng t�ch l�y online/IpBonus")	
	tinsert(tbSayDialog,"B�n ��ng H�nh/pet_init")
--	tinsert(tbSayDialog,"Ta mu�n mua m�t n� S�t Th� ���ng (60 v�ng)/buy_mask")	
--	tinsert(tbSayDialog,"Ta mu�n n�p C�i Kh�/give_wood_201012")	
--	if nDate >= 20110422 and nDate <= 20110529 then
--		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[1],VET_TB_201102_PLANT_NPC_NAME[1]),"VET_201102_Plant_ActiveCheck"));
--		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[2],VET_TB_201102_PLANT_ITEM_TITLE[1], 1,VET_TB_201102_PLANT_ITEM_TITLE[1],20,VET_TB_201102_PLANT_ITEM_TITLE[2]),"VET_201102_Plant_BuyItem"));
--	end
	
--	tinsert(tbSayDialog,"Trang tr��c/SelectSay")
--	tinsert(tbSayDialog,"Trang sau/NextPage2")
--	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	return tbSayDialog
end


function NextPage()
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function NextPage2()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch�."
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%Y%m%d"))

      if nDate >= 20101210 and nDate <= 20110109 then
    		szSayHead = "<color=yellow>Ho�t ��ng m�ng Gi�ng Sinh<color> b�t ��u t� <color=red>ng�y 10/12/2010 ��n ng�y 09/1/2011<color>. N�i dung chi ti�t vui l�ng t�m hi�u t�i trang ch�."
   	 end
   	 
     if nDate >= 20110401 and nDate <= 20110417 then
    		szSayHead = VET_TB_201103_OPERATING_DLG[1]
    		tinsert(tbSayDialog, format("%s/%s",VET_TB_201103_OPERATING_DLG[4],"VET_201103_Operating_GetFinalAwardDlg"))
     end
     
     if nDate >= 20110125 and nDate <= 20110327 then
     		szSayHead = "Ho�t ��ng th�ng 3 di�n ra trong th�i gian t� ng�y 25 th�ng 2 n�m 2011 ��n 24 gi� ng�y 27 th�ng 3 n�m 2011, n�i dung chi ti�t t�i trang ch�."
     		tinsert(tbSayDialog, format("%s/%s",VET_TB_201102_OPERATING_DLG[4],"VET_201102_Operating_GetFinalAwardDlg"))
     	end

--	tinsert(tbSayDialog,"��i v�t ph�m C�ng Th�nh/exchange_citywar")	
--	tinsert(tbSayDialog,"Chu�c l�i qu�n c�ng t�n th�t trong ng�y (1 �i�m = 2 b�c)/take_jungong_back")
	--tinsert(tbSayDialog,"Trang tr��c/NextPage")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)

	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function Viet_0912_GetXiangCaoDanGao()
	local SourceTable = {{"C�y K�o Gi�ng Sinh", {2, 1, 30138, 4}}, {"�ng gi� tuy�t", {2, 1, 30125, 1}}};
	local DestTable = {{"B�nh Kem Vani", 100, {2, 1, 30124, 1}}};
	if GetItemCount(2,1,30138) < 4 or GetItemCount(2,1,30125) < 1 then
		Talk(1,"SelectSay","Nguy�n li�u kh�ng ��!")
		return
	end
	local szFullTitle = VIET_0912_STR_EVENT_LOG_TITLE
	gf_ExchangeItem(SourceTable, DestTable, szFullTitle, 0, 0, 1, 10, VIET_0912_NPC_NAME_1, 1);
	SelectSay()	
end

function Viet_0912_GetMaxXiangCaoDanGao()
	if GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT) > VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		Talk(1, "", "B�n �� nh�n ph�n th��ng n�y r�i!")
		return 0;
	end
	if GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT) == VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		if GetFreeItemRoom() < 2 then	
			Talk(1, "", "H�nh trang ng��i kh�ng �� 2 � tr�ng!")
			return 0;
		end
		SetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT, VIET_0912_TASK_XIANGCAODANGAO_COUNT + 1)
		ModifyExp(20000000)
		local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
		gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD_FULL, 10000, 2, szFullLogTitle, "Max Event");
	else
		Talk(1, "", "B�n ch�a s� d�ng �� s� l��ng B�nh Kem Vani!");
	end
end

function clear_pk_value()
	local nPK = GetPKValue()
	if nPK == 0 then
		Talk(1, "", "�i�m PK hi�n t�i c�a c�c h� �ang l� 0, kh�ng c�n ph�i t�y PK!")
		return
	else	
		local tbSayDialog = {}
		local nSaySize = 0
		local szSayHead = format("�i�m PK c�a c�c h� �ang l� %d, c�n c� %d gi� �y th�c B�ch C�u Ti�n ��n, %d gi� �y th�c Tam Thanh Ti�n ��n, %d gi� �y th�c L�c Th�n Ti�n ��n �� ti�n h�nh t�y �i�m. C� mu�n t�y �i�m PK kh�ng?", nPK, nPK*2, nPK, nPK)
		tinsert(tbSayDialog,"��ng �/clear_pk")
		tinsert(tbSayDialog,"Kh�ng ��i n�a/dialog_over")
		nSaySize = getn(tbSayDialog)
		Say(szSayHead, nSaySize, tbSayDialog)
	end
end

function clear_pk()
	local nPK = GetPKValue()
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	
	if nExBigBCH < (120 * nPK) then
		Talk(1,"",szNpcName.."Kh�ng �� gi� �y th�c B�ch C�u Ti�n ��n!")
		return
	elseif nExBigTTH < (60 * nPK) then
		Talk(1,"",szNpcName.."Kh�ng �� gi� �y th�c Tam Thanh Ti�n ��n!")
		return
	elseif nExBigLTH < (60 * nPK) then
		Talk(1,"",szNpcName.."Kh�ng �� gi� �y th�c L�c Th�n Ti�n ��n!")
		return
	else
		SetTask(2508,nExBigBCH - (120 * nPK))
		EatLiushen(3,-(60 * nPK))
		EatSanqin(3,-(60 * nPK))
		AddPKValue(nPK * (-1))
		WriteLogEx("Hoat dong thang 5","t�y "..nPK.." �i�m PK")			
	end
end

function exchange_xu()
	if GetItemCount(2,1,199) < 1 then
		Talk(1, "", "��i hi�p ch�a mang theo ��i Ng�n Phi�u m� ��i ��i Xu �?")
		return
	end
	if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        	return
    end
    if DelItem(2,1,199,1) == 1 then
    		gf_AddItemEx2({2,1,30230, 100}, "Xu", "Doi Dai Ngan Phieu ra Xu", "CNDSK")
    end
    SelectSay()
end

function dialog_over()
end

  --Nh�n ph�o hoa m�ng phi�n b�n TMT
function VET_201106_Give_Fire()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead ="Nh�n ph�o hoa m�i ng�y. ��i hi�p c� th� s� d�ng ch�c n�ng VIP �� nh�n ��i �i�m khi s� d�ng ph�o hoa."
	
	tinsert(tbSayDialog,"Nh�n ph�o hoa m�i ng�y/Confirm_VET_201106_Give_Fire")	
	--tinsert(tbSayDialog,"K�ch ho�t s� d�ng ph�o hoa d�ng VIP (ti�u hao 12 Xu v�t ph�m)/Active_VET_201106_Give_Fire")		
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)

	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function Active_VET_201106_Give_Fire()
	VietResetDate()
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) == 1 then
		Talk(1, "", "H�m nay b�n �� k�ch ho�t s� d�ng ph�o hoa d�ng VIP r�i !!!!")
		return
	end
	if GetTask(TSK_ACTIVE_VIP_PHAOHOA) ~= 0 then
		Talk(1, "", "H�m nay b�n �� k�ch ho�t s� d�ng ph�o hoa d�ng Th��ng r�i !!!!")
		return
	end

	if GetItemCount(2,1,30230) < 12 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� Xu v�t ph�m �� kick ho�t VIP?")
		return
	end
	DelItem(2,1,30230,12)
	SetTask(TSK_ACTIVE_VIP_PHAOHOA, 1)
	gf_WriteLogEx("KICK HOAT VIP", "kick ho�t th�nh c�ng", 1, "VIP ph�o hoa")
end


function Confirm_VET_201106_Give_Fire()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end	
	if GetLevel() < 73 then
		Talk(1, "", "��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng n�y!")
		return
	end
	
--	if nDate > 121230 then
--		Talk(1,"","�� h�t th�i h�n s� ki�n!")
--		return
--	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	local nMaxRecv = 60
	if nCount >= 1 then
		Talk(1,"","H�m nay ��i hi�p �� h�t l�n nh�n ph�o hoa !!!")
		return
	end
	
--	if nCount == 1 then
--		if GetCash() < 1600000 then
--			Talk(1,"","��i hi�p kh�ng mang theo �� v�ng !!!")
--			return
--		end
--		Pay(1600000)
--		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph�o Hoa m�ng phi�n b�n m�i l�n 2", "Phao hoa phien ban moi thang 6", "nh�n "..nMaxRecv.." Ph�o hoa")
--	elseif nCount ==2 then
--			if GetItemCount(2,1,30230) < 40 then
--			Talk(1,"","��i hi�p kh�ng mang theo �� Xu v�t ph�m !!!")
--			return
--		end
--		DelItem(2,1,30230,40)
--		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Ph�o Hoa m�ng phi�n b�n m�i l�n 3", "Phao hoa phien ban moi thang 6", "nh�n "..nMaxRecv.." Ph�o hoa")
--	else
		gf_AddItemEx2({2, 1, 30297, nMaxRecv, 4}, "Nh�n Ph�o Hoa m�i ng�y", "Phao hoa CNDSK 2013 bk", "nh�n "..nMaxRecv.." Ph�o hoa")
		gf_WriteLogEx("Phao hoa CNDSK 2013", "nh�n 60 ph�o hoa", 1, "Nh�n Ph�o Hoa m�i ng�y")
--	end
	
	Msg2Player("B�n nh�n ���c "..nMaxRecv.." ph�o hoa.")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function reward_karaoke_2011()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 110703 then
		Talk(1,"","�� h�t th�i gian nh�n th��ng!")
		return
	end
	
	if nNationality ~= nNation then
		Talk(1, "", "B�n kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	
	if gf_GetTaskBit(TSK_GIVE_AWARD_CNDSK, BIT_KARAOKE2011) == 1 then
		Talk(1, "","B�n �� nh�n ph�n th��ng r�i")
		return
	end
	
	if GetLevel() < 73 then
		Talk(1, "", "��ng c�p 73 tr� l�n m�i c� th� nh�n th��ng!")
		return
	end
	
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a v� m�n ph�i n�n kh�ng th� nh�n th��ng!" )
		return
	end
	
	local tKaraokeAward = 
	{
		[3]   = 30000000,
		[10] = 10000000,
		[17] = 20000000,
		[52] = 10000000,
	}
	
	local nExp = tKaraokeAward[nNationality]
	gf_SetTaskBit(TSK_GIVE_AWARD_CNDSK, BIT_KARAOKE2011, 1)
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m")
end	
------------------------
-- ��i Kem Socola l�y �i�m kinh nghi�m
function ChangeSoCola()
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(TKS_KSOCOLA_TIMES)/100)
	if nDate ~= nCurdate then
		SetTask(TKS_KSOCOLA_TIMES , nDate*100)
	end
	if GetItemCount(2,1,30325) < 10 then
		Talk(1,"","��i hi�p mang kh�ng �� 10 Kem Socola")
		return
	end
	local nUse = mod(GetTask(TKS_KSOCOLA_TIMES),100)
	if nUse >= 4 then
		Talk(1,"","H�m nay ��i hi�p ��i 4 l�n r�i. Ng�y mai quay l�i")
		return
	end
	
	if DelItem(2,1,30325,10) == 1 then
		ModifyExp(2500000)
		Msg2Player("B�n �� nh�n ���c 2500000 �i�m kinh nghi�m")
		SetTask(TKS_KSOCOLA_TIMES,GetTask(TKS_KSOCOLA_TIMES)+1)
	end
end

tbItem = {
	{{2,1,30086,24,4}, "H�t gi�ng", 7*24*60*60},
	{{2,1,9999,1,4},"Qu�n C�ng Ch��ng", 7*24*60*60},
	{{2,1,9998,1,4},"Qu�n C�ng ��i", 7*24*60*60},
	{{2,1,9977,1,4},"Qu�n C�ng Huy Ho�ng", 7*24*60*60},
	{{2,1,1017,1,4}, "S� m�n l�nh k�", 7*24*60*60},

}
function get_NewRegis()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(30, 100," ") ~= 1 then
        	return
    end
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1, "", "��i hi�p ch�a k�ch ho�t code ho�c �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng ���c n�a!!!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			for i = 1, getn(tbItem) do
				gf_AddItemEx2(tbItem[i][1], tbItem[i][2], "NHAN THUONG TAN THU", "nh�n th�nh c�ng", tbItem[i][3])
			end		
			Earn(240000)	
		end
	else
		Talk(1, "", "��i hi�p ch�a k�ch ho�t code ho�c �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng ���c n�a!!!")
		return
	end
end


function prize_max_event_4000()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if GetTask(2731) < 1 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 4000 Cua Rang Mu�i v� 4000 C�ng Gh� N��ng Mu�i �t!!!!")
		return 0
	end
	if GetTask(2731) > 1 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "Nh�n m�c event 4000"
	
	local tbAward1 = {item = {{gdp={2,1,30341,5}, name = "T�ng R��ng"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,1,30341,10}, name = "T�ng R��ng"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,1,30341,15}, name = "T�ng R��ng"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,1,30341,20}, name = "T�ng R��ng"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,1,30341,25}, name = "T�ng R��ng"}}, nChankhi = 10000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 55.550},
		[2] = {[1] = tbAward2, nRate = 33.330},
		[3] = {[1] = tbAward3, nRate = 10.100},
		[4] = {[1] = tbAward4, nRate = 1.019},
		[5] = {[1] = tbAward5, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,2)
    	end
 end
 
 
 function prize_max_event_6000()
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if GetTask(2731) < 3 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 6000 Cua Rang Mu�i v� 6000 C�ng Gh� N��ng Mu�i �t!!!!")
		return 0
	end
	if GetTask(2731) > 3 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "Nh�n m�c event 6000"
	
	local tbAward1 = {item = {{gdp={2,1,30346,1}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,1,30346,2}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,1,30346,3}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,1,30346,4}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,1,30346,5}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward6 = {item = {{gdp={2,1,30346,6}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward7 = {item = {{gdp={2,1,30346,7}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward8 = {item = {{gdp={2,1,30346,8}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward9 = {item = {{gdp={2,1,30346,9}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAward10 = {item = {{gdp={2,1,30346,10}, name = "M�nh B�ch Kim"}}, nChankhi = 10000}
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 50.551},
		[2] = {[1] = tbAward2, nRate = 30.551},
		[3] = {[1] = tbAward3, nRate = 15.551},
		[4] = {[1] = tbAward4, nRate = 0.999},
		[5] = {[1] = tbAward5, nRate = 0.888},
		[6] = {[1] = tbAward6, nRate = 0.777},
		[7] = {[1] = tbAward7, nRate = 0.666},
		[8] = {[1] = tbAward8, nRate = 0.010},
		[9] = {[1] = tbAward9, nRate = 0.006},
		[10] = {[1] = tbAward10, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,4)
    	end
 end
 
 
 function prize_max_event_8000()
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if GetTask(2731) < 5 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 8000 Cua Rang Mu�i v� 8000 C�ng Gh� N��ng Mu�i �t!!!!")
		return 0
	end
	if GetTask(2731) > 5 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0		
	end

	LIB_Award.szLogTitle = "Hoat dong thang 7 nam 2012"
	LIB_Award.szLogAction = "Nh�n m�c event 10000"
	
	local tbAward1 = {item = {{gdp={2,95,204,2}, name = "Thi�n Cang L�nh"}}, nChankhi = 10000}
	local tbAward2 = {item = {{gdp={2,95,204,4}, name = "Thi�n Cang L�nh"}}, nChankhi = 10000}
	local tbAward3 = {item = {{gdp={2,95,204,6}, name = "Thi�n Cang L�nh"}}, nChankhi = 10000}
	local tbAward4 = {item = {{gdp={2,95,204,8}, name = "Thi�n Cang L�nh"}}, nChankhi = 10000}
	local tbAward5 = {item = {{gdp={2,95,204,10}, name = "Thi�n Cang L�nh"}}, nChankhi = 10000}
	
	local tbAwardSet = {
		[1] = {[1] = tbAward1, nRate = 88.888},
		[2] = {[1] = tbAward2, nRate = 10.123},
		[3] = {[1] = tbAward3, nRate = 0.696},
		[4] = {[1] = tbAward4, nRate = 0.292},
		[5] = {[1] = tbAward5, nRate = 0.001},
	}
    	if LIB_Award:AwardByRate(tbAwardSet) == 1 then
		SetTask(2731,6)
    	end
 end

 function prize_max_event_3000_choose()
 	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckPet = mod(GetTask(TASK_VNG_PET), 100)
 	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Ch�n 1 trong 3 lo�i ph�n th��ng:  !!!!"
	
	tinsert(tbSayDialog, "Ph�n th��ng 1.000.000.000 �i�m kinh nghi�m/#confirm_prize_max_event_3000_choose(1)")
	tinsert(tbSayDialog, "Ph�n th��ng 1 chuy�n sinh ��n (60 ng�y s� d�ng)/#confirm_prize_max_event_3000_choose(2)")
	tinsert(tbSayDialog, "Ph�n th��ng 30.000 �i�m ch�n kh�/#confirm_prize_max_event_3000_choose(3)")
	tinsert(tbSayDialog,"Ta ch� h�i th�m/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	
	Say(szSayHead, nSaySize, tbSayDialog); 
 end
 function confirm_prize_max_event_3000_choose(nType) 
  	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)

	if nCheckMaxEvent1 < 1 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 3000 Sinh T� v� 3000 Tr�i C�y d�m!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
 	if gf_Judge_Room_Weight(2,50) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
	if nType == 3 then
		if nCheckKinhMach < 1 then
			Talk(1,"","��i hi�p ch�a k�ch ho�t kinh m�ch n�n kh�ng th� nh�n th��ng !!!!")
			return 0
		end
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 1, 2)		
	if nType == 1 then
		ModifyExp(1000000000)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i 1 t� �i�m kinh nghi�m�")
	end
	if nType == 2 then
		gf_AddItemEx2({2,1,30345, 1}, "Chuy�n sinh ��n", "Log phu Hoat dong thang 07 nam 2013", "Chuy�n Sinh ��n", 60 * 24 * 3600)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i chuy�n sinh ��n")
	end
	if nType == 3 then
		AwardGenuineQi(30000);
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i ch�n kh�")
	end	

---ph�n th��ng
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 3000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "T�ng nh�n m�c event 3000")
 end
 function prize_max_event_4000_choose()
 	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckPet = mod(GetTask(TASK_VNG_PET), 100)
 	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Ch�n 1 trong 3 lo�i ph�n th��ng:  !!!!"
	
	tinsert(tbSayDialog, "Ph�n th��ng 2.000.000.000 �i�m kinh nghi�m/#confirm_prize_max_event_4000_choose(1)")
	tinsert(tbSayDialog, "Ph�n th��ng 2 chuy�n sinh ��n (60 ng�y s� d�ng)/#confirm_prize_max_event_4000_choose(2)")
	tinsert(tbSayDialog, "Ph�n th��ng 60.000 �i�m ch�n kh�/#confirm_prize_max_event_4000_choose(3)")
	tinsert(tbSayDialog,"Ta ch� h�i th�m/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	
	Say(szSayHead, nSaySize, tbSayDialog); 
 end
 function confirm_prize_max_event_4000_choose(nType) 
  	local nCheckKinhMach = MeridianGetLevel()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)

	if nCheckMaxEvent1 < 3 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 4000 Sinh T� v� 4000 Tr�i C�y d�m!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
 	if gf_Judge_Room_Weight(4,50) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
	if nType == 3 then
		if nCheckKinhMach < 1 then
			Talk(1,"","��i hi�p ch�a k�ch ho�t kinh m�ch n�n kh�ng th� nh�n th��ng !!!!")
			return 0
		end
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 1, 4)		
	if nType == 1 then
		ModifyExp(2000000000)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i 1 t� �i�m kinh nghi�m�")
	end
	if nType == 2 then
		gf_AddItemEx2({2,1,30345, 2}, "Chuy�n sinh ��n", "Log phu Hoat dong thang 07 nam 2013", "Chuy�n Sinh ��n", 60 * 24 * 3600)
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i chuy�n sinh ��n")
	end
	if nType == 3 then
		AwardGenuineQi(60000);
		gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000 lo�i ch�n kh�")
	end	

---ph�n th��ng
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 4000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 07 nam 2013", "nh�n th��ng th�nh c�ng", 1, "T�ng nh�n m�c event 4000")
 end
 
function prize_max_both_event_3000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(10,250) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 1 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 3000 c�i m�i lo�i B�nh Trung Thu!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	
	gf_SetTaskByte(2731, 1, 2)
	gf_AddItemEx2({2, 95,  204, 1}, "Thi�n Cang L�nh", "Log phu Hoat dong thang 09 nam 2013", "1 Thi�n Cang L�nh")
	gf_AddItemEx2({2,1,30370, 1}, "Thi�n M�n Kim L�nh", "Log phu Hoat dong thang 09 nam 2013", "1Thi�n M�n Kim L�nh")
	Msg2Player("B�n nh�n ���c 1 t� 500 tri�u �i�m kinh nghi�m, 1 thi�n cang l�nh, 1 thi�n m�n kim l�nh")	
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 50000)
	else
		SetTask(701,GetTask(701) - 50000)
	end
	Msg2Player("B�n nh�n ���c 50000 �i�m c�ng tr�ng")	
--	AwardGenuineQi(50000)
	ModifyExp(1500000000)
	Pet_AddGP(200)
	WriteLogEx("Hoat dong thang 09 nam 2013", "nh�n th��ng m�c 3000 ���c 200 linh l�c ", 1, "200 �i�m linh l�c")
	Msg2Player("B�n nh�n ���c 200 �i�m Linh L�c B�n ��ng H�nh")
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 3000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 09 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000")
 end	
function prize_max_both_event_4000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(10,250) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 3 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 4000 c�i m�i lo�i B�nh Trung Thu!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	
	gf_SetTaskByte(2731, 1, 4)
	gf_AddItemEx2({2, 95,  204, 2}, "Thi�n Cang L�nh", "Log phu Hoat dong thang 09 nam 2013", "2 Thi�n Cang L�nh")
	gf_AddItemEx2({2,1,30370, 2}, "Thi�n M�n Kim L�nh", "Log phu Hoat dong thang 09 nam 2013", "2Thi�n M�n Kim L�nh")
	Msg2Player("B�n nh�n ���c 2 t� �i�m kinh nghi�m, 2 thi�n cang l�nh, 2 thi�n m�n kim l�nh")		
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 50000)
	else
		SetTask(701,GetTask(701) - 50000)
	end
	Msg2Player("B�n nh�n ���c 50000 �i�m c�ng tr�ng")	
--	AwardGenuineQi(50000)
	ModifyExp(2000000000)
	Pet_AddGP(200)
	WriteLogEx("Hoat dong thang 09 nam 2013", "nh�n th��ng m�c 3000 ���c 200 linh l�c ", 1, "200 �i�m linh l�c")
	Msg2Player("B�n nh�n ���c 200 �i�m Linh L�c B�n ��ng H�nh")
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 4000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 09 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 4000")
 end	
  
 function prize_max_both_event_6000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
 	if nCheckMaxEvent1 < 5 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 3000 v�t ph�m Hu�n Ch��ng v� 3000 v�t ph�m B�ng Khen!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 5 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	--SetTask(2731,1)
	gf_SetTaskByte(2731, 1, 6)
	gf_AddItemEx2({2,1,30344, 2}, "Th�n T�i B�o R��ng", "Log phu Hoat dong thang 04 nam 2013", "2 Th�n T�i B�o R��ng")
	AwardGenuineQi(35000)
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 3000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 3000")
 end	
 	
 
 function prize_max_event_6000_choose()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if nCheckMaxEvent1 < 1 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 1111 v�t ph�m �n L�nh Th�!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 1 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 2, 2)
	
	--gf_AddItemEx2({2,1,30390, 1000}, "1000 M�nh Thi�n Cang", "Log phu Hoat dong thang 03 nam 2013", "1000 M�nh Thi�n Cang")
	--gf_AddItemEx2({2,1,30071, 10}, "10 Nh�n s�m v�n n�m", "Log phu Hoat dong thang 03 nam 2013", "10 Nh�n s�m v�n n�m")
	gf_AddItemEx2({2,95,204, 1}, "Thi�n Cang L�nh", "Log phu Hoat dong thang 04 nam 2013", "1 Thi�n Cang L�nh")
	gf_AddItemEx2({2,1,30344, 3}, "Th�n T�i B�o R��ng", "Log phu Hoat dong thang 04 nam 2013", "1 Th�n T�i B�o R��ng")
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 1111 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 1111")
 end
 
 function prize_max_event_1500_anlanhtho()
 	local nCheckMaxEvent1 = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if nCheckMaxEvent1 < 3 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 1500 v�t ph�m �n L�nh Th�!!!!")
		return 0
	end
	if nCheckMaxEvent1 > 3 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	--SetTask(2731,2)
	gf_SetTaskByte(2731, 2, 4)
	gf_AddItemEx2({2,1,30344, 3}, "Th�n T�i B�o R��ng", "Log phu Hoat dong thang 04 nam 2013", "Th�n T�i B�o R��ng")
	AwardGenuineQi(39000)
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 1500 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 04 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 1500")
 end
 

 function prize_max_event_10000_choose()
 	local nCheckMaxEvent2 = gf_GetTaskByte(2731, 1)
 	if gf_Judge_Room_Weight(12,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if nCheckMaxEvent2 < 5 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 10000 v�t ph�m Kh�n ��ng v� 10000 v�t ph�m Phi Phong N� T��ng!!!!")
		return 0
	end
	if nCheckMaxEvent2 > 5 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	
	--SetTask(2731,4)
	gf_SetTaskByte(2731, 1, 6)
	
	local nKinhNghiem = 390000000
	ModifyExp(nKinhNghiem)
	gf_AddItemEx2({2,1,30427, 10}, "C��ng h�a quy�n 15", "Log phu Hoat dong thang 03 nam 2013", "10 C��ng h�a quy�n 15", 30 * 24 * 3600)
	gf_AddItemEx2({2,1,30071, 10}, "10 Nh�n s�m v�n n�m", "Log phu Hoat dong thang 03 nam 2013", "10 Nh�n s�m v�n n�m")
	Msg2Player("Ch�c m�ng ��i hi�p nh�n th��ng m�c 10000 th�nh c�ng")
	gf_WriteLogEx("Hoat dong thang 03 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 10000")
 end
 function prize_max_event_lixi_choose()
 	local nCheckMaxLixi = gf_GetTaskByte(2731, 2)
 	if gf_Judge_Room_Weight(5,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end
	if nCheckMaxLixi < 1 then
		Talk(1,"","��i hi�p ch�a s� d�ng �� 6800 v�t ph�m L� x� n�m m�i!!!!")
		return 0
	end
	if nCheckMaxLixi > 1 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i !!!!")
		return 0
	end
	if GetItemCount(2,1,539,8) < 8 then
		Talk(1,"","��i hi�p kh�ng c� �� 8 bao Ho�ng Kim ��i H�ng Bao (ch�a 999 v�ng)i !!!!")
		return 0
	end
	gf_SetTaskByte(2731, 2, 2)
	DelItem(2,1,539,8)
	gf_WriteLogEx("Hoat dong thang 01 nam 2013", "nh�n th��ng th�nh c�ng", 1, "Nh�n m�c event 6800 l� x�")
	gf_AddItemEx2({0,102,8844, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Ho�ng Qu�t Kh�i", "Log phu Hoat dong thang 01 nam 2013", "Huy Ho�ng Qu�t Kh�i")
	gf_AddItemEx2({0,102,8845, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh D� Qu�t Kh�i", "Log phu Hoat dong thang 01 nam 2013", "Vinh D� Qu�t Kh�i")
	local nKinhNghiem = 666666666
	ModifyExp(nKinhNghiem)
 end
 function buy_NoelTree(nType)
 	do return 0 end
 	local tCheck = {{68, 0}, {0, 19}}
 	if GetItemCount(2,1,30230) < tCheck[nType][2] then
 		Talk(1,"","B�n kh�ng �� Xu �� mua c�y th�ng !!!!")
		return 0
 	end
 	if GetCash() < tCheck[nType][1] * 10000 then
 		Talk(1,"","B�n kh�ng �� V�ng �� mua c�y th�ng !!!!")
		return 0
 	end
 	if nType == 1 then
 		Pay(680000)
 		AddItem(2,1,30471,1)
 	elseif nType == 2 then
 		DelItem(2,1,30230,19)
 		AddItem(2,1,30471,1)
 	else
  		Talk(1,"","B�n kh�ng �� �i�u ki�n �� mua c�y th�ng !!!!")
		return 0	
 	end
 end
 
 
function EventThang8_HoTro1()
	if gf_Judge_Room_Weight(2,1) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	if GetItemCount(2,1,30132) < 100 then
		Talk(1,"","C�c h� kh�ng �� 100 v� l�m b�o h�p.")
        	return 0
	end
	if GetCash() < 1000000 then
		Talk(1,"","C�c h� kh�ng c� �� 100 v�ng.")
        	return 0
	end
	if DelItem(2,1,30132,100) == 1 and Pay(1000000) == 1 then
		gf_AddItemEx2({2,1,30563,1000}, "Gi�y Tr�ng", "Hoat dong thang 08 nam 2013", "nh�n m� r�ng event b�ng v�ng + VLBH")
	end
 end
 function EventThang8_HoTro2()
 	if gf_Judge_Room_Weight(2,1) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	if GetItemCount(2,1,30230) < 39 then
		Talk(1,"","C�c h� kh�ng �� 39 xu v�t ph�m.")
        	return 0
	end
	if DelItem(2,1,30230,39) == 1 then
		gf_AddItemEx2({2,1,30563,1000}, "Gi�y Tr�ng", "Hoat dong thang 08 nam 2013", "nh�n m� r�ng event b�ng xu")
		WriteLogEx("LOG XU VAT PHAM","M� r�ng event th�ng 8/2013 b�ng 39 xu")	
	end	
 end
 
 
 function EventT201502_Max4000_Menu(nNum)
	if gf_GetTaskByte(2731,nNum) >= 2 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i")
		return 0
	end	
 
 	if gf_Judge_Room_Weight(2,200,1) ~= 1 then		
        return 0
	end
	
	if nNum == 1 then
		gf_AddItemEx2({2,95,204,2}, "Thi�n Cang L�nh", "MORONGEVENT", "Nhan",0,1)
		gf_AddItemEx2({2,1,30370,2}, "Thi�n M�n Kim L�nh", "MORONGEVENT", "Nhan",0,1)
		gf_WriteLogEx("MoRongEventThang2", "Nhan", 1, "2TCL + 2TMKL")
		gf_SetTaskByte(2731,1,2)
	end
	
	if nNum == 2 then 
		gf_Modify("Exp",2000000000)
		gf_Modify("JunGong",39000)
		gf_AddItemEx2({2,1,3356,1}, "T�i Thi�n Th�ch Tinh Th�ch", "MORONGEVENT", "Nhan",7 * 24 * 3600,1)
		gf_WriteLogEx("MoRongEventThang2", "Nhan", 1, "2tExp + 39k CongTrang + 1TuiTTTT")
		gf_SetTaskByte(2731,2,2)
	end
	
	if nNum == 3 then 
		gf_Modify("Exp",2000000000)
		AwardGenuineQi(69999)
		gf_AddItemEx2({2,1,3356,1}, "T�i Thi�n Th�ch Tinh Th�ch", "MORONGEVENT", "Nhan",7 * 24 * 3600,1)
		gf_WriteLogEx("MoRongEventThang2", "Nhan", 1, "2tExp + 99kChanKhi + 1TuiTTTT")
		gf_SetTaskByte(2731,3,2)
	end
	
	if nNum == 4 then 
		gf_Modify("Exp",2000000000)		
		gf_AddItemEx2({1,1,15,333}, "B�nh B�t V�ng", "MORONGEVENT", "Nhan",0,1)
		gf_AddItemEx2({1,1,19,333}, "T�y B�c V�ng", "MORONGEVENT", "Nhan",0,1)
		gf_AddItemEx2({1,1,17,333}, "Minh Nguy�t D�", "MORONGEVENT", "Nhan",0,1)
		gf_AddItemEx2({2,1,30344,4}, "Th�n T�i B�o R��ng", "MORONGEVENT", "Nhan",0,1)
		gf_WriteLogEx("MoRongEventThang2", "Nhan", 1, "2tExp + 333BBV + 333TBV + 333MGD + 4TTBR")
		gf_SetTaskByte(2731,4,2)
	end
 end
 
 
 function EventT10_Max4000_Done(nOpt,nPos2,nPos1)
 	local tbAward = {
		[1] = {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}}},
		[2] = {nCheck = 0, nExp = 600000000},
 	}
 	if VNG_GetTaskPos(2731,nPos2,nPos1) ~= 0 then
 		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
 		return 0
 	end
 	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	VNG_SetTaskPos(2731,1,nPos1,nPos2)
	LIB_Award.szLogTitle = "EVENT THANG 10 MO RONG"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward[nOpt])
	Talk(1,"","C�c h� �� nh�n th��ng th�nh c�ng")
 end
 
 function get_award201403()
 	local nCheckExt = GetExtPoint(5)
 	if nCheckExt ~= 1 then
 		Talk(1, "", "B�n kh�ng c� trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng r�i !!!!")
 		return
 	end
 	if AddExtPoint(5,2) == 1 then
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403", "nh�n v�t ph�m", 1, "Nh�n th�nh c�ng")
 	else
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403", "th�t b�i", 1, "Nh�n th�t b�i")
 	end
 	if Vet_Activity_YaoYang_Rand() == 1 then
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403 BK", "nh�n v�t ph�m", 1, "Nh�n th�nh c�ng")
 	else
 		gf_WriteLogEx("NHAN LAI VAT PHAM EVENT 201403 BK", "th�t b�i", 1, "Nh�n th�t b�i")
 	end
 end
 function nguyenlieu_thang4(nType)
 	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
 	if GetCash() < 790000 then
 		Talk(1, "", "��i hi�p kh�ng �� 79 v�ng")
 		return
 	end
 	if Pay(790000) == 1 then
 		if nType == 1 then
 			gf_AddItemEx2({2,1,30638,1000}, "h� keo", "MUA NGUYEN LIEU THANG 4 bk", "mua h� keo")
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "th�nh c�ng", 1, "mua h� keo")
 		elseif nType == 2 then
 			gf_AddItemEx2({2,1,30637,1000}, "gi�y ng� s�c", "MUA NGUYEN LIEU THANG 4 bk", "mua gi�y ng� s�c")
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "th�nh c�ng", 1, "mua gi�y ng� s�c")
 		else
 			gf_WriteLogEx("MUA NGUYEN LIEU THANG 4", "th�t b�i", 1, "mua v�t ph�m")
 		end
 	end
 	
 end
 