----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc n�ng c�p trang b�
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\newbattles\\functions.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade.lua");
----------------------------------------------------------------------------------------------------
-- C�c config update include d��i n�y
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_dd_cc_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_dd_cc_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_cc_hh_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ddtc_hh_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ddtc_hh_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_cc_hh_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hh_hhvh_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hh_hhvh_trangsuc_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hh_hhvh_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hhvh_ah_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hhvh_ah_trangsuc_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hhvh_ah_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ah_st_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ah_st_trangsuc_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ah_st_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_st_ph_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_st_ph_trangsuc_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_st_ph_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ngulongtuong_thuongungtuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ngulongtuong_thuongungtuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ngulongtuong_thuongungtuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_ngulongtuong_thuongungtuong_trangsuc3_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thuongungtuong_loihotuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thuongungtuong_loihotuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thuongungtuong_loihotuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thuongungtuong_loihotuong_trangsuc3_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_loihotuong_hoaphungtuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_loihotuong_hoaphungtuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_loihotuong_hoaphungtuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_loihotuong_hoaphungtuong_trangsuc3_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_loihotuong_hoaphungtuong_vukhi_100.lua");

--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hoaphungtuong_thanhlongtuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hoaphungtuong_thanhlongtuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hoaphungtuong_thanhlongtuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hoaphungtuong_thanhlongtuong_trangsuc3_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_hoaphungtuong_thanhlongtuong_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thanhlongtuong_uyhotuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thanhlongtuong_uyhotuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thanhlongtuong_uyhotuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thanhlongtuong_uyhotuong_trangsuc3_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_thanhlongtuong_uyhotuong_vukhi_100.lua");
--
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_uyhotuong_chutuoctuong_muaoquan_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_uyhotuong_chutuoctuong_trangsuc1_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_uyhotuong_chutuoctuong_trangsuc2_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_uyhotuong_chutuoctuong_trangsuc3_100.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade_types\\upgrade_uyhotuong_chutuoctuong_vukhi_100.lua");
--------------------------------------------------------------------------------------------------

m_szNpcName = "<color=green>H�c tr� Th� r�n L�u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_hoctro_thorenluu.lua";
m_tbUpgradeFeature = { -- Define group n�ng c�p t�i ��y
    [1] = { szGroupName = "C�ch n�ng c�p trang b� l�n Chi�n Cu�ng",
            szFeatureTalk = "<npcname>: Trang b� Chi�n Cu�ng qu� th�t l�i h�i nh� c�i t�n c�a n�, m�c l�n ng��i c� th� x�ng b� v� l�m!",
    },
    [2] = { szGroupName = "C�ch n�ng c�p trang b� l�n H�o Hi�p",
            szFeatureTalk = "<npcname>: Trang b� H�o Hi�p, ng��i kho�c l�n m�nh s� �nh l�n �nh s�ng h�o hoa, h�nh hi�p tr��ng ngh�a!",
    },
    [3] = { szGroupName = "C�ch n�ng c�p trang b� l�n H�o Hi�p V� H�",
            szFeatureTalk = "<npcname>: Trang b� H�o Hi�p V� H�, ng��i kho�c l�n m�nh s� �nh l�n �nh s�ng h�o hoa, h�nh hi�p tr��ng ngh�a!",
    },
    [4] = { szGroupName = "C�ch n�ng c�p trang b� l�n �m Huy�t",
            szFeatureTalk = "<npcname>: Trang b� H�o �m Huy�t, th� huy�t �m h�n, chi�n v� b�t th�ng!",
    },
    [5] = { szGroupName = "C�ch n�ng c�p trang b� l�n S�t Tinh",
            szFeatureTalk = "<npcname>: T�ng l� B� C�u Ch�u, sau b� t� kh� x�m nh�p, t�ng m�nh uy l�c, nh�ng ng��i d�ng ph�i chi�n ��u kh�ng ng�ng.",
    },
    [6] = { szGroupName = "C�ch n�ng c�p trang b� l�n Ph� H�n",
            szFeatureTalk = "<npcname>: Ki�m kh� tung ho�nh v�n d�m, �nh l�nh r�c s�ng c�u ch�u.",
    },
    [7] = { szGroupName = "C�ch n�ng c�p trang b� l�n Th��ng �ng T��ng Qu�n",
            szFeatureTalk = "<npcname>: Th��ng �ng Th�n ban cho T��ng Qu�n, kho�c l�n m�nh uy d�ng v� c�ng.",
    },
    [8] = { szGroupName = "C�ch n�ng c�p trang b� l�n L�i H� T��ng Qu�n",
            szFeatureTalk = "<npcname>: Chi�n b�o t��ng qu�n do T� linh chi th�n L�i H� c�ng cho. Trang b� c�n qu�n h�m t��ng qu�n ho�c qu�n c�ng ��t ��n 800,000.",
    },
    [9] = { szGroupName = "C�ch n�ng c�p trang b� l�n H�a Ph�ng T��ng Qu�n",
            szFeatureTalk = "<npcname>: Chi�n b�o do Th�n H�a Ph�ng ban t�ng. Trang b� c�n qu�n h�m T��ng qu�n ho�c qu�n c�ng ��t 2,000,000.",
        --tbFeatureEx = {
        --    { szFeatureName= format("H�p th�nh v� kh� T�ng H�a Ph�ng cao c�p/#WLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_TONG_HPT_VUKHI), nDateOpen=1, nDateClose=1, nCamp=WEnv.BATTLECAMP_TONG },
        --    { szFeatureName= format("H�p th�nh v� kh� Li�u H�a Ph�ng cao c�p/#WLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_LIEU_HPT_VUKHI), nDateOpen=1, nDateClose=1, nCamp=WEnv.BATTLECAMP_LIEU },
        --}
    },
    [10] = { szGroupName = "C�ch n�ng c�p trang b� l�n Thanh Long T��ng Qu�n",
             szFeatureTalk = "<npcname>: Chi�n b�o do Th�n Thanh Long ban t�ng. Trang b� c�n qu�n h�m T��ng qu�n ho�c qu�n c�ng ��t 4,000,000.",
    },
    [11] = { szGroupName = "C�ch n�ng c�p trang b� l�n Uy H� T��ng Qu�n",
             szFeatureTalk = "<npcname>: T� linh th�n, tr�n b�n ph��ng. C�n ��t qu�n h�m T��ng ho�c c�ng tr�ng ��t ��n 6,000,000.",
    },
    [12] = { szGroupName = "C�ch n�ng c�p trang b� l�n Chu T��c T��ng Qu�n",
             szFeatureTalk = "<npcname>: �nh b�t d�y m�a gi�, ���ng m�c r� v�n m�y. C�n ��t qu�n h�m T��ng ho�c c�ng tr�ng ��t ��n 7,000,000.",
    },
};

function _w_NpcMain(nNpcIdx, nGroupIdx)
    local nCurRank = BT_GetData(PT_CURRANK);
    nCurRank = abs(nCurRank);
    local tbSay = { "<npcname>: Ti�u �� � ��y l� ch�n truy�n c�a L�u s� ph�, <sex> mu�n r�n c�i g� c� n�i!", };
    if WDate:Today() > 20240424 then
        tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_VSCT], EQUIP_SHOP_EXCHANGE_VSCT)); --N�ng c�p V� Song Chi�n Th�n
    end
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENCUONG], EQUIP_SHOP_EXCHANGE_CHIENCUONG));

   tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN], EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LANGSUONG], EQUIP_SHOP_EXCHANGE_LANGSUONG));


    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_HAOHIEP], EQUIP_SHOP_EXCHANGE_HAOHIEP));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA], EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_AMHUYET], EQUIP_SHOP_EXCHANGE_AMHUYET));
    -- tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_SATTINH], EQUIP_SHOP_EXCHANGE_SATTINH)); --LongDaiKa: ��ng n�ng c�p S�t Tinh
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_PHAHON], EQUIP_SHOP_EXCHANGE_PHAHON)); --LongDaiKa: ��ng n�ng c�p Ph� H�n
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TUT], EQUIP_SHOP_EXCHANGE_TONG_TUT));
        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_LHT], EQUIP_SHOP_EXCHANGE_TONG_LHT));
        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_HPT], EQUIP_SHOP_EXCHANGE_TONG_HPT));
        if nCurRank>4 then
            -- tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLT], EQUIP_SHOP_EXCHANGE_TONG_TLT));
        end
        -- tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLT], EQUIP_SHOP_EXCHANGE_TONG_TLT));
        if WDate:Today() > 20240414 then
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_UHT], EQUIP_SHOP_EXCHANGE_TONG_UHT)); --LongDaiKa: ��ng n�ng c�p Uy H� T��ng
            if nCurRank>1 then
                --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLSOAI], EQUIP_SHOP_EXCHANGE_TONG_TLSOAI)); --LongDaiKa: ��ng n�ng c�p Chu T��c T��ng
                tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_UHS], EQUIP_SHOP_EXCHANGE_TONG_UHS)); --LongDaiKa: ��ng n�ng c�p Uy H� So�i
            end

        end
        --if WDate:Today() > 20240530 then
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_CTT], EQUIP_SHOP_EXCHANGE_TONG_CTT));
            --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_CTSOAI], EQUIP_SHOP_EXCHANGE_TONG_CTSOAI));
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI], EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI));
           tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG], EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG));
          --LongDaiKa: ��ng n�ng c�p Chu T��c T��ng
        --end

        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLSOAI], EQUIP_SHOP_EXCHANGE_TONG_TLSOAI)); --LongDaiKa: ��ng n�ng c�p Chu T��c T��ng
    else
        -- tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TUT], EQUIP_SHOP_EXCHANGE_LIEU_TUT));
        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_LHT], EQUIP_SHOP_EXCHANGE_LIEU_LHT));
        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_HPT], EQUIP_SHOP_EXCHANGE_LIEU_HPT));

        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLT], EQUIP_SHOP_EXCHANGE_LIEU_TLT));

        --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLT], EQUIP_SHOP_EXCHANGE_LIEU_TLT));

        if WDate:Today() > 20240414 then
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_UHT], EQUIP_SHOP_EXCHANGE_LIEU_UHT)); --LongDaiKa: ��ng n�ng c�p Uy H� T��ng
            --if nCurRank>1 then
                --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI], EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI));
                tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_UHS], EQUIP_SHOP_EXCHANGE_LIEU_UHS)); --LongDaiKa: ��ng n�ng c�p Uy H� So�i
            --end
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_CTT], EQUIP_SHOP_EXCHANGE_LIEU_CTT));
            --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI], EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI));
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI], EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI));
            tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG], EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG));
        end

        -- tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI], EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI)); --LongDaiKa: ��ng n�ng c�p Chu T��c T��ng

    end
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA3], EQUIP_SHOP_EXCHANGE_KIMXA3));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA4], EQUIP_SHOP_EXCHANGE_KIMXA4));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA5], EQUIP_SHOP_EXCHANGE_KIMXA5));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA6], EQUIP_SHOP_EXCHANGE_KIMXA6));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA7], EQUIP_SHOP_EXCHANGE_KIMXA7));    --LongDaiKa: ��ng n�ng c�p Kim X� 7
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA8], EQUIP_SHOP_EXCHANGE_KIMXA8));	--LongDaiKa: ��ng n�ng c�p Kim X� 8
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA9], EQUIP_SHOP_EXCHANGE_KIMXA9));	--LongDaiKa: ��ng n�ng c�p Kim X� 9
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3));
    if WDate:Today() > 20231222 then
        tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4)); --LongDaiKa: ��ng n�ng c�p V�n S�c
    end
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5)); --LongDaiKa: ��ng n�ng c�p V�n S�c 5
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TAYTAMTHACH], EQUIP_SHOP_EXCHANGE_TAYTAMTHACH));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LUYENLOTHIET], EQUIP_SHOP_EXCHANGE_LUYENLOTHIET));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_UANLINH7], EQUIP_SHOP_EXCHANGE_UANLINH7));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_UANLINH8], EQUIP_SHOP_EXCHANGE_UANLINH8));
    --tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU], EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LinhThach], EQUIP_SHOP_EXCHANGE_LinhThach));
    tinsert(tbSay, format("M� %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_THUCUNG], EQUIP_SHOP_EXCHANGE_THUCUNG));


    tinsert(tbSay, "\nKhi kh�c s� quay l�i");
    WNpc:SayDialog(tbSay);

    -- D��i n�y kh�ng ch�y n�a
    do
        return 0;
    end

    nGroupIdx = tonumber(nGroupIdx) or 0;

    if nGroupIdx == 0 then
        local tbSay = { "<npcname>: Ti�u �� � ��y l� ch�n truy�n c�a L�u s� ph�, <sex> mu�n r�n c�i g� c� n�i!", };

        for nIdx, tbGroupInfo in pairs(m_tbUpgradeFeature) do
            for _, tbFeatureInfo in pairs(WItemUpgrade:GetAllTypes()) do
                -- t�m t�nh n�ng con �ang m�, n�u c� th� m�i m� cho hi�n group
                if _ ~= "n" and tbFeatureInfo and WLib:IsDateValid(tbFeatureInfo.nDateOpen, tbFeatureInfo.nDateClose) == 1 then
                    tinsert(tbSay, format("%s/#_w_NpcMain(%d, %d)", tbGroupInfo.szGroupName, nNpcIdx, nIdx));
                    break ;
                end
            end
        end

        if getn(tbSay) > 1 then
            tinsert(tbSay, "\nKhi kh�c s� quay l�i");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        else
            WNpc:Talk("<npcname>: Ti�u �� v�n �ang c�n h�c vi�c, 10 n�m n�a nh� h�y quay l�i nh�!");
            return WEnv.RETCODE_NOTOPEN;
        end
    end

    if m_tbUpgradeFeature[nGroupIdx] == WEnv.NULL then
        WNpc:Talk("<npcname>: Ta � ��y th� nghi�p s� ph� �� l�u nh�ng ch�a t�ng nghe qua chuy�n n�y, c�c h� c� nh�m g� kh�ng?");
        return WEnv.RETCODE_UNDEFINE;
    end

    local tbSay = { m_tbUpgradeFeature[nGroupIdx].szFeatureTalk };

    for nTypeIdx, tbTypeConfigs in pairs(WItemUpgrade:GetAllTypes()) do
        -- hi�n c�c sub con
        if nTypeIdx ~= "n" and tbTypeConfigs and nGroupIdx == tbTypeConfigs.nGroupId and WLib:IsDateValid(tbTypeConfigs.nDateOpen, tbTypeConfigs.nDateClose) == WEnv.TRUE then
            tinsert(tbSay, format("%s/#_w_UpgradeMain(%d, %d, 0)", tbTypeConfigs.szFeatureName, nGroupIdx, nTypeIdx));
        end
    end

    local nCamp = WPlayer:GetBattleCamp();
    if m_tbUpgradeFeature[nGroupIdx].tbFeatureEx then
        for _, tbFeatureEx in pairs(m_tbUpgradeFeature[nGroupIdx].tbFeatureEx) do
            if _ ~= "n"
                    and (WLib:IsDateValid(tbFeatureEx.nDateOpen, tbFeatureEx.nDateClose) == WEnv.TRUE)
                    and (tbFeatureEx.nCamp == WEnv.NULL or tbFeatureEx.nCamp == 0 or nCamp == tbFeatureEx.nCamp)
            then
                tinsert(tbSay, tbFeatureEx.szFeatureName);
            end
        end
    end

    if getn(tbSay) > 1 then
        tinsert(tbSay, "\nKhi kh�c s� quay l�i/nothing");
        WNpc:SayDialog(tbSay);
    else
        WNpc:Talk("<npcname>: �� c� nghe s� ph� t�ng n�i qua nh�ng ch�a ch� cho ��, 10 n�m n�a nh� h�y quay l�i nh�!");
    end
    return WEnv.RETCODE_SUCCESS;
end

function _w_UpgradeMain(nGroupIdx, nTypeIdx, bConfirm)
    nGroupIdx = tonumber(nGroupIdx) or 0;
    nTypeIdx = tonumber(nTypeIdx) or 0;
    bConfirm = tonumber(bConfirm) or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nGroupIdx == 0
            or nTypeIdx == 0
            or tbTypeConfigs == WEnv.NULL
            and (tbTypeConfigs and nGroupIdx ~= tbTypeConfigs.nGroupId)
    then
        WNpc:Talk("<npcname>: Ng�n n�y ta ch�a ���c h�c qua, ��i ta th�m 10 n�m n�a nh�!");
        return WEnv.RETCODE_UNDEFINE;
    end

    local szFeatureName = tbTypeConfigs.szFeatureName;
    local nDateOpen = tbTypeConfigs.nDateOpen;
    local nDateClose = tbTypeConfigs.nDateClose;
    local szPutinTitle = tbTypeConfigs.szPutinTitle;
    local nPutinNum = tbTypeConfigs.nPutinNum;
    local szConsumeInfo = tbTypeConfigs.szConsumeInfo;
    local tbMaterialConsume = tbTypeConfigs.tbMaterialConsume;
    local nMatchBodyMode = tbTypeConfigs.nMatchBodyMode;
    local nEnhanceMode = tbTypeConfigs.nEnhanceMode;

    if WLib:IsDateValid(nDateOpen, nDateClose) ~= 1 then
        WNpc:Talk("<npcname>: T�nh n�ng n�y t�m th�i ch�a m�.");
        return WEnv.RETCODE_NOTOPEN;
    end

    if bConfirm == 0 then
        local szSuccessDesc = format("\nTh�nh c�ng: nh�n ���c %s, %s.", enumWItemUpgradeMatchBodyMode[nMatchBodyMode], enumWItemUpgradeEnhanceMode[nEnhanceMode]);
        local szFailureDesc = "\nTh�t b�i: nh�n l�i trang b�, ti�u hao nguy�n li�u.";
        if tbTypeConfigs.nMaxRandom == tbTypeConfigs.nLuckyNum then
            szFailureDesc = "";
        end
        local szNotice = format("\n<color=red>L�u �: trang b� c�n n�ng c�p ��t v�o � v�t ph�m, nguy�n li�u �� � h�nh trang.%s%s<color>", szSuccessDesc, szFailureDesc);
        local tbSay = { format("%s c�n %s%s.%s", szFeatureName, WLib:MaterialDescription(tbMaterialConsume), szConsumeInfo, szNotice),
                        format("Ta mu�n n�ng c�p b�y gi�\n /#_w_UpgradeMain(%d, %d, 1)", nGroupIdx, nTypeIdx),
                        "Ta hi�u r�i, khi kh�c s� quay l�i/nothing",
        };
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if IsBoxLocking() == 1 then
        WNpc:Talk("<npcname>: <color=red>�� ��m b�o t�i s�n <sex> ph�i m� kh�a r��ng tr��c khi th�c hi�n thao t�c n�y.<color>\n<color=green>(H��ng d�n: m�t m� r��ng c� th� ��n t�m Th� kh� �� h�i)<color>");
        return WEnv.RETCODE_BOXLOCK;
    end

    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_TYPE_IDX, nTypeIdx);
    PutinItemBox(szPutinTitle, nPutinNum, WLib:StringFormal("<sex> x�c nh�n mu�n <color=green>%s<color> kh�ng?", szFeatureName), m_szThisFile, nTypeIdx);
    return WEnv.RETCODE_SUCCESS;
end
