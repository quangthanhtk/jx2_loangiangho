Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function sf2017_killnpc()
    if sf2017_indate(SF2017_DATE_ACT4_1) ~= 1 then return end 
    local nRnd = random(1,100)
    if nRnd <= 4 then
        local tItem = SF2017_FIRE.normal
        AddItemWithJudge(tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    end
end

function sf2017_mission()
    if sf2017_indate(SF2017_DATE_ACT4_2) ~= 1 then return end 
    local szTitle = format("<color=green>%s<color>: M�i ng�y m�i ng��i ph�i t�n 2 Thi�n Ki�u L�nh �� m� nhi�m v� thu ph�, m�i ng�y ���c nh�n 20 l�n nhi�m v�.",SF2017_HDDS.szName)
    local tbSay  = {}
    
    local nRand = random(1,100)
    local nType = 1 
    if nRand >=1 and nRand <= 60 then nType = 1
    elseif nRand >=61 and nRand <= 90 then nType = 2
    elseif nRand >=91 and nRand <= 100 then nType = 3
    end
    tinsert(tbSay,format("Nh�n nhi�m v� /#sf2017_mission_choose(%d)",nType))
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_mission_check()
    for i = 1, getn(SF2017_MISSION.low) do 
        local nTaskId = SF2017_MISSION.low[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    for i = 1, getn(SF2017_MISSION.mid) do 
        local nTaskId = SF2017_MISSION.mid[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    for i = 1, getn(SF2017_MISSION.high) do 
        local nTaskId = SF2017_MISSION.high[i]
        if tGtTask:check_cur_task(nTaskId) == 1 then return nTaskId end
    end
    return 0
end 

function sf2017_mission_choose(nType)
    if sf2017_indate(SF2017_DATE_ACT4_2) ~= 1 then return end 
    if sf2017_mission_check() ~= 0 then
        Talk(1,"",format("<color=green>%s<color>: B�n �� nh�n 1 nhi�m v�, h�y ho�n th�nh nhi�m v� �� ��.",SF2017_HDDS.szName))
        return 
    end
    local nFlag = get_task("id_mission")
    if nFlag >= SF2017_MISSION.limit then
        Talk(1,"",format("<color=green>%s<color>: M�i ng�y nh�n t�i �a %d nhi�m v�, s� nhi�m v� b�n nh�n h�m nay �� ��t t�i �a.",SF2017_HDDS.szName,SF2017_MISSION.limit))
        return 
    end
    if gf_Judge_Room_Weight(1, 500) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return
    end
    if get_task("id_mission") == 0 then 
        local nTJL = GetItemCount(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3])
        if nTJL < SF2017_MISSION.nTJL then
            Talk(1,"",format("<color=green>%s<color>: M�i ng�y m� nhi�m v� c�n %d Thi�n Ki�u L�nh, Thi�n Ki�u L�nh tr�n ng��i kh�ng ��.",SF2017_HDDS.szName,SF2017_MISSION.nTJL))
            return
        end
        if DelItem(SF2017_TJL[1],SF2017_TJL[2],SF2017_TJL[3],SF2017_MISSION.nTJL) ~= 1 then return end
    end
    local tMission = {}
    if nType == 1 then tMission = SF2017_MISSION.low
    elseif nType == 2 then tMission = SF2017_MISSION.mid
    elseif nType == 3 then tMission = SF2017_MISSION.high
    end
    local nRand = random(1,getn(tMission))
    if OpenGTask(tMission[nRand]) == 1 then
        Msg2Player("B�n �� nh�n nhi�m v� th�nh c�ng")
        set_task("id_mission",nFlag+1)
    end
end

function sf2017_complete(nType)
    local nRand = random(1,100)
    if nType == 2 then
        if nRand <= 20 then
           local _,nIndex = AddItemWithJudge(2,200,69,1,0,"M�nh Thi�n Tinh Th�ch")
			SetItemExpireTime(nIndex,30*24*3600)
        end
    elseif nType == 3 then
        if nRand <= 10 then
           local _,nIndex = AddItemWithJudge(2,200,70,1,0,"M�nh H�c B�ch K�")
			SetItemExpireTime(nIndex,30*24*3600)
        end
    end
end

function sf2017_finish_mission()
    local tskid = sf2017_mission_check()
    local id = tskid - 487 -- ����ڱ��е�����
    local szNpcName = GetNpcName(GetTargetNpc())
    local szSex = "��i hi�p"
    if id <= 0 then
        if szNpcName ~= SF2017_HDDS.szName then Talk(1,"","B�n ch�a nh�n nhi�m v�, h�y ��n g�p ��i S� Ho�t ��ng Xu�n M�i �� nh�n.") end
        return 0 
    end
    if GetSex() == 2 then szSex = "N� hi�p " end
    if SF2017_FINISH_TASK[id][2] ~= szNpcName then
        if szNpcName ~= SF2017_HDDS.szName then Talk(1,"",format("Nhi�m v� n�y kh�ng li�n quan ��n t�i, c� ph�i %s �� t�m nh�m ng��i kh�ng?",szSex)) end
        return 0 
    end -- �������NPC
    if FinishGTask(tskid) == 1 then
        Talk(1,"","Nhi�m v� ho�n th�nh!")
        Msg2Player("Nhi�m v� ho�n th�nh!")
        return 1
    else
        Msg2Player("V�n ch�a ho�n th�nh nhi�m v�!")
    end
    return 0
end

function sf2017_mission_description()
    Talk(1,"",format("<color=green>%s<color>: Xu�n m�i s�p ��n r�i, ho�n th�nh nhi�m v� thu th�p H�a D��c c�a ��i S� Ho�t ��ng Xu�n M�i s� nh�n ���c H�a D��c Tinh Ch�. Di�t ��ng H�i H�i T�n 1, ��ng H�i H�i T�n 2 v� qu�i trong ��o Hoa ��o s� c� x�c su�t nh�n ���c H�a D��c S� Ch�. Trong th�i gian T�t, c� th� �em H�a D��c ��n ch� ��i S� Xu�n M�i gh�p th�nh Ph�o �� �u�i Ni�n Th�.",SF2017_HDDS.szName))
end