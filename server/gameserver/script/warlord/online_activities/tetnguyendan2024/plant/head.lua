Include('\\script\\warlord\\preload.lua');

IS_OPEN = 1;
IS_DEBUG = 1;

PLANT_LIFE_TIME = 129; --Th�i gian t�n t�i c�a c�y
PLANT_CONSUME_TIME = 99; --Th�i gian ch� thu ho�ch c�y

WATER_CONSUME_ITEM = {2,1,30274,1}; --Ti�n L�
MATERIAL_ITEM = {
	[40133] = {"C�y ��o N�m M�i", "��o Hoa th�","C�nh Hoa ��o",1},
	[40134] = {"C�y T� Linh ", "C�y T� Linh 3_2"," C�y Gi�ng T� Linh",1},
	--[50157] = {"H�t Gi�ng L�o Tao", "Tr�ng m�c"},
};
AWARD_ITEM = { --Item nh�n ���c khi thu ho�ch c�y
	[40133] = { szName = "C�nh Hoa ��o", tbProp = {2,1,40135,1}, tbRand = {
		{20, 50}, -- {20: t� l� / 100%, ph�i x�p t� nh� ��n l�n, 5: SL v�t ph�m nh�n ���c}
		{40, 50},
		{60, 50},
		{80, 50},
		{90, 50},
		{100, 50},
	}},
	[40134] = { szName = "C�nh Hoa Mai", tbProp = {2,1,40136,1}, tbRand = {
		{20, 50}, -- {20: t� l� / 100%, ph�i x�p t� nh� ��n l�n, 5: SL v�t ph�m nh�n ���c}
		{40, 50},
		{60, 50},
		{80, 50},
		{90, 50},
		{100, 50},
	}},
};
AWARD_GOLD_TIME = {
	{700, 900, "07:00 - 09:00"},
	{1100, 1300, "11:00 - 13:00"},
	{1600, 1800, "16:00 - 18:00"},
	{2200, 2359, "22:00 - 23:59"},
};
PLANT_ITEM_LV_REQ = 0; -- ��ng c�p y�u c�u khi tr�ng c�y
ROB_ITEM_LV_REQ = 86; -- ��ng c�p y�u c�u khi c��p c�y
ROB_ITEM_QUANTITY = 5; --S� l��ng item nh�n �c khi c��p c�y

MAP_ALLOW = {
	-- [MapID] =  {nMinX, nMinY, nMaxX, nMaxY}
	[218] = {nMinX = 204, nMinY = 204, nMaxX = 233, nMaxY = 227}, --Linh B�o S�n
	--[151] = {nMinX = 170, nMinY = 170, nMaxX = 195, nMaxY = 195}, --V�n M�ng Tr�ch
};

function validate_map()
	local nMapID, snX, snY = GetWorldPos();
	
	if MAP_ALLOW[nMapID] == nil then -- map not allow
		return 0;
	end
	
	local nX = snX/8;
	local nY = snY/16;
	if nX > MAP_ALLOW[nMapID].nMaxX or nY > MAP_ALLOW[nMapID].nMaxY or nX < MAP_ALLOW[nMapID].nMinX or nY < MAP_ALLOW[nMapID].nMinY then
		return 0;
	end
	
	return 1;
end

function SetUnitCurStates(Npc_index,att_seq,number)
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function plant_create_map_trigger()
	do return end

	if GetTrigger(3028*2) == 0 then
		if CreateTrigger(2,3028,3028*2) == 0 then
			WriteLog("[lua_mach_map_trigger][Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3028,3028*2) Failed. ")
		end
	end
	if GetTrigger(3029*2) == 0 then
		if CreateTrigger(2,3029,3029*2) == 0 then
			WriteLog("[lua_mach_map_trigger][Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3029,3029*2) Failed. ")
		end
	end
	if GetTrigger(3030*2) == 0 then
		if CreateTrigger(2,3030,3030*2) == 0 then
			WriteLog("[lua_mach_map_trigger][Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3030,3030*2) Failed. ")
		end
	end
	if GetTrigger(3031*2) == 0 then
		if CreateTrigger(2,3031,3031*2) == 0 then
			WriteLog("[lua_mach_map_trigger][Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3031,3031*2) Failed. ")
		end
	end
end


