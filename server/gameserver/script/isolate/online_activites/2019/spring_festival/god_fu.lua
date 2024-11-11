-- 2019����
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
tFushen = {
    "Ph�c Th�n", "Ph�c Th�n", 
    "\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua"
}
local tFushenPos = {
    {200,1427,2879}
}

tZZ = {2,1,31277} -- ����
tZZMat = {
    {item = {2,1,31273,1}, content = "L� g�i b�nh"},
    {item = {2,1,31275,5}, content = "G�o N�p Ngon"},
    {item = {2,1,31274,5}, content = "Th�t Heo Ngon"},
    {item = {2,1,31276,5}, content = "��u Xanh Ngon"},
}

tMonsterName2Info = {
--               ��ø�����ֵ�, �ܻ�õ���ƷId(����tZZMat,nѡ1), ��õ�����
    ["T�m B�o Nh�n"] = {500, {2, 3, 4}, 1},
    ["Sa M�c H�nh Nh�n"] = {500, {2, 3, 4}, 1},
    ["Nh�t Ph�m ���ng �m S�y S�"] = {500, {2, 3, 4}, 1},
    ["K� ��o m�"] = {500, {2, 3, 4}, 1},
}

function main()--FS2019_OnTalk2Fushen()
    local szTitle = format("<color=green>%s<color>: T�ch! �� ��ng! �� ��ng!......", GetTargetNpcName())
    local tbSay = {}
    tinsert(tbSay,"Nh�n ph�n th��ng n�m m�i/FS2019_Award")
    tinsert(tbSay,format("Mua ��o c� [Xu�n L�i]: %s/FS2019_FireWork1"," (M�i l�n 100 V�ng)"))
    tinsert(tbSay,format("Mua ��o c� [M�n H�ng]: %s/FS2019_FireWork2"," (M�i l�n 100 V�ng)"))
    tinsert(tbSay,"G�i B�nh/ZZ2019_ZZ")
    tinsert(tbSay,"C�m ��u N�m/NYF2019")
    if sf2019_check_qrj_date() == 1 then
        tinsert(tbSay,"Event l� t�nh nh�n/QRJ2019")
    end
    tinsert(tbSay,"��n ch�c m�ng n�m m�i/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ZZ2019_ZZ()
    if sf2019_check_main_date() ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: C� nh� c�ng ng�i g�i b�nh, n�u b�nh, �� l� k� �c ��m �m �� kh�c s�u trong t�m tr� m�i ng��i. ��i v�i nh�ng ng��i con �i xa, h��ng v� ng�y t�t, ch�nh l� qu� nh�.\n", GetTargetNpcName())
    szTitle = szTitle .. format("      Trong ho�t ��ng, v��t �i Th�i Nh�t Th�p, Ki�m ��ng Y�n V�n, %s �� kh� b�t k�, ���c nh�n <color=yellow>%s<color>\n", "<color=green>100%<color>", format("L� Dong x%d", tZZMat[1].item[4]))
    szTitle = szTitle .. format("      Trong ho�t ��ng, ��nh b�i NPC � c�c khu v�c sau c� %s c� h�i nh�n ���c 1 lo�i nguy�n li�u: <color=yellow>%s<color>\n", "<color=green>1%<color>", "G�o N�p,Th�t Heo,��u Xanh")
    szTitle = szTitle .. format("      ��a �i�m: %s     M�c ti�u: %s/%s\n", "M� cung sa m�c", "T�m B�o Nh�n", "Sa M�c H�nh Nh�n")
    szTitle = szTitle .. format("      ��a �i�m: %s     M�c ti�u: %s/%s\n", "T�n L�ng", "Nh�t Ph�m ���ng �m S�y S�", "K� ��o m�")
    szTitle = szTitle .. format("     L� Dong <color=green>x%d<color> + G�o N�p <color=green>x%d<color> + Th�t Heo <color=green>x%d<color> + ��u Xanh <color=green>x%d<color> + V�ng <color=green>x%d<color> = B�nh Ngon",
                                    1,5,5,5,10
                                )
    local tbSay = {}
    tinsert(tbSay, "G�i B�nh/ZZ2019_MakeZZ")
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ZZ2019_MakeZZ()
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    local minNum = 999999999
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        local has = GetItemCount(mat[1],mat[2],mat[3])
        local need = mat[4]
        minNum = min(minNum, floor(has/need))
    end
    local nCash = GetCash()
    minNum = min(minNum, floor(nCash / (10 * 10000) ))
    if minNum <= 0 then 
        Talk(1,"",format("<color=green>%s<color>: Tr�n ng��i kh�ng �� nguy�n li�u ho�c V�ng, kh�ng th� l�m b�nh.\n", GetTargetNpcName()))
        return
    end
    AskClientForNumber("ZZ2019_MakeZZConfirm", 1, minNum, "Mu�n g�i bao nhi�u c�i??")
end

function ZZ2019_MakeZZConfirm(nNum)
    if nNum <= 0 then
        return
    end

    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    local minNum = 999999999
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        local has = GetItemCount(mat[1],mat[2],mat[3])
        local need = mat[4]
        minNum = min(minNum, floor(has/need))
    end
    local nCash = GetCash()
    minNum = min(minNum, floor(nCash / (10 * 10000) ))
    if minNum < nNum then 
        Talk(1,"",format("<color=green>%s<color>: Tr�n ng��i kh�ng �� nguy�n li�u ho�c V�ng, kh�ng th� l�m b�nh.\n", GetTargetNpcName()))
        return
    end
    for i = 1, getn(tZZMat) do
        local mat = tZZMat[i].item
        if DelItem(mat[1],mat[2],mat[3],mat[4] * nNum) ~= 1 then
            Talk(1,"","<color=red>G�i b�nh th�t b�i!<color>")
            return
        end
    end 
    Pay(nNum*10*10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    local ret, itemId = gf_AddItemEx2({tZZ[1], tZZ[2], tZZ[3], nNum}, "B�nh Ngon", SF_LOG_KEY_WORD, "G�i B�nh", resTime)
end

function ZZ2019_OnUseZZ(nItemIdx)
    if sf2019_check_main_date() ~= 1 then
        DelItemByIndex(nItemIdx, 1)
        Talk(1,"","V�t ph�m �� qu� h�n s� d�ng!")
        return 
    end
    local szAward = "chunjie_zongzi"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","S� d�ng th�t b�i")
        return 0
    end
    local used = GetTask(2825)
    if used >= ZZ2019_MaxUseZZ then
        Talk(1,"","S� l�n s� d�ng �� ��t gi�i h�n")
        return
    end
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        Talk(1,"","S� d�ng th�t b�i")
        return
    end
    SetTask(2825, used + 1)
    CustomAwardGiveGroup(szAward, 0)
end

function ZZ2019_OnKillMonster(para)
    local tInfo = tMonsterName2Info[para[2][1]]
    local rnd = random(1,10000)
    if rnd <= tInfo[1] then
        if gf_Judge_Room_Weight(1, 10, nil) ~= 1 then
            Msg2Player("H�nh trang kh�ng �� ch�, kh�ng th� nh�n v�t ph�m ho�t ��ng")
            return 0;
        end
        local id = random(1,getn(tInfo[2]))
        local tItem = tZZMat[tInfo[2][id]]
        local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
        local ret,itemId = gf_AddItemEx2({tItem.item[1],tItem.item[2],tItem.item[3],1}, tItem.content, SF_LOG_KEY_WORD, "Gi�t qu�i", resTime)
    end
end

function ZZ2019_OnMissionCompleted(param)
    local matId = param[4][1]
    local rate = param[4][2]
    local rnd = random(1,10000)
    if rnd <= rate then
        if gf_Judge_Room_Weight(1, 10, nil) ~= 1 then
            Msg2Player("H�nh trang kh�ng �� ch�, kh�ng th� nh�n v�t ph�m ho�t ��ng")
            return 0;
        end
        local tItem = tZZMat[matId]
        local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
        local ret,itemId = gf_AddItemEx2({tItem.item[1],tItem.item[2],tItem.item[3],1}, tItem.content, SF_LOG_KEY_WORD, "Th��ng V��t Ph� B�n", resTime)
    end
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function FS2019_Award()
    if sf2019_check_main_date() ~= 1 then return end
    
    if get_trans_level() < 59 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("C�p %d tr� l�n, �� h�c 1 b� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng.", 59))
		return 0;
	end
    local szTitle = format("<color=green>%s<color>: Trong ho�t ��ng, m�i ng�y c� th� ��n ch� ta nh�n th��ng. Khi nh�n �� 10 l�n, ���c nh�n th�m 1 ph�n <color=yellow>%s<color>.",
        GetTargetNpcName(),
        "Qu� Ng�c Kim (��u)"
    )
    local awardCnt = GetTask(2826)
    

    if GetTask(2824) == 1 then
        szTitle = szTitle..format("\n      �� nh�n <color=green>%d<color> l�n.", awardCnt)
        szTitle = szTitle.."\n      <color=red>H�m nay �� nh�n r�i, mai h�y quay l�i!<color>"
        Talk(1,"main",szTitle)
        return 
    end
    if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
        szTitle = szTitle..format("\n      �� nh�n <color=green>%d<color> l�n.", awardCnt)
        szTitle = szTitle.."\n      <color=red>H�nh trang kh�ng �� ch�, c�n c� �t nh�t 2 � tr�ng.<color>"
        Talk(1,"main",szTitle)
		return 0;
    end

    SetTask(2824, 1)
    SetTask(2826, awardCnt+1)
    szTitle = szTitle..format("\n      �� nh�n <color=green>%d<color> l�n.", awardCnt+1)
    if awardCnt+1 == 10 then
        szTitle = szTitle..format("\n      <color=yellow>�� nh�n �� 10 l�n, nh�n ���c %s<color>","Qu� Ng�c Kim (��u)")
        gf_AddItemEx({2,1,31511,1,4}, "Qu� Ng�c Kim (��u)")
    end
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    local ret,itemId = gf_AddItemEx2({2,1,31288,1}, "V� S� N�m M�i", SF_LOG_KEY_WORD, "Nh�n Th��ng Ng�y", resTime)
    Talk(1,"main",szTitle)
end

function FS2019_FireWork1()
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    AskClientForNumber("FS2019_FireWork1Confirm", 1, 99, "Mu�n mua bao nhi�u ph�n??")
end

function FS2019_FireWork2()
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    AskClientForNumber("FS2019_FireWork2Confirm", 1, 99, "Mu�n mua bao nhi�u ph�n??")
end

function FS2019_FireWork1Confirm(nNum)
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local cash = GetCash()
    if cash < nNum * 100 * 10000 then
        Talk(1, "", "Kh�ng �� V�ng")
        return
    end
    Pay(nNum * 100 * 10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    gf_AddItemEx2({2,3,31272,nNum}, "Xu�n L�i", SF_LOG_KEY_WORD, "Mua Xu�n L�i", resTime)
end

function FS2019_FireWork2Confirm(nNum)
    if sf2019_check_main_date() ~= 1 then return end
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local cash = GetCash()
    if cash < nNum * 100 * 10000 then
        Talk(1, "", "Kh�ng �� V�ng")
        return
    end
    Pay(nNum * 100 * 10000)
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    gf_AddItemEx2({2,3,31287,nNum}, "M�n H�ng", SF_LOG_KEY_WORD, "Mua M�n H�ng", resTime)
end

function FS2019_OnSeverStart()
    for i = 1, getn(%tFushenPos) do
        local tPos = %tFushenPos[i]
        local idx = CreateNpc(tFushen[1],tFushen[2],tPos[1],tPos[2],tPos[3])
        SetNpcScript(idx,tFushen[3])
    end
end

tNYFMissions = {
    -- ["guildname"] = dynamicMapId,
    -- id is nil means dungeon has never been opened
    -- id == 0 means dungeon was opened and closed
}

function NYF2019_Open()
    if SF2019_DEBUG ~= 1 then
        if sf2019_check_main_date() ~= 1 then return end
        if sf2019_check_nyf_date() ~= 1 then return end
    end

    local tongName = GetTongName()
    if tongName == "" then
        Talk(1,"",format("<color=green>%s<color>: V�o bang m�i ���c tham gia ho�t ��ng n�y......", GetTargetNpcName()))
		return 0
    end
    local nMapId = tNYFMissions[tongName]
    if nMapId ~= nil then -- �Ѿ����˸���
        if nMapId == 0 then
            Talk(1,"",format("<color=green>%s<color>: M�i bang ch� ���c m� ho�t ��ng C�m ��u N�m 1 l�n.", GetTargetNpcName()))
            return 0
        end
        tbMission:TeamEnter(nMapId, 1); -- �Ѿ����˸���, ֱ�ӽ���
        return
    end

    local nDuty = GetTongDuty();
	if nDuty < 1 or nDuty > 2 then
		Talk(1,"",format("<color=green>%s<color>: Ch� bang ch� v� ph� bang ���c m� ho�t ��ng n�y", GetTargetNpcName()))
		return 0
    end
    nMapId = tbMission:Create();
    tNYFMissions[tongName] = nMapId
    tbMission:TeamEnter(nMapId, 1);
end

function NYF2019_Close()
    local tongName = GetTongName()
    tNYFMissions[tongName] = 0
end

function NYF2019()
    local szTitle = format("<color=green>%s<color>: Trong c� ng�y %d-%d-%d, th�nh vi�n bang h�i c�ng t� t�u m�ng n�m m�i. Ng�y T�t Nguy�n Ti�u, qu�n l� bang c� th� ��n ch� ta h�n ��t C�m ��u N�m.......",
        GetTargetNpcName(),
        tonumber(strsub(NYF2019_DATE,1,4)) or 0, 
        tonumber(strsub(NYF2019_DATE,5,6)) or 0, 
        tonumber(strsub(NYF2019_DATE,7,8)) or 0)
    szTitle = szTitle .. "\n    <color=green>Sau khi m�, s� c� 10 ph�t ch� ��i c�c th�nh vi�n bang ��n �n C�m ��u N�m<color>\n"
    szTitle = szTitle .. "    <color=green>Sau khi m�, C�m ��u N�m k�o d�i 15 ph�t<color>\n"
    szTitle = szTitle .. "    <color=green>M�i bang ch� ���c m� C�m ��u N�m 1 l�n<color>\n"
    szTitle = szTitle .. "    <color=yellow>Ho�t ��ng C�m ��u s� c� nhi�u ph�n qu� s� ���c d�nh cho m�i ng��i<color>\n"
    local tbSay = {}
    local tongName = GetTongName()

    if SF2019_DEBUG == 1 then tinsert(tbSay, "[DEBUG] Tham d� ho�t ��ng C�m ��u N�m/NYF2019_Open") end
    
    if tongName ~= "" and NYF2019_DATE == tonumber(date("%Y%m%d")) then
        local nMapId = tNYFMissions[tongName]
        if nMapId ~= nil then 
            tinsert(tbSay, "Tham d� ho�t ��ng C�m ��u N�m/NYF2019_Open")
        else
            tinsert(tbSay, "M� C�m ��u N�m/NYF2019_Open")
        end
    end
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function SP2019_OnUseAwardTicket(nItemIdx)
    local dateCheck = sf2019_check_ticket_award_date()
    if dateCheck < 1 then
        Talk(1,"","Ch�a ��n th�i gian s� d�ng")
        return 
    end
    if dateCheck > 1 then
        DelItemByIndex(nItemIdx, 1)
        Talk(1,"","V�t ph�m �� qu� h�n s� d�ng!")
        return 
    end
    local szAward = "xinchunchoujiangquan"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","S� d�ng th�t b�i")
        return 0
    end
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        Talk(1,"","S� d�ng th�t b�i")
        return
    end
    Msg2Player(format("B�n �� s� d�ng %s","V� S� N�m M�i"))
    CustomAwardGiveGroup(szAward, 0)
end

function QRJ2019()
    if sf2019_check_qrj_date() ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Trong ng�y L� T�nh Nh�n <color=red>%d- %d-%d<color>, ��n D��ng Ch�u g�p X�o N� �� ho�n th�nh nhi�m v� L� T�nh Nh�n. Sau �� t� ��i v�i m�t nh�n v�t kh�c gi�i, �em ��o c� nh�n ���c t� nhi�m v� ��n ch� ta, s� ���c nh�n qu� L� T�nh Nh�n..", 
        GetTargetNpcName(), 
        tonumber(strsub(QRJ2019_DATE,1,4)) or 0, 
        tonumber(strsub(QRJ2019_DATE,5,6)) or 0, 
        tonumber(strsub(QRJ2019_DATE,7,8)) or 0)
    local tbSay = {}
    tinsert(tbSay, "Tham gia/QRJ2019_StartAct")
    tinsert(tbSay, "��i qu�/QRJ2019_Exchange")
    tinsert(tbSay, "tr� l�i/main")
    Say(szTitle, getn(tbSay), tbSay)
end

function QRJ2019_StartAct()
    if sf2019_check_qrj_date() ~= 1 then return end

    local sex = GetSex()
    local sex2taskID = QRJ_GTASKID_TABLE or nil;
    local sex2Name = {
        "Thi�u hi�p","N� hi�p "
    }
    if not sex2taskID or  not sex2taskID[sex] then
        return
    end

    if gf_GetTaskBit(2828,2) ~= 1 then
        gf_SetTaskBit(2828,2,1)
        for i=1, getn(sex2taskID) do
            for j=1,getn(sex2taskID[i]) do
                --tGtTask:CloseTask(sex2taskID[i][j])
                ClearGTask(sex2taskID[i][j])
            end
        end
    end
    
    if tGtTask:check_task_isfinish(sex2taskID[sex][1]) == 0 and tGtTask:check_cur_task(sex2taskID[sex][1]) == 0 then
        --tGtTask:set_task(1,sex2taskID[sex][1])
        OpenGTask(sex2taskID[sex][1])
        Talk(1,"",format("<color=green>%s<color>: Xu�n �� v�, D��ng Ch�u tr�n ng�p s�c xu�n! %s c� mu�n �i d�o D��ng Ch�u kh�ng? <color=red>(Nhi�m v� ch� c� hi�u l�c trong ng�y h�m nay)<color>", GetTargetNpcName(), sex2Name[sex]))
        Msg2Player("��n D��ng Ch�u, n�i chuy�n v�i X�o N�")
    else
        Talk(1,"",format("<color=green>%s<color>: C�c h� �� nh�n nhi�m v� n�y r�i.", GetTargetNpcName()))
    end
end

function QRJ2019_Exchange()
    if sf2019_check_qrj_date() ~= 1 then return end
    local szNpcName = GetTargetNpcName()
    local sex2Item = {
        [1] = {2,1,31292, "B�n Th�o Xoa ��u Ph��ng (Th��ng)"},
        [2] = {2,1,31293, "B�n Th�o Xoa ��u Ph��ng (H�)"},
    }
    local teamSize = GetTeamSize()
    if teamSize ~= 2 then
        Talk(1,"",format("<color=green>%s<color>: Ch� khi t� ��i 1 nam 1 n� ��n ��y, m�i ���c nh�n qu� ho�t ��ng n�y.", szNpcName))
        return
    end
    if PlayerIndex ~= GetTeamMember(1) then
        Talk(1,"",format("<color=green>%s<color>: C�c h� kh�ng ph�i ��i tr��ng! H�y m�i ��i tr��ng n�i chuy�n v�i ta!.", szNpcName))
        return
    end
    local oldPlayer = PlayerIndex
    local tErrorMsg = {}
    for i = 1, teamSize do
        PlayerIndex = GetTeamMember(i)
        local item = sex2Item[GetSex()]
        if GetItemCount(item[1],item[2],item[3]) < 1 then 
            tinsert(tErrorMsg, format("\n\n    <color=red>%s thi�u [%s].<color>", GetName(), item[4]))
        end
        if gf_GetTaskBit(2828, 1) > 0 then
            tinsert(tErrorMsg, format("\n\n    <color=red>%s �� nh�n th��ng l� t�nh nh�n r�i.<color>", GetName()))
        end
        if gf_Judge_Room_Weight(2, 10) ~= 1 then
            tinsert(tErrorMsg, format("\n\n    <color=red>H�nh trang c�a %s �� ��y.<color>", GetName()))
        end
    end
    PlayerIndex = oldPlayer
    if getn(tErrorMsg) > 0 then
        local szTalk= format("<color=green>%s<color>: Ch�a ��t �i�u ki�n nh�n th��ng.:", szNpcName)
        for i = 1, getn(tErrorMsg) do
            szTalk = szTalk .. tErrorMsg[i]
        end
        Talk(1,"", szTalk)
        return
    end
    local oldPlayer = PlayerIndex
    for i = 1, teamSize do
        PlayerIndex = GetTeamMember(i)
        local item = sex2Item[GetSex()]
        gf_SetTaskBit(2828, 1, 1)
        if DelItem(item[1],item[2],item[3],1) == 1 then
            gf_AddItemEx({2,1,31286,1,4},"Qu� V�n T�nh Trang")
            gf_AddItemEx({2,1,31279,1,4},"B�n Th�o Xoa ��u Ph��ng")
        end
    end
    PlayerIndex = oldPlayer
end