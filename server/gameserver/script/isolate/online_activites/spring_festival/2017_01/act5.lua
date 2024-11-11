-- ��������
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\function\\ornament\\ornament.lua")
function sf2017_make_normalfirecrackers()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local nFire = GetItemCount(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < 1 then Talk(1,"",szNpcName.."H�a D��c S� Ch� tr�n ng��i kh�ng ��.") return end
    if nCash < 20000 then Talk(1,"",szNpcName.."V�ng tr�n ng��i kh�ng ��.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh�ng gian h�nh trang kh�ng d�") return end
    local nMax = min(nFire,99)
    AskClientForNumber("sf2017_make_normalfirecrackersCB", 0, nMax, "Mu�n ch� bao nhi�u c�i?");
end

function sf2017_make_normalfirecrackersCB(nNum)
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if nNum == 0 then return end
    local nFire = GetItemCount(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < nNum then Talk(1,"",szNpcName.."H�a D��c S� Ch� tr�n ng��i kh�ng ��.") return end
    if nCash < 20000*nNum then Talk(1,"",szNpcName.."V�ng tr�n ng��i kh�ng ��.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh�ng gian h�nh trang kh�ng d�") return end
    if DelItem(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3],nNum) ~= 1 then return end
    Pay(20000*nNum)
    local tItem = SF2017_FIRECRACKERS.normal
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
end

function sf2017_make_delicatefirecrackers()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local nFire = GetItemCount(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < 1 then Talk(1,"",szNpcName.."H�a D��c Tinh Ch� tr�n ng��i kh�ng ��.") return end
    if nCash < 50000 then Talk(1,"",szNpcName.."V�ng tr�n ng��i kh�ng ��.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh�ng gian h�nh trang kh�ng d�") return end
    local nMax = min(nFire,99)
    AskClientForNumber("sf2017_make_delicatefirecrackersCB", 0, nMax, "Mu�n ch� bao nhi�u c�i?");
end
function sf2017_make_delicatefirecrackersCB(nNum)
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if nNum == 0 then return end
    local nFire = GetItemCount(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3])
    local nCash = GetCash()
    local szNpcName = format("<color=green>%s<color>:",SF2017_HDDS.szName)
    if nFire < nNum then Talk(1,"",szNpcName.."H�a D��c Tinh Ch� tr�n ng��i kh�ng ��.") return end
    if nCash < 50000*nNum then Talk(1,"",szNpcName.."V�ng tr�n ng��i kh�ng ��.") return end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"",szNpcName.."Kh�ng gian h�nh trang kh�ng d�") return end
    if DelItem(SF2017_FIRE.delicate[1],SF2017_FIRE.delicate[2],SF2017_FIRE.delicate[3],nNum) ~= 1 then return end
    Pay(50000*nNum)
    local tItem = SF2017_FIRECRACKERS.delicate
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],nNum,4,tItem[4])
end

function sf2017_use_firecrackers(nIndex)
    local g,d,p = GetItemInfoByIndex(nIndex)
    local m,x,y = GetWorldPos()
    local nUseNormal = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.firecrackers)
    if p == SF2017_FIRECRACKERS.normal[3] then
        if nUseNormal >= SF2017_FIRECRACKERS.nUselimit then
            Talk(1,"","Ph�o S� ch� ���c s� d�ng t�i �a 25 c�i m�i ng�y, h�m nay b�n �� s� d�ng ��t s� l��ng t�i �a.")
            return
        end
    end
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (<color=red>2017/1/26 - 2017/2/1<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (m�i ng�y l�c <color=red>12:00-14:00<color> v� <color=red>19:00-24:00<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Ni�n Th� �� b� d�a s� b� ch�y r�i, h�y ch� Ni�n Th� xu�t hi�n l�i r�i s� d�ng.") return end
    local posx = SF2017_MONSTER.tPos[2];
    local posy = SF2017_MONSTER.tPos[3];
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if m ~= SF2017_MONSTER.tPos[1] or k >20 then
        Talk(1,"","Ph�o ch� ���c s� d�ng � g�n Ni�n Th�.")
        return
    end
    if DelItemByIndex(nIndex,1) ~= 1 then return end
    if p == SF2017_FIRECRACKERS.normal[3] then
        local nRand = random(1,100)
        local nHurt = 1
        if nRand <= 10 then
            nHurt = 2
        end
        SF2017_MONSTER:BeAttacked(nHurt,1)
        set_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.firecrackers,nUseNormal+1)
    elseif p == SF2017_FIRECRACKERS.delicate[3] then
        SF2017_MONSTER:BeAttacked(2,2)
    end
end
function sf2017_talk2xcbox()
    local tItem = SF2017_BOX.tItem
    local nIdx = GetTargetNpc()
    local nTime = GetTime()
    local nLastTime = get_task("id_get_box")
    local nGot = get_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.box)
    if nGot >= SF2017_BOX.nMaxLimit then
        Talk(1,"","Trong 1 ng�y ch� ���c nh�t 3 l�n R��ng Xu�n M�i.")
        return
    end
    if nLastTime + SF2017_BOX.nColdTime > nTime then
        Talk(1,"","Trong 1 ph�t ch� ���c nh�t 1 l�n th�i!")
        return
    end
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    if SF2017_DEBUG == 1 then
        print("\naddItem",tItem[1],tItem[2],tItem[3],1,4,tItem[4])
    end
    SetNpcLifeTime(nIdx,0)
    set_task("id_get_box",nTime)
    set_task_byte("id_dc_byte",SF2017_BYTE_DCTSK.box,nGot+1)
end

function sf2017_get_box_fromDS()
    local m,_,_ = GetWorldPos()
    if m ~= 100 then
        Talk(1,"","H�y ��n ch� ��i S� Ho�t ��ng Tuy�n Ch�u nh�n th��ng.")
        return
    end
    local nMax = SF2017_MONSTER.DeadCnt;
    if nMax == 0 then
        Talk(1,"",format("<color=green>%s<color>: Hi�n v�n ch�a �u�i Ni�n Th�t h�nh c�ng.",SF2017_HDDS.szName))
        return  
    end
    local nGot = get_task("id_get_box_fromDS")
    if nGot >= nMax then
        Talk(1,"",format("<color=green>%s<color>: B�n �� nh�n th��ng �u�i Ni�n Th� tr��c r�i, n�u mu�n nh�n l�i, h�y c� g�ng �u�i Ni�n Th� ti�p theo!",SF2017_HDDS.szName))
        return
    end
    local tItem = SF2017_BOX.tItem
    AddItemWithJudge(tItem[1],tItem[2],tItem[3],5,4,tItem[4])
    set_task("id_get_box_fromDS",nGot+1)
end

function sf2017_monster_description()
    local szTitle = format("<color=green>%s<color>: Ch�c m�ng xu�n m�i!",SF2017_HDDS.szName)
    local tbSay  = {}
    tinsert(tbSay,"Gi�i thi�u ho�t ��ng Ng�m Hoa ��o/#sf2017_Actdescription(1)")
    tinsert(tbSay,"Gi�i thi�u ho�t ��ng T�m Ph�c Th�n/#sf2017_Actdescription(2)")
    tinsert(tbSay,"Gi�i thi�u ho�t ��ng �u�i Ni�n Th�/#sf2017_Actdescription(3)")
    tinsert(tbSay,"Gi�i thi�u ho�t ��ng H�ng Ph�c Tr�i Ban/#sf2017_Actdescription(4)")
    tinsert(tbSay,"Gi�i thi�u c�a h�ng Xu�n M�i/#sf2017_Actdescription(5)")
    tinsert(tbSay,"tr� l�i/#sf2017_talk2hdds()")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_Actdescription(nType)
    local nSex = GetSex()
    local szSex = "��i hi�p"
    if nSex == 2 then szSex = "N� hi�p " end
    if nType == 1 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong th�i gian ho�t ��ng, %s c� th� ��n Tuy�n Ch�u, Th�nh ��, Bi�n Kinh, T��ng D��ng ��i tho�i v�i C�y ��o v� h�i Hoa ��o. M�i ng��i m�i ng�y ���c h�i 10 l�n, m�i l�n h�i c�ch nhau 6s. Nh�n chu�t ph�i s� d�ng Hoa ��o h�i ���c �� nh�n th��ng.",SF2017_HDDS.szName,szSex))
    elseif nType == 2 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong th�i gian ho�t ��ng, m�i ng�y l�c 12h, 14h, 16h, 18h, 20h, 21h, 22h v� 23h, Ph�c Th�n s� xu�t hi�n � m�t trong 3 th�nh Bi�n Kinh, Th�nh �� v� Tuy�n Ch�u. T�m ���c Ph�c Th�n, ti�n h�nh ��i tho�i s� nh�n ���c ph�n th��ng. M�i Ph�c Th�n ch� t�ng 100 ph�n th��ng, m�i ng��i ch�i ch� ���c nh�n 1 l�n ph�n th��ng t� 1 Ph�c Th�n. M�i Ph�c Th�n t�n t�i 30 ph�t.",SF2017_HDDS.szName))
    elseif nType == 3 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong th�i gian ho�t ��ng, m�i ng�y ng��i ch�i c� th� ��i tho�i v�i ��i S� Ho�t ��ng Xu�n M�i, s� d�ng H�a D��c S� Ch� v� 2 V�ng s� ch� ���c Ph�o S� Ch�. S� d�ng 1 H�a D��c Tinh Ch� v� 5 V�ng s� ch� ���c Ph�o Tinh Ch�. S� d�ng Ph�o S� Ch� v�i Ni�n Th� s� t�ng 1 �i�m s� h�i cho Ni�n Th� v� nh�n ���c 1 Thi�p B�c Xu�n M�i. S� d�ng Ph�o Tinh Ch� v�i Ni�n Th� s� t�ng 2 �i�m s� h�i cho Ni�n Th� v� nh�n ���c 1 Thi�p V�ng Xu�n M�i. Thi�p B�c Xu�n M�i v� Thi�p V�ng Xu�n M�i d�ng �� ��i v�t ph�m � c�a h�ng Xu�n M�i.",SF2017_HDDS.szName))
    elseif nType == 4 then
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Trong th�i gian 2017-1-28 ��n 2-1, ��ng nh�p tr� ch�i v� ��i tho�i v�i ��i S� Ho�t ��ng Xu�n M�i s� nh�n ���c 1 b� ngo�i trang X�ch Vi�n L�ng H�c (7 ng�y) ph� h�p v�i th� h�nh b�n th�n. S� d�ng 1 ngo�i trang X�ch Vi�n L�ng H�c c� th�i h�n, 40 Thi�n Ki�u L�nh v� 500 V�ng ��i l�y 1 ngo�i trang X�ch Vi�n L�ng H�c v�nh vi�n.",SF2017_HDDS.szName))
    else 
        Talk(1,"sf2017_monster_description",format("<color=green>%s<color>: Th�i gian m� c�a h�ng Xu�n M�i g�m 2 giai �o�n, giai �o�n 1: 2017-1-26 5:00 ��n 2-1 24:00, giai �o�n 2: 2017-2-2 5:00 ��n 2-8 24:00. � m�i giai �o�n, c�a h�ng s� b�n c�c lo�i v�t ph�m kh�c nhau.",SF2017_HDDS.szName))
    end
end

function sf2017_exc_wushi()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Mu�n ��i [L�n S�] c� th�i h�n th�nh [L�n S�] v�nh vi�n, c�n <color=red>1 Thi�n Cang L�nh<color>, <color=red>1 Thi�n M�n Kim L�nh<color> v� <color=red>3600 �i�m Phong Hoa<color>. Mu�n ��i?",SF2017_HDDS.szName)
    local tbSay  = {}
    tinsert(tbSay,"���c/sf2017_exc_wushi_confirm")
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_exc_wushi_confirm()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    local bGot = get_task("id_wushi")
    if bGot == 1 then Talk(1,"","B�n �� ��i th� c��i v�nh vi�n n�y r�i, kh�ng th� ��i th�m.") return end
    local nWushi = GetItemCount(SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3]) if nWushi < 1 then Talk(1,"","H�y ��t [L�n S�] c� th�i h�n v�o t�i.")return end
    local nTGL   = GetItemCount(SF2017_TGL[1],SF2017_TGL[2],SF2017_TGL[3]) if nTGL < 1 then Talk(1,"","Thi�n Cang L�nh kh�ng ��.")return end
    local nTMJL  = GetItemCount(SF2017_TMJL[1],SF2017_TMJL[2],SF2017_TMJL[3]) if nTMJL < 1 then Talk(1,"","Thi�n M�n Kim L�nh kh�ng ��.")return end
    local nFenghua = ornament_get_score() if nFenghua < 3600 then Talk(1,"","�i�m Phong Hoa kh�ng ��.")return end
    if DelItem(SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3],1) ~= 1 then return end
    if DelItem(SF2017_TGL[1],SF2017_TGL[2],SF2017_TGL[3],1) ~= 1 then return end
    if DelItem(SF2017_TMJL[1],SF2017_TMJL[2],SF2017_TMJL[3],1) ~= 1 then return end
    ornament_add_score(-3600)
    Msg2Player(format("B�n �� m�t 3600 �i�m Phong Hoa, �i�m c�n l�i l� %s",ornament_get_score()))
    gf_AddItemEx({SF2017_WUSHI[1],SF2017_WUSHI[2],SF2017_WUSHI[3],1,4,-1,-1,-1,-1,-1,-1},SF2017_WUSHI[4])
    set_task("id_wushi",1)
end

function sf2017_ask_number()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (<color=red>2017/1/26 - 2017/2/1<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (m�i ng�y l�c <color=red>12:00-14:00<color> v� <color=red>19:00-24:00<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Ni�n Th� �� b� d�a s� b� ch�y r�i, h�y ch� Ni�n Th� xu�t hi�n l�i r�i s� d�ng.") return end
    local m,x,y = GetWorldPos()
    local posx = SF2017_MONSTER.tPos[2];
    local posy = SF2017_MONSTER.tPos[3];
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if m ~= SF2017_MONSTER.tPos[1] or k >20 then
        Talk(1,"","Ph�o ch� ���c s� d�ng � g�n Ni�n Th�.")
        return
    end
    local tItem = SF2017_FIRECRACKERS.delicate;
    local nItem = GetItemCount(tItem[1],tItem[2],tItem[3])
    local nMax = min(100,nItem)
    AskClientForNumber("sf2017_use_delicate", 1, nMax, "S� d�ng bao nhi�u?");
end
function sf2017_use_delicate(nNum) 
    local nUsed = nNum
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (<color=red>2017/1/26 - 2017/2/1<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if sf2017_intime(SF2017_MONSTER.ActTime[1]) ~= 1 and sf2017_intime(SF2017_MONSTER.ActTime[2]) ~= 1 then
        Talk(1,"","Ch� trong th�i gian ho�t ��ng (m�i ng�y l�c <color=red>12:00-14:00<color> v� <color=red>19:00-24:00<color>) m�i ���c s� d�ng Ph�o.")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return 0
    end
    if SF2017_MONSTER.isLife == 0 then Talk(1,"","Ni�n Th� �� b� d�a s� b� ch�y r�i, h�y ch� Ni�n Th� xu�t hi�n l�i r�i s� d�ng.") return end
    if SF2017_MONSTER.nHp < nNum * 2 then 
        nUsed = floor((SF2017_MONSTER.nHp+1)/2);
    end
    local tItem = SF2017_FIRECRACKERS.delicate;
    if DelItem(tItem[1],tItem[2],tItem[3],nUsed) ~= 1 then return end
    SF2017_MONSTER:BeAttacked(nUsed*2,2,nUsed)
    if SF2017_MONSTER.nHp+1 < nNum * 2 then 
        Msg2Player(format("Do sinh l�c c�a Ni�n Th� kh�ng ��, b�n ch� s� d�ng th�nh c�ng % Ph�o Tinh Ch�!",nUsed))
    end
end
