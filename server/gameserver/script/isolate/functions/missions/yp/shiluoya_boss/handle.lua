Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function handle_on_enter_map(data, para)
	isolate_enable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--进入目标地图打开杀怪开关
end
function handle_on_leave_map(data, para)
	isolate_disable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--离开目标地图关闭杀怪开关
end

function handle_on_kill_npc(data, para)
	local tAward = tCfg.tNpcDeathAward[data[1]]
	if tAward then
		return
	end
	if tCfg:kill_npc_rand() == 1 then--1/10000概率刷出小BOSS
		local nKillNpcIndex = data[3]
		local nMap, nX, nY = GetNpcWorldPos(nKillNpcIndex)
		nMap, nX, nY =  GetRandPos(nMap, nX, nY, 10)
		local npc = t_data:create_npc("sly_tianyinfenduotaowangzhe", "Thi猲  Уo Vong Gi�", nMap, nX, nY, 3600)--一小时存在时间
		local szMsg = "T玦 ng魕 trang nh� th� n祔 r錳, t筰 sao v蒼 t譵 ra, t玦 mu鑞 tho竧 ra kh醝 Thi猲 Dng Giao!"
		NpcChat(npc, szMsg)
		szMsg = format("%s:%s", GetNpcName(npc), szMsg)
		Msg2Map(nMap, szMsg)
		AddRuntimeStat(32, 2, 0, 1)
	end
	if t_shiluoya_boss.enable and t_shiluoya_boss.shashou_boss_create_cnt < tCfg.SLY_BOSS_NPC_MAX_DROP and tCfg:sly_boss_kill_npc_rand() == 1 then
		t_shiluoya_boss.shashou_boss_create_cnt = t_shiluoya_boss.shashou_boss_create_cnt + 1
		
		local nKillNpcIndex = data[3]
		local nMap, nX, nY = GetNpcWorldPos(nKillNpcIndex)
		nMap, nX, nY =  GetRandPos(nMap, nX, nY, 10)
		local npc = t_data:create_npc("sly_tianyingshashou", "S竧 th� Thi猲  Gi竜", nMap, nX, nY)
	end
end

function handle_on_server_tick_hour(data, para)
	global_msg("Ti猲 Dng Ph﹏ У sau khi b� ph� v�, r蕋 nhi襲 Giao у Hu� 甧m kho b竨 Ph﹏ У ng魕 trang th祅h ngi d﹏ Th蕋 L筩 nhai th竜 ch箉, Hi謕 s� kh玭g h� ng筰 ng莕 甶 t譵 � Th蕋 L筩 nhai.")
end

--------------------------------------------------------------------------------------------------------
t_shiluoya_boss = t_data.t_shiluoya_boss
function t_shiluoya_boss.open(data, para)
	global_msg("Thi猲 Dng Giao Ph﹏ D� sau khi b� t蕁 c玭g, gi竜 ch� n鎖 c琻 th辬h n�, ra l謓h cho cao th� m阨 c竎 Hi謕 s� kh緋 n琲 t� h鋚 t筰 Th蕋 L筩 nhai!")
	t_data.t_shiluoya_boss.enable = 1
	t_data.t_shiluoya_boss.enable_award = nil
end
function t_shiluoya_boss.npc1(data, para)
	global_msg("Ti猲 phong Thi猲 Dng Giao xu蕋 hi謓 � v竎h Th蕋 L筩!")
	for i = 1,20 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaoqianfeng", "Ti猲 phong Thi猲 Dng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.npc2(data, para)
	global_msg("Ng魕 trang H莡 Vng 頲 Thi猲 Dng Giao tinh ch� xu蕋 hi謓 � Th蕋 L筩 nhai!")
	for i = 1,10 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaojingying", "Tinh hoa Thi猲 Dng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.boss(data, para)
	global_msg("Ng魕 trang H莡 Vng 頲 Thi猲 Dng Giao tinh ch� xu蕋 hi謓 � Th蕋 L筩 nhai!")
	for i = 1,1 do
		local nMap, nX, nY = tCfg:get_rand_boss_pos()
		local npc = t_data:create_npc("sly_weihouwang", "Ng魕 H莡 Vng", nMap, nX, nY)
	end
end
function t_shiluoya_boss.rank(data, para)
	global_msg("Thi猲 Dng Giao cu鑙 c飊g ph秈 th竜 ch箉, m阨 c竎 v� Hi謕 s�  n V� L﹎ Minh huy chng ngi th竝 t飊g c馻 m鏸 th� l鵦  nh薾 ph莕 thng!")
	t_data.t_shiluoya_boss.enable_award = 1
	t_data:clear_npc(-1, 1)
	t_data:rank()
end
function t_shiluoya_boss.before_close(data, para)
	global_msg("C遪 c� 5 ph髏 s� ng ph莕 thng K輈h Tho竔 Thi猲 Thi猲 Dng Giao, m阨 c竎 Hi謕 s� mau ch鉵g n V� L﹎ Minh huy chng ngi th竝 t飊g c馻 m鏸 th� l鵦  nh薾 ph莕 thng!")
end
function t_shiluoya_boss.close(data, para)
	global_msg("Th阨 gian nh薾 K輈h Tho竔 Thi猲 ph莕 thng c馻 Thi猲 Dng Giao k誸 th骳!")
	t_data:clear()
end


function handle_on_server_time(data, para)
	local szFunc = para[3]
	if t_shiluoya_boss[szFunc] then
		t_shiluoya_boss[szFunc](data, para)
	end
end

function handle_on_npc_talk(nNpcIndex)
	tNpc = {
		"筺 H遖 Huy襫",
		"C竧 Kh﹎ X輈h Ba",
		"L� K� Tinh",
	}
	local szNpcName = GetTargetNpcName()
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "M阨 quay l筰 gia nh藀 th� l鵦")
		return 0
	end

	if szNpcName ~= tNpc[nCamp] then
		Talk(1, "", "Ngi  gia nh藀 th� l鵦 kh竎, v藋 c遪 n y l祄 g�? Ch糿g l� c� �  g�?")
		return 0
	end
	
	local szTitle = format("T玦 c� th� nh薾 頲 Ch� Kh竛g Thi猲 ph莕 thng m鏸 ng祔 c馻 Thi猲 Dng Giao, th阨 gian nh薾 thng m鏸 ng祔 l� <color=yellow>%s<color>, th阨 gian nh薾 thng th� l鵦 l� <color=yellow>%s<color>",
		"19:00~23:00", "20:00~23:00")
    local tbSay = {}
    tinsert(tbSay, format("%s/_npc_talk_personal_award", "Nh薾 ph莕 thng c� nh﹏ "))
    tinsert(tbSay, format("%s/_npc_talk_shili_award", "Nh薾 ph莕 thng th� l鵦"))
    tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _npc_talk_personal_award()
	local nScore = t_data.get_score()
	local szTitle = format("Hi謓 nay t輈h 甶觤 c� nh﹏ l� <color=yellow>%d/%d<color>, m阨 n nh薾 thng trc l骳<color=yellow>%s<color>hi謓 nay kh玭g ph秈 th阨 gian nh薾 thng", nScore, tCfg.PERSONAL_AWARD_SCORE, "19:00~23:00")
	
	if not t_data.t_shiluoya_boss.enable then
		Talk(1, "", "Hi謓 t筰 kh玭g ph秈 th阨 gian nh薾 thng")
		return 0
	end
	if nScore < tCfg.PERSONAL_AWARD_SCORE then
		Talk(1, "", "T輈h 甶觤 c� nh﹏ ch璦  nh薾 thng")
		return 0
	end
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD) ~= 0 then
		Talk(1, "", "H玬 nay b筺  nh薾 ph莕 thng r錳, ng l鮝 t玦")
		return 0
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	gf_SetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD, 1)
	Talk(1, "", "Ch骳 m鮪g nh薾 thng th祅h c玭g ph莕 thng c� nh﹏")
	AddItem(2,1,30925,1)
end


function _npc_talk_shili_award(bConfirm)
	if not t_data.t_shiluoya_boss.enable_award then
		Talk(1, "", format("Hi謓 nay kh玭g ph秈 l� th阨 gian nh薾 thng c� nh﹏,m阨 l骳 %s quay l筰", "20:00~23:00"))
		return 0
	end
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "M阨 quay l筰 gia nh藀 th� l鵦")
		return 0
	end
	
	local nMyRank = t_data.t_shili_score[nCamp][3]
	
	if not bConfirm then
		local szShiliScore = ""
		for i= 1,getn(t_data.t_shili_rank) do
			local camp,score,rank = unpack(t_data.t_shili_rank[i])
			if rank > 0 then
				local camp_name = yp_get_camp_name(camp)
				local szRank = format("  V� tr� th� %d t猲   %s  %d", rank, camp_name, score)
    			if camp == nCamp then
    				szRank = format("<color=yellow>%s<color>", szRank)
    			end
    			szShiliScore = format("%s\n%s", szShiliScore, szRank)
			end
		end
		szShiliScore = strsub(szShiliScore,2)
		if t_data.t_shiluoya_boss.boss_killer then
			local szKiller = format("Ng魕 H莡 Vng  頲 nh薾: <color=yellow>%s<color>(to祅 th� ph莕 thng t╪g g蕄 i)", t_data.t_shiluoya_boss.boss_killer)
		else
			szShiliScore = format("%s\n%s", szShiliScore, "Ng魕 H莡 Vng  tr鑞 tho竧")
		end
		
		local tbSay = {}
		local szTitle = format("H玬 nay x誴 h筺g t輈h 甶觤 th� l鵦 nh� sau: \n%s", szShiliScore)
		if nMyRank > 0 then
			szTitle = format("%s\n Hi謕 s� h玬 nay c� th� nh薾 gi秈<color=yellow>v� tr� th� %d t猲 ph莕 thng<color>", szTitle, nMyRank)
			tinsert(tbSay, format("%s/#_npc_talk_shili_award(1)", "X竎 nh薾 nh薾 thng"))
		else
			szTitle = format("%s\n r蕋 ti誧 Hi謕 s� h玬 nay kh玭g th� nh薾 ph莕 thng th� l鵦 theo x誴 h筺g", szTitle, nMyRank)
		end
        tinsert(tbSay, format("%s/handle_on_npc_talk", "tr� l筰"))
        tinsert(tbSay, format("%s/nothing", "Ra kh醝"))
        Say(szTitle, getn(tbSay), tbSay)
        return
	end
	
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_SHILI_AWARD) ~= 0 then
		Talk(1, "", "H玬 nay b筺  nh薾 ph莕 thng r錳, ng l鮝 t玦")
		return 0
	end
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if nMyRank <= 0 then
		assert("error rank")
		return 0
	end
	
	gf_SetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_SHILI_AWARD, 1)
	local nMul = 1
	if t_data.t_shiluoya_boss.boss_killer then
		nMul = 2
	end
	local tAward = {
		--势力声望，经验
		{10, 8000000},
		{5, 5000000},
		{2, 2000000},
	}
	local t = tAward[nMyRank]
	yp_setValue(1, t[1]*nMul)--extern
	ModifyExp(t[2]*nMul)
	Talk(1, "", "Ch骳 m鮪g nh薾 thng th祅h c玭g ph莕 thng th� l鵦")
	TriggerMisEvent("event_slyb_award", "yp_slyzz_award", nMyRank);
end

function handle_on_item_talk(nIndex)
	local szAward = "worldboss_sly4"
	if CustomAwardCheckCondition(szAward) == 1 and DelItemByIndex(nIndex, 1) == 1 then
		return CustomAwardGiveGroup("worldboss_sly4", 1)
	else
		Talk(1, "", "S� d鬾g th蕋 b筰")
	end
	return 0
end

