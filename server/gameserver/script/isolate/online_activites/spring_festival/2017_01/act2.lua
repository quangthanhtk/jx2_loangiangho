-- ������	Ѱ�Ҹ���
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")

function sf2017_talk2fushen()
    if sf2017_indate(SF2017_DATE_ACT2) ~= 1 then return end
    local szTitle = format("<color=green>%s<color>: Xu�n m�i vui v�!",SF2017_FUSHEN.szName)
    local tbSay  = {}
    if SF2017_FUSHEN.nCnt < SF2017_FUSHEN.lim then 
        tinsert(tbSay,"Nh�n l�y ph�n th��ng./sf2017_on_fushen")
    else
        szTitle = szTitle.."L�n n�y t�i �� t�ng h�t ph�n th��ng r�i, l�n sau h�y t�m ��n t�i nhanh h�n nh�."
    end
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_on_fushen()
    if sf2017_indate(SF2017_DATE_ACT2) ~= 1 then return end
    local szPlayerName = GetName()
    local szNpcName = format("<color=green>%s<color>:",SF2017_FUSHEN.szName)
    if SF2017_FUSHEN.nCnt >= SF2017_FUSHEN.lim then
        Talk(1,"",szNpcName.."L�n n�y t�i �� t�ng h�t ph�n th��ng r�i, l�n sau h�y t�m ��n t�i nhanh h�n nh�.")
        return
    end
    if get_task("id_last_fushen",nHash) == SF2017_FUSHEN.nHash then
        Talk(1,"",szNpcName.."B�n �� nh�n th��ng � ch� t�i r�i, m�i ng��i ch� ���c nh�n 1 l�n th�i!")
        return
    end
    if sf2017_give_fushen_award() == 1 then
        set_task("id_last_fushen",SF2017_FUSHEN.nHash)
        SF2017_FUSHEN.nCnt = SF2017_FUSHEN.nCnt + 1;
    end
end
