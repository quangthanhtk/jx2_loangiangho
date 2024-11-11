Include("\\script\\missions\\taixu_mission\\head.lua")



function OnUse(nItemidx)

    local g,d,p = GetItemInfoByIndex(nItemidx);
    local itemID = PackItemId(g,d,p)
    local item = tTxExpGDP2Item[itemID]

    local nSubWorldTmpId = GetMapTemplate(SubWorld)
    local nDrugTime = 60 * 30
    if nSubWorldTmpId ~= 1010 then
        Talk(1,"","§¹o cô chØ dïng trong <color=yellow>Th¸i H­ HuyÔn C¶nh<color>!")
        return
    end
    local nCurTime = GetTime()
    local nLastTime = GetTask(TAIXU_TASKID_EXP_DRUG_TIME);
    if nLastTime > nCurTime then -- ÉÏ´ÎÒ©Ð§»¹Ã»¹ý
        Talk(1,"","§· cã hiÖu qu¶ cïng lo¹i, kh«ng thÓ dïng trïng lÆp!")
        return
    end
    if DelItemByIndex(nItemidx, 1) == 1 then
        AddRuntimeStat(71, 1, 0, 1)
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
        Msg2Player(format("%s ®ang cã hiÖu lùc, Th¸i H­ HuyÔn C¶nh nhËn %s. Cßn %d gi©y.",item[2],item[3], nDrugTime))
        SetTask(TAIXU_TASKID_EXP_DRUG_TIME, nCurTime + nDrugTime)
        SetTask(TAIXU_TASKID_EXP_DRUG_TYPE, item[1])
    end
end