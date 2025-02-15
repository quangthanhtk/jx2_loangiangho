Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--测试
DebugOutput = nothing

--是否为新服服务器
--Experience server Switch
CK_ES_SWITCH = 0;

function _ck_check_tong()
    if IsTongMember() <= 0 then
        --Say(CK_NPC_NAME.."不满足条件，不能完成任务！", 0);
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
        --Say(CK_NPC_NAME.."您还没有激活任何月卡，不能完成任务！", 0);
        return 0;
    end
    return 1
end
function _ck_del_300_ziguangjifen()
    --扣紫光积分
    local TSK_POINT = 652;            --记录玩家个人关卡积分
    if GetTask(TSK_POINT) < 300 then
        Say(CK_NPC_NAME .. format("觤 t輈h l騳 t� quang kh玭g  <color=red>%d<color> 甶觤", 300), 0);
        return 0;
    end
    SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
    return 1
end
function _ck_check_300_ziguangjifen()
    local TSK_POINT = 652;            --记录玩家个人关卡积分
    if GetTask(TSK_POINT) < 300 then
        return 0;
    end
    return 1
end

--用一张表来记录所有任务 以前纯手工制作受不了
CK_EXT_AWARD = 0
T_CK_TASK_LIST = {
    --{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
    --百战不殆 三方势力任务
    [1101] = { 0, "V薾 ti猽", { "Ho祅 th祅h 1 l莕 nhi謒 v� v薾 ti猽", "дn b秐  th� l鵦 ch� NPC Ti猽 u Tr蕁 Vi詎 Ti猽 C鬰  nh薾 nhi謒 v� v薾 ti猽" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 1, 2, 3 } },
    [1102] = { 0, "Cp ti猽", { "Ho祅 th祅h 1 l莕 nhi謒 v� cp ti猽", "дn b秐  th� l鵦 ch� NPC Ti猽 u Tr蕁 Vi詎 Ti猽 C鬰  nh薾 nhi謒 v� 畂箃 ti猽" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 4, 5, 6 } },
    [1103] = { 0, "Thu th藀 Ng鋍 Ph竎h", { "Thu th藀 1 Ng鋍 Ph竎h", "дn Th竔 H� C� Th� c馻 th� l鵦 tr錸g 1 h箃 gi鑞g, thu th藀 1 Ng鋍 Ph竎h" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 7, 8, 9 } },
    [1104] = { 0, "Tr閙 Ng鋍 Ph竎h", { "дn th� l鵦 kh竎 tr閙 1 Ng鋍 Ph竎h", "V祇 b秐  th� l鵦 kh竎  tr閙 1 Ng鋍 Ph竎h" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 10, 11, 12 } },
    [1105] = { 0, "T﹜ V鵦 Truy襫 Чo", { "Tham gia t輓h n╪g T﹜ V鵦 Truy襫 Чo, nh蕄 v祇 3 th竛h v藅  nh薾 thng", "V祇 b秐  th� l鵦 tham gia t輓h n╪g T﹜ V鵦 Truy襫 Чo, nh蕄 v祇 3 th竛h v藅  nh薾 thng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 13, 14, 15 } },
    [1106] = { 0, "BOSS Th� L鵦", { "Nh薾 b秓 v� BOSS c馻 th� l鵦 v� ti猽 di謙 BOSS c馻 th� l鵦 phe ch  nh薾 頲 ph莕 thng", "Bu鎖 t鑙 s� xu蕋 hi謓 BOSS c馻 th� l鵦 phe ta ho芻 phe ch, b秓 v� BOSS c馻 phe ta v� ti猽 di謙 BOSS c馻 phe ch s� nh薾 頲 ph莕 thng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 16, 17, 18 } },
    [1107] = { 0, "Th� S╪ Ti襫 Thng", { "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng", "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 19, 20, 21 } },
    [1108] = { 0, "Nhi謒 v� Уo Kho B竨", { "Ho祅 th祅h 1 l莕 nhi謒 v� Уo Kho B竨", "V祇 th� l鵦 nh薾 1 T祅g B秓 у, ho祅 th祅h 1 l莕 nhi謒 v� Уo Kho B竨" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 22, 23, 24 } },

    --百战不殆 副本任务
    [1201] = { 0, "Lng S琻", { "Ho祅 th祅h 1 l莕 秈 Lng S琻 B筩", "Ho祅 th祅h 1 l莕 秈 Lng S琻 B筩" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 1, 2, 3 } },
    [1202] = { 0, "V筺 Ki誱 Tr騨g", { "Vt 秈 V筺 Ki誱 Tr騨g 1 l莕", "Vt 秈 V筺 Ki誱 Tr騨g 1 l莕" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 4, 5, 6 } },
    [1203] = { 0, "мa Huy襫 Cung", { "Vt 秈 мa Huy襫 Cung 1 l莕", "Vt 秈 мa Huy襫 Cung 1 l莕" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 7, 8, 9 } },
    [1204] = { 0, "Th竔 Nh蕋 Th竝", { "Vt 秈 Th竔 Nh蕋 Th竝 1 l莕", "Vt 秈 Th竔 Nh蕋 Th竝 1 l莕" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 10, 11, 12 } },

    --百战不殆 PVP任务
    [1301] = { 0, "Tr錸g 1 C﹜ B竧 Nh�-Nh�", { "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh�-Nh�", "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh�-Nh�" }, { 20000000, 35 }, { 2, 13, 14, 15 } },
    [1302] = { 0, "Tr錸g 1 C﹜ T� Linh", { "Tr錸g v� thu ho筩h 1 C﹜ T� Linh", "Tr錸g v� thu ho筩h 1 C﹜ T� Linh" }, { 20000000, 35 }, { 2, 16, 17, 18 } },
    [1303] = { 0, "Tr錸g 1 C﹜ H箃 Gi鑞g", { "Tr錸g v� thu ho筩h 1 C﹜ H箃 Gi鑞g", "Tr錸g v� thu ho筩h 1 C﹜ H箃 Gi鑞g" }, { 20000000, 35 }, { 2, 19, 20, 21 } },
    [1304] = { 0, "PK Th� L鵦 Ba Phe", { "Цnh b筰 1 ngi ch琲 phe ch c馻 th� l鵦 kh竎", "Di謙 1 ngi ch琲 th� l鵦 ch, ch鴑g minh kh� n╪g c馻 b筺!" }, { 20000000, 35 }, { 2, 22, 23, 24 } },
    ------1305~1307必须保持连续，禁止插人
    [1305] = { 0, "Chi課 D辌h Th玭 Trang", { "Tham gia 1 l莕 Th玭 l祅g chi課", "Tham gia 1 l莕 Th玭 l祅g chi課" }, { 20000000, 35 }, { 2, 25, 26, 27 } },
    [1306] = { 0, "Chi課 D辌h Th秓 C鑓", { "Tham gia 1 l莕 Th秓 c鑓 chi課", "Tham gia 1 l莕 Th秓 c鑓 chi課" }, { 20000000, 35 }, { 2, 28, 29, 30 } },
    [1307] = { 0, "Ph竜 Уi Tranh 箃 Chi課", { "Tham gia 1 l莕 Ph竜 i chi課", "Tham gia 1 l莕 Ph竜 i chi課" }, { 20000000, 35 }, { 3, 1, 2, 3 } },
    [1308] = { 0, "S� d鬾g 50 Ph竜 Chi課 Th緉g", { "S� d鬾g 50 Ph竜 Chi課 Th緉g", "S� d鬾g 50 Ph竜 Chi課 Th緉g" }, { 20000000, 35 }, { 3, 4, 5, 6 } },
    [1309] = { 0, "H玬 nay tr錸g 1 C﹜ B竧 Nh� L韓", { "H玬 nay tr錸g v� thu ho筩h 1 C﹜ B竧 Nh� L韓", "H玬 nay tr錸g v� thu ho筩h 1 C﹜ B竧 Nh� L韓" }, { 20000000, 35 }, { 3, 8, 9, 10 } },
    [1310] = { 0, "Nh筺 M玭 Li謙 H醓", { "Nh薾 thng chi課 trng Nh筺 M玭 Li謙 H醓", "Nh薾 thng chi課 trng Nh筺 M玭 Li謙 H醓" }, { 20000000, 35 }, { 3, 11, 12, 13 } },
    [1311] = { 0, "T鑞g Li猽 T礽 Nguy猲 Chi課", { "H玬 nay tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕", "H玬 nay tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕" }, { 20000000, 35 }, { 3, 14, 15, 16 } },


    --每日其他任务
    [1401] = { 1, "Жng nh藀 m鏸 ng祔", { "Жng nh藀 m鏸 ng祔", "Жng nh藀 m鏸 ng祔" }, { 20000000, 20 }, { 3, 0, 0, 7 } },

    --------------------

    --速战速决 帮会任务
    [2101] = { 0, "Gia nh藀 bang h閕", { "Gia nh藀 m閠 bang h閕 b蕋 k�, tr� th祅h m閠 th祅h vi猲 trong bang", "Gia nh藀 bang h閕, c飊g v韎 th祅h vi猲 kh竎 c� g緉g  gi髉 bang h閕 ng祔 c祅g l韓 m筺h" }, { 50000000, 200 }, { 9, 0, _ck_check_tong, 1 } },
    [2102] = { 0, "T竔 chi課 Th莕 Th�", { "N閜 300 甶觤 t輈h l騳 t� quang (Sau khi giao nhi謒 v� th� hai b猲 s� b� tr� 300 甶觤 t輈h l騳 t� quang)", "Ch� c� ngi m韎 c� th� thu莕 ph鬰 T� Quang Th莕 Th�!" }, { 50000000, 100, _ck_del_300_ziguangjifen }, { 9, 0, _ck_check_300_ziguangjifen, 2 } },
    [2103] = { 0, "N閜 甶觤 c鑞g hi課 bang h閕", { "Tham gia t輓h n╪g Bang H閕 Vinh Danh, giao n閜 10 甶觤 c鑞g hi課 bang h閕", "Tham gia t輓h n╪g Bang H閕 Vinh Danh, giao n閜 10 甶觤 c鑞g hi課 bang h閕" }, { 50000000, 100 }, { 9, 0, 3, 4 } },
    [2104] = { 0, "Nh薾 ph莕 thng Bang H閕 Vinh Danh", { "Nh薾 ph莕 thng Bang H閕 Vinh Danh", "Tham gia t輓h n╪g Bang H閕 Vinh Danh v� nh薾 ph莕 thng" }, { 50000000, 300 }, { 9, 0, 5, 6 } },

    [2201] = { 0, "Чi Hi謕", { "K輈h ho箃 danh ph薾 Чi Hi謕", "K輈h ho箃 VIP Чi Hi謕 L謓h, ch琲 tr� ch琲 nh� nh祅g h琻" }, { 50000000, 1400 }, { 10, 0, _ck_check_yueka, 1 } },
    [2202] = { 0, "Gia nh藀 th� l鵦", { "Gia nh藀 1 th� l鵦 trong ba phe", "Gia nh藀 1 th� l鵦 trong ba phe" }, { 50000000, 400 }, { 10, 0, _ck_check_shili, 2 } },
    [2203] = { 0, "V薾 ti猽", { "Ho祅 th祅h 1 l莕 v薾 ti猽", "V祇 th� l鵦 nh薾 nhi謒 v� v薾 ti猽, ho祅 th祅h 1 l莕 v薾 ti猽" }, { 50000000, 400 }, { 10, 0, 3, 4 } },
    [2204] = { 0, "Cp ti猽", { "Ho祅 th祅h 1 l莕 cp ti猽", "V祇 th� l鵦 nh薾 nhi謒 v� cp ti猽, ho祅 th祅h 1 l莕 cp ti猽" }, { 50000000, 400 }, { 10, 0, 5, 6 } },
    [2205] = { 0, "Tr錸g c﹜", { "Ho祅 th祅h 1 l莕 nhi謒 v� tr錸g c﹜", "V祇 th� l鵦 ch� C﹜ Th竔 H� ho祅 th祅h 1 l莕 nhi謒 v� tr錸g c﹜" }, { 5000000, 400 }, { 10, 0, 7, 8 } },
    [2206] = { 0, "Уo rng", { "Ho祅 th祅h 1 l莕 nhi謒 v� o rng", "Ho祅 th祅h 1 l莕 nhi謒 v� o rng" }, { 5000000, 400 }, { 10, 0, 9, 10 } },
    [2207] = { 0, "Th� S╪ Ti襫 Thng", { "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng", "Ho祅 th祅h 1 l莕 nhi謒 v� Th� S╪ Ti襫 Thng" }, { 5000000, 400 }, { 10, 0, 11, 12 } },
    -- [2208] = {0, "西域传道", {"使用其中任意1个道具：金陵酒，藏剑秘传心经，百晓生秘法", "参与西域传道功能，任意使用其中1个道具：金陵酒，藏剑秘传心经，百晓生秘法"}, {50000000, 600}, {10, 0, 13, 14}},

    [2209] = { 0, "Tr錸g 1 C﹜ B竧 Nh� L韓", { "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh� L韓", "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh� L韓" }, { 50000000, 300 }, { 10, 0, 13, 14 } },
    [2210] = { 0, "Tr錸g 1 C﹜ B竧 Nh�-Nh�", { "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh�-Nh�", "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh�-Nh�" }, { 50000000, 300 }, { 10, 0, 15, 16 } },
    [2211] = { 0, "Tr錸g 1 H箃 Gi鑞g", { "Tr錸g v� thu ho筩h 1 H箃 Gi鑞g", "Tr錸g v� thu ho筩h 1 H箃 Gi鑞g" }, { 50000000, 300 }, { 10, 0, 17, 18 } },
    [2212] = { 0, "Tr錸g 1 C﹜ T� Linh", { "Tr錸g v� thu ho筩h 1 C﹜ T� Linh", "Tr錸g v� thu ho筩h 1 C﹜ T� Linh" }, { 50000000, 300 }, { 10, 0, 19, 20 } },
    [2213] = { 0, "D飊g 8 Ng玦 Sao May M緉", { "D飊g 8 Ng玦 Sao May M緉", "D飊g 8 Ng玦 Sao May M緉" }, { 50000000, 400 }, { 10, 0, 21, 22 } },
    [2214] = { 0, "D飊g 100 N� Oa B秓 H筽", { "D飊g 100 N� Oa B秓 H筽", "D飊g 100 N� Oa B秓 H筽" }, { 50000000, 400 }, { 10, 0, 23, 24 } },
    [2215] = { 0, "S� d鬾g 50 Ph竜 Chi課 Th緉g", { "S� d鬾g 50 Ph竜 Chi課 Th緉g", "S� d鬾g 50 Ph竜 Chi課 Th緉g" }, { 50000000, 200 }, { 10, 0, 25, 26 } },
    [2216] = { 0, "T鑞g Li猽 T礽 Nguy猲 Chi課", { "Tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕", "Tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕" }, { 50000000, 300 }, { 10, 0, 27, 28 } },

    --大富翁 数值累计任务 占位
    --[3001] = {},

    --大富翁 天骄令消费任务 占位
    --[3101] = {},

    --活跃度积分领奖 占位
    --[10001]= {},
}

--任务组列表,用于生成任务对话
T_CK_TASK_GROUP_LIST = {
    --name, {type,desc}, {sub_list_group}
    [1] = {
        [1] = "Nhi謒 v� h祅g ng祔",
        [2] = { 1, "H籲g ng祔 nh薾 ng蓇 nhi猲, nh薾 頲 nhi襲 EXP v�  n╪g ng!" },
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
                [1] = "Nhi謒 v� Th� L鵦 Ba Phe",
                [2] = 2,
                [3] = {
                    { { 1101 }, 4000 }, --运镖
                    { { 1102 }, 3200 }, --夺镖
                    { { 1103 }, 400 }, --收集玉魄
                    { { 1104 }, 400 }, --偷取玉魄
                    { { 1105 }, 400 }, --西域传道
                    { { 1106 }, 400 }, --势力boss
                    { { 1107 }, 400 }, --赏金猎人
                    { { 1108 }, 400 }, --挖宝藏任务
                },
                [4] = 0
            },

            [2] = {
                [1] = "Nhi謒 v� ph� b秐",
                [2] = 1,
                [3] = {
                    { { 1201 }, 2000 }, --万剑冢
                    { { 1202 }, 2000 }, --万剑冢
                    { { 1203 }, 3000 }, --地玄宫
                    { { 1204 }, 3000 }, --太一塔
                },
                [4] = 0,
            },

            [3] = {
                [1] = "Nhi謒 v� PVP",
                [2] = 5,
                [3] = {
                    { { 1301 }, 1500 }, --种一颗小般若树
                    { { 1302 }, 1500 }, --种一颗四灵树
                    { { 1303 }, 1500 }, --种一颗种子树
                    { { 1309 }, 500 }, --种一颗大般若树
                    { { 1304 }, 1000 }, --三方势力PK
                    { { 1305, 1306, 1307, 1310 }, 1000 }, --村落战役 草谷场战役 炮台争夺战 雁门烈火
                    { { 1308 }, 1000 }, --使用50个胜利鞭炮
                    { { 1311 }, 2000 }, --宋辽资源战
                },
                [4] = 1,
            },

            [4] = {
                [1] = "Жng nh藀 m鏸 ng祔",
                [2] = 1,
                [3] = {
                    { { 1401 }, 1000 },
                },
                [4] = 0,
            },
        },
    },
    [2] = {
        [1] = "Nhi謒 v� trng th祅h",
        [2] = { 2, "Trong th阨 gian ho箃 ng ch� ho祅 th祅h 1 l莕, nh薾 頲 nhi襲 EXP v�  n╪g ng!" },
        [3] = {
            [1] = { "Nhi謒 v� bang h閕", 0, { 2101, 2102, 2103, 2104 }, 0 }, --速战速决-帮会任务
            [2] = { "Nhi謒 v� hng d蒼", 0, { 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216 }, 0 }, --速战速决-指引任务
        },
    },
}

function ck_task_daily_clear()
    --每日清理
    --百战不殆任务变量清理
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
        --调试模式
        print("ck_task_daily_clear", task_index, nGroupTaskIndex, nBitGet, nBitFinish, nBitAward)
    end
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
end

--外部调用 设置某一个任务为完成状态
function ck_global_set_task_finish(nTaskIndex)
    --gf_TeamOperateEX(function()
    local t = _ck_get_task_cfg(nTaskIndex)
    if not t then
        return
    end
    if ck_IsOpen() ~= 1 then
        if gDebug:is_debug() == 1 then
            --调试模式
            print("ck_global_set_task_finish not open", nTaskIndex)
        end
        return 0;
    end
    if ck_GetTitleType() == 0 then
        if gDebug:is_debug() == 1 then
            --调试模式
            print("ck_global_set_task_finish title error", nTaskIndex)
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --调试模式
            print("ck_global_set_task_finish not enable", nTaskIndex)
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        if gDebug:is_debug() == 1 then
            --调试模式
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
            Msg2Player(format("B筺  ho祅 th祅h nhi謒 v� Code Chu Tc [%s]", szTaskName));
        end
    else
        if gDebug:is_debug() == 1 then
            --调试模式
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
    tinsert(tSay, format("\n%s/nothing", "T筰 h� ch� xem qua th玦"))
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
            --尝试接取随机任务
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
        --没有领取任务的话随机生成
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
        --调试模式
        tinsert(tSay, format("%s/ck_DailyReset", "dailyclear"))
    end
    tinsert(tSay, format("%s/nothing", "T筰 h� ch� xem qua th玦"))
    Say(CK_NPC_NAME .. szTitle, getn(tSay), tSay)
end

--任务对话
function ck_task_talk(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    local tSay = {}
    tinsert(tSay, format("\n%s/#_ck_task_award(%d)", "Ho祅 th祅h nhi謒 v�", nTaskIndex))
    if gDebug:is_debug() == 1 then
        --调试模式
        tinsert(tSay, format("\n%s/#ck_global_set_task_finish(%d)", "debugfinish", nTaskIndex))
    end
    tinsert(tSay, format("\n%s/nothing", "T筰 h� ch� xem qua th玦"))
    local szStatus = _ck_get_task_status(nTaskIndex)
    local Msg = format("T猲 nhi謒 v�: <color=gold>%s(%s)<color>\n襲 ki謓:\n  %s\nHng d蒼:\n  %s\nPh莕 thng:\n  EXP: %d,  n╪g ng: %d",
            t[2], szStatus, t[3][1], t[3][2], t[4][1], t[4][2])
    Say(CK_NPC_NAME .. Msg, getn(tSay), tSay)
end

function _ck_get_task_bitset(nTaskIndex)
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[5]
end

--获取随机任务
function _ck_rand_task_list(tTaskList, nCount, bPass)
    if nCount <= 0 then
        return
    end
    local nPass = 0
    local nMaxPass = 0
    local nGet = 0
    if bPass and bPass == 1 then
        if ck_GetTitleType() == 3 then
            --活跃者少一个任务
            nMaxPass = 1
        end
    end

    for i = 1, getn(tTaskList) do
        --先检查有没有任务
        local nTaskIndex = tTaskList[i][1]
        if type(nTaskIndex) == "table" then
            for j = 1, getn(nTaskIndex) do
                if _ck_check_task_getflag(nTaskIndex[j]) == 1 then
                    --已经有任务就不用随机了
                    return
                end
            end
        else
            if _ck_check_task_getflag(nTaskIndex) == 1 then
                --已经有任务就不用随机了
                return
            end
        end
    end

    for i = 1, getn(tTaskList) do
        --优先接取已随机过的任务
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
        --调试模式
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
            --调试模式
            print("condition false")
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --调试模式
            print(format("disable task %d", nTaskIndex))
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        Talk(1, "", "Kh玭g c� nhi謒 v� n祔")
        return 0
    end
    if _ck_check_task_awardflag(nTaskIndex) == 1 then
        Talk(1, "", "B筺  nh薾 ph莕 thng nhi謒 v� n祔 r錳!")
        return 0
    end
    if _ck_check_task_finishflag(nTaskIndex) ~= 1 then
        Talk(1, "", "Nhi謒 v� n祔 v蒼 ch璦 ho祅 th祅h!")
        return 0
    end

    local t = _ck_get_task_cfg(nTaskIndex)
    if t[4][3] and (t[4][3]() ~= 1) then
        --额外的奖励函数
        return 0
    end

    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBitAward = tBitSet[4]
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 1)
    local ext = t[4][4] or 0
    gf_ModifyExp(floor(t[4][1] * (1 + ext)))
    ck_AddCkScore(floor(t[4][2] * (1 + ext)))
    Msg2Player(format("Ch骳 m鮪g ho祅 th祅h nhi謒 v� [%s]", t[2]))

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
    local tType = { "Ch璦 ho祅 th祅h", "Ch璦 nh薾", "Ch璦 ho祅 th祅h", "C� th� giao", "Х ho祅 th祅h" }
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
    --设置已接受标志
    if gDebug:is_debug() == 1 then
        --调试模式
        print("_ck_set_task_getflag", nTaskIndex)
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --未开启任务不能接
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBit, 1)
    end
    return 1 --不需要接受
end

function _ck_check_task_getflag(nTaskIndex)
    --检查是否已接受任务
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --未开启任务不能接
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        local nRet = CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
        if gDebug:is_debug() == 1 then
            --调试模式
            print("task_getflag", nTaskIndex, nGroupTaskIndex, nBit, nRet)
        end
        return nRet
    end
    return 1 --不需要接受
end
function _ck_check_task_enable(nTaskIndex)
    --检查是否开启
    if not nTaskIndex or not T_CK_TASK_LIST[nTaskIndex] then
        --任务未定义
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[1]
end
function _ck_check_task_finishflag(nTaskIndex)
    --检查是否已完成
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --未开启任务不能接
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
    --检查是否已领取奖励
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --未开启任务不能接
        return 1
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[4]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
    end
    error(format("CDKey: award bit error %d", nTaskIndex))
    return 1 --奖励bit必须存在
end

function _ck_set_task_enable(nTaskIndex, nFlag)
    local t = _ck_get_task_cfg(nTaskIndex)
    t[1] = nFlag or 1
    --	if gDebug:is_debug() == 1 then--调试模式
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

--勇往直前系列任务
----------------------------------------------------------------------------
------------------------- 勇往直前任务现在已经关闭了 -------------------------
----------------------------------------------------------------------------
CK_TASK_FORWARD = {
    -- [1] = {"消灭恶狼", 226},
    -- [2] = {"消灭狐狸", 227},
    -- [3] = {"消灭蚩火赤教徒", 228},
    -- [4] = {"消灭苍猿", 229},
    -- [5] = {"消灭苗岭土司", 230},
    -- [6] = {"消灭波斯妖姬", 231},
    -- [7] = {"消灭倭国刀客", 232},
    -- [8] = {"消灭琵琶仙子", 233},
}

--百战不殆杀怪任务
CK_TASK_BZ_KILL = {
    [1] = { "Quay V� Ch鑞 C�", 234 },
    [2] = { "Quay V� Ch鑞 C�", 235 },
    [3] = { "Quay V� Ch鑞 C�", 236 },
    [4] = { "Quay V� Ch鑞 C�", 237 },
    [5] = { "Quay V� Ch鑞 C�", 238 },
}

--百战不殆副本任务(最多5个)
CK_TASK_BZ_RAID = {
    [1] = "Tham gia 1 l莕 秈 Th竔 H�",
    [2] = "Tham gia 1 l莕 秈 Lng S琻 ",
    [3] = "Tham gia 1 l莕 秈 V筺 Ki誱 Tr騨g",
    [4] = "Tham gia 1 l莕 秈 мa Huy襫 Cung",
    [5] = "Tham gia 1 l莕 秈 Th竔 Nh蕋 Th竝",
}

--百战不殆PVP任务  最多7个，不支持新增
CK_TASK_BZ_PVP = {
    -- [1] = "参与3次1v1比赛",
    [1] = "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh�-Nh�",
    [2] = "Tr錸g v� thu ho筩h 1 C﹜ T� Linh",
    [3] = "Tr錸g v� thu ho筩h 1 C﹜ H箃 Gi鑞g (m� t� t骾 h箃 gi鑞g mua t筰 Ng� C竎)",
    [4] = "Цnh b筰 1 ngi ch琲 phe ch c馻 th� l鵦 kh竎", --"参与一次天门阵战场",
    [5] = "Tham gia 1 l莕 Th玭 l祅g chi課",
    [6] = "Tham gia 1 l莕 Th秓 c鑓 chi課",
    [7] = "Tham gia 1 l莕 Ph竜 i chi課",
    -- [7] = "参与一次雁门主战役",
}

--数值累计任务
CK_TASK_ZILON_ATRR = {
    [1] = { "Gia Nh藀 Giang H�", { 0, 90, 1000, 1000, 10000 }, { 10000000, 100 } },
    [2] = { "Ti觰 H鱱 S� Th祅h", { 7, 90, 3000, 3000, 30000 }, { 20000000, 150 } },
    [3] = { "S� Xu蕋 Mao L�", { 8, 90, 6000, 6000, 40000 }, { 30000000, 200 } },
    [4] = { "Ti觰 H鱱 Danh Kh�", { 9, 90, 8000, 8000, 80000 }, { 40000000, 250 } },
    [5] = { "Чi Lang Уo Sa", { 10, 90, 10000, 10000, 120000 }, { 50000000, 300 } },
    [6] = { "Tr竛g Ch� L╪g V﹏", { 10, 91, 12000, 12000, 180000 }, { 60000000, 350 } },
    [7] = { "Uy Phong B竧 Di謓", { 10, 92, 15000, 15000, 250000 }, { 100000000, 400 } },
    [8] = { "Kh� Tr竛g H� S琻", { 10, 96, 16000, 16000, 350000 }, { 200000000, 500 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --并且扩展该table时会影响领奖状态bit位,必须更新客户端活动界面配置表
}
CK_TASK_ZILON_ATRR_BEGIN = 1
CK_TASK_INDEX_BEGIN_ZILON = 3001 --由cdk活动界面配置表里的TaskIndex决定

--天骄令消费任务
CK_TASK_IB_COST = {
    --[1] = {"财源滚滚", 5,   {12500000, 150}},
    --[2] = {"金玉满堂", 25,   {25000000, 300}},
    [1] = { "Phong Y T骳 Th鵦", 5, { 50000000, 300 } },
    [2] = { "Uy Phong B竧 Di謓", 25, { 100000000, 500 } },
    [3] = { "Gia C秐h Kh� Gi�", 50, { 150000000, 800 } },
    [4] = { "Чi Ph� Чi Qu�", 100, { 200000000, 1200 } },
    [5] = { "T礽 Чi Kh� Th�", 200, { 300000000, 1400 } },
    [6] = { "Gia T礽 V筺 Qu竛", 300, { 400000000, 1600 } },
    [7] = { "Ph� Gi竝 Thi猲 H�", 400, { 500000000, 1800 } },
    [8] = { "Ph� Kh� мch Qu鑓", 500, { 600000000, 2200 } },
    [9] = { "Ph� Li謙 Thi猲 T�", 800, { 800000000, 2600 } },
    [10] = { "H錸g Ph骳 Thi猲 H�", 1200, { 1000000000, 3000 } },
    [11] = { "T礽 Nguy猲 Cu錸 Cu閚", 1600, { 1500000000, 3500 } },
    [12] = { "Kim Ng鋍 M穘 Л阯g", 2000, { 2000000000, 4000 } },
    [13] = { "Чi Doanh Gia", 3000, { 2000000000, 5000 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --并且扩展该table时会影响领奖状态bit位,必须更新客户端活动界面配置表
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR) + 1
CK_TASK_INDEX_BEGIN_IB = 3101 --由cdk活动界面配置表里的TaskIndex决定

CK_JS_GUAIYI = {
    { "竜 Cho祅g Ng� H祅h Kim Ch�", { 0, 152, 4, 1, 4 } },
    { "竜 Cho祅g Ng� H祅h M閏 Ch�", { 0, 152, 5, 1, 4 } },
    { "竜 Cho祅g Ng� H祅h Th駓 Ch�", { 0, 152, 6, 1, 4 } },
    { "竜 Cho祅g Ng� H祅h H醓 Ch�", { 0, 152, 7, 1, 4 } },
    { "竜 Cho祅g Ng� H祅h Th� Ch�", { 0, 152, 8, 1, 4 } },
    { "竜 Cho祅g Ng� H祅h  Ch�", { 0, 152, 9, 1, 4 } },
}
CK_JS_HUIZHANG = {
    { "Huy Chng Kim Ch� ng� h祅h", { 0, 153, 4, 1, 4 } },
    { "Huy Chng M閏 Ch� ng� h祅h", { 0, 153, 5, 1, 4 } },
    { "Huy Chng Th駓 Ch� ng� h祅h", { 0, 153, 6, 1, 4 } },
    { "Huy Chng H醓 Ch� ng� h祅h", { 0, 153, 7, 1, 4 } },
    { "Huy Chng Th� Ch� ng� h祅h", { 0, 153, 8, 1, 4 } },
    { "Huy Chng  Ch� ng� h祅h", { 0, 153, 9, 1, 4 } },
}
CK_JS_SHOE = {
    { "Chi課 H礽 Kim Ch� ng� h祅h", { 0, 154, 4, 1, 4 } },
    { "Chi課 H礽 M閏 Ch� ng� h祅h", { 0, 154, 5, 1, 4 } },
    { "Chi課 H礽 Th駓 Ch� ng� h祅h", { 0, 154, 6, 1, 4 } },
    { "Chi課 H礽 H醓 Ch� ng� h祅h", { 0, 154, 7, 1, 4 } },
    { "Chi課 H礽 Th� Ch� ng� h祅h", { 0, 154, 8, 1, 4 } },
    { "Chi課 H礽  Ch� ng� h祅h", { 0, 154, 9, 1, 4 } },
}

CK_YAOYANG_JIEZI_1 = {
    { "Di謚 Dng-� L﹏ B秓 Gi韎", { 0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-T� Giao Ng鋍 B閕", { 0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-V﹏ H� L謓h", { 0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-X輈h Tc Ho祅", { 0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-B輈h Quy Li猲", { 0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_YAOYANG_JIEZI_2 = {
    { "Di謚 Dng-� L﹏ B秓 Gi韎", { 0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-T� Giao Ng鋍 B閕", { 0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-V﹏ H� L謓h", { 0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-X輈h Tc Ho祅", { 0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di謚 Dng-B輈h Quy Li猲", { 0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_4_LEVEL_YUNLING = {
    { "H-Li謙 Nham-Lv4", { 0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph� Kh玭g-Lv4", { 0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T髖 Ki誱-Lv4", { 0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T藅 Phong-Lv4", { 0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T蕁 V�-Lv4", { 0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-g T藀-Lv4", { 0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T﹎-Lv4", { 0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Th莕 L鵦-Lv4", { 0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng璶g Th莕-Lv4", { 0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� Gian-Lv4", { 0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� C鵦-Lv4", { 0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cu錸g Nh蒼-Lv4", { 0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L╪g Nhu�-Lv4", { 0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Vi猲-Lv4", { 0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H秈 V薾-Lv4", { 0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H秈 T﹎-Lv4", { 0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Li謙 Nham-Lv4", { 0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph� Kh玭g-Lv4", { 0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T髖 Ki誱-Lv4", { 0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T藅 Phong-Lv4", { 0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T蕁 V�-Lv4", { 0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu竛 Th筩h-Lv4", { 0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-N� Ng﹎-Lv4", { 0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuy猲 V﹏-Lv4", { 0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Th莕 L鵦-Lv4", { 0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng璶g Th莕-Lv4", { 0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� Gian-Lv4", { 0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� C鵦-Lv4", { 0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cu錸g Nh蒼-Lv4", { 0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L╪g Nhu�-Lv4", { 0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Vi猲-Lv4", { 0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H秈 V薾-Lv4", { 0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H秈 T﹎-Lv4", { 0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Li謙 Nham-Lv4", { 0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh玭g-Lv4", { 0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T髖 Ki誱-Lv4", { 0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T藅 Phong-Lv4", { 0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T蕁 V�-Lv4", { 0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Lng-Lv4", { 0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M鬰 Minh-Lv4", { 0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th莕 L鵦-Lv4", { 0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng璶g Th莕-Lv4", { 0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv4", { 0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C鵦-Lv4", { 0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu錸g Nh蒼-Lv4", { 0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L╪g Nhu�-Lv4", { 0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi猲-Lv4", { 0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 V薾-Lv4", { 0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 T﹎-Lv4", { 0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_5_LEVEL_YUNLING = {
    { "H-Li謙 Nham-Lv5", { 0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph� Kh玭g-Lv5", { 0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T髖 Ki誱-Lv5", { 0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T藅 Phong-Lv5", { 0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T蕁 V�-Lv5", { 0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-g T藀-Lv5", { 0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T﹎-Lv5", { 0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Th莕 L鵦-Lv5", { 0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng璶g Th莕-Lv5", { 0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� Gian-Lv5", { 0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� C鵦-Lv5", { 0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cu錸g Nh蒼-Lv5", { 0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L╪g Nhu�-Lv5", { 0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Vi猲-Lv5", { 0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H秈 V薾-Lv5", { 0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H秈 T﹎-Lv5", { 0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Li謙 Nham-Lv5", { 0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph� Kh玭g-Lv5", { 0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T髖 Ki誱-Lv5", { 0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T藅 Phong-Lv5", { 0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T蕁 V�-Lv5", { 0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu竛 Th筩h-Lv5", { 0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-N� Ng﹎-Lv5", { 0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuy猲 V﹏-Lv5", { 0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Th莕 L鵦-Lv5", { 0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng璶g Th莕-Lv5", { 0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� Gian-Lv5", { 0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� C鵦-Lv5", { 0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cu錸g Nh蒼-Lv5", { 0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L╪g Nhu�-Lv5", { 0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Vi猲-Lv5", { 0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H秈 V薾-Lv5", { 0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H秈 T﹎-Lv5", { 0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Li謙 Nham-Lv5", { 0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh玭g-Lv5", { 0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T髖 Ki誱-Lv5", { 0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T藅 Phong-Lv5", { 0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T蕁 V�-Lv5", { 0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Lng-Lv5", { 0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M鬰 Minh-Lv5", { 0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th莕 L鵦-Lv5", { 0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng璶g Th莕-Lv5", { 0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv5", { 0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C鵦-Lv5", { 0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu錸g Nh蒼-Lv5", { 0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L╪g Nhu�-Lv5", { 0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi猲-Lv5", { 0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 V薾-Lv5", { 0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 T﹎-Lv5", { 0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_6_LEVEL_YUNLING = {
    { "T-Li謙 Nham-Lv6", { 0, 150, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh玭g-Lv6", { 0, 150, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T髖 Ki誱-Lv6", { 0, 150, 87, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T藅 Phong-Lv6", { 0, 150, 88, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T蕁 V�-Lv6", { 0, 150, 89, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Lng-Lv6", { 0, 150, 90, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M鬰 Minh-Lv6", { 0, 150, 91, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th莕 L鵦-Lv6", { 0, 150, 92, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng璶g Th莕-Lv6", { 0, 150, 93, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv6", { 0, 150, 94, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C鵦-Lv6", { 0, 150, 95, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu錸g Nh蒼-Lv6", { 0, 150, 96, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L╪g Nhu�-Lv6", { 0, 150, 97, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi猲-Lv6", { 0, 150, 98, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 V薾-Lv6", { 0, 150, 99, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H秈 T﹎-Lv6", { 0, 150, 100, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

function ck_GiveRandGem456()
    --Faction Cloth 9
    local VET_RandGem456 = {
        { 1, 20, "Huy誸Tr輈hTh筩h Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 20, "Nguy謙B筩hTh筩h Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 20, "H� Ph竎h Th筩h C蕄 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 20, "H綾 Di謚 Th筩h C蕄 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 4, "Huy誸Tr輈hTh筩h Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 4, "Nguy謙B筩hTh筩h Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 4, "H� Ph竎h Th筩h C蕄 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 4, "H綾 Di謚 Th筩h C蕄 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Huy誸Tr輈hTh筩h Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Nguy謙B筩hTh筩h Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H� Ph竎h Th筩h C蕄 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H綾 Di謚 Th筩h C蕄 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
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
    -- 需要等级和复生丹
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
end    -- 7转 需要694级
function judge_translife_needLv_692()
    return judge_translife_needLv(692)
end    -- 7转 需要694级
function judge_translife_needLv_792()
    return judge_translife_needLv(792)
end
function judge_translife_needLv_796()
    return judge_translife_needLv(796)
end    -- 8转 需要796
function judge_translife_needLv_794()
    return judge_translife_needLv(794)
end    -- 8转 需要794
function judge_translife_needLv_793()
    return judge_translife_needLv(793)
end    -- 8转 需要793
function judge_translife_needLv_896()
    return judge_translife_needLv(896)
end    -- 9转 需要896
function judge_translife_needLv_894()
    return judge_translife_needLv(894)
end    -- 9转 需要894
function judge_translife_needLv_893()
    return judge_translife_needLv(893)
end    -- 9转 需要893
function judge_translife_needLv_892()
    return judge_translife_needLv(892)
end    -- 9转 需要892

function judge_translife_needLv_992()
    return judge_translife_needLv(992)
end    -- 10转 需要992

function judge_translife_needLv_997_fsd_5()
    return judge_translife_needLv_and_fushendan(997, 5)
end    -- 10转 需要997, 5个复生丹
function judge_translife_needLv_995_fsd_3()
    return judge_translife_needLv_and_fushendan(995, 3)
end    -- 10转 需要995, 3个复生丹
function judge_translife_needLv_994_fsd_3()
    return judge_translife_needLv_and_fushendan(994, 3)
end    -- 10转 需要994, 3个复生丹
function judge_translife_needLv_994_fsd_2()
    return judge_translife_needLv_and_fushendan(994, 2)
end    -- 10转 需要994, 2个复生丹
function judge_translife_needLv_994_fsd_1()
    return judge_translife_needLv_and_fushendan(994, 1)
end    -- 10转 需要994, 1个复生丹

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
        gf_SetTaskByte(1538, 1, 5);            --5转
        SetLevel(90, 1);                                  --90级
        Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
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
            gf_SetTaskByte(1538, 1, 5);            --1转
            PlayerReborn(2, random(1, 4))
            SetLevel(73, 1);                        --73级
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
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
            gf_SetTaskByte(1538, 1, 5);            --1转
            PlayerReborn(2, random(1, 4))
            SetLevel(90, 1);                        --73级
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
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
        { "Chi課 Cu錸g Thi猲 мa M筼", { 0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi課 Cu錸g Thi猲 мa M筼", { 0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi課 Cu錸g Thi猲 T玭 M筼", { 0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi課 Cu錸g Thi猲 T玭 M筼", { 0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi課 Cu錸g Ph� T� M筼", { 0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi課 Cu錸g Ph� T� M筼", { 0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi課 Cu錸g Tuy謙 M謓h Qu竛", { 0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Qu竛", { 0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Qu竛", { 0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Qu竛", { 0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi課 Cu錸g B� T竧 Tr﹎", { 0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi課 Cu錸g B� T竧 Tr﹎", { 0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi課 Cu錸g L璾 Th駓 Tr﹎", { 0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi課 Cu錸g L璾 Th駓 Tr﹎", { 0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi課 Cu錸g Th莕 Du C﹏", { 0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi課 Cu錸g Th莕 Du C﹏", { 0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi課 Cu錸g Th莕 Du C﹏", { 0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi課 Cu錸g Th莕 Du C﹏", { 0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi課 Cu錸g Ti猽 Dao C﹏", { 0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi課 Cu錸g Ti猽 Dao C﹏", { 0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi課 Cu錸g Ti猽 Dao C﹏", { 0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi課 Cu錸g Ti猽 Dao C﹏", { 0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi課 Cu錸g V� Vi Qu竛", { 0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi課 Cu錸g V� Vi Qu竛", { 0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi課 Cu錸g V� Vi Qu竛", { 0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi課 Cu錸g V� Vi Qu竛", { 0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi課 Cu錸g C祅 Kh玭 Qu竛", { 0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Qu竛", { 0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Qu竛", { 0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Qu竛", { 0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi課 Cu錸g Thi猲 Tinh  Kh玦", { 0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Kh玦", { 0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Kh玦", { 0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Kh玦", { 0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Kh玦", { 0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Kh玦", { 0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Kh玦", { 0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Kh玦", { 0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi課 Cu錸g Minh T玭 C﹏", { 0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi課 Cu錸g Minh T玭 C﹏", { 0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi課 Cu錸g Minh T玭 C﹏", { 0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi課 Cu錸g Minh T玭 C﹏", { 0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi課 Cu錸g C� T﹎ C﹏", { 0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi課 Cu錸g C� T﹎ C﹏", { 0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi課 Cu錸g C� T﹎ C﹏", { 0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi課 Cu錸g C� T﹎ C﹏", { 0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi課 Cu錸g Phong L玦 Qu竛", { 0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi課 Cu錸g Phong L玦 Qu竛", { 0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi課 Cu錸g Чi мa C﹏", { 0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi課 Cu錸g Чi мa C﹏", { 0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi課 Cu錸g Чi мa C﹏", { 0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi課 Cu錸g Чi мa C﹏", { 0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi課 Cu錸g T髖 M閚g Qu竛", { 0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi課 Cu錸g T髖 M閚g Qu竛", { 0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi課 Cu錸g T髖 M閚g Qu竛", { 0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi課 Cu錸g T髖 M閚g Qu竛", { 0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi課 Cu錸g Ma V鵦  Qu竛", { 0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi課 Cu錸g Ma V鵦  Qu竛", { 0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi課 Cu錸g Ma V鵦  Qu竛", { 0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi課 Cu錸g Ma V鵦  Qu竛", { 0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi課 Cu錸g Th竛h N�  Tr﹎", { 0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi課 Cu錸g Th竛h N�  Tr﹎", { 0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi課 Cu錸g Th竛h Linh Tr﹎", { 0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi課 Cu錸g Th竛h Linh Tr﹎", { 0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },

        -- 任侠
        { "Chi課 Cu錸g B祅 V﹏ Qu竛", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Qu竛", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Qu竛", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Qu竛", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- 剑尊
        { "Chi課 Cu錸g Tr秏 Ma Qu竛", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Qu竛", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Qu竛", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Qu竛", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tCloth = {
        { "Chi課 Cu錸g Thi猲 мa B祇", { 0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi課 Cu錸g Thi猲 мa B祇", { 0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi課 Cu錸g Thi猲 T玭 B祇", { 0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi課 Cu錸g Thi猲 T玭 B祇", { 0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi課 Cu錸g Ph� T� B祇", { 0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi課 Cu錸g Ph� T� B祇", { 0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi課 Cu錸g Tuy謙 M謓h Y", { 0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Y", { 0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Y", { 0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Y", { 0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi課 Cu錸g B� T竧 Y", { 0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi課 Cu錸g B� T竧 Y", { 0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi課 Cu錸g L璾 Th駓Y", { 0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi課 Cu錸g L璾 Th駓Y", { 0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi課 Cu錸g Th莕 Du Y", { 0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi課 Cu錸g Th莕 Du Y", { 0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi課 Cu錸g Th莕 Du Y", { 0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi課 Cu錸g Th莕 Du Y", { 0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi課 Cu錸g Ti猽 Dao Y", { 0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Y", { 0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Y", { 0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Y", { 0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi課 Cu錸g V� Vi B祇", { 0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi課 Cu錸g V� Vi B祇", { 0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi課 Cu錸g V� Vi B祇", { 0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi課 Cu錸g V� Vi B祇", { 0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi課 Cu錸g C祅 Kh玭 B祇", { 0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 B祇", { 0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 B祇", { 0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 B祇", { 0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi課 Cu錸g Thi猲 Tinh  Gi竝", { 0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Gi竝", { 0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Gi竝", { 0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Gi竝", { 0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Gi竝", { 0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Gi竝", { 0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Gi竝", { 0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Gi竝", { 0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi課 Cu錸g Minh T玭 Y", { 0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi課 Cu錸g Minh T玭 Y", { 0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi課 Cu錸g Minh T玭 Y", { 0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi課 Cu錸g Minh T玭 Y", { 0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi課 Cu錸g C� T﹎ Y", { 0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi課 Cu錸g C� T﹎ Y", { 0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi課 Cu錸g C� T﹎ Y", { 0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi課 Cu錸g C� T﹎ Y", { 0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi課 Cu錸g Phong L玦 B祇", { 0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi課 Cu錸g Phong L玦 B祇", { 0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi課 Cu錸g Чi мa Y", { 0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi課 Cu錸g Чi мa Y", { 0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi課 Cu錸g Чi мa Y", { 0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi課 Cu錸g Чi мa Y", { 0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi課 Cu錸g T髖 M閚g B祇", { 0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi課 Cu錸g T髖 M閚g B祇", { 0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi課 Cu錸g T髖 M閚g B祇", { 0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi課 Cu錸g T髖 M閚g B祇", { 0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi課 Cu錸g Ma V鵦  B祇", { 0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi課 Cu錸g Ma V鵦  B祇", { 0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi課 Cu錸g Ma V鵦  B祇", { 0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi課 Cu錸g Ma V鵦  B祇", { 0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi課 Cu錸g Th竛h N�  Y", { 0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi課 Cu錸g Th竛h N�  Y", { 0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi課 Cu錸g Th竛h Linh Y", { 0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi課 Cu錸g Th竛h Linh Y", { 0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- 任侠
        { "Chi課 Cu錸g B祅 V﹏ B祇", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi課 Cu錸g B祅 V﹏ B祇", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi課 Cu錸g B祅 V﹏ B祇", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi課 Cu錸g B祅 V﹏ B祇", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- 剑尊
        { "Chi課 Cu錸g Tr秏 Ma B祇", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi課 Cu錸g Tr秏 Ma B祇", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi課 Cu錸g Tr秏 Ma B祇", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi課 Cu錸g Tr秏 Ma B祇", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tShoe = {
        { "Chi課 Cu錸g Thi猲 мa Trang", { 0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi課 Cu錸g Thi猲 мa Trang", { 0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi課 Cu錸g Thi猲 T玭 Trang", { 0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi課 Cu錸g Thi猲 T玭 Trang", { 0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi課 Cu錸g Ph� T� Trang", { 0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi課 Cu錸g Ph� T� Trang", { 0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi課 Cu錸g Tuy謙 M謓h Trang", { 0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Trang", { 0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Trang", { 0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi課 Cu錸g Tuy謙 M謓h Trang", { 0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi課 Cu錸g B� T竧 Kh�", { 0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi課 Cu錸g B� T竧 Kh�", { 0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi課 Cu錸g L璾 Th駓Kh�", { 0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi課 Cu錸g L璾 Th駓Kh�", { 0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi課 Cu錸g Th莕 Du Trang", { 0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi課 Cu錸g Th莕 Du Trang", { 0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi課 Cu錸g Th莕 Du Trang", { 0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi課 Cu錸g Th莕 Du Trang", { 0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi課 Cu錸g Ti猽 Dao Trang", { 0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Trang", { 0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Trang", { 0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi課 Cu錸g Ti猽 Dao Trang", { 0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi課 Cu錸g V� Vi Trang", { 0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi課 Cu錸g V� Vi Trang", { 0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi課 Cu錸g V� Vi Trang", { 0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi課 Cu錸g V� Vi Trang", { 0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi課 Cu錸g C祅 Kh玭 Trang", { 0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Trang", { 0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Trang", { 0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi課 Cu錸g C祅 Kh玭 Trang", { 0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi課 Cu錸g Thi猲 Tinh  Trang", { 0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Trang", { 0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Trang", { 0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi課 Cu錸g Thi猲 Tinh  Trang", { 0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Trang", { 0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Trang", { 0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Trang", { 0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi課 Cu錸g Xuy猲 V﹏ Trang", { 0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi課 Cu錸g Minh T玭 Trang", { 0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi課 Cu錸g Minh T玭 Trang", { 0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi課 Cu錸g Minh T玭 Trang", { 0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi課 Cu錸g Minh T玭 Trang", { 0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi課 Cu錸g C� T﹎ Trang", { 0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi課 Cu錸g C� T﹎ Trang", { 0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi課 Cu錸g C� T﹎ Trang", { 0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi課 Cu錸g C� T﹎ Trang", { 0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi課 Cu錸g Phong L玦 Trang", { 0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi課 Cu錸g Phong L玦 Trang", { 0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi課 Cu錸g Чi мa Trang", { 0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi課 Cu錸g Чi мa Trang", { 0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi課 Cu錸g Чi мa Trang", { 0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi課 Cu錸g Чi мa Trang", { 0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi課 Cu錸g T髖 M閚g Trang", { 0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi課 Cu錸g T髖 M閚g Trang", { 0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi課 Cu錸g T髖 M閚g Trang", { 0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi課 Cu錸g T髖 M閚g Trang", { 0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi課 Cu錸g Ma V鵦  Trang", { 0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi課 Cu錸g Ma V鵦  Trang", { 0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi課 Cu錸g Ma V鵦  Trang", { 0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi課 Cu錸g Ma V鵦  Trang", { 0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi課 Cu錸g Th竛h N�  Kh�", { 0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi課 Cu錸g Th竛h N�  Kh�", { 0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi課 Cu錸g Th竛h Linh Kh�", { 0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi課 Cu錸g Th竛h Linh Kh�", { 0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- 任侠
        { "Chi課 Cu錸g B祅 V﹏ Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- 剑尊
        { "Chi課 Cu錸g Tr秏 Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tWeapon = {
        { "Chi課 Cu錸g B╪g Thi猲 o", { 0, 3, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi課 Cu錸g B╪g Thi猲 o", { 0, 3, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi課 Cu錸g Thi襫 мnh Trng", { 0, 8, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi課 Cu錸g Thi襫 мnh Trng", { 0, 8, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi課 Cu錸g Th竛h Chi課 Th�", { 0, 0, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi課 Cu錸g Th竛h Chi課 Th�", { 0, 0, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi課 Cu錸g 箃 H錸 Ch﹎", { 0, 1, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi課 Cu錸g 箃 H錸 Ch﹎", { 0, 1, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi課 Cu錸g 箃 H錸 Ch﹎", { 0, 1, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi課 Cu錸g 箃 H錸 Ch﹎", { 0, 1, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi課 Cu錸g Ph藅 Quang Ki誱", { 0, 2, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi課 Cu錸g Ph藅 Quang Ki誱", { 0, 2, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi課 Cu錸g H� Bang C莔", { 0, 10, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi課 Cu錸g H� Bang C莔", { 0, 10, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi課 Cu錸g Tr鮪g 竎 Th�", { 0, 0, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi課 Cu錸g Tr鮪g 竎 Th�", { 0, 0, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi課 Cu錸g Tr鮪g 竎 Th�", { 0, 0, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi課 Cu錸g Tr鮪g 竎 Th�", { 0, 0, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi課 Cu錸g V� C鵦 C玭", { 0, 5, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi課 Cu錸g V� C鵦 C玭", { 0, 5, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi課 Cu錸g V� C鵦 C玭", { 0, 5, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi課 Cu錸g V� C鵦 C玭", { 0, 5, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi課 Cu錸g Khu Ma Ki誱", { 0, 2, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi課 Cu錸g Khu Ma Ki誱", { 0, 2, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi課 Cu錸g Khu Ma Ki誱", { 0, 2, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi課 Cu錸g Khu Ma Ki誱", { 0, 2, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi課 Cu錸g Thng Khung B髏", { 0, 9, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi課 Cu錸g Thng Khung B髏", { 0, 9, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi課 Cu錸g Thng Khung B髏", { 0, 9, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi課 Cu錸g Thng Khung B髏", { 0, 9, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi課 Cu錸g Th莕 K輈h Thng", { 0, 6, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi課 Cu錸g Th莕 K輈h Thng", { 0, 6, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi課 Cu錸g Th莕 K輈h Thng", { 0, 6, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi課 Cu錸g Th莕 K輈h Thng", { 0, 6, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi課 Cu錸g Xung Thi猲 Cung", { 0, 4, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi課 Cu錸g Xung Thi猲 Cung", { 0, 4, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi課 Cu錸g Xung Thi猲 Cung", { 0, 4, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi課 Cu錸g Xung Thi猲 Cung", { 0, 4, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi課 Cu錸g Luy謓 Ng鬰 o", { 0, 7, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi課 Cu錸g Luy謓 Ng鬰 o", { 0, 7, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi課 Cu錸g Luy謓 Ng鬰 o", { 0, 7, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi課 Cu錸g Luy謓 Ng鬰 o", { 0, 7, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi課 Cu錸g Nhi誴 H錸 Tr秓", { 0, 11, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi課 Cu錸g Nhi誴 H錸 Tr秓", { 0, 11, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi課 Cu錸g Nhi誴 H錸 Tr秓", { 0, 11, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi課 Cu錸g Nhi誴 H錸 Tr秓", { 0, 11, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi課 Cu錸g Thi猲 Ph箃 Ki誱", { 0, 2, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi課 Cu錸g Thi猲 Ph箃 Ki誱", { 0, 2, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi課 Cu錸g Ch骳 Dung o", { 0, 3, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi課 Cu錸g Ch骳 Dung o", { 0, 3, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi課 Cu錸g Ch骳 Dung o", { 0, 3, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi課 Cu錸g Ch骳 Dung o", { 0, 3, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi課 Cu錸g T� M謓h B髏", { 0, 9, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi課 Cu錸g T� M謓h B髏", { 0, 9, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi課 Cu錸g T� M謓h B髏", { 0, 9, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi課 Cu錸g T� M謓h B髏", { 0, 9, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi課 Cu錸g Truy H錸 Tr秓", { 0, 11, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi課 Cu錸g Truy H錸 Tr秓", { 0, 11, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi課 Cu錸g Truy H錸 Tr秓", { 0, 11, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi課 Cu錸g Truy H錸 Tr秓", { 0, 11, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi課 Cu錸g Phong Linh Phi課", { 0, 13, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi課 Cu錸g Phong Linh Phi課", { 0, 13, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi課 Cu錸g Kh玭g Minh мch", { 0, 12, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi課 Cu錸g Kh玭g Minh мch", { 0, 12, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        { "Chi課 Cu錸g B祅 V﹏ Ch駓", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Ch駓", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Ch駓", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi課 Cu錸g B祅 V﹏ Ch駓", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        { "Chi課 Cu錸g Tr秏 Ma Ki誱", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Ki誱", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Ki誱", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi課 Cu錸g Tr秏 Ma Ki誱", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
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
    --完成宠物复生2任务，VNG功能？
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
        { 1, 25, "Huy誸Tr輈hTh筩h Lv3", { 2, 22, 103, 1 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv3", { 2, 22, 203, 1 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 3", { 2, 22, 303, 1 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 3", { 2, 22, 403, 1 }, nil, nil, nil, nil },
        { 1, 24, "Huy誸Tr輈hTh筩h Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 24, "Nguy謙B筩hTh筩h Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 24, "H� Ph竎h Th筩h C蕄 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 24, "H綾 Di謚 Th筩h C蕄 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 1, "Huy誸Tr輈hTh筩h Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Nguy謙B筩hTh筩h Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H� Ph竎h Th筩h C蕄 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H綾 Di謚 Th筩h C蕄 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
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
    Msg2Player(format("Nh薾 頲 danh hi謚 [%s]", "Nhi謒 V� Чt Nh﹏"))
end

function award_tong_title3()
    SendScript2VM("\\script\\isolate\\functions\\tong_title\\tong_title.lua", format("force_give_max_lv(%d)", 3))
    Msg2Player(format("Nh薾 頲 danh hi謚 [%s]", "Kim Lan"))
end

function award_random_gem1_1()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv1", { 2, 22, 101, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv1", { 2, 22, 201, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 1", { 2, 22, 301, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 1", { 2, 22, 401, 10, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem1_2()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv1", { 2, 22, 101, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv1", { 2, 22, 201, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 1", { 2, 22, 301, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 1", { 2, 22, 401, 20, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_1()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv2", { 2, 22, 102, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv2", { 2, 22, 202, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 2", { 2, 22, 302, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 2", { 2, 22, 402, 8, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_2()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv2", { 2, 22, 102, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv2", { 2, 22, 202, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 2", { 2, 22, 302, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 2", { 2, 22, 402, 12, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_4()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv3", { 2, 22, 103, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv3", { 2, 22, 203, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 3", { 2, 22, 303, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 3", { 2, 22, 403, 4, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_5()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv3", { 2, 22, 103, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv3", { 2, 22, 203, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 3", { 2, 22, 303, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 3", { 2, 22, 403, 5, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_7()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv3", { 2, 22, 103, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv3", { 2, 22, 203, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 3", { 2, 22, 303, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 3", { 2, 22, 403, 7, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_9()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv3", { 2, 22, 103, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv3", { 2, 22, 203, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 3", { 2, 22, 303, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 3", { 2, 22, 403, 9, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem4_3()
    local VET_RandGem = {
        { 1, 25, "Huy誸Tr輈hTh筩h Lv4", { 2, 22, 104, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv4", { 2, 22, 204, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 4", { 2, 22, 304, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 4", { 2, 22, 404, 3, 4 }, nil, nil, nil, nil },
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
        { 1, 25, "Huy誸Tr輈hTh筩h Lv6", { 2, 22, 106, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙B筩hTh筩h Lv6", { 2, 22, 206, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h C蕄 6", { 2, 22, 306, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h C蕄 6", { 2, 22, 406, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem7_1()
    local VET_RandGem = {
        { 1, 25, "Huy誸 Tr輈h Th筩h c蕄 7", { 2, 22, 107, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙 B筩h Th筩h c蕄 7", { 2, 22, 207, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h c蕄 7", { 2, 22, 307, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h c蕄 7", { 2, 22, 407, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end
function award_random_gem7_2()
    local VET_RandGem = {
        { 1, 25, "Huy誸 Tr輈h Th筩h c蕄 7", { 2, 22, 107, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy謙 B筩h Th筩h c蕄 7", { 2, 22, 207, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph竎h Th筩h c蕄 7", { 2, 22, 307, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "H綾 Di謚 Th筩h c蕄 7", { 2, 22, 407, 2, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook5()
    local VET_RandGem = {
        { 1, 30, "輈h Th� Di猲 Dng C蕄 5", { 2, 150, 68, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "Cng Th﹏ B� Th� C蕄 5", { 2, 150, 69, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Huy襫 V� V� Song C蕄 5", { 2, 150, 71, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Ph� Kh玭g Tr秏 秐h C蕄 5", { 2, 150, 78, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Khinh Linh T蕁 T藅 C蕄 5", { 2, 150, 80, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook6()
    local VET_RandGem = {
        { 1, 10, "Ng璶g Th莕 Quy誸 Lv2", { 2, 150, 103, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Kinh Уo Quy誸 Lv2", { 2, 150, 104, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Linh Quang Thi觤 Lv2", { 2, 150, 102, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "V� H譶h Chi C� Lv6", { 2, 150, 101, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Khinh Linh T蕁 T藅 Lv6", { 2, 150, 100, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_8zhuan10()
    if gf_GetTransLevel() >= 796 then
        if gf_GetPlayerRebornCount() < 8 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(3, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
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
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
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
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 1000000000);
        end
    end
end

function award_10zhuan10_need997cost5fsd()
    if judge_translife_needLv_997_fsd_5() == 0 then
        Talk(1, "", format("    <color=gold>Чt n CS %d Lv%d, t鑞 %d Ph鬰 Sinh Кn<color>", 9, 97, 5))
    end
    if gf_GetTransLevel() >= 997 and DelItem(2, 1, 30814, 5) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end
function award_10zhuan10_need995cost3fsd()
    if judge_translife_needLv_995_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>Чt n CS %d Lv%d, t鑞 %d Ph鬰 Sinh Кn<color>", 9, 95, 3))
    end
    if gf_GetTransLevel() >= 995 and DelItem(2, 1, 30814, 3) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th╪g c蕄 chuy觧 sinh th祅h c玭g!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end

function award_10zhuan90_need994cost3fsd()
    if judge_translife_needLv_994_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>Чt n CS %d Lv%d, t鑞 %d Ph鬰 Sinh Кn<color>", 9, 94, 3))
        return
    end
    if DelItem(2, 1, 30814, 3) == 1 then
        ck_award_reborn(10, 90, 2000000000)
    end
end

function award_10zhuan94_need994cost1fsd()
    if judge_translife_needLv_994_fsd_1() == 0 then
        Talk(1, "", format("    <color=gold>Чt n CS %d Lv%d, t鑞 %d Ph鬰 Sinh Кn<color>", 9, 94, 1))
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
        Talk(1, "", format("C莕 %d <color=red>C鰑 Thi猲 V� C鵦 Кn<color>  i <color=gold>V� H� H祇 Hi謕 L謓h (V� kh�)<color>!", 2))
        return
    end
    if DelItem(2, 1, 1006, 2) == 1 then
        gf_AddItemEx({ 2, 1, 30973, 1, 4 }, "V� H� H祇 Hi謕 L謓h (V� kh�)");
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
    "select", "T� ch鋘 1 m鉵 Kim X� Lv5",
    {
        { "item", "Huy chng Hi謕 C鑤", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy chng Q駓 Ph�", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy chng Щng V﹏", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "竜 kho竎 Hi謕 C鑤", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "竜 kho竎 Q駓 Ph�", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "竜 kho竎 Щng V﹏", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hi謕 C鑤 Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Q駓 Ph� Chi課 Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Щng V﹏ Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_5Star_Jinshe9 = {
    "select", "T� ch鋘 1 m鉵 Kim X� Lv5 (Cng h鉧 +9)",
    {
        { "item", "Huy chng Hi謕 C鑤", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy chng Q駓 Ph�", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy chng Щng V﹏", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "竜 kho竎 Hi謕 C鑤", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "竜 kho竎 Q駓 Ph�", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "竜 kho竎 Щng V﹏", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Hi謕 C鑤 Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Q駓 Ph� Chi課 Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Щng V﹏ Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_6Star_Jinshe = {
    "select", "T� ch鋘 1 m鉵 Kim X� Lv6",
    {
        { "item", "Hoan L╪g Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Щng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh雐 Phng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L╪g Chng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Щng Giao Chng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh雐 Phng Chng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L╪g Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Щng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh雐 Phng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_6Star_Jinshe9 = {
    "select", "T� ch鋘 1 m鉵 Kim X� Lv6 (Cng h鉧 +9)",
    {
        { "item", "Hoan L╪g Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Щng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh雐 Phng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L╪g Chng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Щng Giao Chng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh雐 Phng Chng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L╪g Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Щng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh雐 Phng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_Select_ShaXing = {
    "select", "T� Ch鋘 L謓h B礽 Trang B� S竧 Tinh (u, ?o, Qu莕)",
    {
        { "item", "S竧 Tinh L謓h B礽 (u)", { 2, 1, 31313, 1, 4 } },
        { "item", "S竧 Tinh L謓h B礽 (竜)", { 2, 1, 31314, 1, 4 } },
        { "item", "S竧 Tinh L謓h B礽 (Qu莕)", { 2, 1, 31315, 1, 4 } },
    },
}

CK_TASK_INDEX_BEGIN_SCORE_AWARD = 10001
CK_SCROE_AWARD_TABLE = {
    [1] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 1000, 10000000, 160, 160, 1400, 0, 177 },
        { "item", "Ma Tinh", { 2, 1, 30497, 500, 4 } },
        { "func", format("Chuy觧 sinh %d c蕄 %d", 7, 90), ck_award_reborn, { 7, 90, 20000000 } },
        { "func", "Ф th玭g c秐h gi韎 V� Hi襫", award_wuzhe },
        { "func", "N鉵 chi課 cu錸g+9", award_zhankuangtou },
    },
    [2] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 1700, 30000000, 280, 280, 2200, 0, 179 },
        { "func", "Ф th玭g c秐h gi韎 V� Tng", award_wujiang },
        { "func", "竜 chi課 cu錸g+9", award_zhankuangyi },
        { "func", "Qu莕 chi課 cu錸g+9", award_zhankuangku },
        { "item", "L╪g Ba Vi B�", { 0, 112, 78, 1, 4 } },
    },
    [3] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 2000, 40000000, 340, 340, 2600, 30000, 180 },
        { "func", "Ф th玭g c秐h gi韎 V� Vng", award_wuwang },
        { "func", "V� kh� chi課 cu錸g+9", award_zhankuangwuqi },
    },
    [4] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 2400, 50000000, 400, 400, 3000, 0, 181 },
        { "item", "T� Ch鋘 B� Kim X� Lv4", { 2, 1, 31516, 1, 4 } },
    },
    [5] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 2800, 50000000, 460, 460, 3400, 30000, 182 },
        { "item", "V� H� H祇 Hi謕 L謓h (竜)", { 2, 1, 30945, 1, 4 } },
        { "func", "B秓 Th筩h c蕄 1*10", award_random_gem1_1 },
    },
    [6] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 3100, 50000000, 520, 520, 3800, 0, 183 },
        { "func", format("Chuy觧 sinh %d c蕄 %d", 8, 90), ck_award_reborn, { 8, 90, 200000000 } },
        { "func", "Ц qu� c蕄 1*20", award_random_gem1_2 },
        { "func", "U萵 Linh C蕄 4", award_yunling4 },
    },
    [7] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 3500, 50000000, 580, 580, 4200, 0, 184 },
        { "func", "Ц qu� caaps2*8", award_random_gem2_1 },
        { "item", "Linh у Gi韎 (tr竔)", { 0, 102, 30221, 1, 4 } },
        { "item", "Linh у Gi韎 (ph秈)", { 0, 102, 30222, 1, 4 } },
        { "item", "V� H� H祇 Hi謕 L謓h (Qu莕)", { 2, 1, 30946, 1, 4 } },
    },
    [8] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 4000, 50000000, 580, 580, 4200, 0, 185 },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 100 } },
        { "item", "V� H� H祇 Hi謕 L謓h (N鉵)", { 2, 1, 30944, 1, 4 } },
    },
    [9] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 5000, 50000000, 580, 580, 4200, 0, 186 },
        { "func", "Ф th玭g c秐h gi韎 V� T玭", award_wuzun },
        -- {"func", "战狂裤+9", award_zhankuangku},
        { "func", "Ц qu� caaps2*12", award_random_gem2_2 },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 200 } },
    },
    [10] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 6000, 50000000, 580, 580, 4200, 0, 187 },
        { "item", "T� Ch鋘 B� Kim X� Lv5", { 2, 1, 31517, 1, 4 } },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 300 } },
        --{"exchange", format("%d转%d级",8,90), format("    <color=gold>等级达到%d转%d级<color>",7,92), judge_translife_needLv_792, award_8zhuan90,},

    },
    [11] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 7000, 50000000, 580, 580, 4200, 0, 188 },
        table_6Star_Jinshe9,
        { "item", "Hi謕 Ngh躠 Chi Ch鴑g", { 2, 1, 30912, 1000, 4 } },
    },
    [12] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 8500, 50000000, 580, 580, 4200, 0, 189 },
        { "func", "Ф th玭g C秐h Gi韎 V� Ho祅g", award_wuhuang },
        { "item", "萴 Huy誸 y", { 0, 100, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "Danh hi謚 bang h閕 c蕄 3", award_tong_title3 },
    },
    [13] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 9500, 50000000, 580, 580, 4200, 0, 190 },
        { "item", "V� H� H祇 Hi謕 L謓h (V� Kh�)", { 2, 1, 30973, 1, 4 } },
        { "item", "Hi謕 Ngh躠 Chi Ch鴑g", { 2, 1, 30912, 1000, 4 } },
        --{"item", "6级蕴灵精华", {2,1,30668,4, 4}},
    },
    [14] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 13000, 60000000, 580, 580, 4200, 0, 191 },
        { "exchange", format("Chuy觧 sinh %d c蕄 %d", 9, 90), format("    <color=gold>Чt n CS %d Lv%d<color>", 8, 92), judge_translife_needLv_892, award_9zhuan90, },
        { "func", "Ц qu� c蕄 3*5", award_random_gem3_5 },
        { "item", "T輓 V藅 c蕄 5", { 0, 155, 5, 1, 4 } },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 300 } },
        --{"item", "6级蕴灵精华", {2,1,30668,6,4}},
        --{"item", "高级灵兽蛋", {2,1,30728,1,4}},
        --{"item", "无暇豪侠令（武器）", {2,1,30973, 1, 4}},
    },
    [15] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 15000, 70000000, 580, 580, 4200, 0, 192 },
        table_6Star_Jinshe9,
        { "item", "萴 Huy誸 u", { 0, 103, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "Ц qu� c蕄 3*7", award_random_gem3_7 },
        { "item", "уng T� Chi Nguy謓", { 2, 1, 30913, 42, 4 } },
        --{"item", "6级蕴灵精华", {2,1,30668,8,4}},
    },
    [16] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 16000, 80000000, 0, 0, 0, 0, 193 },
        { "item", "萴 Huy誸 Trang", { 0, 101, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 400 } },
        { "func", "Ц qu� c蕄 3*9", award_random_gem3_9 },
        { "item", "Thi誸 tinh c蕄 4", { 2, 1, 30612, 10, 4 } },
    },
    [17] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 17000, 90000000, 0, 0, 0, 0, 194 },
        table_6Star_Jinshe9,
        { "item", "Thi誸 tinh c蕄 4", { 2, 1, 30612, 20, 4 } },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 500 } },
    },
    [18] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 18000, 0, 0, 0, 0, 0, 176 },
        { "item", "T骾 Kh綾 B秐 Ho祅 M� (u)", { 2, 1, 31518, 1, 4 } },
    },
    [19] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 19000, 0, 0, 0, 0, 0, 178 },
        { "item", "T骾 Kh綾 B秐 Ho祅 M� (僶)", { 2, 1, 31519, 1, 4 } },
    },
    [20] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 20000, 100000000, 0, 0, 0, 0, 195 },
        table_Select_ShaXing,
        { "item", "Huy誸Tr輈hTh筩h Lv4", { 2, 22, 104, 1, 1 } },
        { "item", "Nguy謙B筩hTh筩h Lv4", { 2, 22, 204, 1, 1 } },
        { "item", "H� Ph竎h Th筩h C蕄 4", { 2, 22, 304, 1, 1 } },
        { "item", "H綾 Di謚 Th筩h C蕄 4", { 2, 22, 404, 1, 1 } },
        { "item", "Thi誸 tinh c蕄 4", { 2, 1, 30612, 30, 4 } },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 600 } },
    },
    [21] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 21000, 0, 0, 0, 0, 0, 526 },
        { "item", "T骾 Kh綾 B秐 Ho祅 M� (Qu莕)", { 2, 1, 31520, 1, 4 } },
    },
    [22] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 22000, 150000000, 0, 0, 0, 0, 196 },
        { "exchange", format("Chuy觧 sinh %d c蕄 %d", 10, 97), format("    <color=gold>Чt n CS %d Lv%d<color>", 9, 92), judge_translife_needLv_992, award_10zhuan97, },
        --{"exchange", format("%d转%d级",10,94), format("    <color=gold>等级达到%d转%d级,并消耗%d个复生丹<color>",9,94,1), judge_translife_needLv_994_fsd_1, award_10zhuan94_need994cost1fsd, },
        { "item", "Huy誸Tr輈hTh筩h Lv4", { 2, 22, 104, 2, 1 } },
        { "item", "Nguy謙B筩hTh筩h Lv4", { 2, 22, 204, 2, 1 } },
        { "item", "H� Ph竎h Th筩h C蕄 4", { 2, 22, 304, 2, 1 } },
        { "item", "H綾 Di謚 Th筩h C蕄 4", { 2, 22, 404, 2, 1 } },
    },
    [23] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 23000, 0, 0, 0, 0, 0, 527 },
        { "item", "T骾 Kh綾 B秐 Ho祅 M� (Nh蒼)", { 2, 1, 31521, 1, 4 } },
    },
    [24] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 24000, 200000000, 0, 0, 0, 0, 197 },
        table_Select_ShaXing,
        { "item", "H錳 Ti猲 Кn", { 2, 1, 30847, 20, 4 } },
        { "item", "Huy誸Tr輈hTh筩h Lv5", { 2, 22, 105, 1, 1 } },
        { "item", "Nguy謙B筩hTh筩h Lv5", { 2, 22, 205, 1, 1 } },
        { "item", "H� Ph竎h Th筩h C蕄 5", { 2, 22, 305, 1, 1 } },
        { "item", "H綾 Di謚 Th筩h C蕄 5", { 2, 22, 405, 1, 1 } },
        { "func", "Danh hi謚 Nhi謒 V� Чt Nh﹏", award_title },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 600 } },
    },
    [25] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 25000, 0, 0, 0, 0, 0, 528 },
        { "item", "T骾 Kh綾 B秐 Ho祅 M� (Eo)", { 2, 1, 31522, 1, 4 } },
    },
    [26] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 25500, 0, 0, 0, 0, 0, 198 },
        { "item", "Linh Ph竎h Кn", { 2, 1, 31239, 2, 4 } },
        { "func", "S竎h K� N╪g уng H祅h C蕄 6 (Ng蓇 nhi猲)", award_petbook6, { 1 } },
    },
    [27] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 26000, 250000000, 0, 0, 0, 0, 199 },
        { "func", "觤 c鑞g hi課 bang", award_tongscore, { 600 } },
        --{"item", "超级宠物蛋", {2, 1, 31169, 1, 4}},
        { "item", "Huy誸Tr輈hTh筩h Lv6", { 2, 22, 106, 1, 1 } },
        { "item", "Nguy謙B筩hTh筩h Lv6", { 2, 22, 206, 1, 1 } },
        { "item", "H� Ph竎h Th筩h C蕄 6", { 2, 22, 306, 1, 1 } },
        { "item", "H綾 Di謚 Th筩h C蕄 6", { 2, 22, 406, 1, 1 } },
    },
    [28] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 27000, 0, 0, 0, 0, 0, 200 },
        { "func", "Ф th玭g C秐h Gi韎 V� Th竛h", award_wusheng },
    },
    [29] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 28000, 0, 0, 0, 0, 0, 201 },
        { "item", "Huy誸 Tr輈h Th筩h c蕄 7", { 2, 22, 107, 2, 4 } },
        { "item", "Nguy謙 B筩h Th筩h c蕄 7", { 2, 22, 207, 2, 4 } },
        { "item", "H� Ph竎h Th筩h c蕄 7", { 2, 22, 307, 2, 4 } },
        { "item", "H綾 Di謚 Th筩h c蕄 7", { 2, 22, 407, 2, 4 } },
        --{"func", "随机7级宝石", award_random_gem7_2,{1}},
    },
    [30] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 32000, 0, 0, 0, 0, 0, 216 },
        { "item", "Linh Ph竎h Кn", { 2, 1, 31239, 8, 4 } },
    },
    [31] = {
        --score, EXP 声望值 师门值 军功值 真气
        { 35000, 0, 0, 0, 0, 0, 217 },
        { "item", "Thng H秈 Ch﹗ Lv7 (Ch璦 gi竚 nh)", { 2, 102, 214, 2, 4 } },
    },
}
function ck_view_score_award(nType)
    local tSay = {
        format("\n Nh薾 ph莕 thng/#ck_get_score_award(%d)", nType),
        "\nT玦 ch� xem xem th玦/nothing",
    }
    local tAward = CK_SCROE_AWARD_TABLE[nType]
    local tBase = tAward[1]
    local szMsg = format("Kinh nghi謒 %s, danh v鋘g %d, 甶觤 s� m玭 %d, 甶觤 c玭g tr筺g %d, 甶觤 ch﹏ kh� %d", tBase[2], tBase[3], tBase[4], tBase[5], tBase[6])
    for i = 2, getn(tAward) do
        if tAward[i][1] == "item" then
            szMsg = format("%s,%s*%d", szMsg, tAward[i][2], tAward[i][3][4]);
        else
            szMsg = format("%s,%s", szMsg, tAward[i][2])
        end
    end
    Say(CK_NPC_NAME .. format("Hi謓 t筰 c� th� nh薾 ph莕 thng:\n   <color=green>%s<color>\n<color=red>Khi kh玭g th� cho th猰 ph莕 thng th� s� d飊g 甶觤 kinh nghi謒  thay th�<color>", szMsg), getn(tSay), tSay);
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
        Say(CK_NPC_NAME .. format("觤 n╪g ng ch璦 t <color=red>%d<color>, kh玭g th� nh薾 thng!", nNeedScore), 0);
        return 0;
    end
    --if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) ~= 0 then
    if ActCheckCondition(nAwardedFlagId) ~= 0 then
        Say(CK_NPC_NAME .. "Х nh薾 ph莕 thng n祔 r錳!", 0);
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
        -- 从这里开始领奖
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
                Msg2Player(format("B筺 nh薾 頲 %d 甶觤  c鑞g hi課 bang h閕", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph莕 thng 甶觤 t輈h l騳", (t[4] or 0), 1);
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
    local szTitle = format("%s: фi %s c莕 th猰:\n%s", CK_NPC_NAME, tAward[2], tAward[3])
    if tAward[4]() == 1 then
        tinsert(tSay, format("X竎 nh /#ck_get_score_award_select_final(%d)", nType))
    else
        szTitle = szTitle .. "\n<color=red>Ch璦 t y猽 c莡!<color>"
    end
    tinsert(tSay, "H駓 b�/nothing")
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
            local szTitle = format("%s: H穣 ch鋘 %s", CK_NPC_NAME, tAward[2])
            local tSel = tAward[3]
            for k = 1, getn(tSel) do
                if tSel[k][1] == "item" then
                    tinsert(tDialog, format("%s*%d/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], tSel[k][3][4], nType, i, k));
                else
                    tinsert(tDialog, format("%s/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], nType, i, k));
                end
            end
            tinsert(tDialog, "\nTa ch� xem xem th玦/ck_get_score_award_select_cancle")
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
        -- 从这里开始领奖
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
                Msg2Player(format("B筺 nh薾 頲 %d 甶觤  c鑞g hi課 bang h閕", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph莕 thng 甶觤 t輈h l騳", (t[4] or 0), 1);
        elseif "select" == t[1] then
            local Index = g_RecordIndex[PlayerIndex][i];
            local tItem = t[3][Index];
            if "item" == tItem[1] then
                gf_AddItemEx2(tItem[3], tItem[2], "CDKEY", "Ph莕 thng 甶觤 t輈h l騳", (tItem[4] or 0), 1);
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



