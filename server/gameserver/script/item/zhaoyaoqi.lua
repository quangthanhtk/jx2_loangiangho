-- ������ ʹ�ýű�
Import("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
    if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch�a ho�n th�nh nhi�m v� ph�c sinh ��ng h�nh, t�m th�i kh�ng th� m�!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("S� l��ng b�n ��ng h�nh hi�n t�i v��t qu� 5");
		return 0;
    end

    local tbCustomAward = {
        [PackItemId(2,1,31307)] = "zhaoyaoqi",
        [PackItemId(2,1,31600)] = "dilingjinghua",
    };
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local szAward = tbCustomAward[PackItemId(nGenre, nDetail, nParticular)];

    if not szAward then
        return 0;
    end

    if CustomAwardCheckCondition(szAward, 0, 1) ~=1 then
        return 0;
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if CustomAwardGiveGroup(szAward, 0) > 0 then   --���Ų���Ϊ�Ƿ����ȫ������
            return 1;
        else
            AddItem(nGenre, nDetail, nParticular, 1, 4);
        end
    end
end