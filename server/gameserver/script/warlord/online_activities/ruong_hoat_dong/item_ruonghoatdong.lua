----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng më tÝch lòy ®iÓm
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szThisFile = "\\script\\warlord\\online_activities\\ruong_hoat_dong\\item_ruonghoatdong.lua";
----------------------------------------------------------------------------------------------------

function OnUse(nItemIdx)
    local tbAward = WRUONGHD.tbBoxAward;
    if GetItemSpecialAttr(nItemIdx, "BIND") == 1 then
        tbAward = WRUONGHD.tbLockBoxAward;
    end

    WTask:ResetDaily();

    if WItem:DelByIndex(nItemIdx, 1) == WEnv.RETCODE_SUCCESS then
        WTask:Set(WTASKID_RUONG_HOATDONG_DAILY_COUNT, WTask:Get(WTASKID_RUONG_HOATDONG_DAILY_COUNT) + 1);
        WPlayer:Msg(format("H«m nay ®· më thµnh c«ng %d R­¬ng Ho¹t §éng!", WTask:Get(WTASKID_RUONG_HOATDONG_DAILY_COUNT)));
        WAward:Give(tbAward);

        local szKey = WRUONGHD.szSdbKeyPrefix .. WDate:Today();
        DelRelayShareDataCopy(szKey, 0, 0);
        AddRelayShareData(szKey, 0, 0, m_szThisFile, "nothing", ORDER_BY_DESC, WPlayer:GetName(), "dddd", WTask:Get(WTASKID_RUONG_HOATDONG_DAILY_COUNT), WPlayer:GetRoute(), WPlayer:GetBigLevel(), 0);
    end
end
