Include("\\script\\ksgvn\\award_types\\simple_type.lua")
AwardEnergy = SimpleType:new("nEnergy")
AwardEnergy.pFun = function(nAmount)
    ModifyEnergy(nAmount, 1)
end
AwardEnergy.szMsgFormat = "Nh�n ���c %d �i�m tinh l�c."