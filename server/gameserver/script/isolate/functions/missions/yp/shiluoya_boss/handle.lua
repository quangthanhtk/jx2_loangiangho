Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function handle_on_enter_map(data, para)
	isolate_enable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--����Ŀ���ͼ��ɱ�ֿ���
end
function handle_on_leave_map(data, para)
	isolate_disable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--�뿪Ŀ���ͼ�ر�ɱ�ֿ���
end

function handle_on_kill_npc(data, para)
	local tAward = tCfg.tNpcDeathAward[data[1]]
	if tAward then
		return
	end
	if tCfg:kill_npc_rand() == 1 then--1/10000����ˢ��СBOSS
		local nKillNpcIndex = data[3]
		local nMap, nX, nY = GetNpcWorldPos(nKillNpcIndex)
		nMap, nX, nY =  GetRandPos(nMap, nX, nY, 10)
		local npc = t_data:create_npc("sly_tianyinfenduotaowangzhe", "Thi�n �m ��o Vong Gi�", nMap, nX, nY, 3600)--һСʱ����ʱ��
		local szMsg = "T�i ng�y trang nh� th� n�y r�i, t�i sao v�n t�m ra, t�i mu�n tho�t ra kh�i Thi�n D��ng Giao!"
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
		local npc = t_data:create_npc("sly_tianyingshashou", "S�t th� Thi�n �m Gi�o", nMap, nX, nY)
	end
end

function handle_on_server_tick_hour(data, para)
	global_msg("Ti�n D��ng Ph�n �� sau khi b� ph� v�, r�t nhi�u Giao �� Hu� �em kho b�u Ph�n �� ng�y trang th�nh ng��i d�n Th�t L�c nhai th�o ch�y, Hi�p s� kh�ng h� ng�i ng�n �i t�m � Th�t L�c nhai.")
end

--------------------------------------------------------------------------------------------------------
t_shiluoya_boss = t_data.t_shiluoya_boss
function t_shiluoya_boss.open(data, para)
	global_msg("Thi�n D��ng Giao Ph�n D� sau khi b� t�n c�ng, gi�o ch� n�i c�n th�nh n�, ra l�nh cho cao th� m�i c�c Hi�p s� kh�p n�i t� h�p t�i Th�t L�c nhai!")
	t_data.t_shiluoya_boss.enable = 1
	t_data.t_shiluoya_boss.enable_award = nil
end
function t_shiluoya_boss.npc1(data, para)
	global_msg("Ti�n phong Thi�n D��ng Giao xu�t hi�n � v�ch Th�t L�c!")
	for i = 1,20 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaoqianfeng", "Ti�n phong Thi�n D��ng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.npc2(data, para)
	global_msg("Ng�y trang H�u V��ng ���c Thi�n D��ng Giao tinh ch� xu�t hi�n � Th�t L�c nhai!")
	for i = 1,10 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaojingying", "Tinh hoa Thi�n D��ng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.boss(data, para)
	global_msg("Ng�y trang H�u V��ng ���c Thi�n D��ng Giao tinh ch� xu�t hi�n � Th�t L�c nhai!")
	for i = 1,1 do
		local nMap, nX, nY = tCfg:get_rand_boss_pos()
		local npc = t_data:create_npc("sly_weihouwang", "Ng�y H�u V��ng", nMap, nX, nY)
	end
end
function t_shiluoya_boss.rank(data, para)
	global_msg("Thi�n D��ng Giao cu�i c�ng ph�i th�o ch�y, m�i c�c v� Hi�p s�  ��n V� L�m Minh huy ch��ng ng��i th�p t�ng c�a m�i th� l�c �� nh�n ph�n th��ng!")
	t_data.t_shiluoya_boss.enable_award = 1
	t_data:clear_npc(-1, 1)
	t_data:rank()
end
function t_shiluoya_boss.before_close(data, para)
	global_msg("C�n c� 5 ph�t s� ��ng ph�n th��ng K�ch Tho�i Thi�n Thi�n D��ng Giao, m�i c�c Hi�p s� mau ch�ng ��n V� L�m Minh huy ch��ng ng��i th�p t�ng c�a m�i th� l�c �� nh�n ph�n th��ng!")
end
function t_shiluoya_boss.close(data, para)
	global_msg("Th�i gian nh�n K�ch Tho�i Thi�n ph�n th��ng c�a Thi�n D��ng Giao k�t th�c!")
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
		"�o�n H�a Huy�n",
		"C�t Kh�m X�ch Ba",
		"L� K� Tinh",
	}
	local szNpcName = GetTargetNpcName()
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "M�i quay l�i gia nh�p th� l�c")
		return 0
	end

	if szNpcName ~= tNpc[nCamp] then
		Talk(1, "", "Ng��i �� gia nh�p th� l�c kh�c, v�y c�n ��n ��y l�m g�? Ch�ng l� c� � �� g�?")
		return 0
	end
	
	local szTitle = format("T�i c� th� nh�n ���c Ch� Kh�ng Thi�n ph�n th��ng m�i ng�y c�a Thi�n D��ng Giao, th�i gian nh�n th��ng m�i ng�y l� <color=yellow>%s<color>, th�i gian nh�n th��ng th� l�c l� <color=yellow>%s<color>",
		"19:00~23:00", "20:00~23:00")
    local tbSay = {}
    tinsert(tbSay, format("%s/_npc_talk_personal_award", "Nh�n ph�n th��ng c� nh�n "))
    tinsert(tbSay, format("%s/_npc_talk_shili_award", "Nh�n ph�n th��ng th� l�c"))
    tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _npc_talk_personal_award()
	local nScore = t_data.get_score()
	local szTitle = format("Hi�n nay t�ch �i�m c� nh�n l� <color=yellow>%d/%d<color>, m�i ��n nh�n th��ng tr��c l�c<color=yellow>%s<color>hi�n nay kh�ng ph�i th�i gian nh�n th��ng", nScore, tCfg.PERSONAL_AWARD_SCORE, "19:00~23:00")
	
	if not t_data.t_shiluoya_boss.enable then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng")
		return 0
	end
	if nScore < tCfg.PERSONAL_AWARD_SCORE then
		Talk(1, "", "T�ch �i�m c� nh�n ch�a �� nh�n th��ng")
		return 0
	end
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD) ~= 0 then
		Talk(1, "", "H�m nay b�n �� nh�n ph�n th��ng r�i, ��ng l�a t�i")
		return 0
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	gf_SetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD, 1)
	Talk(1, "", "Ch�c m�ng nh�n th��ng th�nh c�ng ph�n th��ng c� nh�n")
	AddItem(2,1,30925,1)
end


function _npc_talk_shili_award(bConfirm)
	if not t_data.t_shiluoya_boss.enable_award then
		Talk(1, "", format("Hi�n nay kh�ng ph�i l� th�i gian nh�n th��ng c� nh�n,m�i l�c %s quay l�i", "20:00~23:00"))
		return 0
	end
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "M�i quay l�i gia nh�p th� l�c")
		return 0
	end
	
	local nMyRank = t_data.t_shili_score[nCamp][3]
	
	if not bConfirm then
		local szShiliScore = ""
		for i= 1,getn(t_data.t_shili_rank) do
			local camp,score,rank = unpack(t_data.t_shili_rank[i])
			if rank > 0 then
				local camp_name = yp_get_camp_name(camp)
				local szRank = format("  V� tr� th� %d t�n   %s  %d", rank, camp_name, score)
    			if camp == nCamp then
    				szRank = format("<color=yellow>%s<color>", szRank)
    			end
    			szShiliScore = format("%s\n%s", szShiliScore, szRank)
			end
		end
		szShiliScore = strsub(szShiliScore,2)
		if t_data.t_shiluoya_boss.boss_killer then
			local szKiller = format("Ng�y H�u V��ng �� ���c nh�n: <color=yellow>%s<color>(to�n th� ph�n th��ng t�ng g�p ��i)", t_data.t_shiluoya_boss.boss_killer)
		else
			szShiliScore = format("%s\n%s", szShiliScore, "Ng�y H�u V��ng �� tr�n tho�t")
		end
		
		local tbSay = {}
		local szTitle = format("H�m nay x�p h�ng t�ch �i�m th� l�c nh� sau: \n%s", szShiliScore)
		if nMyRank > 0 then
			szTitle = format("%s\n Hi�p s� h�m nay c� th� nh�n gi�i<color=yellow>v� tr� th� %d t�n ph�n th��ng<color>", szTitle, nMyRank)
			tinsert(tbSay, format("%s/#_npc_talk_shili_award(1)", "X�c nh�n nh�n th��ng"))
		else
			szTitle = format("%s\n r�t ti�c Hi�p s� h�m nay kh�ng th� nh�n ph�n th��ng th� l�c theo x�p h�ng", szTitle, nMyRank)
		end
        tinsert(tbSay, format("%s/handle_on_npc_talk", "tr� l�i"))
        tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
        Say(szTitle, getn(tbSay), tbSay)
        return
	end
	
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_SHILI_AWARD) ~= 0 then
		Talk(1, "", "H�m nay b�n �� nh�n ph�n th��ng r�i, ��ng l�a t�i")
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
		--��������������
		{10, 8000000},
		{5, 5000000},
		{2, 2000000},
	}
	local t = tAward[nMyRank]
	yp_setValue(1, t[1]*nMul)--extern
	ModifyExp(t[2]*nMul)
	Talk(1, "", "Ch�c m�ng nh�n th��ng th�nh c�ng ph�n th��ng th� l�c")
	TriggerMisEvent("event_slyb_award", "yp_slyzz_award", nMyRank);
end

function handle_on_item_talk(nIndex)
	local szAward = "worldboss_sly4"
	if CustomAwardCheckCondition(szAward) == 1 and DelItemByIndex(nIndex, 1) == 1 then
		return CustomAwardGiveGroup("worldboss_sly4", 1)
	else
		Talk(1, "", "S� d�ng th�t b�i")
	end
	return 0
end

