Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardChanKhi = SimpleType:new("nChanKhi")
AwardChanKhi.pFun = AwardGenuineQi
AwardChanKhi.szMsgFormat = "Nh�n ���c %d �i�m ch�n kh�."
AwardChanKhi.isValid = function(nAmount)
    return nAmount > 0 and MeridianGetLevel() > 0
end