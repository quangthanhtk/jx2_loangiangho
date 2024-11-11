Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\global\\battlefield_callback.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
--Include("\\script\\warlord\\task_id_def.lua");
----------------------------------------------------------------------------------------------------

szName = "<color=green>Th� ��i T�n<color>: "

-- VNG ch�c n�ng b�o v� c�ng tr�ng chuy�n server
TSK_TRANS_POINT = 2150;
TSK_TRANS_DATE  = 2151;
TSK_TRANS_POINT_ALLOW = 2711;

function OnUse(nitem)
    -- local nW = tonumber(date("%w"));
    -- local nHM = tonumber(date("%H%M"));

    -- if not(nW == 6 and nHM >= 1800 and nHM <= 2030)  then
    -- Say(szName.."��i hi�p ch� c� th� s� d�ng th� ��i t�n v�o l�c <color=yellow>t� 18h00 t�i 20h30 ng�y th� 7 trong tu�n.<color>", 0);
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
    --	gf_Msg2Player('<sex> c� trong danh s�ch ��ng k� BHTA Ph�o l�n n�y t�m th�i kh�ng ��i ���c t�n!', 12);
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
    --		gf_Msg2Player('<sex> c� trong danh s�ch ��ng k� tham gia C�ng Th�nh Chi�n, t�m th�i kh�ng ��i ���c t�n.!', 12);
    --		return 0;
    --	end
    --end

    -- B�ng danh s�ch t�i kho�n c� th� t�y � ��i t�n
    local tSpecialAccount = {
        -- ['longdaika'] = 1,
        ['vanmyjx2'] = 1,
        ['truonggapx3'] = 1,
        ['ducpx3'] = 1,
    };

    if tSpecialAccount[GetAccount()] == nil then
        local nH = tonumber(date('%H%M'));
        -- if nH < 1600 then
        -- Say('T�nh n�ng n�y hi�n �ang t�m ��ng ��n 16h00p h�m nay s� m� l�i!', 0);
        -- return 0;
        -- end

        if nH < 0 or nH > 1700 then
            Say('Ch� cho ph�p ��i t�n t� 0h00p-17h00p m�i th� 2 h�ng tu�n!', 0);
            return 0;
        end

        local n1, szBoss = GetCityWarInfo(300, "boss");
        local n2, szManager = GetCityWarInfo(300, "manager");
        local n3, szF1, szF2, szF3, szF4 = GetCityWarInfo(300, "fighter");
        local szOldName = GetName();

        if szOldName == szBoss or szOldName == szManager or szOldName == szF1 or szOldName == szF2 or szOldName == szF3 or szOldName == szF4 then
            Say(szName..'��i hi�p l� ng��i c� ch�c v� trong C�ng Th�nh Chi�n, kh�ng ���c ��i t�n.', 0);
            return 0;
        end

        local nWeekDay = tonumber(date('%w'));
        -- cn=0, t2=1, t3=2, t4=3, t5=4, t6=5, t7=6
        if nWeekDay ~= 1 then
            Say(szName..'Th� ��i t�n ch� s� d�ng ���c v�o 0h-17h00p th� 2 h�ng tu�n!', 0);
            return 0;
        end
    end

    SaveNow();
    Say(szName.."��i hi�p c� th� d�ng th� �� ��i t�n nh�n v�t trong kho�n th�i gian 0h-17h00p m�i th� 2 h�ng tu�n.\n<color=red>Ch� �: C�n ly khai bang h�i, ��nh gi� qu�n h�m, nh�n c�c ph�n th��ng n�u c� tr��c khi ��i t�n.\nSau khi ��i t�n th�nh c�ng c�n ��ng nh�p l�i v� t�m npc ��nh gi� qu�n h�m!<color>", 2, {
        "T�i h� mu�n ��i t�n/renameAction",
        "T�i h� s� quay l�i sau/nothing"
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
        -- L�u t�n nh�n v�t c�, ch�n ��i ho�c t�o m�i tr�ng t�n c�
        --local sQuery = format('REPLACE INTO `jx2ib_database`.`role` VALUES ("%s", "%s", "*1", "0x0", "0x0", "%s");', old_name, GetAccount(), date('%Y-%m-%d %H:%M:%S'));
        --local nRet = SendGlbDBData(0, sQuery);
        --print(sQuery, nRet);

        local nWeeks, nRank, nPoint = GetPlayerRank();
        --print(nWeeks, nRank, nPoint);
        if nRank == nil then
        elseif nRank > 0 then -- X�a tr�n BXH T�ng tu�n tr��c
            RemoveRelayShareDataByIndex('_PlayerBattleRankS', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
        elseif nRank < 0 then -- X�a tr�n BXH Li�u tu�n tr��c

            RemoveRelayShareDataByIndex('_PlayerBattleRankL', 5, 0, abs(nRank) - 1, '\\script\\warlord\\item\\item_rename_card.lua', 'RemoveRelayBR');
        end

        Msg2Player("��i t�n th�nh c�ng, qu� ��i hi�p h�y ��ng nh�p l�i nh�.");
        WPlayerLog:WriteRenameLog("��i t�n th�nh c�ng", "rename", sName);
        SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
        Talk(1,"ExitGame", szName.."��i t�n th�nh c�ng, qu� ��i hi�p h�y ��ng nh�p l�i nh�.");
    else
        --baoluu_congtrang_rollback();

        AddItem(2,1,40147,1);
        gf_WriteLog('rename', format('��i t�n th�t b�i: t�n c�: %s - t�n m�i: %s - handle: %d', old_name, sName, handle));
        Talk(1,"",szName.."��i t�n th�t b�i. T�n m�i �� c� ng��i ��t ho�c sai c� ph�p.")
        return 0
    end
end

function RemoveRelayBR(bSuccess)
    if bSuccess == 1 then
        -- ��nh gi� qu�n h�m
        --SetRankPoint(5, 701, 1);
        --SetTask(TSK_TRANS_POINT_ALLOW,1);

        -- C�p nh�p qu�n h�m
        --CalcBattleRank();
        --UpdateBattleMaxRank();
    end
end

function renameAction(sName)

    -- Check th�i gian tr�nh tr�ng l�c backup database
    --local nM = tonumber(date('%M'));
    --if (nM >= 23 and nM <= 30) or (nM >= 53 and nM <= 59) then
    --	Say('D� li�u �ang ���c sao l�u, ��i hi�p <color=green>h�y ��i th�m kho�ng 10 ph�t<color> n�a r�i ��i t�n nh�.!', 0);
    --	return 0;
    --end

    -- B�t bu�c out bang tr��c khi ��i t�n, tr�nh l�i d�nh t�n nh�n v�t trong bang
    if IsTongMember() > 0 then
        Talk(1,'',szName..'C�n ly khai bang h�i tr��c khi ��i t�n!');
        return 0;
    end

    -- B�t bu�c nh�n ph�n th��ng t� v�
    --local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
    --if (nBWRank >= 1 and nBWRank <= 3) and GetTask(676) < nWeekNum then
    --    Talk(1,'',szName..'C�n nh�n th��ng 1v1 tr��c khi ��i t�n!');
    --    return 0;
    --end

    -- B�t bu�c ph�i ��nh gi� qu�n h�m
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, '', szName..'H�y tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� m�i c� th� ��i t�n ���c!.');
        return 0;
    end

    if not sName then
        AskClientForString("renameAction","T�n m�i...",6,16,"��i t�n");
        return 0;
    end


    sName = gsub(sName, '[%p%c%s]', '');

    local szNameGSub = gsub(sName, "�", '');
    if szNameGSub ~= sName then --ki�m tra k� t� dac biet
        Talk(1,"",szName.."T�n m�i kh�ng ���c c� k� t� ��c bi�t, kho�ng tr�ng.");
        return 0;
    end

    local tCharValidate = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoNnPpQqRrSsTtUuVvXxYyZzWw1234567890';
    local sLastName = strsub(sName, -1);

    if strfind(tCharValidate, sLastName) == nil then --ki�m tra k� t� cu�i c�ng ph�i l� ch� & s�
        Talk(1,"",szName.."K� t� cu�i c�ng c�a t�n ph�i l� ch� ho�c s�.");
        return 0;
    end

    if strlen(sName) < 6 or strlen(sName) > 16 then
        Talk(1,"",szName.."T�n ph�i t� 6 - 16 k� t�. Kh�ng ���c c� k� t� ��c bi�t.");
        return 0;
    end

    -- Danh s�ch t�n b� c�m ��
    local nCheckName=0;
    local tSpecialName = {
        "ExitGame",
        "H�Ch�Minh",
        "HoChiMinh",
        "Nguy�nT�tTh�nh",
        "NguyenTatThanh",
        "Long��iKa",
    };
    for i = 1, getn(tSpecialName) do
        if tSpecialName[i] == sName then
            nCheckName=nCheckName+1;
        end
    end
    if nCheckName >0  then
        --gf_Talk(1, 'renameAction',szName..'T�n n�y kh�ng ���c ph�p s� d�ng, m�i <sex> ch�n t�n kh�c.');
        Talk(1,"",szName.."T�n ph�i t� 6 - 16 k� t�. Kh�ng ���c c� k� t� ��c bi�t.");
        return 0;
    end

    if DelItem(2,1,40147,1) == 1 then
        --baoluu_congtrang();

        -- L�u to�n b� th�ng tin
        SaveNow();
        ProgressSlot(1*18, "#renameProcess('".. sName .."')");
    end
    return 1
end

function baoluu_congtrang()
    do return end

    -- B�o l�u qu�n h�m, fix l�i l�u t�n c� t� t7-cn tr�n BXH ��nh gi� cho tu�n sau
    local nCurrentPoint = GetTask(701);
    local nTongOrLieu = 0;

    if nCurrentPoint > 0 then
        nTongOrLieu = 1;
    elseif nCurrentPoint < 0 then
        nTongOrLieu = -1;
    end

    if nTongOrLieu ~= 0 then
        if abs(nCurrentPoint) >= 80000 then -- 80k l� m�c th�p nh�t c� th� l�u v� ��nh gi� tr�n gs, cho ph�p replace t�n c� BXH ��nh gi� cho tu�n sau
            local nCurrentRank = GetTask(704);
            local nCurrentDate = tonumber(date('%Y%m%d'));

            SetTask(701, 80000*nTongOrLieu);
            SetTask(WTASKID_BAO_LUU_CT_POINT, nCurrentPoint);
            SetTask(WTASKID_BAO_LUU_CT_RANK, nCurrentRank);
            SetTask(WTASKID_BAO_LUU_CT_DATE, nCurrentDate);
            SetRankPoint(5, 701, 1);
            gf_WriteLog('rename', gf_Join({'B�o l�u c�ng tr�ng', nCurrentPoint, nCurrentRank, nCurrentDate}, '\t'));
        end
    end
end

function baoluu_congtrang_rollback()
    do return end

    if GetAccount() == 'longdaika' then
        Msg2Player('reload ok', WTASKID_BAO_LUU_CT_POINT, WTASKID_BAO_LUU_CT_RANK, WTASKID_BAO_LUU_CT_DATE);
    end

    -- Ph�c h�i b�o l�u c�ng tr�ng & reset b�o l�u khi ��i t�n th�t b�i
    local nCurrentPoint = GetTask(701);
    local nCurrentRank = GetTask(704);
    local nCurrentDate = tonumber(date('%Y%m%d'));
    local nBaoLuuPoint = GetTask(WTASKID_BAO_LUU_CT_POINT);
    local nBaoLuuRank = GetTask(WTASKID_BAO_LUU_CT_RANK);
    local nBaoLuuDate = GetTask(WTASKID_BAO_LUU_CT_DATE);

    if nBaoLuuDate <= 1000 then -- reset ��i v�i nh�n v�t �� d�ng event s� d�ng task n�y
        nBaoLuuDate = 0;
        SetTask(WTASKID_BAO_LUU_CT_POINT, 0);
        SetTask(WTASKID_BAO_LUU_CT_RANK, 0);
        SetTask(WTASKID_BAO_LUU_CT_DATE, 0);
        gf_WriteLog('rename', gf_Join({'Reset task b�o l�u CT c�', nCurrentPoint, nCurrentRank, nCurrentDate, nBaoLuuPoint, nBaoLuuRank, nBaoLuuDate}, '\t'));
    end

    if nBaoLuuDate ~= 0 then
        SetTask(701, nBaoLuuPoint);
        SetTask(704, nBaoLuuRank);
        SetTask(WTASKID_BAO_LUU_CT_POINT, 0);
        SetTask(WTASKID_BAO_LUU_CT_RANK, 0);
        SetTask(WTASKID_BAO_LUU_CT_DATE, 0);
        gf_WriteLog('rename', gf_Join({'Ph�c h�i b�o l�u c�ng tr�ng', nCurrentPoint, nCurrentRank, nCurrentDate, nBaoLuuPoint, nBaoLuuRank, nBaoLuuDate}, '\t'));
    end
end
