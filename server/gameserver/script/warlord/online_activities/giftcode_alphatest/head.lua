----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: §Þnh nghÜa c¸c tham sè cho ho¹t ®éng nhËn giftcode alphatest
----------------------------------------------------------------------------------------------------
WGIFTCODE_ALPHATEST = {
    tbBattleTopAwardDef = {
        [1] = { nGiftCodeId = 1 },
        [2] = { nGiftCodeId = 2 },
        [3] = { nGiftCodeId = 3 },
        [4] = { nGiftCodeId = 4 },
        [5] = { nGiftCodeId = 5 },
        [6] = { nGiftCodeId = 6 },
        [7] = { nGiftCodeId = 7 },
        [8] = { nGiftCodeId = 8 },
        [9] = { nGiftCodeId = 9 },
        [10] = { nGiftCodeId = 10 },
    }, -- PhÇn th­ëng code chiÕn tr­êng chÝnh, giftcode ë file ic_giftcode.lua

    tbTaskReqAwardDef = {
        [1] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC1,
                nGiftCodeId = 15,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "§¹t 250,000 ®iÓm c«ng tr¹ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 250000 } },
                BatNhaLon = { szTaskName = "Thu ho¹ch 16 B¸t Nh· Lín", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 16 } },
                VanTieu = { szTaskName = "VËn thµnh c«ng 2 Tiªu Hoµng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 2 } },
                TaiNguyenChien = { szTaskName = "Hoµn thµnh 4 nhiÖm vô Tµi Nguyªn ChiÕn", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 4 } },
            },
        },
        [2] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC2,
                nGiftCodeId = 16,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "§¹t 700,000 ®iÓm c«ng tr¹ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 700000 } },
                BatNhaLon = { szTaskName = "Thu ho¹ch 32 B¸t Nh· Lín", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 32 } },
                VanTieu = { szTaskName = "VËn thµnh c«ng 2 Tiªu Hoµng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 3 } },
                TaiNguyenChien = { szTaskName = "Hoµn thµnh 4 nhiÖm vô Tµi Nguyªn ChiÕn", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 8 } },
            },
        },
        [3] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC3,
                nGiftCodeId = 17,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "§¹t 1,000,000 ®iÓm c«ng tr¹ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 1000000 } },
                BatNhaLon = { szTaskName = "Thu ho¹ch 10 B¸t Nh· Lín", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 10 } },
                VanTieu = { szTaskName = "VËn thµnh c«ng 2 Tiªu Hoµng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 5 } },
                TaiNguyenChien = { szTaskName = "Hoµn thµnh 4 nhiÖm vô Tµi Nguyªn ChiÕn", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 12 } },
            },
        },
    }, -- PhÇn th­ëng c¸c mèc nhiÖm vô, phÇn th­ëng giftcode ë file ic_giftcode.lua

    tbMsgString = {
      [1] = "Mèc %d: tiÕn ®é %d/%d",
      [2] = "<sex> ®· nhËn th­ëng nµy råi, kh«ng thÓ nhËn thªm!",
      [3] = "<sex> vÉn ch­a hoµn thµnh c¸c môc tiªu, kh«ng thÓ nhËn th­ëng!",
    },

    tbActivityInfo = {
        szActivityName = "Ho¹t ®éng nhËn GiftCode AlphaTest",
        szActivitySayTitle = "Tham gia tr¶i nghiÖm nhËn GiftCode liÒn tay!",
        tbActivitySayOption = {
            [1] = "§¹t TOP 1-10 chiÕn tr­êng chÝnh nhËn GiftCode/WGIFTCODE_ALPHATEST_Act1",
            [2] = "NhiÖm vô AlphaTest nhËn GiftCode/WGIFTCODE_ALPHATEST_Act2",
        },
    },
};
