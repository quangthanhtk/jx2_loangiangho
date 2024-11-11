--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- ����ַ�����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

--��ʱ������� ��֤��ͬgs�õ��Ľ����һ����
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
		npcid = CreateNpc("huangjin_box","R��ng Th�n T�i",pos[1],pos[2],pos[3])
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
		AddGlobalNews("R��ng Th�n T�i t� tr�n tr�i r�i xu�ng t� ��i th�nh th�: Th�nh ��, Tuy�n Ch�u, T��ng D��ng, Bi�n Kinh! C�c ��i hi�p h�y nhanh ch�ng �i t�m r��ng th�t n�o!", 1)
	end
end 

function add_item( i,npcid )
	-- print("\n add_item",i,npcid)
	BOX_NPC_TABLE.idx[i]=npcid;
end

function kill_all_box()
	for i=1,getn(BOX_NPC_TABLE.idx) do
		if GetNpcName(BOX_NPC_TABLE.idx[i]) == "R��ng Th�n T�i" then
			SetNpcLifeTime(BOX_NPC_TABLE.idx[i],0)
		end
	end
end

function handle_on_npc_talk_box( nIndex )
	if nIndex == BOX_NPC_TABLE.trueid then
		if handle_on_box_award(nIndex, 1) == 1 then
			Talk(1,"","Ch�c m�ng b�n �� ph�t hi�n b�o r��ng th�t!")
    		local news = format("Ng��i ch�i %s �� ph�t hi�n R��ng Th�n T�i th�t!",GetName())
    		handle_on_box_award(nIndex, 0)
    		kill_all_box()
    		local news = format("Ch�c m�ng %s �� ph�t hi�n R��ng Th�n T�i th�t!",GetName())
    		AddGlobalNews(news, 1)
		else
			Talk(1,"","Ch�c m�ng b�n �� ph�t hi�n r��ng th�t, nh�ng tr��c ti�n h�y s�p x�p l�i t�i!")
		end
	else
		Talk(1,"","R�t ti�c, ��y l� R��ng Th�n T�i gi�!")
	end
end
function handle_on_box_award(nIndex, bCheckOnly)
	
	if GetNpcTempData(nIndex, 1) == 100 then return 0 end

	local szAward = "caishenbox"
	
	if CustomAwardCheckCondition(szAward, 0, 1) ~= 1 then return 0 end
	
	if bCheckOnly == 0 then
		if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
			SetNpcTempData(nIndex, 1,100)
    		return 1
    	else
    		return 0
    	end
	end
	return 1
end