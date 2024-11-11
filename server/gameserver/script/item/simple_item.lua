--Import("\\script\\class\\ktabfile.lua")
--Include("\\script\\lib\\exchangemgr.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\callback.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function _add_popur2(nGDP, nNum)
    local nMax = get_popur2_left_cap(1)
    if nMax > 0 then
        gf_Modify("Popur2", nNum)
        if nGDP == PackItemId(2, 114, 143) then
            AddRuntimeStat(39, 2, 0, floor(nNum / 500))
        elseif nGDP == PackItemId(2, 114, 144) then
            AddRuntimeStat(39, 3, 0, floor(nNum / 1000))
        end
        return 1
    end
    return 0
end

g_tConfig = {
    --batch, award,start_date,end_date
    [PackItemId(2, 114, 117)] = { 0, 0, { WLib.OpenEquipShop, 0, { WLib, EQUIP_SHOP_CHANQUYEN_TINHHOA } }, 0, 0 }, --Õæ¾í¾«»ª
    [PackItemId(2, 114, 143)] = { 100, 1, { _add_popur2, 500, { PackItemId(2, 114, 143) }, "LÞch luyÖn" }, 0, 0 }, --ÕæÎä»êÊ¯
    [PackItemId(2, 114, 144)] = { 100, 1, { _add_popur2, 1000, { PackItemId(2, 114, 144) }, "LÞch luyÖn" }, 0, 0 }, --´óÕæÎä»êÊ¯

    [PackItemId(2, 1, 31014)] = { 100, 10, { AddItem, 1, { 2, 1, 31015, }, "Ch©n Nguyªn Néi §¬n" }, 0, 0 }, --ÕæÔªËéÆ¬
    [PackItemId(2, 97, 378)] = { 100, 10, { AddItem, 1, { 2, 102, 232, 1, 4 }, "NguyÖt Ph¸ch" }, 0, 0 }, --ÕæÔªËéÆ¬
    [PackItemId(2, 97, 379)] = { 100, 10, { AddItem, 1, { 2, 95, 3855, }, "Tinh Hån" }, 0, 0 }, --ÕæÔªËéÆ¬

    [PackItemId(2, 1, 31599)] = { 1, 1, { AddItem, 1, { 0, 105, 218, 1, 4, -1, -1, -1, -1, -1, -1}, "Phï Quang KiÕm" }, 0, 0 }, --ÕæÔªËéÆ¬
}

function OnUse(nItemIdx)
    ConfirmUse(nItemIdx);
end

g_tempCallback = {}
function AskClientForNumberEx(msg, nMin, nMax, ...)
    local key = GetName();
    g_tempCallback[key] = arg;
    AskClientForNumber("AskClientForNumberExCB", nMin, nMax, msg)
end
function AskClientForNumberExCB(nCount)
    local key = GetName();
    local tcb = g_tempCallback[key];
    g_tempCallback[key] = nil;
    ConfirmUse(tcb[1], nCount);
end

function ConfirmUse(nItemIdx, nCount, bSure)

    local g, d, p = GetItemInfoByIndex(nItemIdx);
    local key = PackItemId(g, d, p);
    local tConfig = g_tConfig[key];
    if not tConfig then
        WriteLog(format("[SimpleItem] [No Item Cfg] [Item=(%d,%d,%d)]", g, d, p));
        return
    end

    local szName = GetItemName(g, d, p)
    local batch, need, award, stratD, endD = tConfig[1], tConfig[2], tConfig[3], tConfig[4], tConfig[5]
    stratD = stratD or 0
    endD = endD or 0

    local nToday = tonumber(date("%Y%m%d"))
    if stratD ~= 0 and nToday < stratD then
        local dt = stratD
        local y = floor(dt / 10000);
        dt = mod(dt, 10000)
        local m = floor(dt / 100);
        dt = mod(dt, 100)
        local d = dt
        Talk(1, "", format("VËt phÈm nµy %d-%d-%d míi ®­îc më", y, m, d));
        return
    end

    if endD ~= 0 and nToday > endD then
        Talk(1, "", format("Kh«ng thÓ dïng vËt phÈm nµy n÷a"));
        return
    end

    if award[4] == "LÞch luyÖn" and get_popur2_left_cap(1) <= 0 then
        return
    end

    if batch > 1 and not nCount then
        -- ÅúÁ¿
        local nCount = GetItemCount(g, d, p);
        local nMax = min(floor(nCount / need), batch);
        local msg = format("<color=green>%s:<color> Dïng <color=gold>%d [%s]<color> cã thÓ ®æi <color=red>%d [%s]<color>, muèn ®æi bao nhiªu lÇn?", szName,
                need, szName,
                award[2], award[4]);
        local tSel = {
            format('%s/#AskClientForNumberEx("%s", 1, %d, %d)', "NhËp vµo sè lÇn ®æi", "Sè lÇn ®æi", nMax, nItemIdx),
            "Hñy bá/nothing",
        }
        Say(msg, getn(tSel), tSel)
        return
    else
        nCount = nCount or 1
    end

    if nCount <= 0 then
        WriteLog(format("[SimpleItem] [Error Count] [Count=%d]", nCount));
        return
    end

    local nNeed = nCount * need;
    local nGive = nCount * award[2];

    --if tConfig.Room[1] > 0 and gf_JudgeRoomWeight(1, 100, "") ~= 1 then return end

    --	if tConfig.bSure == 1 and not bSure then
    --		local msg = format("Ê¹ÓÃ%d [%s]¿ÉÒÔ»ñµÃ%d [%s], ÄúÈ·¶¨ÒªÊ¹ÓÃÂð?",
    --			tConfig[1], nNeed,
    --			award[2][2], award[2][3]);
    --		local tSel = {
    --			format("È·¶¨/#ConfirmUse(%d, %d, 1)", nItemIdx, nCount),
    --			"È¡Ïû/nothing",
    --		}
    --		Say(msg, getn(tSel), tSel);
    --		return
    --	end

    local nRet = 0
    if nNeed > 1 then
        nRet = DelItem(g, d, p, nNeed);
    elseif nNeed == 1 then
        nRet = DelItemByIndex(nItemIdx, 1);
    else
        nRet = 1;
    end

    if nRet ~= 1 then
        return Talk(1, "", format("Sè [%s] trªn ng­êi d­êng nh­ ch­a ®ñ!", szName));
    end

    local tPara = {}
    local t = award[3]
    for i = 1, getn(t) do
        tPara[i] = t[i]
    end
    if getn(tPara) < 4 then
        tPara[getn(tPara) + 1] = nGive
    else
        tPara[4] = nGive
    end

    award[1](unpack(tPara));
end

--debug = print
--AddItem(2,95,3690,100)
--function GetItemInfoByIndex() return 2,95,3690 end
--OnUse(1)

