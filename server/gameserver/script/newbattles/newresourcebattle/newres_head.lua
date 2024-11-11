Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\newbattles\\newresourcebattle\\newres_pos.lua");

SONG_ID = 1
LIAO_ID = 2
ALL_ID = 3

MAX_CAMP = 300
MAX_POINT = 2000

MAP_ID = 606

DEATH_SCRIPT = "\\script\\newbattles\\newresourcebattle\\playerdeath.lua"

tCamp = {
    [0] = "Trung lËp",
    [1] = "Tèng",
    [2] = "Liªu",
    [3] = "hai phe",
}

tCampNameP = {
    [ALL_ID] = "noaligned",
    [SONG_ID] = "dasong",
    [LIAO_ID] = "daliao",
}

tItem = {
    { "Cuèc Chim", { 0, 200, 11, 1 }, { 5, 11, 10 } },
    { "ThiÕt Phñ", { 0, 200, 14, 1 }, { 1, 21, 10 } },
    { "ChÕ B× §ao", { 0, 200, 12, 1 }, { 2, 41, 10 } },
    { "Cuèc Thuèc", { 0, 200, 16, 1 }, { 4, 1, 10 } },
    { "§Êu Hån", { 2, 1, 1157, 1 } },
    { "Cuèc Céng C«ng", { 0, 200, 23, 1 }, { 5, 11, 10 } },
    { "Bµn Cæ phñ", { 0, 200, 26, 1 }, { 1, 21, 10 } },
    { "L«i ThÇn ®ao", { 0, 200, 24, 1 }, { 2, 41, 10 } },
    { "Cuèc ThÇn N«ng", { 0, 200, 28, 1 }, { 4, 1, 10 } },
}

tBattleItem = {
    [1] = { "L­¬ng th¶o-s¬ cÊp", 2, 0, 588, 1 },
    [2] = { "L­¬ng th¶o-trung cÊp", 2, 0, 589, 1 },
    [3] = { "L­¬ng th¶o-cao cÊp", 2, 0, 590, 1 },
    [4] = { "Cuèc l­¬ng th¶o", 2, 0, 591, 1 },
    [5] = { "H­íng dÉn chiÕn tr­êng", 2, 0, 595, 0 },
    [6] = { "HuyÒn thiÕt kho¸ng th¹ch", 2, 0, 594, 1 },
    [7] = { "S¬n tÆc-binh kú", 2, 0, 593, 1 },
    [8] = { "S¬n tÆc-chiÕn cæ", 2, 0, 592, 1 },
    [9] = { "Sinh Sinh Hãa T¸n", 1, 0, 205, 1 },
    [10] = { "Ngäc Cao t¸n", 1, 0, 204, 1 },
    [11] = { "V¹n VËt Quy Nguyªn ®¬n", 1, 0, 206, 1 }
}

tBattleMed = {
    { "ChÝnh Nguyªn Håi T©m §¬n(c.tr­êng)", 1, 0, 207, 80, "phôc håi tÊt c¶ nh÷ng kü n¨ng bÞ ®ãng b¨ng", 0 },
    { "Ngò ChuyÓn Linh B¶o §¬n (c.tr­êng)", 1, 0, 208, 50, "XuÊt chiªu+5, duy tr× trong 10 gi©y", 0 },
    { "ThÇn Gi¸p §¬n (chiÕn tr­êng)", 1, 0, 209, 50, "Ngo¹i phßng 100%, duy tr× trong 5 gi©y", 0 },
    { "ThÇn Tr¸o §¬n (chiÕn tr­êng)", 1, 0, 210, 50, "Néi phßng 100%, duy tr× 5 gi©y", 0 },
    { "Th«ng C©n T¸n (chiÕn tr­êng)", 1, 0, 211, 50, "MiÔn dÞch lµm chËm, duy tr× trong 10 gi©y", 0 },
    { "Ho¹t HuyÕt T¸n (chiÕn tr­êng)", 1, 0, 212, 50, "MiÔn dÞch gi¶m tèc, duy tr× trong 10 gi©y", 0 },
    { "S­íng L¹c T¸n (chiÕn tr­êng)", 1, 0, 213, 50, "MiÔn dÞch tª liÖt, duy tr× trong 10 gi©y", 0 },
    { "Cù Th¹ch T¸n (chiÕn tr­êng)", 1, 0, 215, 50, "MiÔn dÞch ®Èy lui, duy tr× trong 10 gi©y", 0 },
    { "Kim Cang T¸n (chiÕn tr­êng)", 1, 0, 216, 50, "MiÔn dÞch ®¸nh ng·, duy tr× trong 10 gi©y", 0 },
    { "§Ò ThÇn T¸n (chiÕn tr­êng)", 1, 0, 217, 50, "MiÔn dÞch mª man, duy tr× trong 10 gi©y", 0 },
    { "Ng­ng Hån T¸n (chiÕn tr­êng)", 1, 0, 218, 50, "MiÔn dÞch hçn lo¹n, duy tr× trong 10 gi©y", 0 },
    { "ThÇn Phong T¸n (chiÕn tr­êng)", 1, 0, 219, 50, "MiÔn dÞch ®Þnh th©n, duy tr× trong 10 gi©y", 0 },
    { "V« óy T¸n (chiÕn tr­êng)", 1, 0, 220, 50, "MiÔn cho¸ng, duy tr× trong 10 gi©y", 0 },
    -- { "ThÊt X¶o Linh §¬n (chiÕn tr­êng)", 1, 0, 223, 200, "TiÓu v« ®Þch, duy tr× trong 3 gi©y", 0 },
    -- { "V« Cùc Tiªn §¬n (chiÕn tr­êng)", 1, 0, 224, 500, "§¹i v« ®Þch, duy tr× trong 6 gi©y", 0 },
    { "Sinh Sinh Hãa T¸n", 1, 0, 205, 10, "Nhanh chãng phôc håi sinh lùc vµ néi lùc", 0 },
    { "Ngäc Cao t¸n", 1, 0, 204, 10, "Nhanh chãng phôc håi sinh lùc", 0 },
    { "V¹n VËt Quy Nguyªn ®¬n", 1, 0, 206, 8, "Nhanh chãng phôc håi néi lùc", 0 },
    { "ThÊt KhiÕu Nguyªn B¶o §¬n(ctr­êng)", 1, 0, 225, 500, "XuÊt chiªu+10, duy tr× trong 15 gi©y", 4 },
    -- { "Th«ng Thiªn V« Cùc §¬n (ctr­êng)", 1, 0, 227, 1000, "V« ®Þch, duy tr× trong 9 gi©y", 4 },
}

tAwardRank = {
    [4] = { 100000000, 1600 },
    [1] = { 120000000, 3200 },
    [2] = { 130000000, 8000 },
    [3] = { 140000000, 16000 },
    [5] = { 150000000, 22400 },
    --	[6] = {50000000,1600},
}

tJungongItem = {
    --gèc
    --[1] = { "Qu©n C«ng Ch­¬ng", { 2, 1, 9999 }, 1.5, 2, 2 },
    --[2] = { "Huy HiÖu ChiÕn C«ng (®¹i)", { 2, 1, 9998 }, 2, 5, 4 },
    --[3] = { "Huy HiÖu ChiÕn C«ng Huy Hoµng", { 2, 1, 9977 }, 2.5, 10, 6 },
    --[4] = { "Kh«ng", { 0, 0, 0 }, 1, 1, 1 },

    --LongDaiKa: söa cho ®ång nhÊt tªn
    [1] = { "Qu©n C«ng Ch­¬ng", { 2, 1, 9999 }, 1.5, 2, 2 },
    [2] = { "Qu©n C«ng §¹i", { 2, 1, 9998 }, 2, 5, 4 },
    [3] = { "Qu©n C«ng Huy Hoµng", { 2, 1, 9977 }, 2.5, 10, 6 },
    [4] = { "Kh«ng dïng QCC", { 0, 0, 0 }, 1, 1, 1 },
    [5] = { "Qu©n C«ng Vinh Dù", { 2, 1, 30642 }, 2.5, 10, 6 },
}
