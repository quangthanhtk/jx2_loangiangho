Import("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("M� r��ng/#get_huofengling(%d)", nItem),
		"\n v� sau xem l�i/nothing",
	}
	Say("Ch� c� bang ch� m�i ���c m� R��ng H�a Ph�ng, c� th� ph�n ph�i cho ��ng ��i v� th�nh vi�n kh�c.", getn(tSay), tSay);
end

function get_huofengling(nItem)
	if GetTongDuty() ~= 1 then
		Say("Ch� c� bang ch� m�i ���c s� d�ng r��ng n�y!", 0);
		return 0;
	end
	local tSay = {};
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex ~= oldPlayerIndex then
			tinsert(tSay, format("Ph�n ph�i cho %s/#assign_to_member(%d, %d)", GetName(), nItem, PlayerIndex));
		else
			tinsert(tSay, format("Ph�n ph�i cho %s/#assign_to_member(%d, %d)", "Ta", nItem, PlayerIndex));
		end
	end
	PlayerIndex = oldPlayerIndex;
	tinsert(tSay, "\n v� sau xem l�i/nothing");
	Say("B�n mu�n ph�n ph�i <color=gold>H�a Ph�ng Linh*1<color> cho ai?", getn(tSay), tSay);	
end

function assign_to_member(nItem, playerIndex)
	local oldPlayerIndex = PlayerIndex
	-- check free room
	PlayerIndex = playerIndex;
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		PlayerIndex = oldPlayerIndex;
		return 0
	end
	-- del box
	PlayerIndex = oldPlayerIndex
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	-- add item
	PlayerIndex = playerIndex
	local szName = GetName();
	gf_AddItemEx2({2, 1, 30769, 1, 4}, "H�a Ph�ng Linh", "Bang H�i Vinh Danh", "R��ng H�a Ph�ng", 0, 1);
	-- extra msg
	if PlayerIndex ~= oldPlayerIndex then
		PlayerIndex = oldPlayerIndex;
		Msg2Player(format("Ta mu�n ph�n ph�i [H�a Ph�ng Linh*1] cho [%s]", szName));
	end
end