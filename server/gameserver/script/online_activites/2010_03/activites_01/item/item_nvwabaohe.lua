--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 女娲宝盒脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--活动头文件
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Import("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")
TASKID_NVWA_BOX_USECOUNT = 3537

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnUse(nItemIdx)
    -- ng祔 u ti猲 m� server kh玭g cho s� d鬾g n� oa b秓 h筽
    if WDate:Today() < 20230101 then
        WNpc:Talk("N� Oa B秓 H筽 s� m� v祇 0 gi� ng祔 01/01/2023, h穣 th� l筰 sau!", WEnv.TRUE);
        do return 0; end
    end
    
    --    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
    --        return 0;
    --    end
    if GetTask(2711) == 0 then	--TSK_TRANS_POINT_ALLOW = 2711 --l璾 gi� tr� b秓 l璾, ko cho ph衟 tham gia chi課 trng
        if GetTask(701) > 0 then
            Talk(1, "", "H穣 n g苝 Ti觰 Phng  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  m韎 c� th� s� d鬾g N� Oa B秓 H筽!");
            return 0;
        elseif GetTask(701) < 0 then
            Talk(1, "", "H穣 n g苝 Ti觰 Ng鋍  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  m韎 c� th� s� d鬾g N� Oa B秓 H筽!");
            return 0;
        else
            Talk(1, "", "H穣 tham gia T鑞g Li猽 v� ch鋘 Phe trc m韎 c� th� s� d鬾g N� Oa B秓 H筽!");
            return 0;
        end
    end
    local nDate = tonumber(date("%y%m%d"))

    --	if nDate > 161231 then
    --		Talk(1,"","N� Oa b秓 h筽  h誸 h筺 s� d鬾g!")
    --		do	return	end
    --	end

    if GetLevel() < 73 then
        Talk(1, "", "Ъng c蕄 73 tr� l猲 m韎 s� d鬾g 頲 v藅 ph萴 n祔.")
        return
    end
    if GetPlayerRoute() == 0 then
        Talk(1, "", "Gia nh藀 m玭 ph竔 m韎 s� d鬾g 頲 v藅 ph萴 n祔.")
        return
    end
    if gf_Judge_Room_Weight(9, 100) ~= 1 then
        Talk(1, "", "Kh玭g gian h祅h trang kh玭g ");
        return
    end
    --   if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
    --    if nDate > 100704 then
    --		return
    --    end    
    if nLastGetDate ~= nDate then
        SetTask(VET_201003_01_TASK_GET_BAOHE_DATE, nDate)
        --        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);	--chuy觧 qua reset b猲 vng_task_control.lua
        --        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end

    local nUse = 200
    local nWeek = tonumber(date("%w"))
    -- VIP 甤 d飊g 200
    --if IsActivatedVipCard() == 1 then --LongDaiKa: t総 t輓h n╪g ╪ x2 khi k輈h ho箃 VIP
    --    nUse = 200
    --end
    --if nDate >= 151012 and nDate <= 151031 then
    --    if nWeek == 5 or nWeek == 6 or nWeek == 0 then
    --        nUse = 200
    --    end
    --end

    --local nNation = GetGlbValue(GLB_TSK_SERVER_ID)


    --	if nWeek == 2 or nWeek == 3 then
    --		nUse = 64
    --	elseif nWeek == 4 or nWeek == 5 then
    --		nUse = 88
    --	end
    --    if nDate <= 100905 then
    --    		nUse = 64
    --    end
    --    if nDate >= 100909 and nDate <= 100912 then
    --    		nUse = 128
    --    end
    if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nUse then
        Talk(1,"","M鏸 ng祔 ch� c� th� s� d鬾g " .. GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) .. "/"..nUse.." N� Oa B秓 H筽");
        return
    end
    
    --Do b� bug s� d鬾g vt qu� s� l莕 t� item n猲 ph竧 sinh th猰 ch苙 � y
    if WTASKID_USE_NUOA_DAILY == nil then
        print("Error, task WTASKID_USE_NUOA_DAILY is null", GetAccount(), GetName());
        return 0;
    end
    WTask:ResetDaily();
    local nMax = 200;
    if WTask:Get(WTASKID_USE_NUOA_DAILY) >= nMax or GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nMax then
        WNpc:Talk(format("Х nh薾 t鑙 產 %d ph莕 thng t� N� Oa B秓 H筽, kh玭g th� nh薾 th猰!", nMax));
        return 0;
    end
    
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) + 1)
        --    	  if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and mod(GetTask(TASK_VNG_PET), 100) >= 2 then
        --    	  	Pet_AddGP(1)
        --    	  end

        -- Nhi謒 v� chuy觧 sinh 5
        if GetTask(TRANSLIFE_MISSION_ID) == 34 and GetTask(TRANSLIFE_TASK_5_2) < 2000 then
            SetTask(TRANSLIFE_TASK_5_2, GetTask(TRANSLIFE_TASK_5_2) + 1)
            if GetTask(TRANSLIFE_TASK_5_2) == 2000 then
                TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh s� d鬾g 2000 N� Oa B秓 H筽")
            end
        end

        --	  gf_EventGiveCustomAward(1, nExp, 0, "Nu Oa Bao Hap")
        --   	  gf_EventGiveRandAward(VET_201003_01_NVWABAOHE_AWARD_LIST, 100, 3, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[9][1]);
        --- 觤 V薾 May
        --	  	local nExp = 1000000
        --		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
        --		local nExpVM = (nPointVM - 100)/100*nExp
        --		ModifyExp(nExpVM)
        --		if nExpVM > 0 then
        --			Msg2Player("B筺 nh薾 th猰 ".. nExpVM.." 甶觤 kinh nghi謒 t� v薾 may!")
        --		else
        --			Msg2Player("B筺 b� t鎛 th蕋 ".. nExpVM.." 甶觤 kinh nghi謒 do kh玭g may m緉. H穣 甶 gi秈 v薾 xui � Th莥 B鉯 Si猽 H筺g!")
        --		end   	
        -----------
        --        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 400 then
        --    	  		gf_AddItemEx2({2,1,30130,1}, "Phi Y猲 Th筩h", VET_201003_01_STR_LOG_TITLE, "nh薾 Phi Y猲 Th筩h" )
        --    	  		Msg2Player("B筺 nh薾 頲 1 Phi Y猲 Th筩h")
        --    	  end
        --		gf_WriteLogEx("DA THONG KINH MACH", "i th祅h c玭g", nExpChanKhi, "甶觤 ch﹏ kh� N� Oa")		
        --		VietWaBaoHe(); --th猰 nguy猲 li謚 event h祅g th竛g
        Use_Award_NuOa() --ph莕 thng khi s� d鬾g N� Oa
        gf_WriteLogEx("SO LAN SU DUNG NU OA 12/2016", "Nh薾 th祅h c玭g", 1, "S� d鬾g n� oa b秓 h筽")
        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == nUse or GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 then
            Use_Award_NuOa_100()
            gf_WriteLogEx("SO LAN SU DUNG NU OA 12/2016", "Nh薾 th祅h c玭g", 1, "S� d鬾g n� oa l莕 th� 100")
        end
        ----------- Chu鏸 nhi謒 v� Chuy觧 Sinh 6
        local nCS6_BH = floor(GetTask(TSK_CS6_GET1TIME) / 1000)
        local nCS6_BH_Num = mod(GetTask(TSK_CS6_GET1TIME), 1000)
        if mod(nCS6_BH, 10000) < 1000 and GetTask(TSK_CS6_TULINH) < 2 then
            nCS6_BH = (nCS6_BH + 1) * 1000 + nCS6_BH_Num
            SetTask(TSK_CS6_GET1TIME, nCS6_BH)
        end
        --nhi謒 v� l祄 gi祏
        if CFG_NhiemVuLamGiau == 1 then
            if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= 5 and gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 1) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 1, 1, 0)
                TaskTip("Ho祅 th祅h nhi謒 v� l祄 gi祏: S� d鬾g 05 n� oa b秓 h筽.")
            end
        end

        FireEvent("event_mission_task_award", "ksgsystem", "nuoabaohap", GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT))
        KsgPlayer:Msg(format("Х s� d鬾g %d/%d N� Oa B秓 H筽 trong ng祔.", GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT), nUse))
        
        FireEvent("event_cost_item", 2,1,30154,1);

       if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and nDate <= 130120 then
            gf_AddItemEx2({ 2, 1, 30030, 50 }, "Ti觰 Nh� Y1", "NIEN THU NHU Y", "ho祅 th祅h 100 N� oa ")
        end
        local used = GetTask(TASKID_NVWA_BOX_USECOUNT)
        --cdkey
        SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemNvWa()");
        SetTask(TASKID_NVWA_BOX_USECOUNT, used + 1)
        if used + 1 >= 200 then
            SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2214)");
        end
    end
end
