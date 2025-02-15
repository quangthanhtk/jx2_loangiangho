Include("\\script\\isolate\\functions\\gtask\\handler.lua")
--所有的任务杀怪掉落都在这里配置了，不用再单独配置触发器之类
Include("\\script\\task\\global_task\\runtime_data_stat.lua")

---------------------
--config
tNpcDeathCfg = {
	--nTaskId, nTaskName, {NpcInfo}, fn, {fnPara}
	{415, "L蕐 l筰 v藅 ph萴", {"Giang H� Ti猽 Ti觰 u M鬰", 6300}, fn_award_items, {5,100,{ 
																		{"V╪ s鴆-u m蕋 linh kh�",{2,1,31085,1,4},1,100}, 
																		{"V╪ s鴆-竜 m蕋 linh kh�",{2,1,31086,1,4},1,100}, 
																		{"V╪ s鴆-Qu莕 m蕋 linh kh�",{2,1,31087,1,4},1,100}, 
																		{"V╪ s鴆-Gi韎 m蕋 linh kh�",{2,1,31088,1,4},1,100}, 
																		{"V╪ s鴆-B閕 m蕋 linh kh�",{2,1,31089,1,4},1,100}, 
																	}
																} 
	},
	{418, "箃 Kim Tinh", {"Kim Linh ", 321}, fn_award_items, {1,100,{  {"Kim Tinh",{2,1,31091,1,4},1,100},   }}		},
	{430, "Phong V﹏ Kinh Bi課", {"Tinh hoa Thi猲 Dng Giao", 6400}, fn_award_items, {1,100,{  {"M藅 th� Thi猲  gi竜",{2,1,31098,1,4},10,100},   }}		},
	{436, "箃 l筰 B骯", {"T猲 tr閙 b� 萵", 208}, fn_award_items, {1,100,{  {"B骯 c馻 M筩 Nh�",{2,1,31102,1,4},1,100},   }}		},
	{446, "Di謙 竎 qu�", {"Vua 竎 Qu�", 306}, fn_award_items, {1,100,{  {"Kh╪ Tay C馻 Vua 竎 Qu�",{2,1,31106,1,4},1,100},   }}		},
	{450, "Th� th竎h c馻 Th鮝 Tng", {"Чi o Quan Th緉g", 6007}, fn_award_items, {1,100,{  {"Th� u H祅g",{2,1,31108,1,4},1,50},   }}		},

--		战狂升级第二期新增
	{469, "Khi猽 chi課 Л阯g M玭 L穙 L穙 (2)", {"Ti猽 Nhi詍 Nguy謙 Thi猲  Gi竜", 7118}, fn_award_items, {1,100,{{"B秐 V� C� Quan", {2,1,31143,1,4}, 1, 100},}}},
	{475, "Khi猽 chi課 C竔 Bang Bang Ch� (2)", {"Nhai Thng S琻 T芻", 6300}, fn_award_items, {1,100,{{"T礽 S秐 B� Cp", {2,1,31145,1,4}, 50, 50},}}},
	
}







--never modify below
----------------------------------------------------------------------------
function gtask_npc_death_main(npcIdx, sName)
	local tCfg = tNpcDeathMap[sName]
	if tCfg then
		local nMyMapId = GetWorldPos()--检查一下被杀怪物所在的地图是否满足要求
		if nMyMapId >= 65536 then--副本，取模板ID
			local nMapIndex = SubWorldID2Idx(nMyMapId)
			nMyMapId = GetMapTemplate(nMapIndex)
		end
		for i=1,getn(tCfg) do
			local t = tCfg[i]
			local nMapId = t[3][2]
			if nMapId == -1 or nMapId == nMyMapId then
				gt_add_runtime_stat("kill_boss", t[1], 0, 1)
				_fn_task_dispatch(t)
			end
		end
	end
end

--npc death event
-------------------------------------------------------------------------
function fn_make_npc_death_map()
	if not tNpcDeathCfg then
		error("cannnot call fn_make_npc_death_map without tNpcDeathCfg")
		return
	end
	tNpcDeathMap = {}
	for i=1,getn(tNpcDeathCfg) do
		local t = tNpcDeathCfg[i]
		local szNpcName = t[3][1]
		local tCfg = tNpcDeathMap[szNpcName] or {}
		tinsert(tCfg, t)
		tNpcDeathMap[szNpcName] = tCfg
	end
end

tNpcDeathMap = nil
fn_make_npc_death_map()