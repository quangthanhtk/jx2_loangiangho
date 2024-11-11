Include('\\script\\warlord\\preload.lua');

IS_OPEN = 1;
IS_DEBUG = 1;

PLANT_LIFE_TIME = 129; --Thêi gian tån t¹i cña c©y
PLANT_CONSUME_TIME = 99; --Thêi gian chê thu ho¹ch c©y

WATER_CONSUME_ITEM = {2,1,30274,1}; --Tiªn Lé
MATERIAL_ITEM = {
	[40133] = {"C©y §µo N¨m Míi", "§µo Hoa thô","Cµnh Hoa §µo",1},
	[40134] = {"C©y Tø Linh ", "C©y Tø Linh 3_2"," C©y Gièng Tø Linh",1},
	--[50157] = {"H¹t Gièng Lµo Tao", "Träng méc"},
};
AWARD_ITEM = { --Item nhËn ®­îc khi thu ho¹ch c©y
	[40133] = { szName = "Cµnh Hoa §µo", tbProp = {2,1,40135,1}, tbRand = {
		{20, 50}, -- {20: tØ lÖ / 100%, ph¶i xÕp tõ nhá ®Õn lín, 5: SL vËt phÈm nhËn ®­îc}
		{40, 50},
		{60, 50},
		{80, 50},
		{90, 50},
		{100, 50},
	}},
	[40134] = { szName = "Cµnh Hoa Mai", tbProp = {2,1,40136,1}, tbRand = {
		{20, 50}, -- {20: tØ lÖ / 100%, ph¶i xÕp tõ nhá ®Õn lín, 5: SL vËt phÈm nhËn ®­îc}
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
PLANT_ITEM_LV_REQ = 0; -- §¼ng cÊp yªu cÇu khi trång c©y
ROB_ITEM_LV_REQ = 86; -- §¼ng cÊp yªu cÇu khi c­íp c©y
ROB_ITEM_QUANTITY = 5; --Sè l­îng item nhËn ®c khi c­íp c©y

MAP_ALLOW = {
	-- [MapID] =  {nMinX, nMinY, nMaxX, nMaxY}
	[218] = {nMinX = 204, nMinY = 204, nMaxX = 233, nMaxY = 227}, --Linh B¶o S¬n
	--[151] = {nMinX = 170, nMinY = 170, nMaxX = 195, nMaxY = 195}, --V©n Méng Tr¹ch
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


