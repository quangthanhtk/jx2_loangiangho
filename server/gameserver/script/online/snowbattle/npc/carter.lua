Include("\\script\\online\\snowbattle\\head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\ksgvn\\lib.lua");

CR_Head = format("<color=green>%s:<color> Ho�t ��ng tuy�t c�u m�i ng�y s� m� 3 l�n, th�i gian m� l� 11:30, 17:30 v� 21:30, ho�t ��ng duy tr� 1 ti�ng; Hi�p s� tr�n 80 c�p v� �� ra nh�p m�n ph�i, k�ch ho�t kinh m�ch m�i c� th� tham gia.", CR_NAME);

function main()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","B�n �� b� tr�ng th��ng r�i, h�y v� th�nh d��ng s�c �i.")
		return 0
	end	
	local CR_Menu1 = {
		format("V�o tr��ng tuy�t c�u (Ti�u hao %d v�ng ���c %d Ti�u tuy�t c�u)",floor(SB_COST/10000), 10) .. "/CR_DoEnter",
		format("%s/getNewYearAward", "Nh�n ph�n th��ng ho�t ��ng"),
		"Mua ��n tuy�t c�u/CR_DoShowSaleList",
		"Gi�i th�ch ho�t ��ng/CR_Information",
		"R�i kh�i/gf_DoNothing"
	}
	local CR_Menu2 = {
		"R�i kh�i ��u tr��ng tuy�t/CR_DoExit",
		"Mua ��n tuy�t c�u/CR_DoShowSaleList",
		"Gi�i th�ch ho�t ��ng/CR_Information",
		"R�i kh�i/gf_DoNothing"
	}
	if 0 == SB_IsInSnowMap() then
		Say(CR_Head, getn(CR_Menu1), CR_Menu1);
	else
		Say(CR_Head, getn(CR_Menu2), CR_Menu2);
	end
end

function getNewYearAward()
	local day1225 = SB_START_TIME[1]*10000+1225
	local day0101 = (SB_START_TIME[1]+1)*10000+0101
	local today = tonumber(date("%Y%m%d"))
	local task = GetTask(SB_TASK_GET_NEWYEAR_AWARD)
	local szAward = "10 c�i ��i tuy�t c�u"
	if today == day1225 or today == day0101 then
		if task ~= today then
			SetTask(SB_TASK_GET_NEWYEAR_AWARD, today)
			local nExpireTime = 5 * 24 * 3600
			gf_AddItemEx2({2, 3, 221, 10, 4}, "��i tuy�t c�u", "SnowBattle", "NewYearGift", nExpireTime);--10��ѩ��
			Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, format("Ch�c m�ng b�n �� th�nh c�ng nh�n ���c %s.", szAward)))
		else
			Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, "B�n �� nh�n th��ng r�i."))
		end
	else
		local szMsg = format("M�i c�c h� ��n v�o ng�y <color=yellow>%s - %s<color>, c� th� nh�n mi�n ph� %s.", KsgDate:ToString(day1225), KsgDate:ToString(day0101), szAward)
		Talk(1, "nothing", format("<color=green>%s<color>: %s", CR_NAME, szMsg))
	end
end

function CR_DoEnter()
	local mapID = GetWorldPos();
 	mapID = SB_MapMap[mapID];
	if 1 ~= SB_CheckState(mapID) then
		Talk(1, "", "M�i ng�y s� m� 3 l�n, th�i gian m� l� 11:30-12:30, 17:30-18:30 v� 21:30-22:30");
		return
	end
	if 1 ~= SB_CheckPlayerCount(mapID) then
		Talk(1, "", "R�t ti�c, ��u tr��ng �� ��y, vui l�ng tr� l�i l�n sau");
		return
	end
	if gf_CheckBaseCondition(SB_MIN_LEVEL) ~= 1 then
		return 
	end
--	if MeridianGetLevel() < 1 then
--		Talk(1,"","R�t ti�c, c�c h� ch�a khai th�ng c�nh gi�i kinh m�ch");
--		return
--	end
--	if 1 ~= SB_CheckEquipment() then
--		Talk(1, "", "�Բ�����ж������������");
--		return
--	end
	if GetTeamSize() > 0 then
		Talk(1,"","��i hi�p h�y r�i kh�i t� ��i r�i quay l�i!");
		return
	end
	if GetCash() < SB_COST then
		Talk(1,"","R�t ti�c, ng�n l��ng c�c h� mang theo kh�ng ��!");
		return
	end	

	mf_JoinMission(SB_MISSION_ID, SB_CAMP_ID, mapID);
end

function CR_DoExit()
	DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
end

function CR_DoShowSaleList()
	if gf_CheckDuration(SB_START_TIME, SB_END_TIME) ~= 1 then
		Talk(1,"","Xin l�i b�n, ho�t ��ng �� h�t th�i gian.!");
		return
	end
	
	local CR_Menu3_1 = {
		format("%d ��i tuy�t c�u (%d v�ng)",10, 60) .. "/#CR_DoBuy(1)",
		format("%d Trung tuy�t c�u (%d v�ng)",10, 40) .. "/#CR_DoBuy(2)",
		format("%d Ti�u tuy�t c�u (%d v�ng)",10, 20) .. "/#CR_DoBuy(3)",
		"Ta ch� gh� ch�i/gf_DoNothing",
	}
	Say(CR_Head, getn(CR_Menu3_1), CR_Menu3_1);
end

function CR_DoBuy(index)
	local CR_SaleList = {
		{{2, 3, 221}, "��i tuy�t c�u", 10, 600000},
		{{2, 3, 220}, "Trung tuy�t c�u", 10, 400000},
		{{2, 3, 219}, "Ti�u tuy�t c�u", 10, 200000},
	}
	local itemID = CR_SaleList[index][1];
	local itemName = CR_SaleList[index][2];
	local itemCount = CR_SaleList[index][3];
	local cost = CR_SaleList[index][4];
	if GetCash() < cost then
		Talk(1,"","H�nh trang kh�ng �� ti�n!");
		return
	end
	if 1 == gf_Judge_Room_Weight(1, itemCount, "") then
		if 1 == Pay(cost) then
			local tmpItemID = {itemID[1], itemID[2], itemID[3], itemCount,4};
			gf_AddItemEx2(tmpItemID, itemName, "��nh tr�n tuy�t", "Mua ��n tuy�t c�u");
		end
	end
	CR_DoShowSaleList();	
end

function CR_Information()
	Talk(1,"","Sau khi ��i hi�p v�o khu n�m tuy�t, ��i tho�i v�i Thi�n S�n Tuy�t Y�u � ch�nh gi�a, c� th� tri�u h�i Tuy�t Qu�i. Sau khi ��nh b�i t�t c� Tuy�t Qu�i s� xu�t hi�n l��t ti�p theo, t�ng c�ng c� 10 l��t. Sau khi ��nh xong 10 l��t th� ��i tho�i v�i Thi�n S�n Tuy�t Y�u, ��nh b�i BOSS s� nh�n ���c ph�n th��ng phong ph�. Trong khu n�m tuy�t, ch� c� th� d�ng k� n�ng tuy�t c�u, trang b� tr�n ng��i s� t�m th�i m�t hi�u qu�.")
end
