Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardRepute = SimpleType:new("nRepute")
AwardRepute.pFun = function(nPoint)
    ModifyReputation(nPoint, 0)
end
AwardRepute.szMsgFormat = "Nh�n ���c %d �i�m danh v�ng."