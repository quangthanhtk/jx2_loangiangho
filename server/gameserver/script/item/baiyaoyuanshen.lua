-- 百妖元神 使用脚本

Import("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIndex)
    if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch璦 ho祅 th祅h nhi謒 v� ph鬰 sinh ng h祅h, t筸 th阨 kh玭g th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� lng b筺 ng h祅h hi謓 t筰 vt qu� 5");
		return 0;
    end

    local szAward = "baiyaoyuanshen"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        return 0
    end
    if DelItemByIndex(nItemIndex, 1) == 1 then
        if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
            return 1
        else
            AddItem(g,d,p, 1,4)
        end
    end
end