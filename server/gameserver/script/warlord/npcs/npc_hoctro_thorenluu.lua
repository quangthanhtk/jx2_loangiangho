----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Npc n©ng cÊp trang bÞ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\newbattles\\functions.lua");
--Import("\\script\\warlord\\libs\\lib_itemupgrade.lua");
----------------------------------------------------------------------------------------------------
-- C¸c config update include d­íi nµy
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

m_szNpcName = "<color=green>Häc trß Thî rÌn L­u<color>: ";
m_szThisFile = "\\script\\warlord\\npcs\\npc_hoctro_thorenluu.lua";
m_tbUpgradeFeature = { -- Define group n©ng cÊp t¹i ®©y
    [1] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn ChiÕn Cuång",
            szFeatureTalk = "<npcname>: Trang bÞ ChiÕn Cuång qu¶ thËt lîi h¹i nh­ c¸i tªn cña nã, mÆc lªn ng­êi cã thÓ x­ng b¸ vâ l©m!",
    },
    [2] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Hµo HiÖp",
            szFeatureTalk = "<npcname>: Trang bÞ Hµo HiÖp, ng­êi kho¸c lªn m×nh sÏ ¸nh lªn ¸nh s¸ng hµo hoa, hµnh hiÖp tr­îng nghÜa!",
    },
    [3] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Hµo HiÖp V« H¹",
            szFeatureTalk = "<npcname>: Trang bÞ Hµo HiÖp V« H¹, ng­êi kho¸c lªn m×nh sÏ ¸nh lªn ¸nh s¸ng hµo hoa, hµnh hiÖp tr­îng nghÜa!",
    },
    [4] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Èm HuyÕt",
            szFeatureTalk = "<npcname>: Trang bÞ Hµo Èm HuyÕt, thÞ huyÕt Èm hËn, chiÕn v« bÊt th¾ng!",
    },
    [5] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn S¸t Tinh",
            szFeatureTalk = "<npcname>: Tõng lµ Bé Cöu Ch©u, sau bÞ tµ khÝ x©m nhËp, t¨ng m¹nh uy lùc, nh­ng ng­êi dïng ph¶i chiÕn ®Êu kh«ng ngõng.",
    },
    [6] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Ph¸ Hån",
            szFeatureTalk = "<npcname>: KiÕm khÝ tung hoµnh v¹n dÆm, ¸nh l¹nh rùc s¸ng cöu ch©u.",
    },
    [7] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Th­¬ng ¦ng T­íng Qu©n",
            szFeatureTalk = "<npcname>: Th­¬ng ¦ng ThÇn ban cho T­íng Qu©n, kho¸c lªn m×nh uy dòng v« cïng.",
    },
    [8] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn L«i Hæ T­íng Qu©n",
            szFeatureTalk = "<npcname>: ChiÕn bµo t­íng qu©n do Tø linh chi thÇn L«i Hæ cèng cho. Trang bÞ cÇn qu©n hµm t­íng qu©n hoÆc qu©n c«ng ®¹t ®Õn 800,000.",
    },
    [9] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Háa Phông T­íng Qu©n",
            szFeatureTalk = "<npcname>: ChiÕn bµo do ThÇn Háa Phông ban tÆng. Trang bÞ cÇn qu©n hµm T­íng qu©n hoÆc qu©n c«ng ®¹t 2,000,000.",
        --tbFeatureEx = {
        --    { szFeatureName= format("Hîp thµnh vò khÝ Tèng Háa Phông cao cÊp/#WLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_TONG_HPT_VUKHI), nDateOpen=1, nDateClose=1, nCamp=WEnv.BATTLECAMP_TONG },
        --    { szFeatureName= format("Hîp thµnh vò khÝ Liªu Háa Phông cao cÊp/#WLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_LIEU_HPT_VUKHI), nDateOpen=1, nDateClose=1, nCamp=WEnv.BATTLECAMP_LIEU },
        --}
    },
    [10] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Thanh Long T­íng Qu©n",
             szFeatureTalk = "<npcname>: ChiÕn bµo do ThÇn Thanh Long ban tÆng. Trang bÞ cÇn qu©n hµm T­íng qu©n hoÆc qu©n c«ng ®¹t 4,000,000.",
    },
    [11] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Uy Hæ T­íng Qu©n",
             szFeatureTalk = "<npcname>: Tø linh thÇn, trÊn bèn ph­¬ng. CÇn ®¹t qu©n hµm T­íng hoÆc c«ng tr¹ng ®¹t ®Õn 6,000,000.",
    },
    [12] = { szGroupName = "C¸ch n©ng cÊp trang bÞ lªn Chu T­íc T­íng Qu©n",
             szFeatureTalk = "<npcname>: ¸nh bót dµy m­a giã, ®­êng mùc râ v©n m©y. CÇn ®¹t qu©n hµm T­íng hoÆc c«ng tr¹ng ®¹t ®Õn 7,000,000.",
    },
};

function _w_NpcMain(nNpcIdx, nGroupIdx)
    local nCurRank = BT_GetData(PT_CURRANK);
    nCurRank = abs(nCurRank);
    local tbSay = { "<npcname>: TiÓu ®Ö ë ®©y lµ ch©n truyÒn cña L­u s­ phô, <sex> muèn rÌn c¸i g× cø nãi!", };
    if WDate:Today() > 20240424 then
        tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_VSCT], EQUIP_SHOP_EXCHANGE_VSCT)); --N©ng cÊp V« Song ChiÕn ThÇn
    end
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENCUONG], EQUIP_SHOP_EXCHANGE_CHIENCUONG));

   tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN], EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LANGSUONG], EQUIP_SHOP_EXCHANGE_LANGSUONG));


    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_HAOHIEP], EQUIP_SHOP_EXCHANGE_HAOHIEP));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA], EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_AMHUYET], EQUIP_SHOP_EXCHANGE_AMHUYET));
    -- tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_SATTINH], EQUIP_SHOP_EXCHANGE_SATTINH)); --LongDaiKa: §ãng n©ng cÊp S¸t Tinh
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_PHAHON], EQUIP_SHOP_EXCHANGE_PHAHON)); --LongDaiKa: §ãng n©ng cÊp Ph¸ Hån
    if WPlayer:GetBattleCamp() == WEnv.BATTLECAMP_TONG then
        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TUT], EQUIP_SHOP_EXCHANGE_TONG_TUT));
        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_LHT], EQUIP_SHOP_EXCHANGE_TONG_LHT));
        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_HPT], EQUIP_SHOP_EXCHANGE_TONG_HPT));
        if nCurRank>4 then
            -- tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLT], EQUIP_SHOP_EXCHANGE_TONG_TLT));
        end
        -- tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLT], EQUIP_SHOP_EXCHANGE_TONG_TLT));
        if WDate:Today() > 20240414 then
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_UHT], EQUIP_SHOP_EXCHANGE_TONG_UHT)); --LongDaiKa: §ãng n©ng cÊp Uy Hæ T­íng
            if nCurRank>1 then
                --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLSOAI], EQUIP_SHOP_EXCHANGE_TONG_TLSOAI)); --LongDaiKa: §ãng n©ng cÊp Chu T­íc T­íng
                tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_UHS], EQUIP_SHOP_EXCHANGE_TONG_UHS)); --LongDaiKa: §ãng n©ng cÊp Uy Hæ So¸i
            end

        end
        --if WDate:Today() > 20240530 then
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_CTT], EQUIP_SHOP_EXCHANGE_TONG_CTT));
            --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_CTSOAI], EQUIP_SHOP_EXCHANGE_TONG_CTSOAI));
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI], EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI));
           tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG], EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG));
          --LongDaiKa: §ãng n©ng cÊp Chu T­íc T­íng
        --end

        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TONG_TLSOAI], EQUIP_SHOP_EXCHANGE_TONG_TLSOAI)); --LongDaiKa: §ãng n©ng cÊp Chu T­íc T­íng
    else
        -- tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TUT], EQUIP_SHOP_EXCHANGE_LIEU_TUT));
        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_LHT], EQUIP_SHOP_EXCHANGE_LIEU_LHT));
        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_HPT], EQUIP_SHOP_EXCHANGE_LIEU_HPT));

        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLT], EQUIP_SHOP_EXCHANGE_LIEU_TLT));

        --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLT], EQUIP_SHOP_EXCHANGE_LIEU_TLT));

        if WDate:Today() > 20240414 then
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_UHT], EQUIP_SHOP_EXCHANGE_LIEU_UHT)); --LongDaiKa: §ãng n©ng cÊp Uy Hæ T­íng
            --if nCurRank>1 then
                --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI], EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI));
                tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_UHS], EQUIP_SHOP_EXCHANGE_LIEU_UHS)); --LongDaiKa: §ãng n©ng cÊp Uy Hæ So¸i
            --end
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_CTT], EQUIP_SHOP_EXCHANGE_LIEU_CTT));
            --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI], EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI));
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI], EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI));
            tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG], EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG));
        end

        -- tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI], EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI)); --LongDaiKa: §ãng n©ng cÊp Chu T­íc T­íng

    end
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA3], EQUIP_SHOP_EXCHANGE_KIMXA3));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA4], EQUIP_SHOP_EXCHANGE_KIMXA4));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA5], EQUIP_SHOP_EXCHANGE_KIMXA5));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA6], EQUIP_SHOP_EXCHANGE_KIMXA6));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA7], EQUIP_SHOP_EXCHANGE_KIMXA7));    --LongDaiKa: §ãng n©ng cÊp Kim Xµ 7
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA8], EQUIP_SHOP_EXCHANGE_KIMXA8));	--LongDaiKa: §ãng n©ng cÊp Kim Xµ 8
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KIMXA9], EQUIP_SHOP_EXCHANGE_KIMXA9));	--LongDaiKa: §ãng n©ng cÊp Kim Xµ 9
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3));
    if WDate:Today() > 20231222 then
        tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4)); --LongDaiKa: §ãng n©ng cÊp V¨n Søc
    end
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5], EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5)); --LongDaiKa: §ãng n©ng cÊp V¨n Søc 5
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_TAYTAMTHACH], EQUIP_SHOP_EXCHANGE_TAYTAMTHACH));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LUYENLOTHIET], EQUIP_SHOP_EXCHANGE_LUYENLOTHIET));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_UANLINH7], EQUIP_SHOP_EXCHANGE_UANLINH7));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_UANLINH8], EQUIP_SHOP_EXCHANGE_UANLINH8));
    --tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU], EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_LinhThach], EQUIP_SHOP_EXCHANGE_LinhThach));
    tinsert(tbSay, format("Më %s/#WLib:OpenEquipShop(%d)", g_tbEquipShop[EQUIP_SHOP_EXCHANGE_THUCUNG], EQUIP_SHOP_EXCHANGE_THUCUNG));


    tinsert(tbSay, "\nKhi kh¸c sÏ quay l¹i");
    WNpc:SayDialog(tbSay);

    -- D­íi nµy kh«ng ch¹y n÷a
    do
        return 0;
    end

    nGroupIdx = tonumber(nGroupIdx) or 0;

    if nGroupIdx == 0 then
        local tbSay = { "<npcname>: TiÓu ®Ö ë ®©y lµ ch©n truyÒn cña L­u s­ phô, <sex> muèn rÌn c¸i g× cø nãi!", };

        for nIdx, tbGroupInfo in pairs(m_tbUpgradeFeature) do
            for _, tbFeatureInfo in pairs(WItemUpgrade:GetAllTypes()) do
                -- t×m tÝnh n¨ng con ®ang më, nÕu cã th× míi më cho hiÖn group
                if _ ~= "n" and tbFeatureInfo and WLib:IsDateValid(tbFeatureInfo.nDateOpen, tbFeatureInfo.nDateClose) == 1 then
                    tinsert(tbSay, format("%s/#_w_NpcMain(%d, %d)", tbGroupInfo.szGroupName, nNpcIdx, nIdx));
                    break ;
                end
            end
        end

        if getn(tbSay) > 1 then
            tinsert(tbSay, "\nKhi kh¸c sÏ quay l¹i");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        else
            WNpc:Talk("<npcname>: TiÓu ®Ö vÉn ®ang cßn häc viÖc, 10 n¨m n÷a nhÐ h·y quay l¹i nhÐ!");
            return WEnv.RETCODE_NOTOPEN;
        end
    end

    if m_tbUpgradeFeature[nGroupIdx] == WEnv.NULL then
        WNpc:Talk("<npcname>: Ta ë ®©y thô nghiÖp s­ phô ®· l©u nh­ng ch­a tõng nghe qua chuyÖn nµy, c¸c h¹ cã nhÇm g× kh«ng?");
        return WEnv.RETCODE_UNDEFINE;
    end

    local tbSay = { m_tbUpgradeFeature[nGroupIdx].szFeatureTalk };

    for nTypeIdx, tbTypeConfigs in pairs(WItemUpgrade:GetAllTypes()) do
        -- hiÖn c¸c sub con
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
        tinsert(tbSay, "\nKhi kh¸c sÏ quay l¹i/nothing");
        WNpc:SayDialog(tbSay);
    else
        WNpc:Talk("<npcname>: §Ö cã nghe s­ phô tõng nãi qua nh­ng ch­a chØ cho ®Ö, 10 n¨m n÷a nhÐ h·y quay l¹i nhÐ!");
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
        WNpc:Talk("<npcname>: Ngãn nµy ta ch­a ®­îc häc qua, ®îi ta thªm 10 n¨m n÷a nhÐ!");
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
        WNpc:Talk("<npcname>: TÝnh n¨ng nµy t¹m thêi ch­a më.");
        return WEnv.RETCODE_NOTOPEN;
    end

    if bConfirm == 0 then
        local szSuccessDesc = format("\nThµnh c«ng: nhËn ®­îc %s, %s.", enumWItemUpgradeMatchBodyMode[nMatchBodyMode], enumWItemUpgradeEnhanceMode[nEnhanceMode]);
        local szFailureDesc = "\nThÊt b¹i: nhËn l¹i trang bÞ, tiªu hao nguyªn liÖu.";
        if tbTypeConfigs.nMaxRandom == tbTypeConfigs.nLuckyNum then
            szFailureDesc = "";
        end
        local szNotice = format("\n<color=red>L­u ý: trang bÞ cÇn n©ng cÊp ®Æt vµo « vËt phÈm, nguyªn liÖu ®Ó ë hµnh trang.%s%s<color>", szSuccessDesc, szFailureDesc);
        local tbSay = { format("%s cÇn %s%s.%s", szFeatureName, WLib:MaterialDescription(tbMaterialConsume), szConsumeInfo, szNotice),
                        format("Ta muèn n©ng cÊp b©y giê\n /#_w_UpgradeMain(%d, %d, 1)", nGroupIdx, nTypeIdx),
                        "Ta hiÓu råi, khi kh¸c sÏ quay l¹i/nothing",
        };
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if IsBoxLocking() == 1 then
        WNpc:Talk("<npcname>: <color=red>§Ó ®¶m b¶o tµi s¶n <sex> ph¶i më khãa r­¬ng tr­íc khi thùc hiÖn thao t¸c nµy.<color>\n<color=green>(H­íng dÉn: mËt m· r­¬ng cã thÓ ®Õn t×m Thñ khè ®Ó hái)<color>");
        return WEnv.RETCODE_BOXLOCK;
    end

    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_TYPE_IDX, nTypeIdx);
    PutinItemBox(szPutinTitle, nPutinNum, WLib:StringFormal("<sex> x¸c nhËn muèn <color=green>%s<color> kh«ng?", szFeatureName), m_szThisFile, nTypeIdx);
    return WEnv.RETCODE_SUCCESS;
end
