--脚本名称：灵魄开启脚本
--脚本功能：点击灵魄开启的回调脚本，主要用于开启条件的判断
--代码开发人：刘宇斌
--代码开发时间：2010-3-23
--代码修改记录：
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
function main(szSoulName)
	--灵魄等级的获取和判断
	local nSoulChoose = 0;
	for i = 1, getn(VIE_201005_REBORN_TB_WeaponEffectInfo) do
		if VIE_201005_REBORN_TB_WeaponEffectInfo[i][1] == szSoulName then
			nSoulChoose = i;
			break;
		end
	end
	if nSoulChoose == 0 then
		return 0;
	end

	
	--灵魄开启条件判断
	--local bFlag = dostring(VIE_201005_REBORN_TB_WeaponEffectInfo[nSoulChoose][6]) 
    --if bFlag == 0 then
    --    Talk(1,"","<color=green>提示<color>：您当前无法满足灵魄<color=yellow>"..szSoulName.."<color>的召唤条件-"..VIE_201005_REBORN_TB_WeaponEffectInfo[nSoulChoose][3].."，暂时无法召唤灵魄。")
    --end
    --return bFlag;
    return 1;
end
