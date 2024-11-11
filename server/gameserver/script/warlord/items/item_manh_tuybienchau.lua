----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m¶nh tïy biÕn ch©u
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\misc\\left_pearl\\left_pearl_identify.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>M¶nh Tïy BiÕn Ch©u<color>: ";

m_tbItemList = {
    [PackItemId(2, 1, 40046)] = { nComposeLevel = 7, tbComposeProp = { 2, 102, 214 }, nComposeCost = 100 },
};

function OnUse(nItemIdx)
    local g, d, p = GetItemInfoByIndex(nItemIdx);
    local szFragmentName = WItem:GetName(g, d, p);
    local nTempGDP = PackItemId(g, d, p); -- lÊy ra m· item Th­¬ng H¶i Ch©u CÊp X t­¬ng øng
    local nComposeLevel = m_tbItemList[nTempGDP].nComposeLevel;
    local nComposeCost = m_tbItemList[nTempGDP].nComposeCost;

    local tbSay = { format("<npcname>: lµ mét m¶nh vì cña §Þnh H¶i ThÇn Ch©u, thu thËp ®ñ %d %s cã thÓ hîp thµnh mét <color=white>Th­¬ng H¶i Di Ch©u cÊp %d<color> tïy chän.", nComposeCost, szFragmentName,  nComposeLevel),
                    format("%s/#_add_custom_left_pear(%d)", "B¾t ®Çu ghÐp Th­¬ng H¶i Di Ch©u", nItemIdx),
    };

    tinsert(tbSay, "\nT¹m thêi ch­a muèn./nothing");
    WNpc:SayDialog(tbSay);
end

function _add_custom_left_pear(nItemIdx, szGroupName, nSelectIdx, bConfirm)
    if IsBoxLocking() == 1 then
        Talk(1, "", "§Ó ®¶m b¶o an toµn tµi s¶n, ®¹i hiÖp h·y më khãa r­¬ng chøa ®å tr­íc!");
        return
    end

    -- if GetPermission(2) == 0 then
    -- 	Talk(1, "", "ÓÉÓÚ¸±ÃÜÂëµÇÂ½Î´ÉèÖÃÏà¹ØÈ¨ÏÞÎÞ·¨²Ù×÷");
    -- 	return
    -- end


    local g, d, p = GetItemInfoByIndex(nItemIdx);
    local szFragmentName = WItem:GetName(g, d, p);
    local nTempGDP = PackItemId(g, d, p); -- lÊy ra m· item Th­¬ng H¶i Ch©u CÊp X t­¬ng øng
    local tbComposeProp = m_tbItemList[nTempGDP].tbComposeProp;
    local nComposeCost = m_tbItemList[nTempGDP].nComposeCost;
    if WItem:Count(g, d, p) < nComposeCost then
        WNpc:Talk(format("Hµnh trang kh«ng cã ®ñ %d %s, kh«ng thÓ tiÕn hµnh ghÐp ch©u!", nComposeCost, szFragmentName), WEnv.TRUE);
        return 0;
    end
    local nGDP = gf_PackItemGDP(tbComposeProp[1], tbComposeProp[2], tbComposeProp[3]); -- entry point, cÇn lµm ®óng thñ tôc ®Ó nã thèng kª

    if not T_IDENTIFY_ITEM_INFO_LEVEL[nGDP] then
        Talk(1, "", "VËt phÈm kh«ng thÓ gi¸m ®Þnh Th­¬ng H¶i Ch©u!");
        return 0;
    end

    local tLpLvData = T_IDENTIFY_ITEM_INFO_LEVEL[nGDP]
    local nLpLv = tLpLvData[1];
    --print("nLpLv = ",nLpLv)--////////////////////////////////////
    local tInfo = LP_IDENTIFY_INFO and LP_IDENTIFY_INFO[nLpLv];
    --gf_PrintTable(tInfo);--///////////////////////////

    if szGroupName == nil then
        local tbSay = { "<npcname>: chän lo¹i ch©u muèn ghÐp thµnh!" };

        local tbGroup = {};
        for k, v in pairs(tInfo) do
            if k ~= "n" then
                tbGroup[WLib:Split(v[2], "-")[1] or ""] = 1;
            end
        end

        for k, v in pairs(tbGroup) do
            if k ~= "n" and k ~= "" then
                tinsert(tbSay, format("Nhãm ch©u [%s]/#_add_custom_left_pear(%d, %q)", k, nItemIdx, k));
            end
        end

        tinsert(tbSay, "\nT¹m thêi ch­a muèn./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "<npcname>: chän ch©u muèn ghÐp thµnh!" };

        local tbGroup = {};
        for k, v in pairs(tInfo) do
            if k ~= "n" and v[2] ~= nil then
                local szRowGroupName = WLib:Split(v[2], "-")[1] or "";
                if szGroupName == szRowGroupName then
                    tbGroup[k] = v;
                end
            end
        end

        for k, v in pairs(tbGroup) do
            if k ~= "n" and v[2] ~= nil then
                tinsert(tbSay, format("%s/#_add_custom_left_pear(%d, %q, %d)", v[2], nItemIdx, szGroupName, k));
            end
        end

        tinsert(tbSay, "\nT¹m thêi ch­a muèn./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if not tInfo then
        Talk(1, "", "VËt phÈm nµy kh«ng thÓ gi¸m ®Þnh ra Th­¬ng H¶i Ch©u.");
        return 0;
    end

    if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
        return 0;
    end

    local tRet = tInfo[nSelectIdx];--gf_RandRate(tInfo, nil, 7);

    bConfirm = tonumber(bConfirm) or 0;
    if bConfirm == 0 then
        WNpc:SayConfirm(format("<sex> x¸c nhËn muèn ghÐp <color=white>%d %s<color> thµnh <color=white>1 %s<color> cÊp <color=white>%d<color> kh«ng?", nComposeCost, szFragmentName, WItem:GetName(tRet[4], tRet[5], tRet[6]), tRet[1] or nLpLv), format("_add_custom_left_pear(%d, %q, %d, 1)", nItemIdx, szGroupName, nSelectIdx));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    gf_SetLogCaption("[LeftPearl][IdentifyLeftPearl]");

    if WItem:Delete(g, d, p, nComposeCost) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format("Hµnh trang kh«ng cã ®ñ %d %s, kh«ng thÓ tiÕn hµnh ghÐp ch©u!", nComposeCost, szFragmentName), WEnv.TRUE);
        return 0;
    end

    local nBind = tLpLvData[2] and 4 or 1;

    local nRet, nLeftPearlIdx = gf_AddItemEx({ tRet[4], tRet[5], tRet[6], 1, nBind }, format("%s(cÊp %d)", tRet[2] or GetItemName(tRet[4], tRet[5], tRet[6]), tRet[1] or nLpLv), 1);
    --print("nLeftPearlIdx = ", nLeftPearlIdx)--//////////////////////////

    if nRet == 1 then
        --print("g,d,p =", tRet[4],tRet[5],tRet[6]);

        -- local nTaskID = T_ACHI_LEFT_PEARL[GetItemLevel(nLeftPearlIdx)] or 0;
        -- if nTaskID ~= 0 then
        -- 	gf_ModifyTask(nTaskID, 1);
        -- 	gf_OnAchEvent(nTaskID);
        -- end
    end

    local nGroupID = LeftPearl_GetGroupIDByGDP(tRet[4], tRet[5], tRet[6]);

    SendScript2VM([[\script\misc\left_pearl\left_pearl.lua]], format("init_left_pearl(%d, %d, %d, %d)", nLeftPearlIdx, GetItemLevel(nLeftPearlIdx), nGroupID, 0));
    gf_SetLogCaption("");

    if T_RUNTIME_STATE_KEY[nGDP] then
        local tStateKey = T_RUNTIME_STATE_KEY[nGDP];
        AddRuntimeStat(tStateKey[1], tStateKey[2], 0, 1);
    end

    WNpc:Talk(format("Chóc mõng <sex> ®· ghÐp thµnh c«ng <color=white>%s<color> cÊp <color=white>%d<color> thµnh c«ng!", WItem:GetName(tRet[4], tRet[5], tRet[6]), tRet[1] or nLpLv), WEnv.TRUE);
    return nLeftPearlIdx;
end
