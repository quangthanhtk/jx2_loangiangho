----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-24
--- Description: GM item all in one
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>§Æc c¸ch hç trî<color>: ";

function OnUse(nItemIdx, bConfirm)
    bConfirm = tonumber(bConfirm) or 0;
    if bConfirm == 0 then
        WNpc:SayConfirm("<npcname>: Sau khi sö dông lËp tøc ®­îc reset tr¹ng th¸i nhËn trang bÞ hç trî trong <color=white>ThÎ T©n Thñ<color>, trõ Th­¬ng H¶i Di Ch©u. <sex> ®ång ý sö dông kh«ng?",
                format("OnUse(%d, 1)", nItemIdx));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WItem:DelByIndex(nItemIdx, 1) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Thu håi vËt phÈm thÊt b¹i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    local tbExceptTask = {
        [WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU] = 1
    };
    for i = 1, 31 do
        if tbExceptTask[i] == nil then
            WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, i, 0);
        end
    end

    local tbExceptTask2 = {
    };
    for i = 1, 31 do
        if tbExceptTask2[i] == nil then
            WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, i, 0);
        end
    end

    WNpc:Talk("§· reset thµnh c«ng, h·y kiÓm tra l¹i t¹i <color=white>ThÎ T©n Thñ<color>!", WEnv.TRUE);
    return WEnv.RETCODE_SUCCESS;
end
