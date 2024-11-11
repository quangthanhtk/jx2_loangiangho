Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--²âÊÔ
DebugOutput = nothing

--ÊÇ·ñÎªĞÂ·ş·şÎñÆ÷
--Experience server Switch
CK_ES_SWITCH = 0;

function _ck_check_tong()
    if IsTongMember() <= 0 then
        --Say(CK_NPC_NAME.."²»Âú×ãÌõ¼ş£¬²»ÄÜÍê³ÉÈÎÎñ£¡", 0);
        return 0;
    end
    return 1
end
function _ck_check_shili()
    local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
    if nCamp > 0 and nCamp <= 3 then
        return 1
    end
    return 0
end
function _ck_check_yueka()
    if IsActivatedVipCard() ~= 1 then
        --Say(CK_NPC_NAME.."Äú»¹Ã»ÓĞ¼¤»îÈÎºÎÔÂ¿¨£¬²»ÄÜÍê³ÉÈÎÎñ£¡", 0);
        return 0;
    end
    return 1
end
function _ck_del_300_ziguangjifen()
    --¿Û×Ï¹â»ı·Ö
    local TSK_POINT = 652;            --¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ı·Ö
    if GetTask(TSK_POINT) < 300 then
        Say(CK_NPC_NAME .. format("§iÓm tİch lòy tö quang kh«ng ®ñ <color=red>%d<color> ®iÓm", 300), 0);
        return 0;
    end
    SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
    return 1
end
function _ck_check_300_ziguangjifen()
    local TSK_POINT = 652;            --¼ÇÂ¼Íæ¼Ò¸öÈË¹Ø¿¨»ı·Ö
    if GetTask(TSK_POINT) < 300 then
        return 0;
    end
    return 1
end

--ÓÃÒ»ÕÅ±íÀ´¼ÇÂ¼ËùÓĞÈÎÎñ ÒÔÇ°´¿ÊÖ¹¤ÖÆ×÷ÊÜ²»ÁË
CK_EXT_AWARD = 0
T_CK_TASK_LIST = {
    --{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
    --°ÙÕ½²»´ù Èı·½ÊÆÁ¦ÈÎÎñ
    [1101] = { 0, "VËn tiªu", { "Hoµn thµnh 1 lÇn nhiÖm vô vËn tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô vËn tiªu" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 1, 2, 3 } },
    [1102] = { 0, "C­íp tiªu", { "Hoµn thµnh 1 lÇn nhiÖm vô c­íp tiªu", "§Õn b¶n ®å thÕ lùc chç NPC Tiªu §Çu TrÊn ViÔn Tiªu Côc ®Ó nhËn nhiÖm vô ®o¹t tiªu" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 4, 5, 6 } },
    [1103] = { 0, "Thu thËp Ngäc Ph¸ch", { "Thu thËp 1 Ngäc Ph¸ch", "§Õn Th¸i H­ Cæ Thô cña thÕ lùc trång 1 h¹t gièng, thu thËp 1 Ngäc Ph¸ch" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 7, 8, 9 } },
    [1104] = { 0, "Trém Ngäc Ph¸ch", { "§Õn thÕ lùc kh¸c trém 1 Ngäc Ph¸ch", "Vµo b¶n ®å thÕ lùc kh¸c ®Ó trém 1 Ngäc Ph¸ch" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 10, 11, 12 } },
    [1105] = { 0, "T©y Vùc TruyÒn §¹o", { "Tham gia tİnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng", "Vµo b¶n ®å thÕ lùc tham gia tİnh n¨ng T©y Vùc TruyÒn §¹o, nhÊp vµo 3 th¸nh vËt ®Ó nhËn th­ëng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 13, 14, 15 } },
    [1106] = { 0, "BOSS ThÕ Lùc", { "NhËn b¶o vÖ BOSS cña thÕ lùc vµ tiªu diÖt BOSS cña thÕ lùc phe ®Şch ®Ó nhËn ®­îc phÇn th­ëng", "Buæi tèi sÏ xuÊt hiÖn BOSS cña thÕ lùc phe ta hoÆc phe ®Şch, b¶o vÖ BOSS cña phe ta vµ tiªu diÖt BOSS cña phe ®Şch sÏ nhËn ®­îc phÇn th­ëng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 16, 17, 18 } },
    [1107] = { 0, "Thî S¨n TiÒn Th­ëng", { "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 19, 20, 21 } },
    [1108] = { 0, "NhiÖm vô §µo Kho B¸u", { "Hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u", "Vµo thÕ lùc nhËn 1 Tµng B¶o §å, hoµn thµnh 1 lÇn nhiÖm vô §µo Kho B¸u" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 22, 23, 24 } },

    --°ÙÕ½²»´ù ¸±±¾ÈÎÎñ
    [1201] = { 0, "L­¬ng S¬n", { "Hoµn thµnh 1 lÇn ¶i L­¬ng S¬n B¹c", "Hoµn thµnh 1 lÇn ¶i L­¬ng S¬n B¹c" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 1, 2, 3 } },
    [1202] = { 0, "V¹n KiÕm Tròng", { "V­ît ¶i V¹n KiÕm Tròng 1 lÇn", "V­ît ¶i V¹n KiÕm Tròng 1 lÇn" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 4, 5, 6 } },
    [1203] = { 0, "§Şa HuyÒn Cung", { "V­ît ¶i §Şa HuyÒn Cung 1 lÇn", "V­ît ¶i §Şa HuyÒn Cung 1 lÇn" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 7, 8, 9 } },
    [1204] = { 0, "Th¸i NhÊt Th¸p", { "V­ît ¶i Th¸i NhÊt Th¸p 1 lÇn", "V­ît ¶i Th¸i NhÊt Th¸p 1 lÇn" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 10, 11, 12 } },

    --°ÙÕ½²»´ù PVPÈÎÎñ
    [1301] = { 0, "Trång 1 C©y B¸t Nh·-Nhá", { "Trång vµ thu ho¹ch 1 C©y B¸t Nh·-Nhá", "Trång vµ thu ho¹ch 1 C©y B¸t Nh·-Nhá" }, { 20000000, 35 }, { 2, 13, 14, 15 } },
    [1302] = { 0, "Trång 1 C©y Tø Linh", { "Trång vµ thu ho¹ch 1 C©y Tø Linh", "Trång vµ thu ho¹ch 1 C©y Tø Linh" }, { 20000000, 35 }, { 2, 16, 17, 18 } },
    [1303] = { 0, "Trång 1 C©y H¹t Gièng", { "Trång vµ thu ho¹ch 1 C©y H¹t Gièng", "Trång vµ thu ho¹ch 1 C©y H¹t Gièng" }, { 20000000, 35 }, { 2, 19, 20, 21 } },
    [1304] = { 0, "PK ThÕ Lùc Ba Phe", { "§¸nh b¹i 1 ng­êi ch¬i phe ®Şch cña thÕ lùc kh¸c", "DiÖt 1 ng­êi ch¬i thÕ lùc ®Şch, chøng minh kh¶ n¨ng cña b¹n!" }, { 20000000, 35 }, { 2, 22, 23, 24 } },
    ------1305~1307±ØĞë±£³ÖÁ¬Ğø£¬½ûÖ¹²åÈË
    [1305] = { 0, "ChiÕn DŞch Th«n Trang", { "Tham gia 1 lÇn Th«n lµng chiÕn", "Tham gia 1 lÇn Th«n lµng chiÕn" }, { 20000000, 35 }, { 2, 25, 26, 27 } },
    [1306] = { 0, "ChiÕn DŞch Th¶o Cèc", { "Tham gia 1 lÇn Th¶o cèc chiÕn", "Tham gia 1 lÇn Th¶o cèc chiÕn" }, { 20000000, 35 }, { 2, 28, 29, 30 } },
    [1307] = { 0, "Ph¸o §µi Tranh §o¹t ChiÕn", { "Tham gia 1 lÇn Ph¸o ®µi chiÕn", "Tham gia 1 lÇn Ph¸o ®µi chiÕn" }, { 20000000, 35 }, { 3, 1, 2, 3 } },
    [1308] = { 0, "Sö dông 50 Ph¸o ChiÕn Th¾ng", { "Sö dông 50 Ph¸o ChiÕn Th¾ng", "Sö dông 50 Ph¸o ChiÕn Th¾ng" }, { 20000000, 35 }, { 3, 4, 5, 6 } },
    [1309] = { 0, "H«m nay trång 1 C©y B¸t Nh· Lín", { "H«m nay trång vµ thu ho¹ch 1 C©y B¸t Nh· Lín", "H«m nay trång vµ thu ho¹ch 1 C©y B¸t Nh· Lín" }, { 20000000, 35 }, { 3, 8, 9, 10 } },
    [1310] = { 0, "Nh¹n M«n LiÖt Háa", { "NhËn th­ëng chiÕn tr­êng Nh¹n M«n LiÖt Háa", "NhËn th­ëng chiÕn tr­êng Nh¹n M«n LiÖt Háa" }, { 20000000, 35 }, { 3, 11, 12, 13 } },
    [1311] = { 0, "Tèng Liªu Tµi Nguyªn ChiÕn", { "H«m nay tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn", "H«m nay tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn" }, { 20000000, 35 }, { 3, 14, 15, 16 } },


    --Ã¿ÈÕÆäËûÈÎÎñ
    [1401] = { 1, "§¨ng nhËp mçi ngµy", { "§¨ng nhËp mçi ngµy", "§¨ng nhËp mçi ngµy" }, { 20000000, 20 }, { 3, 0, 0, 7 } },

    --------------------

    --ËÙÕ½ËÙ¾ö °ï»áÈÎÎñ
    [2101] = { 0, "Gia nhËp bang héi", { "Gia nhËp mét bang héi bÊt kú, trë thµnh mét thµnh viªn trong bang", "Gia nhËp bang héi, cïng víi thµnh viªn kh¸c cè g¾ng ®Ó gióp bang héi ngµy cµng lín m¹nh" }, { 50000000, 200 }, { 9, 0, _ck_check_tong, 1 } },
    [2102] = { 0, "T¸i chiÕn ThÇn Thó", { "Nép 300 ®iÓm tİch lòy tö quang (Sau khi giao nhiÖm vô th× hai bªn sÏ bŞ trõ 300 ®iÓm tİch lòy tö quang)", "ChØ cã ng­¬i míi cã thÓ thuÇn phôc Tö Quang ThÇn Thó!" }, { 50000000, 100, _ck_del_300_ziguangjifen }, { 9, 0, _ck_check_300_ziguangjifen, 2 } },
    [2103] = { 0, "Nép ®iÓm cèng hiÕn bang héi", { "Tham gia tİnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi", "Tham gia tİnh n¨ng Bang Héi Vinh Danh, giao nép 10 ®iÓm cèng hiÕn bang héi" }, { 50000000, 100 }, { 9, 0, 3, 4 } },
    [2104] = { 0, "NhËn phÇn th­ëng Bang Héi Vinh Danh", { "NhËn phÇn th­ëng Bang Héi Vinh Danh", "Tham gia tİnh n¨ng Bang Héi Vinh Danh vµ nhËn phÇn th­ëng" }, { 50000000, 300 }, { 9, 0, 5, 6 } },

    [2201] = { 0, "§¹i HiÖp", { "Kİch ho¹t danh phËn §¹i HiÖp", "Kİch ho¹t VIP §¹i HiÖp LÖnh, ch¬i trß ch¬i nhÑ nhµng h¬n" }, { 50000000, 1400 }, { 10, 0, _ck_check_yueka, 1 } },
    [2202] = { 0, "Gia nhËp thÕ lùc", { "Gia nhËp 1 thÕ lùc trong ba phe", "Gia nhËp 1 thÕ lùc trong ba phe" }, { 50000000, 400 }, { 10, 0, _ck_check_shili, 2 } },
    [2203] = { 0, "VËn tiªu", { "Hoµn thµnh 1 lÇn vËn tiªu", "Vµo thÕ lùc nhËn nhiÖm vô vËn tiªu, hoµn thµnh 1 lÇn vËn tiªu" }, { 50000000, 400 }, { 10, 0, 3, 4 } },
    [2204] = { 0, "C­íp tiªu", { "Hoµn thµnh 1 lÇn c­íp tiªu", "Vµo thÕ lùc nhËn nhiÖm vô c­íp tiªu, hoµn thµnh 1 lÇn c­íp tiªu" }, { 50000000, 400 }, { 10, 0, 5, 6 } },
    [2205] = { 0, "Trång c©y", { "Hoµn thµnh 1 lÇn nhiÖm vô trång c©y", "Vµo thÕ lùc chç C©y Th¸i H­ hoµn thµnh 1 lÇn nhiÖm vô trång c©y" }, { 5000000, 400 }, { 10, 0, 7, 8 } },
    [2206] = { 0, "§µo r­¬ng", { "Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng", "Hoµn thµnh 1 lÇn nhiÖm vô ®µo r­¬ng" }, { 5000000, 400 }, { 10, 0, 9, 10 } },
    [2207] = { 0, "Thî S¨n TiÒn Th­ëng", { "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng", "Hoµn thµnh 1 lÇn nhiÖm vô Thî S¨n TiÒn Th­ëng" }, { 5000000, 400 }, { 10, 0, 11, 12 } },
    -- [2208] = {0, "Î÷Óò´«µÀ", {"Ê¹ÓÃÆäÖĞÈÎÒâ1¸öµÀ¾ß£º½ğÁê¾Æ£¬²Ø½£ÃØ´«ĞÄ¾­£¬°ÙÏşÉúÃØ·¨", "²ÎÓëÎ÷Óò´«µÀ¹¦ÄÜ£¬ÈÎÒâÊ¹ÓÃÆäÖĞ1¸öµÀ¾ß£º½ğÁê¾Æ£¬²Ø½£ÃØ´«ĞÄ¾­£¬°ÙÏşÉúÃØ·¨"}, {50000000, 600}, {10, 0, 13, 14}},

    [2209] = { 0, "Trång 1 C©y B¸t Nh· Lín", { "Trång vµ thu ho¹ch 1 C©y B¸t Nh· Lín", "Trång vµ thu ho¹ch 1 C©y B¸t Nh· Lín" }, { 50000000, 300 }, { 10, 0, 13, 14 } },
    [2210] = { 0, "Trång 1 C©y B¸t Nh·-Nhá", { "Trång vµ thu ho¹ch 1 C©y B¸t Nh·-Nhá", "Trång vµ thu ho¹ch 1 C©y B¸t Nh·-Nhá" }, { 50000000, 300 }, { 10, 0, 15, 16 } },
    [2211] = { 0, "Trång 1 H¹t Gièng", { "Trång vµ thu ho¹ch 1 H¹t Gièng", "Trång vµ thu ho¹ch 1 H¹t Gièng" }, { 50000000, 300 }, { 10, 0, 17, 18 } },
    [2212] = { 0, "Trång 1 C©y Tø Linh", { "Trång vµ thu ho¹ch 1 C©y Tø Linh", "Trång vµ thu ho¹ch 1 C©y Tø Linh" }, { 50000000, 300 }, { 10, 0, 19, 20 } },
    [2213] = { 0, "Dïng 8 Ng«i Sao May M¾n", { "Dïng 8 Ng«i Sao May M¾n", "Dïng 8 Ng«i Sao May M¾n" }, { 50000000, 400 }, { 10, 0, 21, 22 } },
    [2214] = { 0, "Dïng 100 N÷ Oa B¶o H¹p", { "Dïng 100 N÷ Oa B¶o H¹p", "Dïng 100 N÷ Oa B¶o H¹p" }, { 50000000, 400 }, { 10, 0, 23, 24 } },
    [2215] = { 0, "Sö dông 50 Ph¸o ChiÕn Th¾ng", { "Sö dông 50 Ph¸o ChiÕn Th¾ng", "Sö dông 50 Ph¸o ChiÕn Th¾ng" }, { 50000000, 200 }, { 10, 0, 25, 26 } },
    [2216] = { 0, "Tèng Liªu Tµi Nguyªn ChiÕn", { "Tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn", "Tham gia Tèng Liªu Tµi Nguyªn ChiÕn vµ nhËn th­ëng 1 lÇn" }, { 50000000, 300 }, { 10, 0, 27, 28 } },

    --´ó¸»ÎÌ ÊıÖµÀÛ¼ÆÈÎÎñ Õ¼Î»
    --[3001] = {},

    --´ó¸»ÎÌ Ìì½¾ÁîÏû·ÑÈÎÎñ Õ¼Î»
    --[3101] = {},

    --»îÔ¾¶È»ı·ÖÁì½± Õ¼Î»
    --[10001]= {},
}

--ÈÎÎñ×éÁĞ±í,ÓÃÓÚÉú³ÉÈÎÎñ¶Ô»°
T_CK_TASK_GROUP_LIST = {
    --name, {type,desc}, {sub_list_group}
    [1] = {
        [1] = "NhiÖm vô hµng ngµy",
        [2] = { 1, "H»ng ngµy nhËn ngÉu nhiªn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!" },
        [3] = {
            -- [n] = {
            -- 	[1]= "TaskTypeName",
            -- 	[2]= nRandomTaskCount,
            -- 	[3]= {
            -- 		{{nTaskIndex1}, random1},
            -- 		{{nTaskIndex2}, random2},
            -- 		{{nTaskIndex3,nTaskIndex4,nTaskIndex5,...}, random3},--get 1 from {n}
            -- 	},
            -- 	[4]= bPass, --: 0,1, OldPlayer's TaskCount Reduce 1
            -- },

            [1] = {
                [1] = "NhiÖm vô ThÕ Lùc Ba Phe",
                [2] = 2,
                [3] = {
                    { { 1101 }, 4000 }, --ÔËïÚ
                    { { 1102 }, 3200 }, --¶áïÚ
                    { { 1103 }, 400 }, --ÊÕ¼¯ÓñÆÇ
                    { { 1104 }, 400 }, --ÍµÈ¡ÓñÆÇ
                    { { 1105 }, 400 }, --Î÷Óò´«µÀ
                    { { 1106 }, 400 }, --ÊÆÁ¦boss
                    { { 1107 }, 400 }, --ÉÍ½ğÁÔÈË
                    { { 1108 }, 400 }, --ÍÚ±¦²ØÈÎÎñ
                },
                [4] = 0
            },

            [2] = {
                [1] = "NhiÖm vô phã b¶n",
                [2] = 1,
                [3] = {
                    { { 1201 }, 2000 }, --Íò½£Ú£
                    { { 1202 }, 2000 }, --Íò½£Ú£
                    { { 1203 }, 3000 }, --µØĞş¹¬
                    { { 1204 }, 3000 }, --Ì«Ò»Ëş
                },
                [4] = 0,
            },

            [3] = {
                [1] = "NhiÖm vô PVP",
                [2] = 5,
                [3] = {
                    { { 1301 }, 1500 }, --ÖÖÒ»¿ÅĞ¡°ãÈôÊ÷
                    { { 1302 }, 1500 }, --ÖÖÒ»¿ÅËÄÁéÊ÷
                    { { 1303 }, 1500 }, --ÖÖÒ»¿ÅÖÖ×ÓÊ÷
                    { { 1309 }, 500 }, --ÖÖÒ»¿Å´ó°ãÈôÊ÷
                    { { 1304 }, 1000 }, --Èı·½ÊÆÁ¦PK
                    { { 1305, 1306, 1307, 1310 }, 1000 }, --´åÂäÕ½ÒÛ ²İ¹È³¡Õ½ÒÛ ÅÚÌ¨Õù¶áÕ½ ÑãÃÅÁÒ»ğ
                    { { 1308 }, 1000 }, --Ê¹ÓÃ50¸öÊ¤Àû±ŞÅÚ
                    { { 1311 }, 2000 }, --ËÎÁÉ×ÊÔ´Õ½
                },
                [4] = 1,
            },

            [4] = {
                [1] = "§¨ng nhËp mçi ngµy",
                [2] = 1,
                [3] = {
                    { { 1401 }, 1000 },
                },
                [4] = 0,
            },
        },
    },
    [2] = {
        [1] = "NhiÖm vô tr­ëng thµnh",
        [2] = { 2, "Trong thêi gian ho¹t ®éng chØ hoµn thµnh 1 lÇn, nhËn ®­îc nhiÒu EXP vµ ®é n¨ng ®éng!" },
        [3] = {
            [1] = { "NhiÖm vô bang héi", 0, { 2101, 2102, 2103, 2104 }, 0 }, --ËÙÕ½ËÙ¾ö-°ï»áÈÎÎñ
            [2] = { "NhiÖm vô h­íng dÉn", 0, { 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216 }, 0 }, --ËÙÕ½ËÙ¾ö-Ö¸ÒıÈÎÎñ
        },
    },
}

function ck_task_daily_clear()
    --Ã¿ÈÕÇåÀí
    --°ÙÕ½²»´ùÈÎÎñ±äÁ¿ÇåÀí
    local t = T_CK_TASK_GROUP_LIST[1][3]
    for _, t1 in t do
        for _, t2 in t1[3] do
            if type(t2[1]) == "table" then
                for _, task_index in t2[1] do
                    _ck_task_clear(task_index)
                end
            else
                _ck_task_clear(t2[1])
            end
        end
    end
end

function _ck_task_clear(task_index)
    local tBitSet = _ck_get_task_bitset(task_index)
    local nGroupTaskIndex = tBitSet[1]
    local nBitGet = tBitSet[2]
    local nBitFinish = tBitSet[3]
    local nBitAward = tBitSet[4]
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        print("ck_task_daily_clear", task_index, nGroupTaskIndex, nBitGet, nBitFinish, nBitAward)
    end
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
end

--Íâ²¿µ÷ÓÃ ÉèÖÃÄ³Ò»¸öÈÎÎñÎªÍê³É×´Ì¬
function ck_global_set_task_finish(nTaskIndex)
    --gf_TeamOperateEX(function()
    local t = _ck_get_task_cfg(nTaskIndex)
    if not t then
        return
    end
    if ck_IsOpen() ~= 1 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("ck_global_set_task_finish not open", nTaskIndex)
        end
        return 0;
    end
    if ck_GetTitleType() == 0 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("ck_global_set_task_finish title error", nTaskIndex)
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("ck_global_set_task_finish not enable", nTaskIndex)
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("ck_global_set_task_finish not get", nTaskIndex)
        end
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBitFinish = tBitSet[3]
    local szTaskName = t[2]
    if type(nBitFinish) == "number" and nBitFinish > 0 then
        if CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBitFinish) ~= 1 then
            --ck_BZBD_SetType(14, 15, 16);
            CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 1);
            Msg2Player(format("B¹n ®· hoµn thµnh nhiÖm vô Code Chu T­íc [%s]", szTaskName));
        end
    else
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("ck_global_set_task_finish bit error", nTaskIndex, nGroupTaskIndex, nBitFinish, szTaskName)
        end
        --error(format("CDKey: no need to set finish of task %d", %nTaskIndex))
    end
    --end);
end

function ck_task_group_talk1(nMainIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    local t = T_CK_TASK_GROUP_LIST[nMainIndex]
    local tSay = {}
    local szTitle = format("<color=gold>%s<color>%s, %s", t[1], "", t[2][2])
    for i, tTaskGroup in T_CK_TASK_GROUP_LIST[nMainIndex][3] do
        tinsert(tSay, format("%s/#ck_task_group_talk2(%d, %d)", tTaskGroup[1], nMainIndex, i))
    end
    tinsert(tSay, format("\n%s/nothing", "T¹i h¹ chØ xem qua th«i"))
    Say(CK_NPC_NAME .. szTitle, getn(tSay), tSay)
end

function ck_get_random_task()
    local bHideMsg = 1
    if ck_CheckCondition(bHideMsg) ~= 1 then
        return 0;
    end

    for k, tTaskInfo in T_CK_TASK_GROUP_LIST[1][3] do
        local nRandCnt = tTaskInfo[2]
        local tTaskList = tTaskInfo[3]
        local bPass = tTaskInfo[4] or 0
        if nRandCnt > 0 and tTaskList then
            --³¢ÊÔ½ÓÈ¡Ëæ»úÈÎÎñ
            _ck_rand_task_list(tTaskList, nRandCnt, bPass)
        end
    end
end

function ck_task_group_talk2(nMainIndex, nSubIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    local t = T_CK_TASK_GROUP_LIST[nMainIndex]
    local tt = t[3][nSubIndex]
    local nRandCnt = tt[2]
    local tTaskList = tt[3]
    local bPass = tt[4] or 0
    if nRandCnt > 0 then
        --Ã»ÓĞÁìÈ¡ÈÎÎñµÄ»°Ëæ»úÉú³É
        _ck_rand_task_list(tTaskList, nRandCnt, bPass)
    end

    local tSay = {}
    local szTitle = format("<color=gold>%s<color>%s", t[1], tt[1])
    for _, TaskInfo in tTaskList do
        local nTaskIndex = 0
        if type(TaskInfo) == "table" then
            if type(TaskInfo[1]) == "table" then
                for _, _nTaskIndex in TaskInfo[1] do
                    if _ck_check_task_getflag(_nTaskIndex) == 1 then
                        local t = _ck_get_task_cfg(_nTaskIndex)
                        tinsert(tSay, format("%s(%s)/#ck_task_talk(%d)", t[2], _ck_get_task_status(_nTaskIndex), _nTaskIndex))
                    end
                end
            else
                nTaskIndex = TaskInfo[1]
            end
        else
            nTaskIndex = TaskInfo
        end

        if nTaskIndex and nTaskIndex ~= 0 then
            if _ck_check_task_getflag(nTaskIndex) == 1 then
                local t = _ck_get_task_cfg(nTaskIndex)
                tinsert(tSay, format("%s(%s)/#ck_task_talk(%d)", t[2], _ck_get_task_status(nTaskIndex), nTaskIndex))
            end
        end
    end
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        tinsert(tSay, format("%s/ck_DailyReset", "dailyclear"))
    end
    tinsert(tSay, format("%s/nothing", "T¹i h¹ chØ xem qua th«i"))
    Say(CK_NPC_NAME .. szTitle, getn(tSay), tSay)
end

--ÈÎÎñ¶Ô»°
function ck_task_talk(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    local tSay = {}
    tinsert(tSay, format("\n%s/#_ck_task_award(%d)", "Hoµn thµnh nhiÖm vô", nTaskIndex))
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        tinsert(tSay, format("\n%s/#ck_global_set_task_finish(%d)", "debugfinish", nTaskIndex))
    end
    tinsert(tSay, format("\n%s/nothing", "T¹i h¹ chØ xem qua th«i"))
    local szStatus = _ck_get_task_status(nTaskIndex)
    local Msg = format("Tªn nhiÖm vô: <color=gold>%s(%s)<color>\n§iÒu kiÖn:\n  %s\nH­íng dÉn:\n  %s\nPhÇn th­ëng:\n  EXP: %d, ®é n¨ng ®éng: %d",
            t[2], szStatus, t[3][1], t[3][2], t[4][1], t[4][2])
    Say(CK_NPC_NAME .. Msg, getn(tSay), tSay)
end

function _ck_get_task_bitset(nTaskIndex)
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[5]
end

--»ñÈ¡Ëæ»úÈÎÎñ
function _ck_rand_task_list(tTaskList, nCount, bPass)
    if nCount <= 0 then
        return
    end
    local nPass = 0
    local nMaxPass = 0
    local nGet = 0
    if bPass and bPass == 1 then
        if ck_GetTitleType() == 3 then
            --»îÔ¾ÕßÉÙÒ»¸öÈÎÎñ
            nMaxPass = 1
        end
    end

    for i = 1, getn(tTaskList) do
        --ÏÈ¼ì²éÓĞÃ»ÓĞÈÎÎñ
        local nTaskIndex = tTaskList[i][1]
        if type(nTaskIndex) == "table" then
            for j = 1, getn(nTaskIndex) do
                if _ck_check_task_getflag(nTaskIndex[j]) == 1 then
                    --ÒÑ¾­ÓĞÈÎÎñ¾Í²»ÓÃËæ»úÁË
                    return
                end
            end
        else
            if _ck_check_task_getflag(nTaskIndex) == 1 then
                --ÒÑ¾­ÓĞÈÎÎñ¾Í²»ÓÃËæ»úÁË
                return
            end
        end
    end

    for i = 1, getn(tTaskList) do
        --ÓÅÏÈ½ÓÈ¡ÒÑËæ»ú¹ıµÄÈÎÎñ
        local nTaskIndex = tTaskList[i][1]
        if type(nTaskIndex) == "table" then
            for j = 1, getn(nTaskIndex) do
                if _ck_check_task_enable(nTaskIndex[j]) == 2 then
                    if nPass < nMaxPass then
                        nPass = nPass + 1
                    else
                        _ck_set_task_getflag(nTaskIndex[j])
                        nGet = nGet + 1
                    end
                end
            end
        else
            if _ck_check_task_enable(nTaskIndex) == 2 then
                if nPass < nMaxPass then
                    nPass = nPass + 1
                else
                    _ck_set_task_getflag(nTaskIndex)
                    nGet = nGet + 1
                end
            end
        end
    end

    if nGet > 0 then
        return
    end

    local nRandCount = min(nCount, getn(tTaskList))
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        print("_ck_rand_task_list", nCount, nRandCount)
    end

    local tTempTaskList = new(tTaskList)
    for i = 1, nRandCount do
        local nIdx = gf_RandomSelected(tTempTaskList, 2)
        local nTaskIndex = tTempTaskList[nIdx][1]

        if type(nTaskIndex) == "table" then
            local nIdx2 = random(1, getn(nTaskIndex))
            nTaskIndex = nTaskIndex[nIdx2]
        end

        _ck_set_task_enable(nTaskIndex, 2)

        if nPass < nMaxPass then
            nPass = nPass + 1
        else
            _ck_set_task_getflag(nTaskIndex)
        end

        tremove(tTempTaskList, nIdx)
    end
end

function _ck_task_award(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("condition false")
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print(format("disable task %d", nTaskIndex))
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        Talk(1, "", "Kh«ng cã nhiÖm vô nµy")
        return 0
    end
    if _ck_check_task_awardflag(nTaskIndex) == 1 then
        Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nhiÖm vô nµy råi!")
        return 0
    end
    if _ck_check_task_finishflag(nTaskIndex) ~= 1 then
        Talk(1, "", "NhiÖm vô nµy vÉn ch­a hoµn thµnh!")
        return 0
    end

    local t = _ck_get_task_cfg(nTaskIndex)
    if t[4][3] and (t[4][3]() ~= 1) then
        --¶îÍâµÄ½±Àøº¯Êı
        return 0
    end

    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBitAward = tBitSet[4]
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 1)
    local ext = t[4][4] or 0
    gf_ModifyExp(floor(t[4][1] * (1 + ext)))
    ck_AddCkScore(floor(t[4][2] * (1 + ext)))
    Msg2Player(format("Chóc mõng hoµn thµnh nhiÖm vô [%s]", t[2]))

    return 1
end

function _ck_get_task_cfg(nTaskIndex)
    local t = T_CK_TASK_LIST[nTaskIndex]
    if not t then
        error(format("CDKey: not find task %d", nTaskIndex))
    end
    return t
end

function _ck_get_task_status(nTaskIndex)
    local nType = 0
    local tType = { "Ch­a hoµn thµnh", "Ch­a nhËn", "Ch­a hoµn thµnh", "Cã thÓ giao", "§· hoµn thµnh" }
    if _ck_check_task_enable(nTaskIndex) == 0 then
        nType = 1
    elseif _ck_check_task_getflag(nTaskIndex) ~= 1 then
        nType = 2
    elseif _ck_check_task_finishflag(nTaskIndex) ~= 1 then
        nType = 3
    elseif _ck_check_task_awardflag(nTaskIndex) ~= 1 then
        nType = 4
    else
        nType = 5
    end
    return tType[nType] or ""
end

function _ck_set_task_getflag(nTaskIndex)
    --ÉèÖÃÒÑ½ÓÊÜ±êÖ¾
    if gDebug:is_debug() == 1 then
        --µ÷ÊÔÄ£Ê½
        print("_ck_set_task_getflag", nTaskIndex)
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBit, 1)
    end
    return 1 --²»ĞèÒª½ÓÊÜ
end

function _ck_check_task_getflag(nTaskIndex)
    --¼ì²éÊÇ·ñÒÑ½ÓÊÜÈÎÎñ
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        local nRet = CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
        if gDebug:is_debug() == 1 then
            --µ÷ÊÔÄ£Ê½
            print("task_getflag", nTaskIndex, nGroupTaskIndex, nBit, nRet)
        end
        return nRet
    end
    return 1 --²»ĞèÒª½ÓÊÜ
end
function _ck_check_task_enable(nTaskIndex)
    --¼ì²éÊÇ·ñ¿ªÆô
    if not nTaskIndex or not T_CK_TASK_LIST[nTaskIndex] then
        --ÈÎÎñÎ´¶¨Òå
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[1]
end
function _ck_check_task_finishflag(nTaskIndex)
    --¼ì²éÊÇ·ñÒÑÍê³É
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[3]
    if nBit then
        if type(nBit) == "function" then
            return nBit()
        elseif nBit and nBit > 0 then
            return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
        else
            return 1
        end
    end
    return 0
end
function _ck_check_task_awardflag(nTaskIndex)
    --¼ì²éÊÇ·ñÒÑÁìÈ¡½±Àø
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --Î´¿ªÆôÈÎÎñ²»ÄÜ½Ó
        return 1
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[4]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
    end
    error(format("CDKey: award bit error %d", nTaskIndex))
    return 1 --½±Àøbit±ØĞë´æÔÚ
end

function _ck_set_task_enable(nTaskIndex, nFlag)
    local t = _ck_get_task_cfg(nTaskIndex)
    t[1] = nFlag or 1
    --	if gDebug:is_debug() == 1 then--µ÷ÊÔÄ£Ê½
    --		print("set_task_enable", nTaskIndex)
    --	end
end
function _ck_auto_set_task_enable()
    for _, t1 in T_CK_TASK_GROUP_LIST do
        for _, t2 in t1[3] do
            for _, taskInfo in t2[3] do
                local nTaskIndex = 0
                if type(taskInfo) == "table" then
                    if type(taskInfo[1]) == "table" then
                        for _, v in taskInfo[1] do
                            _ck_set_task_enable(v)
                        end
                    else
                        nTaskIndex = taskInfo[1]
                    end
                else
                    nTaskIndex = taskInfo
                end
                if nTaskIndex and nTaskIndex ~= 0 then
                    _ck_set_task_enable(nTaskIndex)
                end
            end
        end
    end
    --_ck_set_task_enable(1303)
end
_ck_auto_set_task_enable();--auto execute to reset tasks enabled flags

--ÓÂÍùÖ±Ç°ÏµÁĞÈÎÎñ
----------------------------------------------------------------------------
------------------------- ÓÂÍùÖ±Ç°ÈÎÎñÏÖÔÚÒÑ¾­¹Ø±ÕÁË -------------------------
----------------------------------------------------------------------------
CK_TASK_FORWARD = {
    -- [1] = {"ÏûÃğ¶ñÀÇ", 226},
    -- [2] = {"ÏûÃğºüÀê", 227},
    -- [3] = {"ÏûÃğò¿»ğ³à½ÌÍ½", 228},
    -- [4] = {"ÏûÃğ²ÔÔ³", 229},
    -- [5] = {"ÏûÃğÃçÁëÍÁË¾", 230},
    -- [6] = {"ÏûÃğ²¨Ë¹Ñı¼§", 231},
    -- [7] = {"ÏûÃğÙÁ¹úµ¶¿Í", 232},
    -- [8] = {"ÏûÃğÅıÅÃÏÉ×Ó", 233},
}

--°ÙÕ½²»´ùÉ±¹ÖÈÎÎñ
CK_TASK_BZ_KILL = {
    [1] = { "Quay VÒ Chèn Cò", 234 },
    [2] = { "Quay VÒ Chèn Cò", 235 },
    [3] = { "Quay VÒ Chèn Cò", 236 },
    [4] = { "Quay VÒ Chèn Cò", 237 },
    [5] = { "Quay VÒ Chèn Cò", 238 },
}

--°ÙÕ½²»´ù¸±±¾ÈÎÎñ(×î¶à5¸ö)
CK_TASK_BZ_RAID = {
    [1] = "Tham gia 1 lÇn ¶i Th¸i H­",
    [2] = "Tham gia 1 lÇn ¶i L­¬ng S¬n ",
    [3] = "Tham gia 1 lÇn ¶i V¹n KiÕm Tròng",
    [4] = "Tham gia 1 lÇn ¶i §Şa HuyÒn Cung",
    [5] = "Tham gia 1 lÇn ¶i Th¸i NhÊt Th¸p",
}

--°ÙÕ½²»´ùPVPÈÎÎñ  ×î¶à7¸ö£¬²»Ö§³ÖĞÂÔö
CK_TASK_BZ_PVP = {
    -- [1] = "²ÎÓë3´Î1v1±ÈÈü",
    [1] = "Trång vµ thu ho¹ch 1 C©y B¸t Nh·-Nhá",
    [2] = "Trång vµ thu ho¹ch 1 C©y Tø Linh",
    [3] = "Trång vµ thu ho¹ch 1 C©y H¹t Gièng (më tõ tói h¹t gièng mua t¹i Ngù C¸c)",
    [4] = "§¸nh b¹i 1 ng­êi ch¬i phe ®Şch cña thÕ lùc kh¸c", --"²ÎÓëÒ»´ÎÌìÃÅÕóÕ½³¡",
    [5] = "Tham gia 1 lÇn Th«n lµng chiÕn",
    [6] = "Tham gia 1 lÇn Th¶o cèc chiÕn",
    [7] = "Tham gia 1 lÇn Ph¸o ®µi chiÕn",
    -- [7] = "²ÎÓëÒ»´ÎÑãÃÅÖ÷Õ½ÒÛ",
}

--ÊıÖµÀÛ¼ÆÈÎÎñ
CK_TASK_ZILON_ATRR = {
    [1] = { "Gia NhËp Giang Hå", { 0, 90, 1000, 1000, 10000 }, { 10000000, 100 } },
    [2] = { "TiÓu H÷u Së Thµnh", { 7, 90, 3000, 3000, 30000 }, { 20000000, 150 } },
    [3] = { "S¬ XuÊt Mao L­", { 8, 90, 6000, 6000, 40000 }, { 30000000, 200 } },
    [4] = { "TiÓu H÷u Danh Khİ", { 9, 90, 8000, 8000, 80000 }, { 40000000, 250 } },
    [5] = { "§¹i Lang §µo Sa", { 10, 90, 10000, 10000, 120000 }, { 50000000, 300 } },
    [6] = { "Tr¸ng Chİ L¨ng V©n", { 10, 91, 12000, 12000, 180000 }, { 60000000, 350 } },
    [7] = { "Uy Phong B¸t DiÖn", { 10, 92, 15000, 15000, 250000 }, { 100000000, 400 } },
    [8] = { "Khİ Tr¸ng Hµ S¬n", { 10, 96, 16000, 16000, 350000 }, { 200000000, 500 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --²¢ÇÒÀ©Õ¹¸ÃtableÊ±»áÓ°ÏìÁì½±×´Ì¬bitÎ»,±ØĞë¸üĞÂ¿Í»§¶Ë»î¶¯½çÃæÅäÖÃ±í
}
CK_TASK_ZILON_ATRR_BEGIN = 1
CK_TASK_INDEX_BEGIN_ZILON = 3001 --ÓÉcdk»î¶¯½çÃæÅäÖÃ±íÀïµÄTaskIndex¾ö¶¨

--Ìì½¾ÁîÏû·ÑÈÎÎñ
CK_TASK_IB_COST = {
    --[1] = {"²ÆÔ´¹ö¹ö", 5,   {12500000, 150}},
    --[2] = {"½ğÓñÂúÌÃ", 25,   {25000000, 300}},
    [1] = { "Phong Y Tóc Thùc", 5, { 50000000, 300 } },
    [2] = { "Uy Phong B¸t DiÖn", 25, { 100000000, 500 } },
    [3] = { "Gia C¶nh Kh¸ Gi¶", 50, { 150000000, 800 } },
    [4] = { "§¹i Phó §¹i Quı", 100, { 200000000, 1200 } },
    [5] = { "Tµi §¹i Khİ Th«", 200, { 300000000, 1400 } },
    [6] = { "Gia Tµi V¹n Qu¸n", 300, { 400000000, 1600 } },
    [7] = { "Phó Gi¸p Thiªn H¹", 400, { 500000000, 1800 } },
    [8] = { "Phó Kh¶ §Şch Quèc", 500, { 600000000, 2200 } },
    [9] = { "Phó LiÖt Thiªn Tö", 800, { 800000000, 2600 } },
    [10] = { "Hång Phóc Thiªn H¹", 1200, { 1000000000, 3000 } },
    [11] = { "Tµi Nguyªn Cuån Cuén", 1600, { 1500000000, 3500 } },
    [12] = { "Kim Ngäc M·n §­êng", 2000, { 2000000000, 4000 } },
    [13] = { "§¹i Doanh Gia", 3000, { 2000000000, 5000 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --²¢ÇÒÀ©Õ¹¸ÃtableÊ±»áÓ°ÏìÁì½±×´Ì¬bitÎ»,±ØĞë¸üĞÂ¿Í»§¶Ë»î¶¯½çÃæÅäÖÃ±í
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR) + 1
CK_TASK_INDEX_BEGIN_IB = 3101 --ÓÉcdk»î¶¯½çÃæÅäÖÃ±íÀïµÄTaskIndex¾ö¶¨

CK_JS_GUAIYI = {
    { "¸o Choµng Ngò Hµnh Kim ChÕ", { 0, 152, 4, 1, 4 } },
    { "¸o Choµng Ngò Hµnh Méc ChÕ", { 0, 152, 5, 1, 4 } },
    { "¸o Choµng Ngò Hµnh Thñy ChÕ", { 0, 152, 6, 1, 4 } },
    { "¸o Choµng Ngò Hµnh Háa ChÕ", { 0, 152, 7, 1, 4 } },
    { "¸o Choµng Ngò Hµnh Thæ ChÕ", { 0, 152, 8, 1, 4 } },
    { "¸o Choµng Ngò Hµnh ¢m ChÕ", { 0, 152, 9, 1, 4 } },
}
CK_JS_HUIZHANG = {
    { "Huy Ch­¬ng Kim ChÕ ngò hµnh", { 0, 153, 4, 1, 4 } },
    { "Huy Ch­¬ng Méc ChÕ ngò hµnh", { 0, 153, 5, 1, 4 } },
    { "Huy Ch­¬ng Thñy ChÕ ngò hµnh", { 0, 153, 6, 1, 4 } },
    { "Huy Ch­¬ng Háa ChÕ ngò hµnh", { 0, 153, 7, 1, 4 } },
    { "Huy Ch­¬ng Thæ ChÕ ngò hµnh", { 0, 153, 8, 1, 4 } },
    { "Huy Ch­¬ng ¢m ChÕ ngò hµnh", { 0, 153, 9, 1, 4 } },
}
CK_JS_SHOE = {
    { "ChiÕn Hµi Kim ChÕ ngò hµnh", { 0, 154, 4, 1, 4 } },
    { "ChiÕn Hµi Méc ChÕ ngò hµnh", { 0, 154, 5, 1, 4 } },
    { "ChiÕn Hµi Thñy ChÕ ngò hµnh", { 0, 154, 6, 1, 4 } },
    { "ChiÕn Hµi Háa ChÕ ngò hµnh", { 0, 154, 7, 1, 4 } },
    { "ChiÕn Hµi Thæ ChÕ ngò hµnh", { 0, 154, 8, 1, 4 } },
    { "ChiÕn Hµi ¢m ChÕ ngò hµnh", { 0, 154, 9, 1, 4 } },
}

CK_YAOYANG_JIEZI_1 = {
    { "DiÖu D­¬ng-¤ L©n B¶o Giíi", { 0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Tö Giao Ngäc Béi", { 0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-V©n Hæ LÖnh", { 0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Xİch T­íc Hoµn", { 0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Bİch Quy Liªn", { 0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_YAOYANG_JIEZI_2 = {
    { "DiÖu D­¬ng-¤ L©n B¶o Giíi", { 0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Tö Giao Ngäc Béi", { 0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-V©n Hæ LÖnh", { 0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Xİch T­íc Hoµn", { 0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "DiÖu D­¬ng-Bİch Quy Liªn", { 0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_4_LEVEL_YUNLING = {
    { "H-LiÖt Nham-Lv4", { 0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph¸ Kh«ng-Lv4", { 0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Tóy KiÕm-Lv4", { 0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-TËt Phong-Lv4", { 0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-TÊn Vò-Lv4", { 0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-¦ng TËp-Lv4", { 0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T©m-Lv4", { 0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-ThÇn Lùc-Lv4", { 0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng­ng ThÇn-Lv4", { 0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V« Gian-Lv4", { 0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V« Cùc-Lv4", { 0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cuång NhÉn-Lv4", { 0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L¨ng NhuÖ-Lv4", { 0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Viªn-Lv4", { 0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H¶i VËn-Lv4", { 0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H¶i T©m-Lv4", { 0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-LiÖt Nham-Lv4", { 0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph¸ Kh«ng-Lv4", { 0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Tóy KiÕm-Lv4", { 0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-TËt Phong-Lv4", { 0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-TÊn Vò-Lv4", { 0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu¸n Th¹ch-Lv4", { 0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Né Ng©m-Lv4", { 0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuyªn V©n-Lv4", { 0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-ThÇn Lùc-Lv4", { 0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng­ng ThÇn-Lv4", { 0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V« Gian-Lv4", { 0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V« Cùc-Lv4", { 0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cuång NhÉn-Lv4", { 0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L¨ng NhuÖ-Lv4", { 0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Viªn-Lv4", { 0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H¶i VËn-Lv4", { 0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H¶i T©m-Lv4", { 0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-LiÖt Nham-Lv4", { 0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph¸ Kh«ng-Lv4", { 0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Tóy KiÕm-Lv4", { 0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TËt Phong-Lv4", { 0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TÊn Vò-Lv4", { 0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« L­îng-Lv4", { 0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Môc Minh-Lv4", { 0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-ThÇn Lùc-Lv4", { 0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng­ng ThÇn-Lv4", { 0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Gian-Lv4", { 0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Cùc-Lv4", { 0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cuång NhÉn-Lv4", { 0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L¨ng NhuÖ-Lv4", { 0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Viªn-Lv4", { 0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i VËn-Lv4", { 0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i T©m-Lv4", { 0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_5_LEVEL_YUNLING = {
    { "H-LiÖt Nham-Lv5", { 0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph¸ Kh«ng-Lv5", { 0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Tóy KiÕm-Lv5", { 0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-TËt Phong-Lv5", { 0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-TÊn Vò-Lv5", { 0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-¦ng TËp-Lv5", { 0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T©m-Lv5", { 0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-ThÇn Lùc-Lv5", { 0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng­ng ThÇn-Lv5", { 0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V« Gian-Lv5", { 0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V« Cùc-Lv5", { 0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cuång NhÉn-Lv5", { 0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L¨ng NhuÖ-Lv5", { 0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Viªn-Lv5", { 0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H¶i VËn-Lv5", { 0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H¶i T©m-Lv5", { 0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-LiÖt Nham-Lv5", { 0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph¸ Kh«ng-Lv5", { 0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Tóy KiÕm-Lv5", { 0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-TËt Phong-Lv5", { 0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-TÊn Vò-Lv5", { 0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu¸n Th¹ch-Lv5", { 0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Né Ng©m-Lv5", { 0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuyªn V©n-Lv5", { 0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-ThÇn Lùc-Lv5", { 0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng­ng ThÇn-Lv5", { 0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V« Gian-Lv5", { 0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V« Cùc-Lv5", { 0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cuång NhÉn-Lv5", { 0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L¨ng NhuÖ-Lv5", { 0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Viªn-Lv5", { 0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H¶i VËn-Lv5", { 0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H¶i T©m-Lv5", { 0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-LiÖt Nham-Lv5", { 0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph¸ Kh«ng-Lv5", { 0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Tóy KiÕm-Lv5", { 0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TËt Phong-Lv5", { 0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TÊn Vò-Lv5", { 0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« L­îng-Lv5", { 0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Môc Minh-Lv5", { 0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-ThÇn Lùc-Lv5", { 0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng­ng ThÇn-Lv5", { 0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Gian-Lv5", { 0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Cùc-Lv5", { 0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cuång NhÉn-Lv5", { 0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L¨ng NhuÖ-Lv5", { 0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Viªn-Lv5", { 0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i VËn-Lv5", { 0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i T©m-Lv5", { 0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_6_LEVEL_YUNLING = {
    { "T-LiÖt Nham-Lv6", { 0, 150, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph¸ Kh«ng-Lv6", { 0, 150, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Tóy KiÕm-Lv6", { 0, 150, 87, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TËt Phong-Lv6", { 0, 150, 88, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-TÊn Vò-Lv6", { 0, 150, 89, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« L­îng-Lv6", { 0, 150, 90, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Môc Minh-Lv6", { 0, 150, 91, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-ThÇn Lùc-Lv6", { 0, 150, 92, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng­ng ThÇn-Lv6", { 0, 150, 93, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Gian-Lv6", { 0, 150, 94, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V« Cùc-Lv6", { 0, 150, 95, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cuång NhÉn-Lv6", { 0, 150, 96, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L¨ng NhuÖ-Lv6", { 0, 150, 97, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Viªn-Lv6", { 0, 150, 98, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i VËn-Lv6", { 0, 150, 99, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H¶i T©m-Lv6", { 0, 150, 100, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

function ck_GiveRandGem456()
    --Faction Cloth 9
    local VET_RandGem456 = {
        { 1, 20, "HuyÕtTrİchTh¹ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 20, "NguyÖtB¹chTh¹ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 20, "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 20, "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 4, "HuyÕtTrİchTh¹ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 4, "NguyÖtB¹chTh¹ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 4, "Hæ Ph¸ch Th¹ch CÊp 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 4, "H¾c DiÖu Th¹ch CÊp 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
        { 1, 1, "HuyÕtTrİchTh¹ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 1, "NguyÖtB¹chTh¹ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Hæ Ph¸ch Th¹ch CÊp 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H¾c DiÖu Th¹ch CÊp 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem456, 100, 1, "CDKEY", "CDKEY")
end

function _award_jingjie(_nLevel, nExp)
    local nLevel = MeridianGetLevel()
    if nLevel < _nLevel then
        for i = nLevel + 1, _nLevel do
            MeridianUpdateLevel()
        end
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    else
        gf_Modify("Exp", nExp);
    end
end

function award_wuzhe()
    return _award_jingjie(1, 10000000)
end
function award_wujiang()
    return _award_jingjie(2, 30000000)
end
function award_wuwang()
    return _award_jingjie(3, 40000000)
end
function award_wuzun()
    return _award_jingjie(4, 200000000)
end
function award_wuhuang()
    return _award_jingjie(5, 500000000)
end
function award_wusheng()
    return _award_jingjie(6, 1000000000)
end

function judge_translife_needLv(needLv)
    if gf_GetTransLevel() >= needLv then
        return 1
    end
    return 0
end

function judge_translife_needLv_and_fushendan(needLv, needfsd)
    -- ĞèÒªµÈ¼¶ºÍ¸´Éúµ¤
    local nNeed = GetItemCount(2, 1, 30814)
    if gf_GetTransLevel() < needLv then
        return 0
    end
    if nNeed < needfsd then
        return 0
    end
    return 1
end

function judge_translife_needLv_694()
    return judge_translife_needLv(694)
end    -- 7×ª ĞèÒª694¼¶
function judge_translife_needLv_692()
    return judge_translife_needLv(692)
end    -- 7×ª ĞèÒª694¼¶
function judge_translife_needLv_792()
    return judge_translife_needLv(792)
end
function judge_translife_needLv_796()
    return judge_translife_needLv(796)
end    -- 8×ª ĞèÒª796
function judge_translife_needLv_794()
    return judge_translife_needLv(794)
end    -- 8×ª ĞèÒª794
function judge_translife_needLv_793()
    return judge_translife_needLv(793)
end    -- 8×ª ĞèÒª793
function judge_translife_needLv_896()
    return judge_translife_needLv(896)
end    -- 9×ª ĞèÒª896
function judge_translife_needLv_894()
    return judge_translife_needLv(894)
end    -- 9×ª ĞèÒª894
function judge_translife_needLv_893()
    return judge_translife_needLv(893)
end    -- 9×ª ĞèÒª893
function judge_translife_needLv_892()
    return judge_translife_needLv(892)
end    -- 9×ª ĞèÒª892

function judge_translife_needLv_992()
    return judge_translife_needLv(992)
end    -- 10×ª ĞèÒª992

function judge_translife_needLv_997_fsd_5()
    return judge_translife_needLv_and_fushendan(997, 5)
end    -- 10×ª ĞèÒª997, 5¸ö¸´Éúµ¤
function judge_translife_needLv_995_fsd_3()
    return judge_translife_needLv_and_fushendan(995, 3)
end    -- 10×ª ĞèÒª995, 3¸ö¸´Éúµ¤
function judge_translife_needLv_994_fsd_3()
    return judge_translife_needLv_and_fushendan(994, 3)
end    -- 10×ª ĞèÒª994, 3¸ö¸´Éúµ¤
function judge_translife_needLv_994_fsd_2()
    return judge_translife_needLv_and_fushendan(994, 2)
end    -- 10×ª ĞèÒª994, 2¸ö¸´Éúµ¤
function judge_translife_needLv_994_fsd_1()
    return judge_translife_needLv_and_fushendan(994, 1)
end    -- 10×ª ĞèÒª994, 1¸ö¸´Éúµ¤

--function ck_award_reborn(nZhuan, nLv, nExp, nNeedZhuan, nNeedLv, nNeedFsd)
function ck_award_reborn(nZhuan, nLv, nExp)
    if not nZhuan or nZhuan < 0 then
        return
    end

    if gf_GetTransLevel() < nZhuan * 100 + nLv then
        KsgReborn:PlayerReborn(nZhuan, random(1, 4), nLv)
    else
        if nExp and nExp > 0 then
            gf_Modify("Exp", nExp);
        end
    end
end

function award_5zhuan90()
    if gf_GetPlayerRebornCount() < 5 then
        gf_SetTaskByte(1538, 1, 5);            --5×ª
        SetLevel(90, 1);                                  --90¼¶
        Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        gf_Modify("Exp", 20000000);
    end
end
function award_6zhuan90()
    ck_award_reborn(6, 90, 20000000)
end

function award_7zhuan73()
    if gf_GetTransLevel() >= 692 then
        if gf_GetPlayerRebornCount() < 7 then
            gf_SetTaskByte(1538, 1, 5);            --1×ª
            PlayerReborn(2, random(1, 4))
            SetLevel(73, 1);                        --73¼¶
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 500000000);
        end
    end
end

function award_7zhuan90()
    if gf_GetTransLevel() >= 692 then
        if gf_GetPlayerRebornCount() < 7 then
            gf_SetTaskByte(1538, 1, 5);            --1×ª
            PlayerReborn(2, random(1, 4))
            SetLevel(90, 1);                        --73¼¶
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 200000000);
        end
    end
end

function award_yunling4()
    local nRandIndex = random(getn(CK_4_LEVEL_YUNLING));
    gf_AddItemEx2(CK_4_LEVEL_YUNLING[nRandIndex][2], CK_4_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
function award_yunling5()
    local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
    gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end
T_ZHANKUANG = {
    tHead = {
        { "ChiÕn Cuång Thiªn §Şa M¹o", { 0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "ChiÕn Cuång Thiªn §Şa M¹o", { 0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "ChiÕn Cuång Thiªn T«n M¹o", { 0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "ChiÕn Cuång Thiªn T«n M¹o", { 0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "ChiÕn Cuång Phæ TÕ M¹o", { 0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "ChiÕn Cuång Phæ TÕ M¹o", { 0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", { 0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", { 0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", { 0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Qu¸n", { 0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "ChiÕn Cuång Bå T¸t Tr©m", { 0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "ChiÕn Cuång Bå T¸t Tr©m", { 0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "ChiÕn Cuång L­u Thñy Tr©m", { 0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "ChiÕn Cuång L­u Thñy Tr©m", { 0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "ChiÕn Cuång ThÇn Du C©n", { 0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "ChiÕn Cuång ThÇn Du C©n", { 0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "ChiÕn Cuång ThÇn Du C©n", { 0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "ChiÕn Cuång ThÇn Du C©n", { 0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "ChiÕn Cuång Tiªu Dao C©n", { 0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "ChiÕn Cuång Tiªu Dao C©n", { 0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "ChiÕn Cuång Tiªu Dao C©n", { 0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "ChiÕn Cuång Tiªu Dao C©n", { 0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "ChiÕn Cuång V« Vi Qu¸n", { 0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "ChiÕn Cuång V« Vi Qu¸n", { 0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "ChiÕn Cuång V« Vi Qu¸n", { 0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "ChiÕn Cuång V« Vi Qu¸n", { 0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", { 0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", { 0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", { 0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "ChiÕn Cuång Cµn Kh«n Qu¸n", { 0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", { 0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", { 0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", { 0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Kh«i", { 0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "ChiÕn Cuång Xuyªn V©n Kh«i", { 0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "ChiÕn Cuång Xuyªn V©n Kh«i", { 0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "ChiÕn Cuång Xuyªn V©n Kh«i", { 0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "ChiÕn Cuång Xuyªn V©n Kh«i", { 0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "ChiÕn Cuång Minh T«n C©n", { 0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "ChiÕn Cuång Minh T«n C©n", { 0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "ChiÕn Cuång Minh T«n C©n", { 0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "ChiÕn Cuång Minh T«n C©n", { 0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "ChiÕn Cuång Cæ T©m C©n", { 0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "ChiÕn Cuång Cæ T©m C©n", { 0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "ChiÕn Cuång Cæ T©m C©n", { 0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "ChiÕn Cuång Cæ T©m C©n", { 0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "ChiÕn Cuång Phong L«i Qu¸n", { 0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "ChiÕn Cuång Phong L«i Qu¸n", { 0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "ChiÕn Cuång §¹i §Şa C©n", { 0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "ChiÕn Cuång §¹i §Şa C©n", { 0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "ChiÕn Cuång §¹i §Şa C©n", { 0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "ChiÕn Cuång §¹i §Şa C©n", { 0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "ChiÕn Cuång Tóy Méng Qu¸n", { 0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "ChiÕn Cuång Tóy Méng Qu¸n", { 0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "ChiÕn Cuång Tóy Méng Qu¸n", { 0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "ChiÕn Cuång Tóy Méng Qu¸n", { 0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "ChiÕn Cuång Ma Vùc  Qu¸n", { 0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "ChiÕn Cuång Ma Vùc  Qu¸n", { 0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "ChiÕn Cuång Ma Vùc  Qu¸n", { 0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "ChiÕn Cuång Ma Vùc  Qu¸n", { 0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "ChiÕn Cuång Th¸nh N÷  Tr©m", { 0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "ChiÕn Cuång Th¸nh N÷  Tr©m", { 0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "ChiÕn Cuång Th¸nh Linh Tr©m", { 0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "ChiÕn Cuång Th¸nh Linh Tr©m", { 0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },

        -- ÈÎÏÀ
        { "ChiÕn Cuång Bµn V©n Qu¸n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "ChiÕn Cuång Bµn V©n Qu¸n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "ChiÕn Cuång Bµn V©n Qu¸n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "ChiÕn Cuång Bµn V©n Qu¸n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ½£×ğ
        { "ChiÕn Cuång Tr¶m Ma Qu¸n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "ChiÕn Cuång Tr¶m Ma Qu¸n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "ChiÕn Cuång Tr¶m Ma Qu¸n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "ChiÕn Cuång Tr¶m Ma Qu¸n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tCloth = {
        { "ChiÕn Cuång Thiªn §Şa Bµo", { 0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "ChiÕn Cuång Thiªn §Şa Bµo", { 0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "ChiÕn Cuång Thiªn T«n Bµo", { 0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "ChiÕn Cuång Thiªn T«n Bµo", { 0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "ChiÕn Cuång Phæ TÕ Bµo", { 0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "ChiÕn Cuång Phæ TÕ Bµo", { 0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "ChiÕn Cuång TuyÖt MÖnh Y", { 0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Y", { 0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Y", { 0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Y", { 0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "ChiÕn Cuång Bå T¸t Y", { 0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "ChiÕn Cuång Bå T¸t Y", { 0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "ChiÕn Cuång L­u ThñyY", { 0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "ChiÕn Cuång L­u ThñyY", { 0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "ChiÕn Cuång ThÇn Du Y", { 0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "ChiÕn Cuång ThÇn Du Y", { 0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "ChiÕn Cuång ThÇn Du Y", { 0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "ChiÕn Cuång ThÇn Du Y", { 0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "ChiÕn Cuång Tiªu Dao Y", { 0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "ChiÕn Cuång Tiªu Dao Y", { 0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "ChiÕn Cuång Tiªu Dao Y", { 0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "ChiÕn Cuång Tiªu Dao Y", { 0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "ChiÕn Cuång V« Vi Bµo", { 0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "ChiÕn Cuång V« Vi Bµo", { 0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "ChiÕn Cuång V« Vi Bµo", { 0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "ChiÕn Cuång V« Vi Bµo", { 0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "ChiÕn Cuång Cµn Kh«n Bµo", { 0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "ChiÕn Cuång Cµn Kh«n Bµo", { 0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "ChiÕn Cuång Cµn Kh«n Bµo", { 0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "ChiÕn Cuång Cµn Kh«n Bµo", { 0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", { 0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", { 0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", { 0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Gi¸p", { 0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", { 0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", { 0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", { 0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "ChiÕn Cuång Xuyªn V©n Gi¸p", { 0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "ChiÕn Cuång Minh T«n Y", { 0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "ChiÕn Cuång Minh T«n Y", { 0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "ChiÕn Cuång Minh T«n Y", { 0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "ChiÕn Cuång Minh T«n Y", { 0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "ChiÕn Cuång Cæ T©m Y", { 0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "ChiÕn Cuång Cæ T©m Y", { 0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "ChiÕn Cuång Cæ T©m Y", { 0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "ChiÕn Cuång Cæ T©m Y", { 0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "ChiÕn Cuång Phong L«i Bµo", { 0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "ChiÕn Cuång Phong L«i Bµo", { 0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "ChiÕn Cuång §¹i §Şa Y", { 0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "ChiÕn Cuång §¹i §Şa Y", { 0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "ChiÕn Cuång §¹i §Şa Y", { 0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "ChiÕn Cuång §¹i §Şa Y", { 0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "ChiÕn Cuång Tóy Méng Bµo", { 0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "ChiÕn Cuång Tóy Méng Bµo", { 0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "ChiÕn Cuång Tóy Méng Bµo", { 0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "ChiÕn Cuång Tóy Méng Bµo", { 0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "ChiÕn Cuång Ma Vùc  Bµo", { 0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "ChiÕn Cuång Ma Vùc  Bµo", { 0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "ChiÕn Cuång Ma Vùc  Bµo", { 0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "ChiÕn Cuång Ma Vùc  Bµo", { 0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "ChiÕn Cuång Th¸nh N÷  Y", { 0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "ChiÕn Cuång Th¸nh N÷  Y", { 0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "ChiÕn Cuång Th¸nh Linh Y", { 0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "ChiÕn Cuång Th¸nh Linh Y", { 0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- ÈÎÏÀ
        { "ChiÕn Cuång Bµn V©n Bµo", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "ChiÕn Cuång Bµn V©n Bµo", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "ChiÕn Cuång Bµn V©n Bµo", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "ChiÕn Cuång Bµn V©n Bµo", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ½£×ğ
        { "ChiÕn Cuång Tr¶m Ma Bµo", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "ChiÕn Cuång Tr¶m Ma Bµo", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "ChiÕn Cuång Tr¶m Ma Bµo", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "ChiÕn Cuång Tr¶m Ma Bµo", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tShoe = {
        { "ChiÕn Cuång Thiªn §Şa Trang", { 0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "ChiÕn Cuång Thiªn §Şa Trang", { 0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "ChiÕn Cuång Thiªn T«n Trang", { 0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "ChiÕn Cuång Thiªn T«n Trang", { 0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "ChiÕn Cuång Phæ TÕ Trang", { 0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "ChiÕn Cuång Phæ TÕ Trang", { 0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "ChiÕn Cuång TuyÖt MÖnh Trang", { 0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Trang", { 0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Trang", { 0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "ChiÕn Cuång TuyÖt MÖnh Trang", { 0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "ChiÕn Cuång Bå T¸t Khè", { 0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "ChiÕn Cuång Bå T¸t Khè", { 0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "ChiÕn Cuång L­u ThñyKhè", { 0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "ChiÕn Cuång L­u ThñyKhè", { 0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "ChiÕn Cuång ThÇn Du Trang", { 0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "ChiÕn Cuång ThÇn Du Trang", { 0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "ChiÕn Cuång ThÇn Du Trang", { 0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "ChiÕn Cuång ThÇn Du Trang", { 0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "ChiÕn Cuång Tiªu Dao Trang", { 0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "ChiÕn Cuång Tiªu Dao Trang", { 0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "ChiÕn Cuång Tiªu Dao Trang", { 0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "ChiÕn Cuång Tiªu Dao Trang", { 0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "ChiÕn Cuång V« Vi Trang", { 0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "ChiÕn Cuång V« Vi Trang", { 0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "ChiÕn Cuång V« Vi Trang", { 0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "ChiÕn Cuång V« Vi Trang", { 0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "ChiÕn Cuång Cµn Kh«n Trang", { 0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "ChiÕn Cuång Cµn Kh«n Trang", { 0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "ChiÕn Cuång Cµn Kh«n Trang", { 0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "ChiÕn Cuång Cµn Kh«n Trang", { 0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "ChiÕn Cuång Thiªn Tinh  Trang", { 0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Trang", { 0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Trang", { 0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "ChiÕn Cuång Thiªn Tinh  Trang", { 0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "ChiÕn Cuång Xuyªn V©n Trang", { 0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "ChiÕn Cuång Xuyªn V©n Trang", { 0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "ChiÕn Cuång Xuyªn V©n Trang", { 0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "ChiÕn Cuång Xuyªn V©n Trang", { 0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "ChiÕn Cuång Minh T«n Trang", { 0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "ChiÕn Cuång Minh T«n Trang", { 0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "ChiÕn Cuång Minh T«n Trang", { 0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "ChiÕn Cuång Minh T«n Trang", { 0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "ChiÕn Cuång Cæ T©m Trang", { 0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "ChiÕn Cuång Cæ T©m Trang", { 0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "ChiÕn Cuång Cæ T©m Trang", { 0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "ChiÕn Cuång Cæ T©m Trang", { 0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "ChiÕn Cuång Phong L«i Trang", { 0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "ChiÕn Cuång Phong L«i Trang", { 0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "ChiÕn Cuång §¹i §Şa Trang", { 0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "ChiÕn Cuång §¹i §Şa Trang", { 0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "ChiÕn Cuång §¹i §Şa Trang", { 0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "ChiÕn Cuång §¹i §Şa Trang", { 0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "ChiÕn Cuång Tóy Méng Trang", { 0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "ChiÕn Cuång Tóy Méng Trang", { 0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "ChiÕn Cuång Tóy Méng Trang", { 0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "ChiÕn Cuång Tóy Méng Trang", { 0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "ChiÕn Cuång Ma Vùc  Trang", { 0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "ChiÕn Cuång Ma Vùc  Trang", { 0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "ChiÕn Cuång Ma Vùc  Trang", { 0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "ChiÕn Cuång Ma Vùc  Trang", { 0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "ChiÕn Cuång Th¸nh N÷  Khè", { 0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "ChiÕn Cuång Th¸nh N÷  Khè", { 0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "ChiÕn Cuång Th¸nh Linh Khè", { 0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "ChiÕn Cuång Th¸nh Linh Khè", { 0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- ÈÎÏÀ
        { "ChiÕn Cuång Bµn V©n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "ChiÕn Cuång Bµn V©n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "ChiÕn Cuång Bµn V©n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "ChiÕn Cuång Bµn V©n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ½£×ğ
        { "ChiÕn Cuång Tr¶m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "ChiÕn Cuång Tr¶m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "ChiÕn Cuång Tr¶m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "ChiÕn Cuång Tr¶m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tWeapon = {
        { "ChiÕn Cuång B¨ng Thiªn §ao", { 0, 3, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "ChiÕn Cuång B¨ng Thiªn §ao", { 0, 3, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "ChiÕn Cuång ThiÒn §Şnh Tr­îng", { 0, 8, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "ChiÕn Cuång ThiÒn §Şnh Tr­îng", { 0, 8, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "ChiÕn Cuång Th¸nh ChiÕn Thñ", { 0, 0, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "ChiÕn Cuång Th¸nh ChiÕn Thñ", { 0, 0, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "ChiÕn Cuång §o¹t Hån Ch©m", { 0, 1, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "ChiÕn Cuång §o¹t Hån Ch©m", { 0, 1, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "ChiÕn Cuång §o¹t Hån Ch©m", { 0, 1, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "ChiÕn Cuång §o¹t Hån Ch©m", { 0, 1, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "ChiÕn Cuång PhËt Quang KiÕm", { 0, 2, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "ChiÕn Cuång PhËt Quang KiÕm", { 0, 2, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "ChiÕn Cuång Hé Bang CÇm", { 0, 10, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "ChiÕn Cuång Hé Bang CÇm", { 0, 10, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "ChiÕn Cuång Trõng ¸c Thñ", { 0, 0, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "ChiÕn Cuång Trõng ¸c Thñ", { 0, 0, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "ChiÕn Cuång Trõng ¸c Thñ", { 0, 0, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "ChiÕn Cuång Trõng ¸c Thñ", { 0, 0, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "ChiÕn Cuång V« Cùc C«n", { 0, 5, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "ChiÕn Cuång V« Cùc C«n", { 0, 5, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "ChiÕn Cuång V« Cùc C«n", { 0, 5, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "ChiÕn Cuång V« Cùc C«n", { 0, 5, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "ChiÕn Cuång Khu Ma KiÕm", { 0, 2, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "ChiÕn Cuång Khu Ma KiÕm", { 0, 2, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "ChiÕn Cuång Khu Ma KiÕm", { 0, 2, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "ChiÕn Cuång Khu Ma KiÕm", { 0, 2, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "ChiÕn Cuång Th­¬ng Khung Bót", { 0, 9, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "ChiÕn Cuång Th­¬ng Khung Bót", { 0, 9, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "ChiÕn Cuång Th­¬ng Khung Bót", { 0, 9, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "ChiÕn Cuång Th­¬ng Khung Bót", { 0, 9, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "ChiÕn Cuång ThÇn Kİch Th­¬ng", { 0, 6, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "ChiÕn Cuång ThÇn Kİch Th­¬ng", { 0, 6, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "ChiÕn Cuång ThÇn Kİch Th­¬ng", { 0, 6, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "ChiÕn Cuång ThÇn Kİch Th­¬ng", { 0, 6, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "ChiÕn Cuång Xung Thiªn Cung", { 0, 4, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "ChiÕn Cuång Xung Thiªn Cung", { 0, 4, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "ChiÕn Cuång Xung Thiªn Cung", { 0, 4, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "ChiÕn Cuång Xung Thiªn Cung", { 0, 4, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "ChiÕn Cuång LuyÖn Ngôc §ao", { 0, 7, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "ChiÕn Cuång LuyÖn Ngôc §ao", { 0, 7, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "ChiÕn Cuång LuyÖn Ngôc §ao", { 0, 7, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "ChiÕn Cuång LuyÖn Ngôc §ao", { 0, 7, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", { 0, 11, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", { 0, 11, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", { 0, 11, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "ChiÕn Cuång NhiÕp Hån Tr¶o", { 0, 11, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "ChiÕn Cuång Thiªn Ph¹t KiÕm", { 0, 2, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "ChiÕn Cuång Thiªn Ph¹t KiÕm", { 0, 2, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "ChiÕn Cuång Chóc Dung §ao", { 0, 3, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "ChiÕn Cuång Chóc Dung §ao", { 0, 3, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "ChiÕn Cuång Chóc Dung §ao", { 0, 3, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "ChiÕn Cuång Chóc Dung §ao", { 0, 3, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "ChiÕn Cuång Tö MÖnh Bót", { 0, 9, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "ChiÕn Cuång Tö MÖnh Bót", { 0, 9, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "ChiÕn Cuång Tö MÖnh Bót", { 0, 9, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "ChiÕn Cuång Tö MÖnh Bót", { 0, 9, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "ChiÕn Cuång Truy Hån Tr¶o", { 0, 11, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "ChiÕn Cuång Truy Hån Tr¶o", { 0, 11, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "ChiÕn Cuång Truy Hån Tr¶o", { 0, 11, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "ChiÕn Cuång Truy Hån Tr¶o", { 0, 11, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "ChiÕn Cuång Phong Linh PhiÕn", { 0, 13, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "ChiÕn Cuång Phong Linh PhiÕn", { 0, 13, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "ChiÕn Cuång Kh«ng Minh §Şch", { 0, 12, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "ChiÕn Cuång Kh«ng Minh §Şch", { 0, 12, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        { "ChiÕn Cuång Bµn V©n Chñy", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "ChiÕn Cuång Bµn V©n Chñy", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "ChiÕn Cuång Bµn V©n Chñy", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "ChiÕn Cuång Bµn V©n Chñy", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        { "ChiÕn Cuång Tr¶m Ma KiÕm", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "ChiÕn Cuång Tr¶m Ma KiÕm", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "ChiÕn Cuång Tr¶m Ma KiÕm", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "ChiÕn Cuång Tr¶m Ma KiÕm", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
}
function _award_equip(tEquip)
    local nBodyType = GetBody()
    local nRoute = GetPlayerRoute()
    for i = 1, getn(tEquip) do
        local t = tEquip[i]
        if nBodyType == t[3] and nRoute == t[4] then
            gf_AddItemEx2(t[2], t[1], "CDKEY", "CDKEY", 0, 1);
            return
        end
    end
end
function award_zhankuangku()
    return _award_equip(T_ZHANKUANG.tShoe)
end
function award_zhankuangyi()
    return _award_equip(T_ZHANKUANG.tCloth)
end
function award_zhankuangtou()
    return _award_equip(T_ZHANKUANG.tHead)
end
function award_zhankuangwuqi()
    return _award_equip(T_ZHANKUANG.tWeapon)
end
function award_fusheng2renwu()
    --Íê³É³èÎï¸´Éú2ÈÎÎñ£¬VNG¹¦ÄÜ£¿
    Vet_Complete_Revive_OnePartner_FirstStage();
    Vet_Complete_Revive_OnePartner_SecondStage();
end
function award_guayi()
    _award_3jiantao(152)
end
function award_huizhang()
    _award_3jiantao(153)
end
function award_xie()
    _award_3jiantao(154)
end
function _award_3jiantao(nD)
    local nRandP = random(26, 28)
    gf_AddItemEx2({ 0, nD, nRandP, 1, 4, -1, -1, -1, -1, -1, -1 }, GetItemName(0, nD, nRandP), "CDKEY", "CDKEY", 0, 1);
end

function award_gem345_real()
    --Faction Cloth 9
    local VET_RandGem345 = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv3", { 2, 22, 103, 1 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv3", { 2, 22, 203, 1 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 1 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 1 }, nil, nil, nil, nil },
        { 1, 24, "HuyÕtTrİchTh¹ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 24, "NguyÖtB¹chTh¹ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 24, "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 24, "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 1, "HuyÕtTrİchTh¹ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 1, "NguyÖtB¹chTh¹ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Hæ Ph¸ch Th¹ch CÊp 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H¾c DiÖu Th¹ch CÊp 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem345, 200, 1, "CDKEY", "CDKEY")
end

function award_gem345(nNum)
    for i = 1, nNum do
        award_gem345_real()
    end
end
function award_title()
    AddTitle(68, 4);
    SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
    Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "NhiÖm Vô §¹t Nh©n"))
end

function award_tong_title3()
    SendScript2VM("\\script\\isolate\\functions\\tong_title\\tong_title.lua", format("force_give_max_lv(%d)", 3))
    Msg2Player(format("NhËn ®­îc danh hiÖu [%s]", "Kim Lan"))
end

function award_random_gem1_1()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv1", { 2, 22, 101, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv1", { 2, 22, 201, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 1", { 2, 22, 301, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 1", { 2, 22, 401, 10, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem1_2()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv1", { 2, 22, 101, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv1", { 2, 22, 201, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 1", { 2, 22, 301, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 1", { 2, 22, 401, 20, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_1()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv2", { 2, 22, 102, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv2", { 2, 22, 202, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 2", { 2, 22, 302, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 2", { 2, 22, 402, 8, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_2()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv2", { 2, 22, 102, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv2", { 2, 22, 202, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 2", { 2, 22, 302, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 2", { 2, 22, 402, 12, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_4()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv3", { 2, 22, 103, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv3", { 2, 22, 203, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 4, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_5()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv3", { 2, 22, 103, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv3", { 2, 22, 203, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 5, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_7()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv3", { 2, 22, 103, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv3", { 2, 22, 203, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 7, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_9()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv3", { 2, 22, 103, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv3", { 2, 22, 203, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 9, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem4_3()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv4", { 2, 22, 104, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv4", { 2, 22, 204, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 3, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem6(nNum)
    for i = 1, nNum do
        award_random_gem6_1()
    end
end

function award_random_gem6_1()
    local VET_RandGem = {
        { 1, 25, "HuyÕtTrİchTh¹ch Lv6", { 2, 22, 106, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖtB¹chTh¹ch Lv6", { 2, 22, 206, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 6", { 2, 22, 306, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 6", { 2, 22, 406, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem7_1()
    local VET_RandGem = {
        { 1, 25, "HuyÕt Trİch Th¹ch cÊp 7", { 2, 22, 107, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖt B¹ch Th¹ch cÊp 7", { 2, 22, 207, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch cÊp 7", { 2, 22, 307, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch cÊp 7", { 2, 22, 407, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end
function award_random_gem7_2()
    local VET_RandGem = {
        { 1, 25, "HuyÕt Trİch Th¹ch cÊp 7", { 2, 22, 107, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "NguyÖt B¹ch Th¹ch cÊp 7", { 2, 22, 207, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "Hæ Ph¸ch Th¹ch cÊp 7", { 2, 22, 307, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "H¾c DiÖu Th¹ch cÊp 7", { 2, 22, 407, 2, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook5()
    local VET_RandGem = {
        { 1, 30, "İch Thä Diªn D­¬ng CÊp 5", { 2, 150, 68, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "C­êng Th©n B¸ ThÓ CÊp 5", { 2, 150, 69, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "HuyÒn Vò V« Song CÊp 5", { 2, 150, 71, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 5", { 2, 150, 78, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Khinh Linh TÊn TËt CÊp 5", { 2, 150, 80, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook6()
    local VET_RandGem = {
        { 1, 10, "Ng­ng ThÇn QuyÕt Lv2", { 2, 150, 103, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Kinh §µo QuyÕt Lv2", { 2, 150, 104, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Linh Quang ThiÓm Lv2", { 2, 150, 102, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "V« H×nh Chi Cæ Lv6", { 2, 150, 101, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Khinh Linh TÊn TËt Lv6", { 2, 150, 100, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_8zhuan10()
    if gf_GetTransLevel() >= 796 then
        if gf_GetPlayerRebornCount() < 8 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(3, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 1000000000);
        end
    end
end

function award_8zhuan73()
    if gf_GetTransLevel() >= 794 then
        if gf_GetPlayerRebornCount() < 8 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(3, random(1, 4))
            SetLevel(73, 1)
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 1000000000);
        end
    end
end

function award_8zhuan90()
    if judge_translife_needLv_792() ~= 1 then
        return
    end
    ck_award_reborn(8, 90, 500000000)
end

function award_9zhuan90()
    if judge_translife_needLv_892() ~= 1 then
        return
    end
    ck_award_reborn(9, 90, 500000000)
end

function award_10zhuan97()
    if judge_translife_needLv_992() ~= 1 then
        return
    end
    ck_award_reborn(10, 97, 2000000000)
end

function award_9zhuan73()
    if gf_GetTransLevel() >= 894 then
        if gf_GetPlayerRebornCount() < 9 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(4, random(1, 4))
            SetLevel(73, 1)
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 1000000000);
        end
    end
end

function award_10zhuan10_need997cost5fsd()
    if judge_translife_needLv_997_fsd_5() == 0 then
        Talk(1, "", format("    <color=gold>§¹t ®Õn CS %d Lv%d, tèn %d Phôc Sinh §¬n<color>", 9, 97, 5))
    end
    if gf_GetTransLevel() >= 997 and DelItem(2, 1, 30814, 5) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end
function award_10zhuan10_need995cost3fsd()
    if judge_translife_needLv_995_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>§¹t ®Õn CS %d Lv%d, tèn %d Phôc Sinh §¬n<color>", 9, 95, 3))
    end
    if gf_GetTransLevel() >= 995 and DelItem(2, 1, 30814, 3) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th¨ng cÊp chuyÓn sinh thµnh c«ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end

function award_10zhuan90_need994cost3fsd()
    if judge_translife_needLv_994_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>§¹t ®Õn CS %d Lv%d, tèn %d Phôc Sinh §¬n<color>", 9, 94, 3))
        return
    end
    if DelItem(2, 1, 30814, 3) == 1 then
        ck_award_reborn(10, 90, 2000000000)
    end
end

function award_10zhuan94_need994cost1fsd()
    if judge_translife_needLv_994_fsd_1() == 0 then
        Talk(1, "", format("    <color=gold>§¹t ®Õn CS %d Lv%d, tèn %d Phôc Sinh §¬n<color>", 9, 94, 1))
        return
    end
    if DelItem(2, 1, 30814, 1) == 1 then
        ck_award_reborn(10, 94, 2000000000)
    end
end

function judge_wxhxling_weapon()
    local nNeed = GetItemCount(2, 1, 1006)
    if nNeed < 2 then
        return 0
    end
    return 1
end
function award_wxhxling_weapon()
    if judge_wxhxling_weapon() ~= 1 then
        Talk(1, "", format("CÇn %d <color=red>Cöu Thiªn V« Cùc §¬n<color> ®Ó ®æi <color=gold>V« H¹ Hµo HiÖp LÖnh (Vò khİ)<color>!", 2))
        return
    end
    if DelItem(2, 1, 1006, 2) == 1 then
        gf_AddItemEx({ 2, 1, 30973, 1, 4 }, "V« H¹ Hµo HiÖp LÖnh (Vò khİ)");
    end
end

function award_random_4pet()
    local tPet = {
        { 16, 4500 },
        { 17, 4500 },
        { 18, 990 },
        { 19, 3 },
        { 20, 3 },
        { 21, 2 },
        { 22, 1 },
        { 23, 2 },
    }
    local nID = gf_GetRandItemByTable(tPet, 10000, 1)
    AddPet(tPet[nID][1]);
    Msg2Player(GetPetName(tPet[nID][1]));
end

function award_tongscore(nScore)
    SendScript2VM("\\script\\isolate\\functions\\tong_title\\head.lua", format("add_tong_gxd(%d)", nScore))
end

table_5Star_Jinshe = {
    "select", "Tù chän 1 mãn Kim Xµ Lv5",
    {
        { "item", "Huy ch­¬ng HiÖp Cèt", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy ch­¬ng Qñy Phï", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy ch­¬ng §»ng V©n", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "¸o kho¸c HiÖp Cèt", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "¸o kho¸c Qñy Phï", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "¸o kho¸c §»ng V©n", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "HiÖp Cèt Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Qñy Phï ChiÕn Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "§»ng V©n Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_5Star_Jinshe9 = {
    "select", "Tù chän 1 mãn Kim Xµ Lv5 (C­êng hãa +9)",
    {
        { "item", "Huy ch­¬ng HiÖp Cèt", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy ch­¬ng Qñy Phï", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy ch­¬ng §»ng V©n", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "¸o kho¸c HiÖp Cèt", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "¸o kho¸c Qñy Phï", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "¸o kho¸c §»ng V©n", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "HiÖp Cèt Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Qñy Phï ChiÕn Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "§»ng V©n Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_6Star_Jinshe = {
    "select", "Tù chän 1 mãn Kim Xµ Lv6",
    {
        { "item", "Hoan L¨ng Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "§»ng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Khëi Ph­îng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L¨ng Ch­¬ng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "§»ng Giao Ch­¬ng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Khëi Ph­îng Ch­¬ng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L¨ng Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "§»ng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Khëi Ph­îng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_6Star_Jinshe9 = {
    "select", "Tù chän 1 mãn Kim Xµ Lv6 (C­êng hãa +9)",
    {
        { "item", "Hoan L¨ng Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "§»ng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Khëi Ph­îng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L¨ng Ch­¬ng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "§»ng Giao Ch­¬ng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Khëi Ph­îng Ch­¬ng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L¨ng Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "§»ng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Khëi Ph­îng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_Select_ShaXing = {
    "select", "Tù Chän LÖnh Bµi Trang BŞ S¸t Tinh (§Çu, ?o, QuÇn)",
    {
        { "item", "S¸t Tinh LÖnh Bµi (§Çu)", { 2, 1, 31313, 1, 4 } },
        { "item", "S¸t Tinh LÖnh Bµi (¸o)", { 2, 1, 31314, 1, 4 } },
        { "item", "S¸t Tinh LÖnh Bµi (QuÇn)", { 2, 1, 31315, 1, 4 } },
    },
}

CK_TASK_INDEX_BEGIN_SCORE_AWARD = 10001
CK_SCROE_AWARD_TABLE = {
    [1] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 1000, 10000000, 160, 160, 1400, 0, 177 },
        { "item", "Ma Tinh", { 2, 1, 30497, 500, 4 } },
        { "func", format("ChuyÓn sinh %d cÊp %d", 7, 90), ck_award_reborn, { 7, 90, 20000000 } },
        { "func", "§¶ th«ng c¶nh giíi Vâ HiÒn", award_wuzhe },
        { "func", "Nãn chiÕn cuång+9", award_zhankuangtou },
    },
    [2] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 1700, 30000000, 280, 280, 2200, 0, 179 },
        { "func", "§¶ th«ng c¶nh giíi Vâ T­íng", award_wujiang },
        { "func", "¸o chiÕn cuång+9", award_zhankuangyi },
        { "func", "QuÇn chiÕn cuång+9", award_zhankuangku },
        { "item", "L¨ng Ba Vi Bé", { 0, 112, 78, 1, 4 } },
    },
    [3] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 2000, 40000000, 340, 340, 2600, 30000, 180 },
        { "func", "§¶ th«ng c¶nh giíi Vâ V­¬ng", award_wuwang },
        { "func", "Vò khİ chiÕn cuång+9", award_zhankuangwuqi },
    },
    [4] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 2400, 50000000, 400, 400, 3000, 0, 181 },
        { "item", "Tù Chän Bé Kim Xµ Lv4", { 2, 1, 31516, 1, 4 } },
    },
    [5] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 2800, 50000000, 460, 460, 3400, 30000, 182 },
        { "item", "V« H¹ Hµo HiÖp LÖnh (¸o)", { 2, 1, 30945, 1, 4 } },
        { "func", "B¶o Th¹ch cÊp 1*10", award_random_gem1_1 },
    },
    [6] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 3100, 50000000, 520, 520, 3800, 0, 183 },
        { "func", format("ChuyÓn sinh %d cÊp %d", 8, 90), ck_award_reborn, { 8, 90, 200000000 } },
        { "func", "§¸ quı cÊp 1*20", award_random_gem1_2 },
        { "func", "UÈn Linh CÊp 4", award_yunling4 },
    },
    [7] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 3500, 50000000, 580, 580, 4200, 0, 184 },
        { "func", "§¸ quı caaps2*8", award_random_gem2_1 },
        { "item", "Linh §å Giíi (tr¸i)", { 0, 102, 30221, 1, 4 } },
        { "item", "Linh §å Giíi (ph¶i)", { 0, 102, 30222, 1, 4 } },
        { "item", "V« H¹ Hµo HiÖp LÖnh (QuÇn)", { 2, 1, 30946, 1, 4 } },
    },
    [8] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 4000, 50000000, 580, 580, 4200, 0, 185 },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 100 } },
        { "item", "V« H¹ Hµo HiÖp LÖnh (Nãn)", { 2, 1, 30944, 1, 4 } },
    },
    [9] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 5000, 50000000, 580, 580, 4200, 0, 186 },
        { "func", "§¶ th«ng c¶nh giíi Vâ T«n", award_wuzun },
        -- {"func", "Õ½¿ñ¿ã+9", award_zhankuangku},
        { "func", "§¸ quı caaps2*12", award_random_gem2_2 },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 200 } },
    },
    [10] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 6000, 50000000, 580, 580, 4200, 0, 187 },
        { "item", "Tù Chän Bé Kim Xµ Lv5", { 2, 1, 31517, 1, 4 } },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 300 } },
        --{"exchange", format("%d×ª%d¼¶",8,90), format("    <color=gold>µÈ¼¶´ïµ½%d×ª%d¼¶<color>",7,92), judge_translife_needLv_792, award_8zhuan90,},

    },
    [11] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 7000, 50000000, 580, 580, 4200, 0, 188 },
        table_6Star_Jinshe9,
        { "item", "HiÖp NghÜa Chi Chøng", { 2, 1, 30912, 1000, 4 } },
    },
    [12] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 8500, 50000000, 580, 580, 4200, 0, 189 },
        { "func", "§¶ th«ng C¶nh Giíi Vâ Hoµng", award_wuhuang },
        { "item", "Èm HuyÕt y", { 0, 100, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "Danh hiÖu bang héi cÊp 3", award_tong_title3 },
    },
    [13] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 9500, 50000000, 580, 580, 4200, 0, 190 },
        { "item", "V« H¹ Hµo HiÖp LÖnh (Vò Khİ)", { 2, 1, 30973, 1, 4 } },
        { "item", "HiÖp NghÜa Chi Chøng", { 2, 1, 30912, 1000, 4 } },
        --{"item", "6¼¶ÔÌÁé¾«»ª", {2,1,30668,4, 4}},
    },
    [14] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 13000, 60000000, 580, 580, 4200, 0, 191 },
        { "exchange", format("ChuyÓn sinh %d cÊp %d", 9, 90), format("    <color=gold>§¹t ®Õn CS %d Lv%d<color>", 8, 92), judge_translife_needLv_892, award_9zhuan90, },
        { "func", "§¸ quı cÊp 3*5", award_random_gem3_5 },
        { "item", "Tİn VËt cÊp 5", { 0, 155, 5, 1, 4 } },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 300 } },
        --{"item", "6¼¶ÔÌÁé¾«»ª", {2,1,30668,6,4}},
        --{"item", "¸ß¼¶ÁéÊŞµ°", {2,1,30728,1,4}},
        --{"item", "ÎŞÏ¾ºÀÏÀÁî£¨ÎäÆ÷£©", {2,1,30973, 1, 4}},
    },
    [15] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 15000, 70000000, 580, 580, 4200, 0, 192 },
        table_6Star_Jinshe9,
        { "item", "Èm HuyÕt §Çu", { 0, 103, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "§¸ quı cÊp 3*7", award_random_gem3_7 },
        { "item", "§ång TÕ Chi NguyÖn", { 2, 1, 30913, 42, 4 } },
        --{"item", "6¼¶ÔÌÁé¾«»ª", {2,1,30668,8,4}},
    },
    [16] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 16000, 80000000, 0, 0, 0, 0, 193 },
        { "item", "Èm HuyÕt Trang", { 0, 101, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 400 } },
        { "func", "§¸ quı cÊp 3*9", award_random_gem3_9 },
        { "item", "ThiÕt tinh cÊp 4", { 2, 1, 30612, 10, 4 } },
    },
    [17] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 17000, 90000000, 0, 0, 0, 0, 194 },
        table_6Star_Jinshe9,
        { "item", "ThiÕt tinh cÊp 4", { 2, 1, 30612, 20, 4 } },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 500 } },
    },
    [18] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 18000, 0, 0, 0, 0, 0, 176 },
        { "item", "Tói Kh¾c B¶n Hoµn Mü (§Çu)", { 2, 1, 31518, 1, 4 } },
    },
    [19] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 19000, 0, 0, 0, 0, 0, 178 },
        { "item", "Tói Kh¾c B¶n Hoµn Mü (ƒo)", { 2, 1, 31519, 1, 4 } },
    },
    [20] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 20000, 100000000, 0, 0, 0, 0, 195 },
        table_Select_ShaXing,
        { "item", "HuyÕtTrİchTh¹ch Lv4", { 2, 22, 104, 1, 1 } },
        { "item", "NguyÖtB¹chTh¹ch Lv4", { 2, 22, 204, 1, 1 } },
        { "item", "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 1, 1 } },
        { "item", "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 1, 1 } },
        { "item", "ThiÕt tinh cÊp 4", { 2, 1, 30612, 30, 4 } },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 600 } },
    },
    [21] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 21000, 0, 0, 0, 0, 0, 526 },
        { "item", "Tói Kh¾c B¶n Hoµn Mü (QuÇn)", { 2, 1, 31520, 1, 4 } },
    },
    [22] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 22000, 150000000, 0, 0, 0, 0, 196 },
        { "exchange", format("ChuyÓn sinh %d cÊp %d", 10, 97), format("    <color=gold>§¹t ®Õn CS %d Lv%d<color>", 9, 92), judge_translife_needLv_992, award_10zhuan97, },
        --{"exchange", format("%d×ª%d¼¶",10,94), format("    <color=gold>µÈ¼¶´ïµ½%d×ª%d¼¶,²¢ÏûºÄ%d¸ö¸´Éúµ¤<color>",9,94,1), judge_translife_needLv_994_fsd_1, award_10zhuan94_need994cost1fsd, },
        { "item", "HuyÕtTrİchTh¹ch Lv4", { 2, 22, 104, 2, 1 } },
        { "item", "NguyÖtB¹chTh¹ch Lv4", { 2, 22, 204, 2, 1 } },
        { "item", "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 2, 1 } },
        { "item", "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 2, 1 } },
    },
    [23] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 23000, 0, 0, 0, 0, 0, 527 },
        { "item", "Tói Kh¾c B¶n Hoµn Mü (NhÉn)", { 2, 1, 31521, 1, 4 } },
    },
    [24] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 24000, 200000000, 0, 0, 0, 0, 197 },
        table_Select_ShaXing,
        { "item", "Håi Tiªn §¬n", { 2, 1, 30847, 20, 4 } },
        { "item", "HuyÕtTrİchTh¹ch Lv5", { 2, 22, 105, 1, 1 } },
        { "item", "NguyÖtB¹chTh¹ch Lv5", { 2, 22, 205, 1, 1 } },
        { "item", "Hæ Ph¸ch Th¹ch CÊp 5", { 2, 22, 305, 1, 1 } },
        { "item", "H¾c DiÖu Th¹ch CÊp 5", { 2, 22, 405, 1, 1 } },
        { "func", "Danh hiÖu NhiÖm Vô §¹t Nh©n", award_title },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 600 } },
    },
    [25] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 25000, 0, 0, 0, 0, 0, 528 },
        { "item", "Tói Kh¾c B¶n Hoµn Mü (Eo)", { 2, 1, 31522, 1, 4 } },
    },
    [26] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 25500, 0, 0, 0, 0, 0, 198 },
        { "item", "Linh Ph¸ch §¬n", { 2, 1, 31239, 2, 4 } },
        { "func", "S¸ch Kü N¨ng §ång Hµnh CÊp 6 (NgÉu nhiªn)", award_petbook6, { 1 } },
    },
    [27] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 26000, 250000000, 0, 0, 0, 0, 199 },
        { "func", "§iÓm cèng hiÕn bang", award_tongscore, { 600 } },
        --{"item", "³¬¼¶³èÎïµ°", {2, 1, 31169, 1, 4}},
        { "item", "HuyÕtTrİchTh¹ch Lv6", { 2, 22, 106, 1, 1 } },
        { "item", "NguyÖtB¹chTh¹ch Lv6", { 2, 22, 206, 1, 1 } },
        { "item", "Hæ Ph¸ch Th¹ch CÊp 6", { 2, 22, 306, 1, 1 } },
        { "item", "H¾c DiÖu Th¹ch CÊp 6", { 2, 22, 406, 1, 1 } },
    },
    [28] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 27000, 0, 0, 0, 0, 0, 200 },
        { "func", "§¶ th«ng C¶nh Giíi Vâ Th¸nh", award_wusheng },
    },
    [29] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 28000, 0, 0, 0, 0, 0, 201 },
        { "item", "HuyÕt Trİch Th¹ch cÊp 7", { 2, 22, 107, 2, 4 } },
        { "item", "NguyÖt B¹ch Th¹ch cÊp 7", { 2, 22, 207, 2, 4 } },
        { "item", "Hæ Ph¸ch Th¹ch cÊp 7", { 2, 22, 307, 2, 4 } },
        { "item", "H¾c DiÖu Th¹ch cÊp 7", { 2, 22, 407, 2, 4 } },
        --{"func", "Ëæ»ú7¼¶±¦Ê¯", award_random_gem7_2,{1}},
    },
    [30] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 32000, 0, 0, 0, 0, 0, 216 },
        { "item", "Linh Ph¸ch §¬n", { 2, 1, 31239, 8, 4 } },
    },
    [31] = {
        --score, EXP ÉùÍûÖµ Ê¦ÃÅÖµ ¾ü¹¦Öµ ÕæÆø
        { 35000, 0, 0, 0, 0, 0, 217 },
        { "item", "Th­¬ng H¶i Ch©u Lv7 (Ch­a gi¸m ®Şnh)", { 2, 102, 214, 2, 4 } },
    },
}
function ck_view_score_award(nType)
    local tSay = {
        format("\n NhËn phÇn th­ëng/#ck_get_score_award(%d)", nType),
        "\nT«i chØ xem xem th«i/nothing",
    }
    local tAward = CK_SCROE_AWARD_TABLE[nType]
    local tBase = tAward[1]
    local szMsg = format("Kinh nghiÖm %s, danh väng %d, ®iÓm s­ m«n %d, ®iÓm c«ng tr¹ng %d, ®iÓm ch©n khİ %d", tBase[2], tBase[3], tBase[4], tBase[5], tBase[6])
    for i = 2, getn(tAward) do
        if tAward[i][1] == "item" then
            szMsg = format("%s,%s*%d", szMsg, tAward[i][2], tAward[i][3][4]);
        else
            szMsg = format("%s,%s", szMsg, tAward[i][2])
        end
    end
    Say(CK_NPC_NAME .. format("HiÖn t¹i cã thÓ nhËn phÇn th­ëng:\n   <color=green>%s<color>\n<color=red>Khi kh«ng thÓ cho thªm phÇn th­ëng th× sÏ dïng ®iÓm kinh nghiÖm ®Ó thay thÕ<color>", szMsg), getn(tSay), tSay);
    return 0;
end

function ck_get_score_award(nType)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    tSelect = tSelect or {}
    local tAward = CK_SCROE_AWARD_TABLE[nType]
    if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
        return 0;
    end
    local nCurScore = ck_GetCkScore()
    local nNeedScore = tAward[1][1]
    local nAwardedFlagId = tAward[1][7]
    if nCurScore < nNeedScore then
        Say(CK_NPC_NAME .. format("§iÓm n¨ng ®éng ch­a ®¹t <color=red>%d<color>, kh«ng thÓ nhËn th­ëng!", nNeedScore), 0);
        return 0;
    end
    --if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) ~= 0 then
    if ActCheckCondition(nAwardedFlagId) ~= 0 then
        Say(CK_NPC_NAME .. "§· nhËn phÇn th­ëng nµy råi!", 0);
        return 0;
    end
    if gf_CheckBaseCondition(90) ~= 1 then
        return 0;
    end

    for i = 1, getn(tAward) do
        local t = tAward[i];
        if "select" == t[1] then
            ck_get_score_award_select(nType, i);
            return 1;
        end
        if "exchange" == t[1] then
            ck_get_score_award_exchange(nType, i);
            return 1;
        end
    end

    --if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) == 0 then
    if ActCheckCondition(nAwardedFlagId) == 0 then
        -- ´ÓÕâÀï¿ªÊ¼Áì½±
        AddRuntimeStat(81, nType, 0, 1)
    end

    --CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, nType, 1)
    ActSetBitCdtFinish(nAwardedFlagId)

    for i = 1, getn(tAward) do
        local t = tAward[i]
        if type(t[1]) == "number" then
            gf_Modify("Exp", t[2])
            gf_Modify("Rep", t[3])
            gf_Modify("ShiMen", t[4])
            gf_Modify("JunGong", t[5])
            if t[6] > 0 then
                gf_Modify("ZhenQi", t[6])
            end
        elseif "func" == t[1] then
            t[3](unpack(t[4] or {}))
            if t[3] == award_tongscore then
                Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm ®é cèng hiÕn bang héi", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "PhÇn th­ëng ®iÓm tİch lòy", (t[4] or 0), 1);
        end
    end

    return 1;
end

function test_echange()
    ck_get_score_award(24)
end

function ck_get_score_award_exchange(nType, i)
    local tAward = CK_SCROE_AWARD_TABLE[nType][i];
    local tSay = {}
    local szTitle = format("%s: §æi %s cÇn thªm:\n%s", CK_NPC_NAME, tAward[2], tAward[3])
    if tAward[4]() == 1 then
        tinsert(tSay, format("X¸c ®Şnh /#ck_get_score_award_select_final(%d)", nType))
    else
        szTitle = szTitle .. "\n<color=red>Ch­a ®¹t yªu cÇu!<color>"
    end
    tinsert(tSay, "Hñy bá/nothing")
    Say(szTitle, getn(tSay), tSay)
end

function ck_get_score_award_exchange_final(nType, i)
    local tAward = CK_SCROE_AWARD_TABLE[nType][i];
end

function ck_get_score_award_select(nType, i, j)
    local tAward = CK_SCROE_AWARD_TABLE[nType][i];
    if tAward[1] == "select" then
        if not j then
            local tDialog = {}
            local szTitle = format("%s: H·y chän %s", CK_NPC_NAME, tAward[2])
            local tSel = tAward[3]
            for k = 1, getn(tSel) do
                if tSel[k][1] == "item" then
                    tinsert(tDialog, format("%s*%d/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], tSel[k][3][4], nType, i, k));
                else
                    tinsert(tDialog, format("%s/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], nType, i, k));
                end
            end
            tinsert(tDialog, "\nTa chØ xem xem th«i/ck_get_score_award_select_cancle")
            Say(szTitle, getn(tDialog), tDialog)
            return 0;
        end
        if not g_RecordIndex then
            g_RecordIndex = {}
        end
        if not g_RecordIndex[PlayerIndex] then
            g_RecordIndex[PlayerIndex] = {}
        end
        g_RecordIndex[PlayerIndex][i] = j;
    end
    local tNext = CK_SCROE_AWARD_TABLE[nType][i + 1];
    if tNext then
        ck_get_score_award_select(nType, i + 1);
    else
        ck_get_score_award_select_final(nType);
    end
end

function ck_get_score_award_select_cancle()
    if g_RecordIndex then
        g_RecordIndex[PlayerIndex] = nil
    end
end

function ck_get_score_award_select_final(nType)
    local tAward = CK_SCROE_AWARD_TABLE[nType]
    local nAwardedFlagId = tAward[1][7]
    --if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) == 0 then
    if ActCheckCondition(nAwardedFlagId) == 0 then
        -- ´ÓÕâÀï¿ªÊ¼Áì½±
        AddRuntimeStat(81, nType, 0, 1)
    end
    --CK_TASK_GROUP:SetTaskBit(tAwardedBitInfo[1], tAwardedBitInfo[2], 1)
    ActSetBitCdtFinish(nAwardedFlagId)
    for i = 1, getn(tAward) do
        local t = tAward[i]
        if type(t[1]) == "number" then
            gf_Modify("Exp", t[2])
            gf_Modify("Rep", t[3])
            gf_Modify("ShiMen", t[4])
            gf_Modify("JunGong", t[5])
            if t[6] > 0 then
                gf_Modify("ZhenQi", t[6])
            end
        elseif "func" == t[1] then
            t[3](unpack(t[4] or {}))
            if t[3] == award_tongscore then
                Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm ®é cèng hiÕn bang héi", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "PhÇn th­ëng ®iÓm tİch lòy", (t[4] or 0), 1);
        elseif "select" == t[1] then
            local Index = g_RecordIndex[PlayerIndex][i];
            local tItem = t[3][Index];
            if "item" == tItem[1] then
                gf_AddItemEx2(tItem[3], tItem[2], "CDKEY", "PhÇn th­ëng ®iÓm tİch lòy", (tItem[4] or 0), 1);
            elseif "func" == tItem[1] then
                tItem[3]()
            end
        elseif "exchange" == t[1] then
            t[5]()
        end
    end
    if g_RecordIndex then
        g_RecordIndex[PlayerIndex] = nil;
    end
end



