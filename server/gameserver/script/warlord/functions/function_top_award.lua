----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: quµ th¨ng cÊp vµ mét sè hµm cho ng­êi ch¬i míi
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\warlord\\functions\\function_newbie.lua");
Include("\\script\\warlord\\functions\\function_top_award.lua");
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- Function to read/write data into text file
-- Created by Thanh
-- Created date 07/06/2023
LIB_Top_HDL = {
    DataFileName = "",
    listFormat = "(.+)	(.+)	(.+)	(.+)	(.+)",
    tbTextData = {},
    szPattern = "[A-Za-z0-9]"
}
--Load gia tri tu file data
function LIB_Top_HDL:CutText(szData)
    local txtFinal=""
    local nPosition = strfind(szData,"\t")
    local szDataTemp = ""
    if nPosition ~= nil then
        txtFinal = strsub(szData,1,nPosition-1)
        txtFinal=gsub(txtFinal,"TOP","[");
    else
        txtFinal = szData
    end
    return txtFinal
end

function LIB_Top_HDL:Replace(szData)
    local txtFinal=szData;
    txtFinal=gsub(txtFinal,"TONGSOAI1","So¸i Tèng 2:\t");
    txtFinal=gsub(txtFinal,"LIEUSOAI1","So¸i Liªu 2:\t");
    txtFinal=gsub(txtFinal,"TONGSOAI0","So¸i Tèng 1:\t");
    txtFinal=gsub(txtFinal,"LIEUSOAI0","So¸i Liªu 1:\t");
    txtFinal=gsub(txtFinal,"TONGTUONG2","T­íng Tèng 3:\t");
    txtFinal=gsub(txtFinal,"LIEUTUONG2","T­íng Liªu 3:\t");
    txtFinal=gsub(txtFinal,"TONGTUONG1","T­íng Tèng 2:\t");
    txtFinal=gsub(txtFinal,"LIEUTUONG1","T­íng Liªu 2:\t");
    txtFinal=gsub(txtFinal,"TONGTUONG0","T­íng Tèng 1:\t");
    txtFinal=gsub(txtFinal,"LIEUTUONG0","T­íng Liªu 1:\t");
    txtFinal=gsub(txtFinal,"HOACANH0","Top 1:\t");
    txtFinal=gsub(txtFinal,"HOACANH1","Top 2:\t");
    txtFinal=gsub(txtFinal,"HOACANH2","Top 3:\t");
    txtFinal=gsub(txtFinal,"\t"," ");
    return txtFinal;
end

function LIB_Top_HDL:LoadData(szValue)
    self.tbTextData = {}
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        self.DataFileName = "data\\".."topHDL_sucess.txt";
    else
        self.DataFileName = "data/".."topHDL_sucess.txt";
    end
    local pf = openfile(self.DataFileName, "r");
    if pf==nill then return end
    local str = ""
    local nRow =0
    local nCount=1
    ----------------------Load Soai--------------------------------
    if szValue== 1 then
        while 1 do

            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,"SOAI") then
                self.tbTextData[nCount] = LIB_Top_HDL:Replace(str);
                nCount=nCount+1
            end
        end
        ---------------------------o0o---------------------------------------
        ----------------------Load Tuong--------------------------------
    elseif szValue== 2 then
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,"TUONG") then
                self.tbTextData[nCount] = LIB_Top_HDL:Replace(str)
                nCount=nCount+1
            end
        end
        ---------------------------o0o---------------------------------------
        ----------------------Load Ph¸i--------------------------------
    elseif szValue== 3 then
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if not strfind(str,"SOAI") and not strfind(str,"TUONG") and not strfind(str,"HOACANH")  then
                nCount=nCount+1
                self.tbTextData[nCount] = LIB_Top_HDL:CutText(str)
            end
        end
        ---------------------------o0o---------------------------------------
        ----------------------Load Hãa C¶nh--------------------------------
    else
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,"HOACANH")  then
                nCount=nCount+1
                self.tbTextData[nCount] = LIB_Top_HDL:Replace(str)
            end
        end
    end
    ---------------------------o0o---------------------------------------
    closefile(pf);
end

function _w_savetop_HDL(szData)
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\topHDL_sucess.txt";
    else
        fileName = "data/topHDL_sucess.txt";
    end
    local pf = openfile(fileName, "a+");
    if not pf then return end
    write(pf, format("%s", "\n"..szData))
    closefile(pf);
    return 1
end

function _w_savechecktop_HDL(szData)
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\topHDL_checksucess.txt";
    else
        fileName = "data/topHDL_checksucess.txt";
    end
    local pf = openfile(fileName, "a+");
    if not pf then return end
    write(pf, format("%s", "\n"..szData))
    closefile(pf);
    return 1
end

function _w_gettop_HDL(szData)
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\topHDL_checksucess.txt";
    else
        fileName = "data/topHDL_checksucess.txt";
    end
    local check=0;
    local pf = openfile(fileName, "r");
    local tbTop={};
    if pf ~= nil then
        local str = ""
        local nRow = 0
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,szData) then
                tbTop[nRow]=SplitText(str);
            end
        end
        closefile(pf);
        return tbTop;
    else
        return
    end
end

function _w_checktop_HDL(szData)
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\topHDL_checksucess.txt";
    else
        fileName = "data/topHDL_checksucess.txt";
    end
    local check=0;
    local pf = openfile(fileName, "r");
    if pf ~= nil then
        local str = ""
        local nRow = 0
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,szData) then
                check=check+1;
            end
        end
        closefile(pf);
        return check;
    else
        self.tbTextData = {}
        return 0
    end
end
function _w_reset_top_HDL()
    SetTask(4064, 0);
end

function _w_top_check(nValue)
    local nRouteTop = GetPlayerRoute() or 0;
    local g_tbMonPhai = 	--Â·Ïß
    {
        [0] = "V« m«n ph¸i",
        [1] = "ThiÕu L©m",
        [2] = "ThiÕu L©m §ao",
        [3] = "ThiÕu L©m Tr­îng",
        [4] = "ThiÕu L©m QuyÒn",
        [5] = "§­êng M«n",
        [6] = "§­êng M«n",
        [7] = "Nga My",
        [8] = "Nga Mi KiÕm",
        [9] = "Nga Mi §µn",
        [10] = "C¸i Bang",
        [11] = "C¸i Bang QuyÒn",
        [12] = "C¸i Bang Bæng",
        [13] = "Vâ §ang",
        [14] = "Vâ §ang KiÕm",
        [15] = "Vâ §ang Bót",
        [16] = "D­¬ng M«n",
        [17] = "D­¬ng Gia Th­¬ng",
        [18] = "D­¬ng Gia Cung",
        [19] = "Ngò §éc",
        [20] = "HiÖp §éc",
        [21] = "Cæ S­",
        [22] = "C«n L«n",
        [23] = "C«n L«n",
        [24] = "Minh gi¸o",
        [25] = "Th¸nh ChiÕn",
        [26] = "TrËn Binh",
        [27] = "HuyÕt Nh©n",
        [28] = "Thóy Yªn",
        [29] = "Thóy Yªn Vò N÷",
        [30] = "Linh N÷",
        [31] = "§­êng M«n NhËm HiÖp",
        [32] = "C«n L«n KiÕm T«n",
    }
    local nCheck= nValue or 1
    local nCamp="";
    local nCamp1="";
    if KsgPlayer:GetHonor(1) >= 0 then
        nCamp = "TONGSOAI"
        nCamp1="TONGTUONG"
    else
        nCamp = "LIEUSOAI"
        nCamp1="LIEUTUONG"
    end
    if nCheck==1 then
        if _w_checktop_HDL(nCamp)>1 then
            return 0
        else
            return 1
        end
    end
    if nCheck==2 then
        if _w_checktop_HDL(nCamp1)>2 then
            return 0
        else
            return 1
        end
    end
    if nCheck==3 then
        if _w_checktop_HDL(g_tbMonPhai[nRouteTop]) >0 then
            return 0
        else
            return 1
        end
    end
    if nCheck==4 then
        if _w_checktop_HDL("HOACANH") >2 then
            return 0
        else
            return 1
        end
    end
end
----------------------------------------------------------------------------------------------------
function _w_top_Soai()
    local tbAward = {
        { tbProp = { 2, 1, 31505 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- 50 tói ®¸ quý 7
        { tbProp = { 2, 1, 31578 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Ph¸ TrËn Tö
        { tbProp = { 2, 102, 214}, nStack = 150, nStatus = ITEMSTATUS_LOCK }, -- 150 Th­¬ng h¶i di ch©u 7
        { tbProp = { 2, 201, 15 }, nStack = 5, nStatus = ITEMSTATUS_LOCK}, -- 5 §iÓm Tinh Ngäc
        { tbProp = { 0,105,30132 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- ChiÕn T­îng §Ñp
        { tbProp = { 2, 1, 40049 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK },
        { nFunc = "KsgItem:AddBattleSuit_ChuTuoc_Soai(15)" }, -- Chu T­íc So¸i
        { nFunc = "WItem:AddSuit_VanSuc(4, 4 )" }, -- V¨n Søc 4
    };
    local szDate = tostring(date("%Y-%m-%d %H:%M:%S"));
    local nCamp="";
    if GetTask(701) >= 0 then
        nCamp = "TONGSOAI".._w_checktop_HDL("TONGSOAI");
    else
        nCamp = "LIEUSOAI".._w_checktop_HDL("LIEUSOAI");
    end

    local szSave=nCamp.."\t"..GetName().."\t"..szDate;
    if WAward:Give(tbAward, "top_Soai")== WEnv.RETCODE_SUCCESS then
        _w_savetop_HDL(szSave)
        _w_savechecktop_HDL(nCamp)
    end
end

function _w_top_Tuong()
    local tbAward = {
        --{ tbProp = { 2, 1, 31573 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Gi¸ c« ttiªn
        { tbProp = { 2, 102, 214}, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- 100 Th­¬ng h¶i di ch©u 7
        { tbProp = {  0, 105, 205 }, nStack = 1, nStatus = ITEMSTATUS_LOCK}, -- ChiÕn lang
        { tbProp = { 2, 1, 40049 }, nStack = 500, nStatus = ITEMSTATUS_LOCK },
        { nFunc = "KsgItem:AddBattleSuit_ChuTuoc_Tuong(15,3)" }, -- Chu T­íc Tuong
        { nFunc = "WItem:AddSuit_VanSuc(4, 4 )" }, -- V¨n Søc 5
    };
    local szDate = tostring(date("%Y-%m-%d %H:%M:%S"));
    local nCamp="";
    if GetTask(701) >= 0 then
        nCamp = "TONGTUONG".._w_checktop_HDL("TONGTUONG")
    else
        nCamp = "LIEUTUONG".._w_checktop_HDL("LIEUTUONG")
    end

    local szSave=nCamp.."\t"..GetName().."\t"..szDate;
    if WAward:Give(tbAward, "top_Tuong")== WEnv.RETCODE_SUCCESS then
        _w_savetop_HDL(szSave)
        _w_savechecktop_HDL(nCamp)
    end
end
function _w_top_HoaCanh()
    local nFairLv = GetTask(3510);
    if nFairLv<180 then
        return WNpc:Talk(format("Hãa C¶nh cña <sex> lµ %d ch­a ®¹t 180. Kh«ng thÓ nhËn th­ëng!", nFairLv), 1);
    end
    local top= _w_checktop_HDL("HOACANH")+1
    if top >3 then
        return WNpc:Talk(format("Chµo <sex>!\n %d Gi¶i th­ëng ®· ®­îc trao hÕt!", top), 1);
    end
    local tbAward = {
        [1]={
            { nFunc = "KsgItem:AddBattleSuit_ChuTuoc_Tuong(10,3)" }, -- Chu T­íc Tuong
            { nFunc = "WItem:AddSuit_VanSuc(5, 4 )" }, -- V¨n Søc 5
        },
        [2]={
            { nFunc = "KsgItem:AddBattleSuit_ChuTuoc_Tuong(10,3)" }, -- Chu T­íc Tuong
        },
        [3]={
            { nFunc = "WItem:AddSuit_VanSuc(5, 4 )" }, -- V¨n Søc 5
        },
    };
    local szDate = tostring(date("%Y-%m-%d %H:%M:%S"));
    local nHoaCanh="";
    nHoaCanh = "HOACANH".._w_checktop_HDL("HOACANH")

    local szSave=nHoaCanh.."\t"..GetName().."\t"..szDate;
    if WAward:Give(tbAward[top], "top_HoaCanh")== WEnv.RETCODE_SUCCESS then
        _w_savetop_HDL(szSave)
        _w_savechecktop_HDL(nHoaCanh)
    end
end

function _w_top_MonPhai()
    local nRouteTop = GetPlayerRoute() or 0;
    local g_tbMonPhai = 	--Â·Ïß
    {
        [0] = "V« m«n ph¸i",
        [1] = "ThiÕu L©m",
        [2] = "ThiÕu L©m §ao",
        [3] = "ThiÕu L©m Tr­îng",
        [4] = "ThiÕu L©m QuyÒn",
        [5] = "§­êng M«n",
        [6] = "§­êng M«n",
        [7] = "Nga My",
        [8] = "Nga Mi KiÕm",
        [9] = "Nga Mi §µn",
        [10] = "C¸i Bang",
        [11] = "C¸i Bang QuyÒn",
        [12] = "C¸i Bang Bæng",
        [13] = "Vâ §ang",
        [14] = "Vâ §ang KiÕm",
        [15] = "Vâ §ang Bót",
        [16] = "D­¬ng M«n",
        [17] = "D­¬ng Gia Th­¬ng",
        [18] = "D­¬ng Gia Cung",
        [19] = "Ngò §éc",
        [20] = "HiÖp §éc",
        [21] = "Cæ S­",
        [22] = "C«n L«n",
        [23] = "C«n L«n",
        [24] = "Minh gi¸o",
        [25] = "Th¸nh ChiÕn",
        [26] = "TrËn Binh",
        [27] = "HuyÕt Nh©n",
        [28] = "Thóy Yªn",
        [29] = "Thóy Yªn Vò N÷",
        [30] = "Linh N÷",
        [31] = "§­êng M«n NhËm HiÖp",
        [32] = "C«n L«n KiÕm T«n",
    }
    local tbAward = {
        { tbProp = { 2, 1, 40049 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 30
        { tbProp = { 2, 102, 214}, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- 50 Th­¬ng h¶i di ch©u 7
        { nFunc = "_w_newbie_Give_PhaHonLenhBai()" }, -- SetPhaHon
    };
    local szDate = tostring(date("%Y-%m-%d %H:%M:%S"));
    if _w_checktop_HDL(g_tbMonPhai[nRouteTop])  > 0 then
        return WNpc:Talk("Chµo <sex> Top nµy ®· cã ng­êi nhËn råi!", WEnv.TRUE);
    end
    local szSave=g_tbMonPhai[nRouteTop].."\t"..GetName().."\t"..szDate;
    if WAward:Give(tbAward, "top_MP")== WEnv.RETCODE_SUCCESS then
        _w_savetop_HDL(szSave)
        _w_savechecktop_HDL(g_tbMonPhai[nRouteTop])
    end
end
--------------------------------------------------------------------------------------------------
function _w_top_GiveOnceSupport(nTaskId,szMerrit,szQH,nFairLvc, szFunc)
    if nTaskId == nil or szMerrit==nil or szQH==nill then
        return WEnv.RETCODE_ERROR;
    end
    local nFairLv = GetTask(3510);

    --Check
    if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn hç trî!", WEnv.TRUE);
    end
    if WLib:CheckInv(25, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    if abs(GetTask(701)) < szMerrit then
        WNpc:Talk("<sex> ch­a ®ñ c«ng tr¹ng");
        return WEnv.RETCODE_NOTOPEN;
    end
    if abs(GetTask(704)) < szQH then
        WNpc:Talk("<sex> ch­a ch­a ®¹t qu©n Hµm Yªu CÇu");
        return WEnv.RETCODE_NOTOPEN;
    end
    if nFairLv < nFairLvc then
        WNpc:Talk("<sex> ch­a ch­a ®¹t Hãa C¶nh Yªu CÇu");
        return WEnv.RETCODE_NOTOPEN;
    end

    --Save give status
    if dostring(szFunc) then
        SetTask(nTaskId, 1);
    end

end

function _w_top_OpenMenu()
    --local bIsCompleteTask, tbTaskStatus = _w_newbie_CheckWeeklyTask();
    local isHaveSoai = _w_top_check(1)
    local isHaveTuong = _w_top_check(2)
    local isHaveMP = _w_top_check(3)
    local isHaveHC =_w_top_check(4)
    local tbSay = { format("<npcname>: Chµo <color=yellow>%s<color>, thêi gian hiÖn t¹i lµ %s!\n Mçi nh©n vËt <color=red>chØ nhËn th­ëng 1 lo¹i TOP<color>. Kh«ng thÓ nhËn thªm TOP kh¸c", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local tbSayOptionDef = {
       {
            szSelect = "NhËn th­ëng Top So¸i 5,000,000 c«ng tr¹ng",
            szFunc = "_w_top_Soai()",
            nTaskId = WTASKID_AWARD_TASK_TOPSERVER_STATUS,
            nMerrit=5000000,
            nQH=0,
            nReg = isHaveSoai,
            nFair=0,
        },
        {
            szSelect = "NhËn th­ëng Top T­íng 4,000,000 c«ng tr¹ng",
            szFunc = "_w_top_Tuong()",
            nTaskId = WTASKID_AWARD_TASK_TOPSERVER_STATUS,
            nMerrit=4000000,
            nQH=5,
            nReg = isHaveTuong,
            nFair=0,
        },
        {
            szSelect = "NhËn th­ëng Top Ph¸i 3,000,000 c«ng tr¹ng",
            szFunc = "_w_top_MonPhai()",
            nTaskId = WTASKID_AWARD_TASK_TOPSERVER_STATUS,
            nMerrit=3000000,
            nQH=0,
            nReg=isHaveMP,
            nFair=0,
        },
       {
           szSelect = "NhËn th­ëng Top Hãa C¶nh 180",
           szFunc = "_w_top_HoaCanh()",
           nTaskId = WTASKID_AWARD_TASK_TOPHOACANH_STATUS,
           nMerrit=0,
           nQH=0,
           nReg=isHaveHC,
           nFair=180,
       },
    };

    local tbReadyGet = {};
    --local checkTop=GetTask(4064) or 0;
    for i = 1, getn(tbSayOptionDef) do
        if GetTask(tbSayOptionDef[i].nTaskId) == 0 and tbSayOptionDef[i].nReg ==1 then
            tinsert(tbSay, format("%s%s/#_w_top_GiveOnceSupport(%d, %d, %d, %d, %q)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nTaskId, tbSayOptionDef[i].nMerrit, tbSayOptionDef[i].nQH,tbSayOptionDef[i].nFair, tbSayOptionDef[i].szFunc));
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "Chµo <sex>! HiÖn kh«ng cã phÇn th­ëng nµo phï hîp víi b¹n hoÆc ®· ph¸t hÕt, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

function _w_top_getTxt(nValue)
    local szText="";
    local iLoad=nValue or 1;
    LIB_Top_HDL:LoadData(iLoad);
    for i=1, getn( LIB_Top_HDL.tbTextData) do
        szText =szText..tostring( LIB_Top_HDL.tbTextData[i]).."\n";
    end
    return szText
end
function _w_top_Menu_Top_Tuong()
        local szText="Danh s¸ch c¸c ®¹i hiÖp ®· nhËn gi¶i:\nTop T­íng:\n".._w_top_getTxt(2)
        Talk(1,"",szText)
    --WNpc:Talk(format("Chµo <sex> §©y lµ danh s¸ch ®· nhËn th­ëng:\n"..szText));

end
function _w_top_Menu_Top_Soai()
    local szText="Danh s¸ch c¸c ®¹i hiÖp ®· nhËn gi¶i:\n Top So¸i:\n".._w_top_getTxt(1)
    Talk(1,"",szText)
    --WNpc:Talk(format("Chµo <sex> §©y lµ danh s¸ch ®· nhËn th­ëng:\n"..szText));

end
function _w_top_Menu_Top_MonPhai()
    local txtMP=gsub(_w_top_getTxt(3),"\n","] - [")
    local szText="Danh s¸ch c¸c m«n ph¸i ®· cã ng­êi nhËn gi¶i:\n["..txtMP.."]";
    Talk(1,"",szText)
    --WNpc:Talk(format("Chµo <sex> §©y lµ danh s¸ch ®· nhËn th­ëng:\n"..szText));
end
function _w_top_Menu_Top_HoaCanh()
    local szText="Danh s¸ch c¸c ®¹i hiÖp ®· nhËn gi¶i:\n Top Hãa C¶nh:\n".._w_top_getTxt(4)
    Talk(1,"",szText)
    Talk(1,"",szText)
    --WNpc:Talk(format("Chµo <sex> §©y lµ danh s¸ch ®· nhËn th­ëng:\n"..szText));
end

function _w_top_Menu_Top_succes()
    local tbSay = { "KiÓm tra danh s¸ch c¸c gi¶i th­ëng:" };
    tinsert(tbSay, format("%s/#_w_top_Menu_Top_HoaCanh()", "Top Hãa C¶nh"));
    tinsert(tbSay, format("%s/#_w_top_Menu_Top_Soai()", "Top So¸i"));
    tinsert(tbSay, format("%s/#_w_top_Menu_Top_Tuong()", "Top T­íng"));
    tinsert(tbSay, format("%s/#_w_top_Menu_Top_MonPhai()", "Top M«n ph¸i"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end