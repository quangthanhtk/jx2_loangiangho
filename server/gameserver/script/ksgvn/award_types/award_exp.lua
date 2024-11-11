Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardExp = SimpleType:new("nExp")
AwardExp.pFun = function(nAmount)
    if GetPlayerRebornParam(0) == 0 then
        local nExpCanAdd = MAX_EXP - GetExp()
        if nAmount > nExpCanAdd then
            nAmount = nExpCanAdd
            if nAmount > 0 then
                KsgPlayer:Msg("�i�m kinh nghi�m �� ��t gi�i h�n t�i �a n�n c�c h� kh�ng th� nh�n �� s� kinh nghi�m th��ng!")
            else
                KsgPlayer:Msg("�i�m kinh nghi�m �� ��t gi�i h�n t�i �a!")
                return -- only return here
            end
        end
    end
    KsgPlayer:BigAddExp(nAmount)
end
