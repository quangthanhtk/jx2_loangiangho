--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- 活动的字符串表
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

--用时间来随机 保证不同gs得到的结果是一样的
function _random_by_time(nMax)
	local d = tonumber(date("%y%m%d%H"))
	local r = d * 877619 + 141655937
	local ret = mod(r, nMax) + 1
	return ret
end

function handle_refresh_box( tEvent, data, para )
 	local truepos = _random_by_time(getn(tb_box_refresh))
	local npcid = nil
	local truebox = tb_box_refresh[truepos]
	-- print( "True pos is: "..truepos.." ",truebox[1],truebox[2],truebox[3] )
	for i=1,getn(tb_box_refresh)do
		local pos = tb_box_refresh[i];
		npcid = CreateNpc("huangjin_box","Rng Th莕 T礽",pos[1],pos[2],pos[3])
		if i == truepos then
			BOX_NPC_TABLE.trueid = npcid;
		end
		add_item(i,npcid)
		SetNpcLifeTime(npcid,BOX_LIFE_TIME_SEC)
	end
	if npcid == nil then 
		WirteLog("create npc error!") 
		return 0
	else 
		AddGlobalNews("Rng Th莕 T礽 t� tr猲 tr阨 r琲 xu鑞g t� i th祅h th�: Th祅h Й, Tuy襫 Ch﹗, Tng Dng, Bi謓 Kinh! C竎 i hi謕 h穣 nhanh ch鉵g 甶 t譵 rng th藅 n祇!", 1)
	end
end 

function add_item( i,npcid )
	-- print("\n add_item",i,npcid)
	BOX_NPC_TABLE.idx[i]=npcid;
end

function kill_all_box()
	for i=1,getn(BOX_NPC_TABLE.idx) do
		if GetNpcName(BOX_NPC_TABLE.idx[i]) == "Rng Th莕 T礽" then
			SetNpcLifeTime(BOX_NPC_TABLE.idx[i],0)
		end
	end
end

function handle_on_npc_talk_box( nIndex )
	if nIndex == BOX_NPC_TABLE.trueid then
		if handle_on_box_award(nIndex, 1) == 1 then
			Talk(1,"","Ch骳 m鮪g b筺  ph竧 hi謓 b秓 rng th藅!")
    		local news = format("Ngi ch琲 %s  ph竧 hi謓 Rng Th莕 T礽 th藅!",GetName())
    		handle_on_box_award(nIndex, 0)
    		kill_all_box()
    		local news = format("Ch骳 m鮪g %s  ph竧 hi謓 Rng Th莕 T礽 th藅!",GetName())
    		AddGlobalNews(news, 1)
		else
			Talk(1,"","Ch骳 m鮪g b筺  ph竧 hi謓 rng th藅, nh璶g trc ti猲 h穣 s緋 x誴 l筰 t骾!")
		end
	else
		Talk(1,"","R蕋 ti謈, y l� Rng Th莕 T礽 gi�!")
	end
end
function handle_on_box_award(nIndex, bCheckOnly)
	
	if GetNpcTempData(nIndex, 1) == 100 then return 0 end

	local szAward = "caishenbox"
	
	if CustomAwardCheckCondition(szAward, 0, 1) ~= 1 then return 0 end
	
	if bCheckOnly == 0 then
		if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
			SetNpcTempData(nIndex, 1,100)
    		return 1
    	else
    		return 0
    	end
	end
	return 1
end