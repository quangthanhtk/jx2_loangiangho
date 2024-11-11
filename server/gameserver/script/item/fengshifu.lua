local _,AT_GGS = GetRealmType()
if 1==AT_GGS then
	Include("\\script\\item\\fengshifu_ggs.lua")
else
	Include("\\script\\item\\fengshifu_gs.lua")
end