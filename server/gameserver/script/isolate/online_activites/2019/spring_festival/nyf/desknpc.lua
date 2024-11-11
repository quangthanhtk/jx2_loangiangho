Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\mission.lua")
Import("\\script\\lib\\globalfunctions.lua")
function main()
    local szTitle = format("Ti�u hao 50 V�ng, m�i th�nh vi�n trong bang u�ng r��u")
    local tbSay = {}
    tinsert(tbSay, "��ng �/confirm")
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

tWord = {
    "Nh�n d�p T�t Nguy�n ��n, m�i ng��i h�p m�t. [%s] ch�c m�i ng��i n�m m�i vui v�, v�n s� nh� �!",
    "N�m m�i �� ��n, [%s] ch�c m�i ng��i may m�n, m�i m�i vui v�!",
    "N�m m�i vui v�! [%s] ch�c m�i ng��i ph�t t�i, gia ��nh h�nh ph�c!",
}

function player_jingjiu_award()
    local awardTimes = GetTask(2830) 
    if awardTimes >= 20 then
        Msg2Player("�� u�ng tho�i m�i, kh�ng th� nh�n th�m ph�n th��ng m�i r��u!")
        return
    end
    SetTask(2830, awardTimes + 1)
    local nExp = 300000
	local nPopur = 10
	Msg2Player("Ng��i �� nh�n ���c ph�n th��ng m�i r��u:")
	gf_Modify("Exp", nExp);
	gf_Modify("Popur2", nPopur)
end

function confirm()
    if GetTask(2829) > 0 then
        Talk(1,"","Ng��i �� kh�ng u�ng ���c n�a, kh�ng th� m�i r��u m�i ng��i.")
        return
    end
    if Pay(500000) == 1 then
        SetTask(2829, 1)
        this.msCamp:turnPlayer(0, player_jingjiu_award);
        Msg2SubWorld(format(tWord[random(1,getn(tWord))],GetName()))
    else
        Talk(1,"","V�ng tr�n ng��i kh�ng ��")
        return
    end
end