Include("\\script\\missions\\jiandangyanyun\\head.lua");
Import("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");
Include("\\script\\vng\\vansuc_cap2.lua")
--KSGVN
Import("\\script\\ksgvn\\lib.lua")
-- END KSGVN

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

g_szNpcName = "<color=green>Hoa Th�nh L�c Phi: <color>";

function main()
	if g_WCFG_KIEMDANGYENVAN:IsDateOpen(1) ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	local strTab = {
		"Tham gia Ki�m ��ng Y�n V�n-Th��ng						/Talk_1",
		"Tham gia Ki�m ��ng Y�n V�n-Anh h�ng						/Talk_2",
--		"Nh�n mi�n ph� nguy�n li�u c��ng h�a trang b� V�n S�c  				/get_free_NguyenLieuCuongHoaVS",
--		"Mua gi� r� nguy�n li�u c��ng h�a trang b� V�n S�c  				/get_NguyenLieuCuongHoaVS",
		--"N�ng c�p V�n S�c Ho�n M� c�p 3 				/change_VanSuc_cap3", --LongDaiKa: ��ng t�nh n�ng
		--format("Ti�m n�ng c�p V�n S�c Ho�n M� c�p 4/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_VANSUC_4), --LongDaiKa: ��ng t�nh n�ng
		--"��i ph�n th��ng										/Talk_3", --LongDaiKa: ��ng t�nh n�ng
--		"Mua Nguy�n Li�u C��ng H�a Trang B� V�n S�c: L�u Kim v� Thi�n V�n Th�ch (ti�u hao xu v�t ph�m)				/buy_nguyenlieuvansuc",
		--"��i V�n S�c Ho�n M� c�p 2 (gi� r�)				/change_VanSuc_cap2", --LongDaiKa: ��ng t�nh n�ng
		"�i�u ki�n tham gia Ki�m ��ng Y�n V�n								/Talk_4",
		--"Xem danh v�ng Chi�t Xung X�									/Talk_5", --LongDaiKa: ��ng t�nh n�ng
		"H�y b�												/nothing"
	};

	if g_WCFG_KIEMDANGYENVAN.bDisableEntryConsumeMode == WEnv.TRUE then
		tremove(strTab, 2); -- t�t d�ng Talk_2
	end
	if g_WCFG_KIEMDANGYENVAN.bDisableEntryNormalMode == WEnv.TRUE then
		tremove(strTab, 1); -- t�t d�ng Talk_1
	end
	
	Say(g_szNpcName.."��n Tr�y Long S�n c�ng Thi�n �m Gi�o quy�t chi�n sinh t�, mong c�c v� chi�n ��u h�t m�nh!", getn(strTab), strTab);
end

function Talk_1()
	if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.NORMAL) then return 0; end      -- OK
	if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.NORMAL) then return 0; end    -- OK
	local nMapId = this:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ki�m ��ng Y�n V�n qu� ��ng, xin ��i trong gi�y l�t!");
		return 0;
	end
	mf_SetMissionV(this.missionID, this.mv_02, eDifType.NORMAL, nMapId);
	-- if eDifType.HARD == mf_GetMissionV(this.missionID, this.mv_02, nMapId) then
	-- 	SendScript2VM("\\script\\missions\\jiandangyanyun\\mission.lua", format("JDYY_SetPKFlag(%d, %d)", 1, 1));
	-- end
	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		ModifyEnergy(-g_WCFG_KIEMDANGYENVAN.nConsumeEnergy,1);
		SetTask(JDYY_TSK_DC_ENTER,GetTask(JDYY_TSK_DC_ENTER)+1);
	end
	PlayerIndex = oldPlayer;
	this:TeamEnter(nMapId, 1);
end

function Talk_2()
	if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.HARD) then return 0; end
	if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.HARD) then return 0; end
	
	local nMapId = this:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ki�m ��ng Y�n V�n qu� ��ng, xin ��i trong gi�y l�t!");
		return 0;
	end
	mf_SetMissionV(this.missionID, this.mv_02, eDifType.HARD, nMapId);

	local oldPlayer = PlayerIndex
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		ModifyEnergy(-g_WCFG_KIEMDANGYENVAN.nConsumeEnergy,1);
		SetTask(JDYY_TSK_DC_ENTER,GetTask(JDYY_TSK_DC_ENTER)+1);
	end
	PlayerIndex = oldPlayer;
	this:TeamEnter(nMapId, 1);
end

function Talk_3()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3079, "Ti�m danh v�ng Chi�t Xung X�"))
end

function Talk_4()
	local strTab = "Ph�i t� ��i v�o, th�nh vi�n ph�i c� 4-8 ng��i, trong ��i ph�i c� 4 l�u ph�i tr� l�n, th�nh vi�n trong ��i ��u ph�i ��t chuy�n sinh 7 c�p 90 v� ��u gia nh�p l�u ph�i m�i c� th� v�o. M�i l�n v�o s� ti�u hao 20 �i�m tinh l�c c�a t�ng m�i ng��i. Khi s� l�u ph�i nhi�u h�n 5, 6, 7 ph�i, th� s� cho ph�n th��ng kinh nghi�m 1.2, 1.4, 1.6 l�n, khi c� 8 l�u ph�i trong ��i, kinh nghi�m s� ���c g�p ��i. M�i ng��i m�i ng�y ch� c� th� v�o ph� b�n Ki�m ��ng Y�n V�n 5 l�n(t�nh g�m ph� th�ng, anh h�ng v� h�nh th�c sao ch�p) ";
	Talk(1, "main", g_szNpcName.."Tr�y Long S�n ��a th� hi�m tr�, ��i qu�n Thi�n �m Gi�o �ang gi�p s�t, ��i hi�p �� s�n s�ng? �i�u ki�n tham gia �i:"..strTab);
end

function Talk_5( )
	local nPop = GetPop(6)
	local nLim = 0
	local strPop=""
	if nPop < 0 then 
		nPop=0;
	end

	if nPop < 2000 then strPop="S� xu�t mao l�" nLim=2000;
	elseif nPop < 6000 then strPop="B�c l� t�i n�ng" nLim=6000;
	elseif nPop < 12000 then strPop="Danh ti�ng th��c kh�i" nLim=12000;
	elseif nPop < 20000 then strPop="C�ng danh hi�n h�ch" nLim=20000;
	elseif nPop < 40000 then strPop="C�u ph� th�nh danh" nLim=40000;
	else strPop="V�n ng��i ng��ng m�" nLim=40000; end 

	local strTalk = g_szNpcName.."Trong cu�c chi�n Tr�y Long S�n, hi�p s� anh d�ng h�n ng��i.\n"
	strTalk=strTalk..format("Danh v�ng Chi�t Xung X� hi�n c�: %s\n",strPop)
	strTalk=strTalk..format("Danh v�ng Chi�t Xung X� t�ch l�y: %d/%d\n",nPop,nLim)
	local tbSay = {}
	tinsert(tbSay,"tr� l�i/main")
	tinsert(tbSay,"Ra kh�i/nothing")
	Say(strTalk,getn(tbSay),tbSay)
end
