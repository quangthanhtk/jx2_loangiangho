Import("\\script\\ksgvn\\lib.lua")

PHUTU_REQUIRE_MIN_LEVEL = 890
PHUTU_TITLE_GROUP = 101
PHUTU_WAIT_TIME = 30 * 60

g_szTalkHead = "<color=green>Ch��ng M�n<color>: "

g_tbPhuTuCfg = {
    [1] = {
        nByte = TASKID_PHUTU_BYTE_ROUTE1,
        nByteTranPhai = TASKID_PHUTU_BYTE_TRANPHAI1,
        nRequireLevel = 890,
        szName = "nh�t",
    },
    [2] = {
        nByte = TASKID_PHUTU_BYTE_ROUTE2,
        nByteTranPhai = TASKID_PHUTU_BYTE_TRANPHAI2,
        nRequireLevel = 990,
        szName = "nh�",
    },
    [3] = {
        nByte = TASKID_PHUTU_BYTE_ROUTE3,
        nByteTranPhai = TASKID_PHUTU_BYTE_TRANPHAI3,
        nRequireLevel = 1090,
        szName = "tam",
    },
}