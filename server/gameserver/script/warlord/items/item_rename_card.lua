Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\global\\battlefield_callback.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
--Include("\\script\\warlord\\task_id_def.lua");
----------------------------------------------------------------------------------------------------

szName = "<color=green>ThÎ §æi Tªn<color>: "

-- VNG chøc n¨ng b¶o vÖ c«ng tr¹ng chuyÓn server
TSK_TRANS_POINT = 2150;
TSK_TRANS_DATE  = 2151;
TSK_TRANS_POINT_ALLOW = 2711;

function OnUse(nitem)
    -- local nW = tonumber(date("%w"));
    -- local nHM = tonumber(date("%H%M"));

    -- if not(nW == 6 and nHM >= 1800 and nHM <= 2030)  then
    -- Say(szName.."§¹i hiÖp chØ cã thÓ sö dông thÎ ®æi tªn vµo lóc <color=yellow>tõ 18h00 tíi 20h30 ngµy thø 7 trong tuÇn.<color>", 0);
    -- return 0;
    -- end

    --LIB_txtData:Init("bang_hoi_tinh_anh/season_6/list_reg_all.txt");
    --LIB_txtData:LoadMultiColumn();
    --local nTotal = getn(LIB_txtData.tbTextData);
    --local tbData = LIB_txtData.tbTextData;
    --local tbBHTA = {};
    --
    --for i=1, nTotal do
    --	tbBHTA[tbData[i][2]] = 1;
    --end
    --
    --if tbBHTA[GetAccount()] ~= nil then
    --	gf_Msg2Player('<sex> cã trong danh s¸ch ®¨ng ký BHTA Ph¸o lÇn nµy t¹m thêi kh«ng ®æi ®­îc tªn!', 12);
    --	return 0;
    --end

    --LIB_txtData:Init("ctc_reg/list.txt");
    --LIB_txtData:LoadMultiColumn();
    --local nTotal = getn(LIB_txtData.tbTextData);
    --local tbData = LIB_txtData.tbTextData;
    --local szName = GetName();
    --
    --for i=1, nTotal do
    --	if tbData[i][3] == szName then
    --		gf_Msg2Player('<sex> cã trong danh s¸ch ®¨ng ký tham gia C«ng Thµnh ChiÕn, t¹m thêi kh«ng ®æi ®­îc tªn.!', 12);
    --		return 0;
    --	end
    --end

    -- B¶ng danh s¸ch tµi kho¶n cã thÓ tïy ý ®æi tªn
    local tSpecialAccount = {
        -- ['longdaika'] = 1,
        ['vanmyjx2'] = 1,
        ['truonggapx3'] = 1,
        ['ducpx3'] = 1,
    };

    if tSpecialAccount[GetAccount()] == nil then
        local nH = tonumber(date('%H%M'));
        -- if nH < 1600 then
        -- Say('TÝnh n¨ng nµy hiÖn ®ang t¹m ®ãng ®Õn 16h00p h«m nay sÏ më l¹i!', 0);
        -- return 0;
        -- end

        if nH < 0 or nH > 1700 then
            Say('ChØ cho phÐp ®æi tªn tõ 0h00p-17h00p mçi thø 2 hµng tuÇn!', 0);
            return 0;
        end

        local n1, szBoss = GetCityWarInfo(300, "boss");
        local n2, szManager = GetCityWarInfo(300, "manager");
        local n3, szF1, szF2, szF3, szF4 = GetCityWarInfo(300, "fighter");
        local szOldName = GetName();

        if szOldName == szBoss or szOldName == szManager or szOldName == szF1 or szOldName == szF2 or szOldName == szF3 or szOldName == szF4 then
            Say(szName..'§¹i hiÖp lµ ng­êi cã chøc vô trong C«ng Thµnh ChiÕn, kh«ng ®­îc ®æi tªn.', 0);
            return 0;
        end

        local nWeekDay = tonumber(date('%w'));
        -- cn=0, t2=1, t3=2, t4=3, t5=4, t6=5, t7=6
        if nWeekDay ~= 1 then
            Say(szName..'ThÎ ®æi tªn chØ sö dông ®­îc vµo 0h-17h00p thø 2 hµng tuÇn!', 0);
            return 0;
        end
    end

    SaveNow();
    Say(szName.."§¹i hiÖp cã thÓ dïng thÎ ®Ó ®æi tªn nh©n vËt trong khoµn thêi gian 0h-17h00p mçi thø 2 hµng tuÇn.\n<color=red>Chó ý: CÇn ly khai bang héi, ®¸nh gi¸ qu©n hµm, nhËn c¸c phÇn th­ëng nÕu cã tr­íc khi ®æi tªn.\nSau khi ®æi tªn thµnh c«ng cÇn ®¨ng nhËp l¹i vµ t×m npc ®¸nh gi¸ qu©n hµm!<color>", 2, {
        "T¹i h¹ muèn ®æi tªn/renameAction",
        "T¹i h¹ sÏ quay l¹i sau/nothing"
    })
end

function createFile(strFileName, data)
    local filePath = "../../../xmission/gs/data/rename/"
    local file = openfile(filePath .. strFileName, "w+")
    if file == nil then
        execute(format("mkdir -p %s", filePath))
        file = openfile(filePath .. strFileName, "w+")
    end
    write(file, data)
    closefile(file)
end
function renameProcess(sName)
    local old_name = GetName();
    local file1 = GetAccount() .. "_old.txt"
    createFile(file1, old_name);
    local file2 = GetAccount() .. "_new.txt"
    createFile(file2, sName);
    --createFilebak(file2, sName);

    local sEx = "./rename " .. file1 .. " " .. strlen(old_name) .. " " .. file2 .. " " .. strlen(sName)
    Msg2Player(sEx)
    local handle = execute(sEx) --check
    --Msg2Player(handle)
    if handle ==  0 then
        -- L­u tªn nh©n vËt cò, chÆn ®æi hoÆc t¹o míi trïng tªn cò
        --local sQuery = format('REPLACE INTO `jx2ib_database`.`role` VALUES ("%s", "%s", "*1", "0x0", "0x0", "%s");', old_name, GetAccount(), date('%Y-%m-%d %H:%M:%S'));
        --local nRet = SendGlbDBData(0, sQuery);
        --print(sQuery, nRet);

        local nWeeks, nRank, nPoint = GetPlayerRank();
        --print(nWeeks, nRank, nPoint);
        if nRank == nil then
        elseif nRank > 0 then -- Xãa trªn BXH Tèng tuÇn tr­íc
            RemoveRelayShareDataByIndex('_PlayerBattleRankS', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
        elseif nRank < 0 then -- Xãa trªn BXH Liªu tuÇn tr­íc

            RemoveRelayShareDataByIndex('_PlayerBattleRankL', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
        end

        Msg2Player("§æi tªn thµnh c«ng, quý ®¹i hiÖp h·y ®¨ng nhËp l¹i nhÐ.");
        WPlayerLog:WriteRenameLog("§æi tªn thµnh c«ng", "rename", sName);
        SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
        Talk(1,"ExitGame", szName.."§æi tªn thµnh c«ng, quý ®¹i hiÖp h·y ®¨ng nhËp l¹i nhÐ.");
    else
        --baoluu_congtrang_rollback();

        AddItem(2,1,40147,1);
        gf_WriteLog('rename', format('§æi tªn thÊt b¹i: tªn cò: %s - tªn míi: %s - handle: %d', old_name, sName, handle));
        Talk(1,"",szName.."§æi tªn thÊt b¹i. Tªn míi ®· cã ng­êi ®Æt hoÆc sai có ph¸p.")
        return 0
    end
end

function RemoveRelayBR(bSuccess)
    if bSuccess == 1 then
        -- §¸nh gi¸ qu©n hµm
        --SetRankPoint(5, 701, 1);
        --SetTask(TSK_TRANS_POINT_ALLOW,1);

        -- CËp nhËp qu©n hµm
        --CalcBattleRank();
        --UpdateBattleMaxRank();
    end
end

function renameAction(sName)

    -- Check thêi gian tr¸nh trïng lóc backup database
    --local nM = tonumber(date('%M'));
    --if (nM >= 23 and nM <= 30) or (nM >= 53 and nM <= 59) then
    --	Say('D÷ liÖu ®ang ®­îc sao l­u, ®¹i hiÖp <color=green>h·y ®îi thªm kho¶ng 10 phót<color> n÷a råi ®æi tªn nhÐ.!', 0);
    --	return 0;
    --end

    -- B¾t buéc out bang tr­íc khi ®æi tªn, tr¸nh lçi dÝnh tªn nh©n vËt trong bang
    if IsTongMember() > 0 then
        Talk(1,'',szName..'CÇn ly khai bang héi tr­íc khi ®æi tªn!');
        return 0;
    end

    -- B¾t buéc nhËn phÇn th­ëng tû vâ
    --local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
    --if (nBWRank >= 1 and nBWRank <= 3) and GetTask(676) < nWeekNum then
    --    Talk(1,'',szName..'CÇn nhËn th­ëng 1v1 tr­íc khi ®æi tªn!');
    --    return 0;
    --end

    -- B¾t buéc ph¶i ®¸nh gi¸ qu©n hµm
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, '', szName..'H·y tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ ®æi tªn ®­îc!.');
        return 0;
    end

    if not sName then
        AskClientForString("renameAction","Tªn míi...",6,16,"§æi tªn");
        return 0;
    end


    sName = gsub(sName, '[%p%c%s]', '');

    local szNameGSub = gsub(sName, " ", '');
    if szNameGSub ~= sName then --kiÓm tra ký tù dac biet
        Talk(1,"",szName.."Tªn míi kh«ng ®­îc cã ký tù ®Æc biÖt, kho¶ng tr¾ng.");
        return 0;
    end

    local tCharValidate = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoNnPpQqRrSsTtUuVvXxYyZzWw1234567890';
    local sLastName = strsub(sName, -1);

    if strfind(tCharValidate, sLastName) == nil then --kiÓm tra ký tù cuèi cïng ph¶i lµ ch÷ & sè
        Talk(1,"",szName.."Ký tù cuèi cïng cña tªn ph¶i lµ ch÷ hoÆc sè.");
        return 0;
    end

    if strlen(sName) < 6 or strlen(sName) > 16 then
        Talk(1,"",szName.."Tªn ph¶i tõ 6 - 16 ký tù. Kh«ng ®­îc cã ký tù ®Æc biÖt.");
        return 0;
    end

    -- Danh s¸ch tªn bÞ cÊm ®Æ
    local nCheckName=0;
    local tSpecialName = {
        "ExitGame",
        "HåChÝMinh",
        "HoChiMinh",
        "NguyÔnTÊtThµnh",
        "NguyenTatThanh",
        "Long§¹iKa",
    };
    for i = 1, getn(tSpecialName) do
        if tSpecialName[i] == sName then
            nCheckName=nCheckName+1;
        end
    end
    if nCheckName >0  then
        --gf_Talk(1, 'renameAction',szName..'Tªn nµy kh«ng ®­îc phÐp sö dông, mêi <sex> chän tªn kh¸c.');
        Talk(1,"",szName.."Tªn ph¶i tõ 6 - 16 ký tù. Kh«ng ®­îc cã ký tù ®Æc biÖt.");
        return 0;
    end

    if DelItem(2,1,40147,1) == 1 then
        --baoluu_congtrang();

        -- L­u toµn bé th«ng tin
        SaveNow();
        ProgressSlot(1*18, "#renameProcess('".. sName .."')");
    end
    return 1
end

function baoluu_congtrang()
    do return end

    -- B¶o l­u qu©n hµm, fix lçi l­u tªn cò tõ t7-cn trªn BXH ®¸nh gi¸ cho tuÇn sau
    local nCurrentPoint = GetTask(701);
    local nTongOrLieu = 0;

    if nCurrentPoint > 0 then
        nTongOrLieu = 1;
    elseif nCurrentPoint < 0 then
        nTongOrLieu = -1;
    end

    if nTongOrLieu ~= 0 then
        if abs(nCurrentPoint) >= 80000 then -- 80k lµ møc thÊp nhÊt cã thÓ l­u vµ ®¸nh gi¸ trªn gs, cho phÐp replace tªn cò BXH ®¸nh gi¸ cho tuÇn sau
            local nCurrentRank = GetTask(704);
            local nCurrentDate = tonumber(date('%Y%m%d'));

            SetTask(701, 80000*nTongOrLieu);
            SetTask(WTASKID_BAO_LUU_CT_POINT, nCurrentPoint);
            SetTask(WTASKID_BAO_LUU_CT_RANK, nCurrentRank);
            SetTask(WTASKID_BAO_LUU_CT_DATE, nCurrentDate);
            SetRankPoint(5, 701, 1);
            gf_WriteLog('rename', gf_Join({'B¶o l­u c«ng tr¹ng', nCurrentPoint, nCurrentRank, nCurrentDate}, '\t'));
        end
    end
end

function baoluu_congtrang_rollback()
    do return end

    if GetAccount() == 'longdaika' then
        Msg2Player('reload ok', WTASKID_BAO_LUU_CT_POINT, WTASKID_BAO_LUU_CT_RANK, WTASKID_BAO_LUU_CT_DATE);
    end

    -- Phôc håi b¶o l­u c«ng tr¹ng & reset b¶o l­u khi ®æi tªn thÊt b¹i
    local nCurrentPoint = GetTask(701);
    local nCurrentRank = GetTask(704);
    local nCurrentDate = tonumber(date('%Y%m%d'));
    local nBaoLuuPoint = GetTask(WTASKID_BAO_LUU_CT_POINT);
    local nBaoLuuRank = GetTask(WTASKID_BAO_LUU_CT_RANK);
    local nBaoLuuDate = GetTask(WTASKID_BAO_LUU_CT_DATE);

    if nBaoLuuDate <= 1000 then -- reset ®èi víi nh©n vËt ®· dïng event sö dông task nµy
        nBaoLuuDate = 0;
        SetTask(WTASKID_BAO_LUU_CT_POINT, 0);
        SetTask(WTASKID_BAO_LUU_CT_RANK, 0);
        SetTask(WTASKID_BAO_LUU_CT_DATE, 0);
        gf_WriteLog('rename', gf_Join({'Reset task b¶o l­u CT cò', nCurrentPoint, nCurrentRank, nCurrentDate, nBaoLuuPoint, nBaoLuuRank, nBaoLuuDate}, '\t'));
    end

    if nBaoLuuDate ~= 0 then
        SetTask(701, nBaoLuuPoint);
        SetTask(704, nBaoLuuRank);
        SetTask(WTASKID_BAO_LUU_CT_POINT, 0);
        SetTask(WTASKID_BAO_LUU_CT_RANK, 0);
        SetTask(WTASKID_BAO_LUU_CT_DATE, 0);
        gf_WriteLog('rename', gf_Join({'Phôc håi b¶o l­u c«ng tr¹ng', nCurrentPoint, nCurrentRank, nCurrentDate, nBaoLuuPoint, nBaoLuuRank, nBaoLuuDate}, '\t'));
    end
end
