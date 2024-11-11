----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: ��nh ngh�a c�c tham s� cho ho�t ��ng nh�n giftcode alphatest
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
    }, -- Ph�n th��ng code chi�n tr��ng ch�nh, giftcode � file ic_giftcode.lua

    tbTaskReqAwardDef = {
        [1] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC1,
                nGiftCodeId = 15,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "��t 250,000 �i�m c�ng tr�ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 250000 } },
                BatNhaLon = { szTaskName = "Thu ho�ch 16 B�t Nh� L�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 16 } },
                VanTieu = { szTaskName = "V�n th�nh c�ng 2 Ti�u Ho�ng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 2 } },
                TaiNguyenChien = { szTaskName = "Ho�n th�nh 4 nhi�m v� T�i Nguy�n Chi�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 4 } },
            },
        },
        [2] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC2,
                nGiftCodeId = 16,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "��t 700,000 �i�m c�ng tr�ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 700000 } },
                BatNhaLon = { szTaskName = "Thu ho�ch 32 B�t Nh� L�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 32 } },
                VanTieu = { szTaskName = "V�n th�nh c�ng 2 Ti�u Ho�ng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 3 } },
                TaiNguyenChien = { szTaskName = "Ho�n th�nh 4 nhi�m v� T�i Nguy�n Chi�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 8 } },
            },
        },
        [3] = {
            tbAwardDef = {
                nTaskId = WTASKID_CODETEST_BIT_GIVE_STATUS,
                nBitId = WTASKID_CODETEST_BIT_GIVE_MOC3,
                nGiftCodeId = 17,
            },
            tbTaskReq = {
                CongTrang = { szTaskName = "��t 1,000,000 �i�m c�ng tr�ng", tbTaskReq = { WTASKID_NEWBATTLE_MERIT_POINT, 1000000 } },
                BatNhaLon = { szTaskName = "Thu ho�ch 10 B�t Nh� L�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_BATNHALON, 10 } },
                VanTieu = { szTaskName = "V�n th�nh c�ng 2 Ti�u Ho�ng Gia", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_VANTIEU, 5 } },
                TaiNguyenChien = { szTaskName = "Ho�n th�nh 4 nhi�m v� T�i Nguy�n Chi�n", tbTaskByteReq = { WTASKID_CODETEST_BYTE_TASK, WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN, 12 } },
            },
        },
    }, -- Ph�n th��ng c�c m�c nhi�m v�, ph�n th��ng giftcode � file ic_giftcode.lua

    tbMsgString = {
      [1] = "M�c %d: ti�n �� %d/%d",
      [2] = "<sex> �� nh�n th��ng n�y r�i, kh�ng th� nh�n th�m!",
      [3] = "<sex> v�n ch�a ho�n th�nh c�c m�c ti�u, kh�ng th� nh�n th��ng!",
    },

    tbActivityInfo = {
        szActivityName = "Ho�t ��ng nh�n GiftCode AlphaTest",
        szActivitySayTitle = "Tham gia tr�i nghi�m nh�n GiftCode li�n tay!",
        tbActivitySayOption = {
            [1] = "��t TOP 1-10 chi�n tr��ng ch�nh nh�n GiftCode/WGIFTCODE_ALPHATEST_Act1",
            [2] = "Nhi�m v� AlphaTest nh�n GiftCode/WGIFTCODE_ALPHATEST_Act2",
        },
    },
};
