Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--����
DebugOutput = nothing

--�Ƿ�Ϊ�·�������
--Experience server Switch
CK_ES_SWITCH = 0;

function _ck_check_tong()
    if IsTongMember() <= 0 then
        --Say(CK_NPC_NAME.."�����������������������", 0);
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
        --Say(CK_NPC_NAME.."����û�м����κ��¿��������������", 0);
        return 0;
    end
    return 1
end
function _ck_del_300_ziguangjifen()
    --���Ϲ����
    local TSK_POINT = 652;            --��¼��Ҹ��˹ؿ�����
    if GetTask(TSK_POINT) < 300 then
        Say(CK_NPC_NAME .. format("�i�m t�ch l�y t� quang kh�ng �� <color=red>%d<color> �i�m", 300), 0);
        return 0;
    end
    SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
    return 1
end
function _ck_check_300_ziguangjifen()
    local TSK_POINT = 652;            --��¼��Ҹ��˹ؿ�����
    if GetTask(TSK_POINT) < 300 then
        return 0;
    end
    return 1
end

--��һ�ű�����¼�������� ��ǰ���ֹ������ܲ���
CK_EXT_AWARD = 0
T_CK_TASK_LIST = {
    --{enable, name,{condition,desc},{exp,score,exaward_func,ext_rate},{task_index,task_bit_get,task_bit_finish|func_check_finish,task_bit_award}}
    --��ս���� ������������
    [1101] = { 0, "V�n ti�u", { "Ho�n th�nh 1 l�n nhi�m v� v�n ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� v�n ti�u" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 1, 2, 3 } },
    [1102] = { 0, "C��p ti�u", { "Ho�n th�nh 1 l�n nhi�m v� c��p ti�u", "��n b�n �� th� l�c ch� NPC Ti�u ��u Tr�n Vi�n Ti�u C�c �� nh�n nhi�m v� �o�t ti�u" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 4, 5, 6 } },
    [1103] = { 0, "Thu th�p Ng�c Ph�ch", { "Thu th�p 1 Ng�c Ph�ch", "��n Th�i H� C� Th� c�a th� l�c tr�ng 1 h�t gi�ng, thu th�p 1 Ng�c Ph�ch" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 7, 8, 9 } },
    [1104] = { 0, "Tr�m Ng�c Ph�ch", { "��n th� l�c kh�c tr�m 1 Ng�c Ph�ch", "V�o b�n �� th� l�c kh�c �� tr�m 1 Ng�c Ph�ch" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 10, 11, 12 } },
    [1105] = { 0, "T�y V�c Truy�n ��o", { "Tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng", "V�o b�n �� th� l�c tham gia t�nh n�ng T�y V�c Truy�n ��o, nh�p v�o 3 th�nh v�t �� nh�n th��ng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 13, 14, 15 } },
    [1106] = { 0, "BOSS Th� L�c", { "Nh�n b�o v� BOSS c�a th� l�c v� ti�u di�t BOSS c�a th� l�c phe ��ch �� nh�n ���c ph�n th��ng", "Bu�i t�i s� xu�t hi�n BOSS c�a th� l�c phe ta ho�c phe ��ch, b�o v� BOSS c�a phe ta v� ti�u di�t BOSS c�a phe ��ch s� nh�n ���c ph�n th��ng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 16, 17, 18 } },
    [1107] = { 0, "Th� S�n Ti�n Th��ng", { "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 19, 20, 21 } },
    [1108] = { 0, "Nhi�m v� ��o Kho B�u", { "Ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u", "V�o th� l�c nh�n 1 T�ng B�o ��, ho�n th�nh 1 l�n nhi�m v� ��o Kho B�u" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 8, 22, 23, 24 } },

    --��ս���� ��������
    [1201] = { 0, "L��ng S�n", { "Ho�n th�nh 1 l�n �i L��ng S�n B�c", "Ho�n th�nh 1 l�n �i L��ng S�n B�c" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 1, 2, 3 } },
    [1202] = { 0, "V�n Ki�m Tr�ng", { "V��t �i V�n Ki�m Tr�ng 1 l�n", "V��t �i V�n Ki�m Tr�ng 1 l�n" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 4, 5, 6 } },
    [1203] = { 0, "��a Huy�n Cung", { "V��t �i ��a Huy�n Cung 1 l�n", "V��t �i ��a Huy�n Cung 1 l�n" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 7, 8, 9 } },
    [1204] = { 0, "Th�i Nh�t Th�p", { "V��t �i Th�i Nh�t Th�p 1 l�n", "V��t �i Th�i Nh�t Th�p 1 l�n" }, { 20000000, 20, nil, CK_EXT_AWARD }, { 2, 10, 11, 12 } },

    --��ս���� PVP����
    [1301] = { 0, "Tr�ng 1 C�y B�t Nh�-Nh�", { "Tr�ng v� thu ho�ch 1 C�y B�t Nh�-Nh�", "Tr�ng v� thu ho�ch 1 C�y B�t Nh�-Nh�" }, { 20000000, 35 }, { 2, 13, 14, 15 } },
    [1302] = { 0, "Tr�ng 1 C�y T� Linh", { "Tr�ng v� thu ho�ch 1 C�y T� Linh", "Tr�ng v� thu ho�ch 1 C�y T� Linh" }, { 20000000, 35 }, { 2, 16, 17, 18 } },
    [1303] = { 0, "Tr�ng 1 C�y H�t Gi�ng", { "Tr�ng v� thu ho�ch 1 C�y H�t Gi�ng", "Tr�ng v� thu ho�ch 1 C�y H�t Gi�ng" }, { 20000000, 35 }, { 2, 19, 20, 21 } },
    [1304] = { 0, "PK Th� L�c Ba Phe", { "��nh b�i 1 ng��i ch�i phe ��ch c�a th� l�c kh�c", "Di�t 1 ng��i ch�i th� l�c ��ch, ch�ng minh kh� n�ng c�a b�n!" }, { 20000000, 35 }, { 2, 22, 23, 24 } },
    ------1305~1307���뱣����������ֹ����
    [1305] = { 0, "Chi�n D�ch Th�n Trang", { "Tham gia 1 l�n Th�n l�ng chi�n", "Tham gia 1 l�n Th�n l�ng chi�n" }, { 20000000, 35 }, { 2, 25, 26, 27 } },
    [1306] = { 0, "Chi�n D�ch Th�o C�c", { "Tham gia 1 l�n Th�o c�c chi�n", "Tham gia 1 l�n Th�o c�c chi�n" }, { 20000000, 35 }, { 2, 28, 29, 30 } },
    [1307] = { 0, "Ph�o ��i Tranh �o�t Chi�n", { "Tham gia 1 l�n Ph�o ��i chi�n", "Tham gia 1 l�n Ph�o ��i chi�n" }, { 20000000, 35 }, { 3, 1, 2, 3 } },
    [1308] = { 0, "S� d�ng 50 Ph�o Chi�n Th�ng", { "S� d�ng 50 Ph�o Chi�n Th�ng", "S� d�ng 50 Ph�o Chi�n Th�ng" }, { 20000000, 35 }, { 3, 4, 5, 6 } },
    [1309] = { 0, "H�m nay tr�ng 1 C�y B�t Nh� L�n", { "H�m nay tr�ng v� thu ho�ch 1 C�y B�t Nh� L�n", "H�m nay tr�ng v� thu ho�ch 1 C�y B�t Nh� L�n" }, { 20000000, 35 }, { 3, 8, 9, 10 } },
    [1310] = { 0, "Nh�n M�n Li�t H�a", { "Nh�n th��ng chi�n tr��ng Nh�n M�n Li�t H�a", "Nh�n th��ng chi�n tr��ng Nh�n M�n Li�t H�a" }, { 20000000, 35 }, { 3, 11, 12, 13 } },
    [1311] = { 0, "T�ng Li�u T�i Nguy�n Chi�n", { "H�m nay tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n", "H�m nay tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n" }, { 20000000, 35 }, { 3, 14, 15, 16 } },


    --ÿ����������
    [1401] = { 1, "��ng nh�p m�i ng�y", { "��ng nh�p m�i ng�y", "��ng nh�p m�i ng�y" }, { 20000000, 20 }, { 3, 0, 0, 7 } },

    --------------------

    --��ս�پ� �������
    [2101] = { 0, "Gia nh�p bang h�i", { "Gia nh�p m�t bang h�i b�t k�, tr� th�nh m�t th�nh vi�n trong bang", "Gia nh�p bang h�i, c�ng v�i th�nh vi�n kh�c c� g�ng �� gi�p bang h�i ng�y c�ng l�n m�nh" }, { 50000000, 200 }, { 9, 0, _ck_check_tong, 1 } },
    [2102] = { 0, "T�i chi�n Th�n Th�", { "N�p 300 �i�m t�ch l�y t� quang (Sau khi giao nhi�m v� th� hai b�n s� b� tr� 300 �i�m t�ch l�y t� quang)", "Ch� c� ng��i m�i c� th� thu�n ph�c T� Quang Th�n Th�!" }, { 50000000, 100, _ck_del_300_ziguangjifen }, { 9, 0, _ck_check_300_ziguangjifen, 2 } },
    [2103] = { 0, "N�p �i�m c�ng hi�n bang h�i", { "Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i", "Tham gia t�nh n�ng Bang H�i Vinh Danh, giao n�p 10 �i�m c�ng hi�n bang h�i" }, { 50000000, 100 }, { 9, 0, 3, 4 } },
    [2104] = { 0, "Nh�n ph�n th��ng Bang H�i Vinh Danh", { "Nh�n ph�n th��ng Bang H�i Vinh Danh", "Tham gia t�nh n�ng Bang H�i Vinh Danh v� nh�n ph�n th��ng" }, { 50000000, 300 }, { 9, 0, 5, 6 } },

    [2201] = { 0, "��i Hi�p", { "K�ch ho�t danh ph�n ��i Hi�p", "K�ch ho�t VIP ��i Hi�p L�nh, ch�i tr� ch�i nh� nh�ng h�n" }, { 50000000, 1400 }, { 10, 0, _ck_check_yueka, 1 } },
    [2202] = { 0, "Gia nh�p th� l�c", { "Gia nh�p 1 th� l�c trong ba phe", "Gia nh�p 1 th� l�c trong ba phe" }, { 50000000, 400 }, { 10, 0, _ck_check_shili, 2 } },
    [2203] = { 0, "V�n ti�u", { "Ho�n th�nh 1 l�n v�n ti�u", "V�o th� l�c nh�n nhi�m v� v�n ti�u, ho�n th�nh 1 l�n v�n ti�u" }, { 50000000, 400 }, { 10, 0, 3, 4 } },
    [2204] = { 0, "C��p ti�u", { "Ho�n th�nh 1 l�n c��p ti�u", "V�o th� l�c nh�n nhi�m v� c��p ti�u, ho�n th�nh 1 l�n c��p ti�u" }, { 50000000, 400 }, { 10, 0, 5, 6 } },
    [2205] = { 0, "Tr�ng c�y", { "Ho�n th�nh 1 l�n nhi�m v� tr�ng c�y", "V�o th� l�c ch� C�y Th�i H� ho�n th�nh 1 l�n nhi�m v� tr�ng c�y" }, { 5000000, 400 }, { 10, 0, 7, 8 } },
    [2206] = { 0, "��o r��ng", { "Ho�n th�nh 1 l�n nhi�m v� ��o r��ng", "Ho�n th�nh 1 l�n nhi�m v� ��o r��ng" }, { 5000000, 400 }, { 10, 0, 9, 10 } },
    [2207] = { 0, "Th� S�n Ti�n Th��ng", { "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng", "Ho�n th�nh 1 l�n nhi�m v� Th� S�n Ti�n Th��ng" }, { 5000000, 400 }, { 10, 0, 11, 12 } },
    -- [2208] = {0, "���򴫵�", {"ʹ����������1�����ߣ�����ƣ��ؽ��ش��ľ����������ط�", "�������򴫵����ܣ�����ʹ������1�����ߣ�����ƣ��ؽ��ش��ľ����������ط�"}, {50000000, 600}, {10, 0, 13, 14}},

    [2209] = { 0, "Tr�ng 1 C�y B�t Nh� L�n", { "Tr�ng v� thu ho�ch 1 C�y B�t Nh� L�n", "Tr�ng v� thu ho�ch 1 C�y B�t Nh� L�n" }, { 50000000, 300 }, { 10, 0, 13, 14 } },
    [2210] = { 0, "Tr�ng 1 C�y B�t Nh�-Nh�", { "Tr�ng v� thu ho�ch 1 C�y B�t Nh�-Nh�", "Tr�ng v� thu ho�ch 1 C�y B�t Nh�-Nh�" }, { 50000000, 300 }, { 10, 0, 15, 16 } },
    [2211] = { 0, "Tr�ng 1 H�t Gi�ng", { "Tr�ng v� thu ho�ch 1 H�t Gi�ng", "Tr�ng v� thu ho�ch 1 H�t Gi�ng" }, { 50000000, 300 }, { 10, 0, 17, 18 } },
    [2212] = { 0, "Tr�ng 1 C�y T� Linh", { "Tr�ng v� thu ho�ch 1 C�y T� Linh", "Tr�ng v� thu ho�ch 1 C�y T� Linh" }, { 50000000, 300 }, { 10, 0, 19, 20 } },
    [2213] = { 0, "D�ng 8 Ng�i Sao May M�n", { "D�ng 8 Ng�i Sao May M�n", "D�ng 8 Ng�i Sao May M�n" }, { 50000000, 400 }, { 10, 0, 21, 22 } },
    [2214] = { 0, "D�ng 100 N� Oa B�o H�p", { "D�ng 100 N� Oa B�o H�p", "D�ng 100 N� Oa B�o H�p" }, { 50000000, 400 }, { 10, 0, 23, 24 } },
    [2215] = { 0, "S� d�ng 50 Ph�o Chi�n Th�ng", { "S� d�ng 50 Ph�o Chi�n Th�ng", "S� d�ng 50 Ph�o Chi�n Th�ng" }, { 50000000, 200 }, { 10, 0, 25, 26 } },
    [2216] = { 0, "T�ng Li�u T�i Nguy�n Chi�n", { "Tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n", "Tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n" }, { 50000000, 300 }, { 10, 0, 27, 28 } },

    --���� ��ֵ�ۼ����� ռλ
    --[3001] = {},

    --���� �콾���������� ռλ
    --[3101] = {},

    --��Ծ�Ȼ����콱 ռλ
    --[10001]= {},
}

--�������б�,������������Ի�
T_CK_TASK_GROUP_LIST = {
    --name, {type,desc}, {sub_list_group}
    [1] = {
        [1] = "Nhi�m v� h�ng ng�y",
        [2] = { 1, "H�ng ng�y nh�n ng�u nhi�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!" },
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
                [1] = "Nhi�m v� Th� L�c Ba Phe",
                [2] = 2,
                [3] = {
                    { { 1101 }, 4000 }, --����
                    { { 1102 }, 3200 }, --����
                    { { 1103 }, 400 }, --�ռ�����
                    { { 1104 }, 400 }, --͵ȡ����
                    { { 1105 }, 400 }, --���򴫵�
                    { { 1106 }, 400 }, --����boss
                    { { 1107 }, 400 }, --�ͽ�����
                    { { 1108 }, 400 }, --�ڱ�������
                },
                [4] = 0
            },

            [2] = {
                [1] = "Nhi�m v� ph� b�n",
                [2] = 1,
                [3] = {
                    { { 1201 }, 2000 }, --��ڣ
                    { { 1202 }, 2000 }, --��ڣ
                    { { 1203 }, 3000 }, --������
                    { { 1204 }, 3000 }, --̫һ��
                },
                [4] = 0,
            },

            [3] = {
                [1] = "Nhi�m v� PVP",
                [2] = 5,
                [3] = {
                    { { 1301 }, 1500 }, --��һ��С������
                    { { 1302 }, 1500 }, --��һ��������
                    { { 1303 }, 1500 }, --��һ��������
                    { { 1309 }, 500 }, --��һ�Ŵ������
                    { { 1304 }, 1000 }, --��������PK
                    { { 1305, 1306, 1307, 1310 }, 1000 }, --����ս�� �ݹȳ�ս�� ��̨����ս �����һ�
                    { { 1308 }, 1000 }, --ʹ��50��ʤ������
                    { { 1311 }, 2000 }, --������Դս
                },
                [4] = 1,
            },

            [4] = {
                [1] = "��ng nh�p m�i ng�y",
                [2] = 1,
                [3] = {
                    { { 1401 }, 1000 },
                },
                [4] = 0,
            },
        },
    },
    [2] = {
        [1] = "Nhi�m v� tr��ng th�nh",
        [2] = { 2, "Trong th�i gian ho�t ��ng ch� ho�n th�nh 1 l�n, nh�n ���c nhi�u EXP v� �� n�ng ��ng!" },
        [3] = {
            [1] = { "Nhi�m v� bang h�i", 0, { 2101, 2102, 2103, 2104 }, 0 }, --��ս�پ�-�������
            [2] = { "Nhi�m v� h��ng d�n", 0, { 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216 }, 0 }, --��ս�پ�-ָ������
        },
    },
}

function ck_task_daily_clear()
    --ÿ������
    --��ս���������������
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
        --����ģʽ
        print("ck_task_daily_clear", task_index, nGroupTaskIndex, nBitGet, nBitFinish, nBitAward)
    end
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitGet, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitFinish, 0)
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 0)
end

--�ⲿ���� ����ĳһ������Ϊ���״̬
function ck_global_set_task_finish(nTaskIndex)
    --gf_TeamOperateEX(function()
    local t = _ck_get_task_cfg(nTaskIndex)
    if not t then
        return
    end
    if ck_IsOpen() ~= 1 then
        if gDebug:is_debug() == 1 then
            --����ģʽ
            print("ck_global_set_task_finish not open", nTaskIndex)
        end
        return 0;
    end
    if ck_GetTitleType() == 0 then
        if gDebug:is_debug() == 1 then
            --����ģʽ
            print("ck_global_set_task_finish title error", nTaskIndex)
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --����ģʽ
            print("ck_global_set_task_finish not enable", nTaskIndex)
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        if gDebug:is_debug() == 1 then
            --����ģʽ
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
            Msg2Player(format("B�n �� ho�n th�nh nhi�m v� Code Chu T��c [%s]", szTaskName));
        end
    else
        if gDebug:is_debug() == 1 then
            --����ģʽ
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
    tinsert(tSay, format("\n%s/nothing", "T�i h� ch� xem qua th�i"))
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
            --���Խ�ȡ�������
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
        --û����ȡ����Ļ��������
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
        --����ģʽ
        tinsert(tSay, format("%s/ck_DailyReset", "dailyclear"))
    end
    tinsert(tSay, format("%s/nothing", "T�i h� ch� xem qua th�i"))
    Say(CK_NPC_NAME .. szTitle, getn(tSay), tSay)
end

--����Ի�
function ck_task_talk(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    local tSay = {}
    tinsert(tSay, format("\n%s/#_ck_task_award(%d)", "Ho�n th�nh nhi�m v�", nTaskIndex))
    if gDebug:is_debug() == 1 then
        --����ģʽ
        tinsert(tSay, format("\n%s/#ck_global_set_task_finish(%d)", "debugfinish", nTaskIndex))
    end
    tinsert(tSay, format("\n%s/nothing", "T�i h� ch� xem qua th�i"))
    local szStatus = _ck_get_task_status(nTaskIndex)
    local Msg = format("T�n nhi�m v�: <color=gold>%s(%s)<color>\n�i�u ki�n:\n  %s\nH��ng d�n:\n  %s\nPh�n th��ng:\n  EXP: %d, �� n�ng ��ng: %d",
            t[2], szStatus, t[3][1], t[3][2], t[4][1], t[4][2])
    Say(CK_NPC_NAME .. Msg, getn(tSay), tSay)
end

function _ck_get_task_bitset(nTaskIndex)
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[5]
end

--��ȡ�������
function _ck_rand_task_list(tTaskList, nCount, bPass)
    if nCount <= 0 then
        return
    end
    local nPass = 0
    local nMaxPass = 0
    local nGet = 0
    if bPass and bPass == 1 then
        if ck_GetTitleType() == 3 then
            --��Ծ����һ������
            nMaxPass = 1
        end
    end

    for i = 1, getn(tTaskList) do
        --�ȼ����û������
        local nTaskIndex = tTaskList[i][1]
        if type(nTaskIndex) == "table" then
            for j = 1, getn(nTaskIndex) do
                if _ck_check_task_getflag(nTaskIndex[j]) == 1 then
                    --�Ѿ�������Ͳ��������
                    return
                end
            end
        else
            if _ck_check_task_getflag(nTaskIndex) == 1 then
                --�Ѿ�������Ͳ��������
                return
            end
        end
    end

    for i = 1, getn(tTaskList) do
        --���Ƚ�ȡ�������������
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
        --����ģʽ
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
            --����ģʽ
            print("condition false")
        end
        return 0;
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        if gDebug:is_debug() == 1 then
            --����ģʽ
            print(format("disable task %d", nTaskIndex))
        end
        return 0
    end
    if _ck_check_task_getflag(nTaskIndex) ~= 1 then
        Talk(1, "", "Kh�ng c� nhi�m v� n�y")
        return 0
    end
    if _ck_check_task_awardflag(nTaskIndex) == 1 then
        Talk(1, "", "B�n �� nh�n ph�n th��ng nhi�m v� n�y r�i!")
        return 0
    end
    if _ck_check_task_finishflag(nTaskIndex) ~= 1 then
        Talk(1, "", "Nhi�m v� n�y v�n ch�a ho�n th�nh!")
        return 0
    end

    local t = _ck_get_task_cfg(nTaskIndex)
    if t[4][3] and (t[4][3]() ~= 1) then
        --����Ľ�������
        return 0
    end

    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBitAward = tBitSet[4]
    CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBitAward, 1)
    local ext = t[4][4] or 0
    gf_ModifyExp(floor(t[4][1] * (1 + ext)))
    ck_AddCkScore(floor(t[4][2] * (1 + ext)))
    Msg2Player(format("Ch�c m�ng ho�n th�nh nhi�m v� [%s]", t[2]))

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
    local tType = { "Ch�a ho�n th�nh", "Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh" }
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
    --�����ѽ��ܱ�־
    if gDebug:is_debug() == 1 then
        --����ģʽ
        print("_ck_set_task_getflag", nTaskIndex)
    end
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --δ���������ܽ�
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:SetTaskBit(nGroupTaskIndex, nBit, 1)
    end
    return 1 --����Ҫ����
end

function _ck_check_task_getflag(nTaskIndex)
    --����Ƿ��ѽ�������
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --δ���������ܽ�
        return 0
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[2]
    if nBit and nBit > 0 then
        local nRet = CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
        if gDebug:is_debug() == 1 then
            --����ģʽ
            print("task_getflag", nTaskIndex, nGroupTaskIndex, nBit, nRet)
        end
        return nRet
    end
    return 1 --����Ҫ����
end
function _ck_check_task_enable(nTaskIndex)
    --����Ƿ���
    if not nTaskIndex or not T_CK_TASK_LIST[nTaskIndex] then
        --����δ����
        return 0
    end
    local t = _ck_get_task_cfg(nTaskIndex)
    return t[1]
end
function _ck_check_task_finishflag(nTaskIndex)
    --����Ƿ������
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --δ���������ܽ�
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
    --����Ƿ�����ȡ����
    if _ck_check_task_enable(nTaskIndex) == 0 then
        --δ���������ܽ�
        return 1
    end
    local tBitSet = _ck_get_task_bitset(nTaskIndex)
    local nGroupTaskIndex = tBitSet[1]
    local nBit = tBitSet[4]
    if nBit and nBit > 0 then
        return CK_TASK_GROUP:GetTaskBit(nGroupTaskIndex, nBit)
    end
    error(format("CDKey: award bit error %d", nTaskIndex))
    return 1 --����bit�������
end

function _ck_set_task_enable(nTaskIndex, nFlag)
    local t = _ck_get_task_cfg(nTaskIndex)
    t[1] = nFlag or 1
    --	if gDebug:is_debug() == 1 then--����ģʽ
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

--����ֱǰϵ������
----------------------------------------------------------------------------
------------------------- ����ֱǰ���������Ѿ��ر��� -------------------------
----------------------------------------------------------------------------
CK_TASK_FORWARD = {
    -- [1] = {"�������", 226},
    -- [2] = {"�������", 227},
    -- [3] = {"��������ͽ", 228},
    -- [4] = {"�����Գ", 229},
    -- [5] = {"����������˾", 230},
    -- [6] = {"����˹����", 231},
    -- [7] = {"������������", 232},
    -- [8] = {"������������", 233},
}

--��ս����ɱ������
CK_TASK_BZ_KILL = {
    [1] = { "Quay V� Ch�n C�", 234 },
    [2] = { "Quay V� Ch�n C�", 235 },
    [3] = { "Quay V� Ch�n C�", 236 },
    [4] = { "Quay V� Ch�n C�", 237 },
    [5] = { "Quay V� Ch�n C�", 238 },
}

--��ս������������(���5��)
CK_TASK_BZ_RAID = {
    [1] = "Tham gia 1 l�n �i Th�i H�",
    [2] = "Tham gia 1 l�n �i L��ng S�n ",
    [3] = "Tham gia 1 l�n �i V�n Ki�m Tr�ng",
    [4] = "Tham gia 1 l�n �i ��a Huy�n Cung",
    [5] = "Tham gia 1 l�n �i Th�i Nh�t Th�p",
}

--��ս����PVP����  ���7������֧������
CK_TASK_BZ_PVP = {
    -- [1] = "����3��1v1����",
    [1] = "Tr�ng v� thu ho�ch 1 C�y B�t Nh�-Nh�",
    [2] = "Tr�ng v� thu ho�ch 1 C�y T� Linh",
    [3] = "Tr�ng v� thu ho�ch 1 C�y H�t Gi�ng (m� t� t�i h�t gi�ng mua t�i Ng� C�c)",
    [4] = "��nh b�i 1 ng��i ch�i phe ��ch c�a th� l�c kh�c", --"����һ��������ս��",
    [5] = "Tham gia 1 l�n Th�n l�ng chi�n",
    [6] = "Tham gia 1 l�n Th�o c�c chi�n",
    [7] = "Tham gia 1 l�n Ph�o ��i chi�n",
    -- [7] = "����һ��������ս��",
}

--��ֵ�ۼ�����
CK_TASK_ZILON_ATRR = {
    [1] = { "Gia Nh�p Giang H�", { 0, 90, 1000, 1000, 10000 }, { 10000000, 100 } },
    [2] = { "Ti�u H�u S� Th�nh", { 7, 90, 3000, 3000, 30000 }, { 20000000, 150 } },
    [3] = { "S� Xu�t Mao L�", { 8, 90, 6000, 6000, 40000 }, { 30000000, 200 } },
    [4] = { "Ti�u H�u Danh Kh�", { 9, 90, 8000, 8000, 80000 }, { 40000000, 250 } },
    [5] = { "��i Lang ��o Sa", { 10, 90, 10000, 10000, 120000 }, { 50000000, 300 } },
    [6] = { "Tr�ng Ch� L�ng V�n", { 10, 91, 12000, 12000, 180000 }, { 60000000, 350 } },
    [7] = { "Uy Phong B�t Di�n", { 10, 92, 15000, 15000, 250000 }, { 100000000, 400 } },
    [8] = { "Kh� Tr�ng H� S�n", { 10, 96, 16000, 16000, 350000 }, { 200000000, 500 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --������չ��tableʱ��Ӱ���콱״̬bitλ,������¿ͻ��˻�������ñ�
}
CK_TASK_ZILON_ATRR_BEGIN = 1
CK_TASK_INDEX_BEGIN_ZILON = 3001 --��cdk��������ñ����TaskIndex����

--�콾����������
CK_TASK_IB_COST = {
    --[1] = {"��Դ����", 5,   {12500000, 150}},
    --[2] = {"��������", 25,   {25000000, 300}},
    [1] = { "Phong Y T�c Th�c", 5, { 50000000, 300 } },
    [2] = { "Uy Phong B�t Di�n", 25, { 100000000, 500 } },
    [3] = { "Gia C�nh Kh� Gi�", 50, { 150000000, 800 } },
    [4] = { "��i Ph� ��i Qu�", 100, { 200000000, 1200 } },
    [5] = { "T�i ��i Kh� Th�", 200, { 300000000, 1400 } },
    [6] = { "Gia T�i V�n Qu�n", 300, { 400000000, 1600 } },
    [7] = { "Ph� Gi�p Thi�n H�", 400, { 500000000, 1800 } },
    [8] = { "Ph� Kh� ��ch Qu�c", 500, { 600000000, 2200 } },
    [9] = { "Ph� Li�t Thi�n T�", 800, { 800000000, 2600 } },
    [10] = { "H�ng Ph�c Thi�n H�", 1200, { 1000000000, 3000 } },
    [11] = { "T�i Nguy�n Cu�n Cu�n", 1600, { 1500000000, 3500 } },
    [12] = { "Kim Ng�c M�n ���ng", 2000, { 2000000000, 4000 } },
    [13] = { "��i Doanh Gia", 3000, { 2000000000, 5000 } },
    --!!!Keep getn(CK_TASK_ZILON_ATRR) + getn(CK_TASK_IB_COST) <= 30
    --������չ��tableʱ��Ӱ���콱״̬bitλ,������¿ͻ��˻�������ñ�
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR) + 1
CK_TASK_INDEX_BEGIN_IB = 3101 --��cdk��������ñ����TaskIndex����

CK_JS_GUAIYI = {
    { "�o Cho�ng Ng� H�nh Kim Ch�", { 0, 152, 4, 1, 4 } },
    { "�o Cho�ng Ng� H�nh M�c Ch�", { 0, 152, 5, 1, 4 } },
    { "�o Cho�ng Ng� H�nh Th�y Ch�", { 0, 152, 6, 1, 4 } },
    { "�o Cho�ng Ng� H�nh H�a Ch�", { 0, 152, 7, 1, 4 } },
    { "�o Cho�ng Ng� H�nh Th� Ch�", { 0, 152, 8, 1, 4 } },
    { "�o Cho�ng Ng� H�nh �m Ch�", { 0, 152, 9, 1, 4 } },
}
CK_JS_HUIZHANG = {
    { "Huy Ch��ng Kim Ch� ng� h�nh", { 0, 153, 4, 1, 4 } },
    { "Huy Ch��ng M�c Ch� ng� h�nh", { 0, 153, 5, 1, 4 } },
    { "Huy Ch��ng Th�y Ch� ng� h�nh", { 0, 153, 6, 1, 4 } },
    { "Huy Ch��ng H�a Ch� ng� h�nh", { 0, 153, 7, 1, 4 } },
    { "Huy Ch��ng Th� Ch� ng� h�nh", { 0, 153, 8, 1, 4 } },
    { "Huy Ch��ng �m Ch� ng� h�nh", { 0, 153, 9, 1, 4 } },
}
CK_JS_SHOE = {
    { "Chi�n H�i Kim Ch� ng� h�nh", { 0, 154, 4, 1, 4 } },
    { "Chi�n H�i M�c Ch� ng� h�nh", { 0, 154, 5, 1, 4 } },
    { "Chi�n H�i Th�y Ch� ng� h�nh", { 0, 154, 6, 1, 4 } },
    { "Chi�n H�i H�a Ch� ng� h�nh", { 0, 154, 7, 1, 4 } },
    { "Chi�n H�i Th� Ch� ng� h�nh", { 0, 154, 8, 1, 4 } },
    { "Chi�n H�i �m Ch� ng� h�nh", { 0, 154, 9, 1, 4 } },
}

CK_YAOYANG_JIEZI_1 = {
    { "Di�u D��ng-� L�n B�o Gi�i", { 0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-T� Giao Ng�c B�i", { 0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-V�n H� L�nh", { 0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-X�ch T��c Ho�n", { 0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-B�ch Quy Li�n", { 0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_YAOYANG_JIEZI_2 = {
    { "Di�u D��ng-� L�n B�o Gi�i", { 0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-T� Giao Ng�c B�i", { 0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-V�n H� L�nh", { 0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-X�ch T��c Ho�n", { 0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-B�ch Quy Li�n", { 0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_4_LEVEL_YUNLING = {
    { "H-Li�t Nham-Lv4", { 0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph� Kh�ng-Lv4", { 0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�y Ki�m-Lv4", { 0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�t Phong-Lv4", { 0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�n V�-Lv4", { 0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-�ng T�p-Lv4", { 0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T�m-Lv4", { 0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Th�n L�c-Lv4", { 0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng�ng Th�n-Lv4", { 0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� Gian-Lv4", { 0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� C�c-Lv4", { 0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cu�ng Nh�n-Lv4", { 0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L�ng Nhu�-Lv4", { 0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Vi�n-Lv4", { 0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H�i V�n-Lv4", { 0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H�i T�m-Lv4", { 0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Li�t Nham-Lv4", { 0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph� Kh�ng-Lv4", { 0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�y Ki�m-Lv4", { 0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�t Phong-Lv4", { 0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�n V�-Lv4", { 0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu�n Th�ch-Lv4", { 0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-N� Ng�m-Lv4", { 0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuy�n V�n-Lv4", { 0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Th�n L�c-Lv4", { 0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng�ng Th�n-Lv4", { 0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� Gian-Lv4", { 0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� C�c-Lv4", { 0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cu�ng Nh�n-Lv4", { 0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L�ng Nhu�-Lv4", { 0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Vi�n-Lv4", { 0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H�i V�n-Lv4", { 0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H�i T�m-Lv4", { 0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Li�t Nham-Lv4", { 0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh�ng-Lv4", { 0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�y Ki�m-Lv4", { 0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�t Phong-Lv4", { 0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�n V�-Lv4", { 0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� L��ng-Lv4", { 0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M�c Minh-Lv4", { 0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th�n L�c-Lv4", { 0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng�ng Th�n-Lv4", { 0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv4", { 0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C�c-Lv4", { 0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu�ng Nh�n-Lv4", { 0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L�ng Nhu�-Lv4", { 0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi�n-Lv4", { 0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i V�n-Lv4", { 0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i T�m-Lv4", { 0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_5_LEVEL_YUNLING = {
    { "H-Li�t Nham-Lv5", { 0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ph� Kh�ng-Lv5", { 0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�y Ki�m-Lv5", { 0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�t Phong-Lv5", { 0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-T�n V�-Lv5", { 0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-�ng T�p-Lv5", { 0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh T�m-Lv5", { 0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Th�n L�c-Lv5", { 0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Ng�ng Th�n-Lv5", { 0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� Gian-Lv5", { 0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-V� C�c-Lv5", { 0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Cu�ng Nh�n-Lv5", { 0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-L�ng Nhu�-Lv5", { 0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-Linh Vi�n-Lv5", { 0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H�i V�n-Lv5", { 0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "H-H�i T�m-Lv5", { 0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Li�t Nham-Lv5", { 0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ph� Kh�ng-Lv5", { 0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�y Ki�m-Lv5", { 0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�t Phong-Lv5", { 0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-T�n V�-Lv5", { 0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Qu�n Th�ch-Lv5", { 0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-N� Ng�m-Lv5", { 0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Xuy�n V�n-Lv5", { 0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Th�n L�c-Lv5", { 0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Ng�ng Th�n-Lv5", { 0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� Gian-Lv5", { 0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-V� C�c-Lv5", { 0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Cu�ng Nh�n-Lv5", { 0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-L�ng Nhu�-Lv5", { 0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-Linh Vi�n-Lv5", { 0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H�i V�n-Lv5", { 0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "C-H�i T�m-Lv5", { 0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Li�t Nham-Lv5", { 0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh�ng-Lv5", { 0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�y Ki�m-Lv5", { 0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�t Phong-Lv5", { 0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�n V�-Lv5", { 0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� L��ng-Lv5", { 0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M�c Minh-Lv5", { 0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th�n L�c-Lv5", { 0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng�ng Th�n-Lv5", { 0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv5", { 0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C�c-Lv5", { 0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu�ng Nh�n-Lv5", { 0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L�ng Nhu�-Lv5", { 0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi�n-Lv5", { 0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i V�n-Lv5", { 0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i T�m-Lv5", { 0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

CK_6_LEVEL_YUNLING = {
    { "T-Li�t Nham-Lv6", { 0, 150, 85, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ph� Kh�ng-Lv6", { 0, 150, 86, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�y Ki�m-Lv6", { 0, 150, 87, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�t Phong-Lv6", { 0, 150, 88, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-T�n V�-Lv6", { 0, 150, 89, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� L��ng-Lv6", { 0, 150, 90, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-M�c Minh-Lv6", { 0, 150, 91, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Th�n L�c-Lv6", { 0, 150, 92, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Ng�ng Th�n-Lv6", { 0, 150, 93, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� Gian-Lv6", { 0, 150, 94, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-V� C�c-Lv6", { 0, 150, 95, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Cu�ng Nh�n-Lv6", { 0, 150, 96, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-L�ng Nhu�-Lv6", { 0, 150, 97, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-Linh Vi�n-Lv6", { 0, 150, 98, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i V�n-Lv6", { 0, 150, 99, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "T-H�i T�m-Lv6", { 0, 150, 100, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

function ck_GiveRandGem456()
    --Faction Cloth 9
    local VET_RandGem456 = {
        { 1, 20, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 20, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 20, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 20, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 4, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 4, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 4, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 4, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
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
    -- ��Ҫ�ȼ��͸�����
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
end    -- 7ת ��Ҫ694��
function judge_translife_needLv_692()
    return judge_translife_needLv(692)
end    -- 7ת ��Ҫ694��
function judge_translife_needLv_792()
    return judge_translife_needLv(792)
end
function judge_translife_needLv_796()
    return judge_translife_needLv(796)
end    -- 8ת ��Ҫ796
function judge_translife_needLv_794()
    return judge_translife_needLv(794)
end    -- 8ת ��Ҫ794
function judge_translife_needLv_793()
    return judge_translife_needLv(793)
end    -- 8ת ��Ҫ793
function judge_translife_needLv_896()
    return judge_translife_needLv(896)
end    -- 9ת ��Ҫ896
function judge_translife_needLv_894()
    return judge_translife_needLv(894)
end    -- 9ת ��Ҫ894
function judge_translife_needLv_893()
    return judge_translife_needLv(893)
end    -- 9ת ��Ҫ893
function judge_translife_needLv_892()
    return judge_translife_needLv(892)
end    -- 9ת ��Ҫ892

function judge_translife_needLv_992()
    return judge_translife_needLv(992)
end    -- 10ת ��Ҫ992

function judge_translife_needLv_997_fsd_5()
    return judge_translife_needLv_and_fushendan(997, 5)
end    -- 10ת ��Ҫ997, 5��������
function judge_translife_needLv_995_fsd_3()
    return judge_translife_needLv_and_fushendan(995, 3)
end    -- 10ת ��Ҫ995, 3��������
function judge_translife_needLv_994_fsd_3()
    return judge_translife_needLv_and_fushendan(994, 3)
end    -- 10ת ��Ҫ994, 3��������
function judge_translife_needLv_994_fsd_2()
    return judge_translife_needLv_and_fushendan(994, 2)
end    -- 10ת ��Ҫ994, 2��������
function judge_translife_needLv_994_fsd_1()
    return judge_translife_needLv_and_fushendan(994, 1)
end    -- 10ת ��Ҫ994, 1��������

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
        gf_SetTaskByte(1538, 1, 5);            --5ת
        SetLevel(90, 1);                                  --90��
        Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
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
            gf_SetTaskByte(1538, 1, 5);            --1ת
            PlayerReborn(2, random(1, 4))
            SetLevel(73, 1);                        --73��
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
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
            gf_SetTaskByte(1538, 1, 5);            --1ת
            PlayerReborn(2, random(1, 4))
            SetLevel(90, 1);                        --73��
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
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
        { "Chi�n Cu�ng Thi�n ��a M�o", { 0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi�n Cu�ng Thi�n ��a M�o", { 0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi�n Cu�ng Thi�n T�n M�o", { 0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi�n Cu�ng Thi�n T�n M�o", { 0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi�n Cu�ng Ph� T� M�o", { 0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi�n Cu�ng Ph� T� M�o", { 0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", { 0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", { 0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", { 0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Qu�n", { 0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi�n Cu�ng B� T�t Tr�m", { 0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi�n Cu�ng B� T�t Tr�m", { 0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi�n Cu�ng L�u Th�y Tr�m", { 0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi�n Cu�ng L�u Th�y Tr�m", { 0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi�n Cu�ng Th�n Du C�n", { 0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi�n Cu�ng Th�n Du C�n", { 0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi�n Cu�ng Th�n Du C�n", { 0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi�n Cu�ng Th�n Du C�n", { 0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi�n Cu�ng Ti�u Dao C�n", { 0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi�n Cu�ng Ti�u Dao C�n", { 0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi�n Cu�ng Ti�u Dao C�n", { 0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi�n Cu�ng Ti�u Dao C�n", { 0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi�n Cu�ng V� Vi Qu�n", { 0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi�n Cu�ng V� Vi Qu�n", { 0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi�n Cu�ng V� Vi Qu�n", { 0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi�n Cu�ng V� Vi Qu�n", { 0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi�n Cu�ng C�n Kh�n Qu�n", { 0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi�n Cu�ng C�n Kh�n Qu�n", { 0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi�n Cu�ng C�n Kh�n Qu�n", { 0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi�n Cu�ng C�n Kh�n Qu�n", { 0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", { 0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", { 0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", { 0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Kh�i", { 0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", { 0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", { 0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", { 0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Kh�i", { 0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi�n Cu�ng Minh T�n C�n", { 0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi�n Cu�ng Minh T�n C�n", { 0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi�n Cu�ng Minh T�n C�n", { 0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi�n Cu�ng Minh T�n C�n", { 0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi�n Cu�ng C� T�m C�n", { 0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi�n Cu�ng C� T�m C�n", { 0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi�n Cu�ng C� T�m C�n", { 0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi�n Cu�ng C� T�m C�n", { 0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi�n Cu�ng Phong L�i Qu�n", { 0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi�n Cu�ng Phong L�i Qu�n", { 0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi�n Cu�ng ��i ��a C�n", { 0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi�n Cu�ng ��i ��a C�n", { 0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi�n Cu�ng ��i ��a C�n", { 0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi�n Cu�ng ��i ��a C�n", { 0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi�n Cu�ng T�y M�ng Qu�n", { 0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi�n Cu�ng T�y M�ng Qu�n", { 0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi�n Cu�ng T�y M�ng Qu�n", { 0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi�n Cu�ng T�y M�ng Qu�n", { 0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi�n Cu�ng Ma V�c  Qu�n", { 0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi�n Cu�ng Ma V�c  Qu�n", { 0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi�n Cu�ng Ma V�c  Qu�n", { 0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi�n Cu�ng Ma V�c  Qu�n", { 0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi�n Cu�ng Th�nh N�  Tr�m", { 0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi�n Cu�ng Th�nh N�  Tr�m", { 0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi�n Cu�ng Th�nh Linh Tr�m", { 0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi�n Cu�ng Th�nh Linh Tr�m", { 0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },

        -- ����
        { "Chi�n Cu�ng B�n V�n Qu�n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi�n Cu�ng B�n V�n Qu�n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi�n Cu�ng B�n V�n Qu�n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi�n Cu�ng B�n V�n Qu�n", { 0, 103, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ����
        { "Chi�n Cu�ng Tr�m Ma Qu�n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi�n Cu�ng Tr�m Ma Qu�n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi�n Cu�ng Tr�m Ma Qu�n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi�n Cu�ng Tr�m Ma Qu�n", { 0, 103, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tCloth = {
        { "Chi�n Cu�ng Thi�n ��a B�o", { 0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi�n Cu�ng Thi�n ��a B�o", { 0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi�n Cu�ng Thi�n T�n B�o", { 0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi�n Cu�ng Thi�n T�n B�o", { 0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi�n Cu�ng Ph� T� B�o", { 0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi�n Cu�ng Ph� T� B�o", { 0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi�n Cu�ng Tuy�t M�nh Y", { 0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Y", { 0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Y", { 0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Y", { 0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi�n Cu�ng B� T�t Y", { 0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi�n Cu�ng B� T�t Y", { 0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi�n Cu�ng L�u Th�yY", { 0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi�n Cu�ng L�u Th�yY", { 0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi�n Cu�ng Th�n Du Y", { 0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi�n Cu�ng Th�n Du Y", { 0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi�n Cu�ng Th�n Du Y", { 0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi�n Cu�ng Th�n Du Y", { 0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi�n Cu�ng Ti�u Dao Y", { 0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi�n Cu�ng Ti�u Dao Y", { 0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi�n Cu�ng Ti�u Dao Y", { 0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi�n Cu�ng Ti�u Dao Y", { 0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi�n Cu�ng V� Vi B�o", { 0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi�n Cu�ng V� Vi B�o", { 0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi�n Cu�ng V� Vi B�o", { 0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi�n Cu�ng V� Vi B�o", { 0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi�n Cu�ng C�n Kh�n B�o", { 0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi�n Cu�ng C�n Kh�n B�o", { 0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi�n Cu�ng C�n Kh�n B�o", { 0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi�n Cu�ng C�n Kh�n B�o", { 0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", { 0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", { 0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", { 0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Gi�p", { 0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", { 0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", { 0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", { 0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Gi�p", { 0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi�n Cu�ng Minh T�n Y", { 0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi�n Cu�ng Minh T�n Y", { 0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi�n Cu�ng Minh T�n Y", { 0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi�n Cu�ng Minh T�n Y", { 0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi�n Cu�ng C� T�m Y", { 0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi�n Cu�ng C� T�m Y", { 0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi�n Cu�ng C� T�m Y", { 0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi�n Cu�ng C� T�m Y", { 0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi�n Cu�ng Phong L�i B�o", { 0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi�n Cu�ng Phong L�i B�o", { 0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi�n Cu�ng ��i ��a Y", { 0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi�n Cu�ng ��i ��a Y", { 0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi�n Cu�ng ��i ��a Y", { 0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi�n Cu�ng ��i ��a Y", { 0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi�n Cu�ng T�y M�ng B�o", { 0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi�n Cu�ng T�y M�ng B�o", { 0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi�n Cu�ng T�y M�ng B�o", { 0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi�n Cu�ng T�y M�ng B�o", { 0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi�n Cu�ng Ma V�c  B�o", { 0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi�n Cu�ng Ma V�c  B�o", { 0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi�n Cu�ng Ma V�c  B�o", { 0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi�n Cu�ng Ma V�c  B�o", { 0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi�n Cu�ng Th�nh N�  Y", { 0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi�n Cu�ng Th�nh N�  Y", { 0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi�n Cu�ng Th�nh Linh Y", { 0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi�n Cu�ng Th�nh Linh Y", { 0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- ����
        { "Chi�n Cu�ng B�n V�n B�o", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi�n Cu�ng B�n V�n B�o", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi�n Cu�ng B�n V�n B�o", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi�n Cu�ng B�n V�n B�o", { 0, 100, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ����
        { "Chi�n Cu�ng Tr�m Ma B�o", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi�n Cu�ng Tr�m Ma B�o", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi�n Cu�ng Tr�m Ma B�o", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi�n Cu�ng Tr�m Ma B�o", { 0, 100, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tShoe = {
        { "Chi�n Cu�ng Thi�n ��a Trang", { 0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi�n Cu�ng Thi�n ��a Trang", { 0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi�n Cu�ng Thi�n T�n Trang", { 0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi�n Cu�ng Thi�n T�n Trang", { 0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi�n Cu�ng Ph� T� Trang", { 0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi�n Cu�ng Ph� T� Trang", { 0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi�n Cu�ng Tuy�t M�nh Trang", { 0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Trang", { 0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Trang", { 0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi�n Cu�ng Tuy�t M�nh Trang", { 0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi�n Cu�ng B� T�t Kh�", { 0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi�n Cu�ng B� T�t Kh�", { 0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi�n Cu�ng L�u Th�yKh�", { 0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi�n Cu�ng L�u Th�yKh�", { 0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi�n Cu�ng Th�n Du Trang", { 0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi�n Cu�ng Th�n Du Trang", { 0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi�n Cu�ng Th�n Du Trang", { 0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi�n Cu�ng Th�n Du Trang", { 0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi�n Cu�ng Ti�u Dao Trang", { 0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi�n Cu�ng Ti�u Dao Trang", { 0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi�n Cu�ng Ti�u Dao Trang", { 0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi�n Cu�ng Ti�u Dao Trang", { 0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi�n Cu�ng V� Vi Trang", { 0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi�n Cu�ng V� Vi Trang", { 0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi�n Cu�ng V� Vi Trang", { 0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi�n Cu�ng V� Vi Trang", { 0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi�n Cu�ng C�n Kh�n Trang", { 0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi�n Cu�ng C�n Kh�n Trang", { 0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi�n Cu�ng C�n Kh�n Trang", { 0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi�n Cu�ng C�n Kh�n Trang", { 0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi�n Cu�ng Thi�n Tinh  Trang", { 0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Trang", { 0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Trang", { 0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi�n Cu�ng Thi�n Tinh  Trang", { 0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi�n Cu�ng Xuy�n V�n Trang", { 0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Trang", { 0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Trang", { 0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi�n Cu�ng Xuy�n V�n Trang", { 0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi�n Cu�ng Minh T�n Trang", { 0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi�n Cu�ng Minh T�n Trang", { 0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi�n Cu�ng Minh T�n Trang", { 0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi�n Cu�ng Minh T�n Trang", { 0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi�n Cu�ng C� T�m Trang", { 0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi�n Cu�ng C� T�m Trang", { 0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi�n Cu�ng C� T�m Trang", { 0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi�n Cu�ng C� T�m Trang", { 0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi�n Cu�ng Phong L�i Trang", { 0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi�n Cu�ng Phong L�i Trang", { 0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi�n Cu�ng ��i ��a Trang", { 0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi�n Cu�ng ��i ��a Trang", { 0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi�n Cu�ng ��i ��a Trang", { 0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi�n Cu�ng ��i ��a Trang", { 0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi�n Cu�ng T�y M�ng Trang", { 0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi�n Cu�ng T�y M�ng Trang", { 0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi�n Cu�ng T�y M�ng Trang", { 0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi�n Cu�ng T�y M�ng Trang", { 0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi�n Cu�ng Ma V�c  Trang", { 0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi�n Cu�ng Ma V�c  Trang", { 0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi�n Cu�ng Ma V�c  Trang", { 0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi�n Cu�ng Ma V�c  Trang", { 0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi�n Cu�ng Th�nh N�  Kh�", { 0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi�n Cu�ng Th�nh N�  Kh�", { 0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi�n Cu�ng Th�nh Linh Kh�", { 0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi�n Cu�ng Th�nh Linh Kh�", { 0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        -- ����
        { "Chi�n Cu�ng B�n V�n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi�n Cu�ng B�n V�n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi�n Cu�ng B�n V�n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi�n Cu�ng B�n V�n Trang", { 0, 101, 32169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        -- ����
        { "Chi�n Cu�ng Tr�m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi�n Cu�ng Tr�m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi�n Cu�ng Tr�m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi�n Cu�ng Tr�m Ma Trang", { 0, 101, 32170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
    },
    tWeapon = {
        { "Chi�n Cu�ng B�ng Thi�n �ao", { 0, 3, 30143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 2 },
        { "Chi�n Cu�ng B�ng Thi�n �ao", { 0, 3, 30144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 2 },
        { "Chi�n Cu�ng Thi�n ��nh Tr��ng", { 0, 8, 30147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 3 },
        { "Chi�n Cu�ng Thi�n ��nh Tr��ng", { 0, 8, 30148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 3 },
        { "Chi�n Cu�ng Th�nh Chi�n Th�", { 0, 0, 30145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 4 },
        { "Chi�n Cu�ng Th�nh Chi�n Th�", { 0, 0, 30146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 4 },
        { "Chi�n Cu�ng �o�t H�n Ch�m", { 0, 1, 30149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 6 },
        { "Chi�n Cu�ng �o�t H�n Ch�m", { 0, 1, 30150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 6 },
        { "Chi�n Cu�ng �o�t H�n Ch�m", { 0, 1, 30151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 6 },
        { "Chi�n Cu�ng �o�t H�n Ch�m", { 0, 1, 30152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 6 },
        { "Chi�n Cu�ng Ph�t Quang Ki�m", { 0, 2, 30153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 8 },
        { "Chi�n Cu�ng Ph�t Quang Ki�m", { 0, 2, 30154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 8 },
        { "Chi�n Cu�ng H� Bang C�m", { 0, 10, 30155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 9 },
        { "Chi�n Cu�ng H� Bang C�m", { 0, 10, 30156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 9 },
        { "Chi�n Cu�ng Tr�ng �c Th�", { 0, 0, 30157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 11 },
        { "Chi�n Cu�ng Tr�ng �c Th�", { 0, 0, 30158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 11 },
        { "Chi�n Cu�ng Tr�ng �c Th�", { 0, 0, 30159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 11 },
        { "Chi�n Cu�ng Tr�ng �c Th�", { 0, 0, 30160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 11 },
        { "Chi�n Cu�ng V� C�c C�n", { 0, 5, 30161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 12 },
        { "Chi�n Cu�ng V� C�c C�n", { 0, 5, 30162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 12 },
        { "Chi�n Cu�ng V� C�c C�n", { 0, 5, 30163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 12 },
        { "Chi�n Cu�ng V� C�c C�n", { 0, 5, 30164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 12 },
        { "Chi�n Cu�ng Khu Ma Ki�m", { 0, 2, 30165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 14 },
        { "Chi�n Cu�ng Khu Ma Ki�m", { 0, 2, 30166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 14 },
        { "Chi�n Cu�ng Khu Ma Ki�m", { 0, 2, 30167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 14 },
        { "Chi�n Cu�ng Khu Ma Ki�m", { 0, 2, 30168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 14 },
        { "Chi�n Cu�ng Th��ng Khung B�t", { 0, 9, 30169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 15 },
        { "Chi�n Cu�ng Th��ng Khung B�t", { 0, 9, 30170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 15 },
        { "Chi�n Cu�ng Th��ng Khung B�t", { 0, 9, 30171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 15 },
        { "Chi�n Cu�ng Th��ng Khung B�t", { 0, 9, 30172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 15 },
        { "Chi�n Cu�ng Th�n K�ch Th��ng", { 0, 6, 30173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 17 },
        { "Chi�n Cu�ng Th�n K�ch Th��ng", { 0, 6, 30174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 17 },
        { "Chi�n Cu�ng Th�n K�ch Th��ng", { 0, 6, 30175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 17 },
        { "Chi�n Cu�ng Th�n K�ch Th��ng", { 0, 6, 30176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 17 },
        { "Chi�n Cu�ng Xung Thi�n Cung", { 0, 4, 30177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 18 },
        { "Chi�n Cu�ng Xung Thi�n Cung", { 0, 4, 30178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 18 },
        { "Chi�n Cu�ng Xung Thi�n Cung", { 0, 4, 30179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 18 },
        { "Chi�n Cu�ng Xung Thi�n Cung", { 0, 4, 30180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 18 },
        { "Chi�n Cu�ng Luy�n Ng�c �ao", { 0, 7, 30181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 20 },
        { "Chi�n Cu�ng Luy�n Ng�c �ao", { 0, 7, 30182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 20 },
        { "Chi�n Cu�ng Luy�n Ng�c �ao", { 0, 7, 30183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 20 },
        { "Chi�n Cu�ng Luy�n Ng�c �ao", { 0, 7, 30184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 20 },
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", { 0, 11, 30185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 21 },
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", { 0, 11, 30186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 21 },
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", { 0, 11, 30187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 21 },
        { "Chi�n Cu�ng Nhi�p H�n Tr�o", { 0, 11, 30188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 21 },
        { "Chi�n Cu�ng Thi�n Ph�t Ki�m", { 0, 2, 30189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 23 },
        { "Chi�n Cu�ng Thi�n Ph�t Ki�m", { 0, 2, 30190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 23 },
        { "Chi�n Cu�ng Ch�c Dung �ao", { 0, 3, 30191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 25 },
        { "Chi�n Cu�ng Ch�c Dung �ao", { 0, 3, 30192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 25 },
        { "Chi�n Cu�ng Ch�c Dung �ao", { 0, 3, 30193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 25 },
        { "Chi�n Cu�ng Ch�c Dung �ao", { 0, 3, 30194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 25 },
        { "Chi�n Cu�ng T� M�nh B�t", { 0, 9, 30195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 26 },
        { "Chi�n Cu�ng T� M�nh B�t", { 0, 9, 30196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 26 },
        { "Chi�n Cu�ng T� M�nh B�t", { 0, 9, 30197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 26 },
        { "Chi�n Cu�ng T� M�nh B�t", { 0, 9, 30198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 26 },
        { "Chi�n Cu�ng Truy H�n Tr�o", { 0, 11, 30199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 27 },
        { "Chi�n Cu�ng Truy H�n Tr�o", { 0, 11, 30200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 27 },
        { "Chi�n Cu�ng Truy H�n Tr�o", { 0, 11, 30201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 27 },
        { "Chi�n Cu�ng Truy H�n Tr�o", { 0, 11, 30202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 27 },
        { "Chi�n Cu�ng Phong Linh Phi�n", { 0, 13, 30203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 29 },
        { "Chi�n Cu�ng Phong Linh Phi�n", { 0, 13, 30204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 29 },
        { "Chi�n Cu�ng Kh�ng Minh ��ch", { 0, 12, 30205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 30 },
        { "Chi�n Cu�ng Kh�ng Minh ��ch", { 0, 12, 30206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 30 },
        { "Chi�n Cu�ng B�n V�n Ch�y", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 31 },
        { "Chi�n Cu�ng B�n V�n Ch�y", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 31 },
        { "Chi�n Cu�ng B�n V�n Ch�y", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 31 },
        { "Chi�n Cu�ng B�n V�n Ch�y", { 0, 14, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 31 },
        { "Chi�n Cu�ng Tr�m Ma Ki�m", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 1, 32 },
        { "Chi�n Cu�ng Tr�m Ma Ki�m", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 2, 32 },
        { "Chi�n Cu�ng Tr�m Ma Ki�m", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 3, 32 },
        { "Chi�n Cu�ng Tr�m Ma Ki�m", { 0, 2, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 }, 4, 32 },
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
    --��ɳ��︴��2����VNG���ܣ�
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
        { 1, 25, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 1 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 1 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 1 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 1 }, nil, nil, nil, nil },
        { 1, 24, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 24, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 24, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 24, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 1, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 1, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 1, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
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
    Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Nhi�m V� ��t Nh�n"))
end

function award_tong_title3()
    SendScript2VM("\\script\\isolate\\functions\\tong_title\\tong_title.lua", format("force_give_max_lv(%d)", 3))
    Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Kim Lan"))
end

function award_random_gem1_1()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv1", { 2, 22, 101, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv1", { 2, 22, 201, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 1", { 2, 22, 301, 10, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 1", { 2, 22, 401, 10, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem1_2()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv1", { 2, 22, 101, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv1", { 2, 22, 201, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 1", { 2, 22, 301, 20, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 1", { 2, 22, 401, 20, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_1()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv2", { 2, 22, 102, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv2", { 2, 22, 202, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 2", { 2, 22, 302, 8, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 2", { 2, 22, 402, 8, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem2_2()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv2", { 2, 22, 102, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv2", { 2, 22, 202, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 2", { 2, 22, 302, 12, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 2", { 2, 22, 402, 12, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_4()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 4, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 4, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_5()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 5, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 5, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_7()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 7, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 7, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem3_9()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 9, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 9, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem4_3()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 3, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 3, 4 }, nil, nil, nil, nil },
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
        { 1, 25, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_random_gem7_1()
    local VET_RandGem = {
        { 1, 25, "Huy�t Tr�ch Th�ch c�p 7", { 2, 22, 107, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�t B�ch Th�ch c�p 7", { 2, 22, 207, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch c�p 7", { 2, 22, 307, 1, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch c�p 7", { 2, 22, 407, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end
function award_random_gem7_2()
    local VET_RandGem = {
        { 1, 25, "Huy�t Tr�ch Th�ch c�p 7", { 2, 22, 107, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "Nguy�t B�ch Th�ch c�p 7", { 2, 22, 207, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "H� Ph�ch Th�ch c�p 7", { 2, 22, 307, 2, 4 }, nil, nil, nil, nil },
        { 1, 25, "H�c Di�u Th�ch c�p 7", { 2, 22, 407, 2, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook5()
    local VET_RandGem = {
        { 1, 30, "�ch Th� Di�n D��ng C�p 5", { 2, 150, 68, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "C��ng Th�n B� Th� C�p 5", { 2, 150, 69, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Huy�n V� V� Song C�p 5", { 2, 150, 71, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Ph� Kh�ng Tr�m �nh C�p 5", { 2, 150, 78, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Khinh Linh T�n T�t C�p 5", { 2, 150, 80, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_petbook6()
    local VET_RandGem = {
        { 1, 10, "Ng�ng Th�n Quy�t Lv2", { 2, 150, 103, 1, 4 }, nil, nil, nil, nil },
        { 1, 10, "Kinh ��o Quy�t Lv2", { 2, 150, 104, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Linh Quang Thi�m Lv2", { 2, 150, 102, 1, 4 }, nil, nil, nil, nil },
        { 1, 20, "V� H�nh Chi C� Lv6", { 2, 150, 101, 1, 4 }, nil, nil, nil, nil },
        { 1, 30, "Khinh Linh T�n T�t Lv6", { 2, 150, 100, 1, 4 }, nil, nil, nil, nil },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "CDKEY", "CDKEY")
end

function award_8zhuan10()
    if gf_GetTransLevel() >= 796 then
        if gf_GetPlayerRebornCount() < 8 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(3, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
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
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
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
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 1000000000);
        end
    end
end

function award_10zhuan10_need997cost5fsd()
    if judge_translife_needLv_997_fsd_5() == 0 then
        Talk(1, "", format("    <color=gold>��t ��n CS %d Lv%d, t�n %d Ph�c Sinh ��n<color>", 9, 97, 5))
    end
    if gf_GetTransLevel() >= 997 and DelItem(2, 1, 30814, 5) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end
function award_10zhuan10_need995cost3fsd()
    if judge_translife_needLv_995_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>��t ��n CS %d Lv%d, t�n %d Ph�c Sinh ��n<color>", 9, 95, 3))
    end
    if gf_GetTransLevel() >= 995 and DelItem(2, 1, 30814, 3) == 1 then
        if gf_GetPlayerRebornCount() < 10 then
            gf_SetTaskByte(1538, 1, 5)
            PlayerReborn(5, random(1, 4))
            SetLevel(10, 1)
            Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
            PlaySound("\\sound\\sound_i016.wav");
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        else
            gf_Modify("Exp", 2000000000);
        end
    end
end

function award_10zhuan90_need994cost3fsd()
    if judge_translife_needLv_994_fsd_3() == 0 then
        Talk(1, "", format("    <color=gold>��t ��n CS %d Lv%d, t�n %d Ph�c Sinh ��n<color>", 9, 94, 3))
        return
    end
    if DelItem(2, 1, 30814, 3) == 1 then
        ck_award_reborn(10, 90, 2000000000)
    end
end

function award_10zhuan94_need994cost1fsd()
    if judge_translife_needLv_994_fsd_1() == 0 then
        Talk(1, "", format("    <color=gold>��t ��n CS %d Lv%d, t�n %d Ph�c Sinh ��n<color>", 9, 94, 1))
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
        Talk(1, "", format("C�n %d <color=red>C�u Thi�n V� C�c ��n<color> �� ��i <color=gold>V� H� H�o Hi�p L�nh (V� kh�)<color>!", 2))
        return
    end
    if DelItem(2, 1, 1006, 2) == 1 then
        gf_AddItemEx({ 2, 1, 30973, 1, 4 }, "V� H� H�o Hi�p L�nh (V� kh�)");
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
    "select", "T� ch�n 1 m�n Kim X� Lv5",
    {
        { "item", "Huy ch��ng Hi�p C�t", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy ch��ng Q�y Ph�", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Huy ch��ng ��ng V�n", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "�o kho�c Hi�p C�t", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "�o kho�c Q�y Ph�", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "�o kho�c ��ng V�n", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hi�p C�t Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Q�y Ph� Chi�n Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "��ng V�n Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_5Star_Jinshe9 = {
    "select", "T� ch�n 1 m�n Kim X� Lv5 (C��ng h�a +9)",
    {
        { "item", "Huy ch��ng Hi�p C�t", { 0, 153, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy ch��ng Q�y Ph�", { 0, 153, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Huy ch��ng ��ng V�n", { 0, 153, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "�o kho�c Hi�p C�t", { 0, 152, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "�o kho�c Q�y Ph�", { 0, 152, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "�o kho�c ��ng V�n", { 0, 152, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Hi�p C�t Ngoa", { 0, 154, 29, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Q�y Ph� Chi�n Ngoa", { 0, 154, 30, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "��ng V�n Ngoa", { 0, 154, 31, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_6Star_Jinshe = {
    "select", "T� ch�n 1 m�n Kim X� Lv6",
    {
        { "item", "Hoan L�ng Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "��ng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh�i Ph��ng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L�ng Ch��ng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "��ng Giao Ch��ng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh�i Ph��ng Ch��ng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Hoan L�ng Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "��ng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "item", "Kh�i Ph��ng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
    },
}

table_6Star_Jinshe9 = {
    "select", "T� ch�n 1 m�n Kim X� Lv6 (C��ng h�a +9)",
    {
        { "item", "Hoan L�ng Phi Phong", { 0, 152, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "��ng Giao Phi Phong", { 0, 152, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh�i Ph��ng Phi Phong", { 0, 152, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L�ng Ch��ng", { 0, 153, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "��ng Giao Ch��ng", { 0, 153, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh�i Ph��ng Ch��ng", { 0, 153, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },

        { "item", "Hoan L�ng Ngoa", { 0, 154, 32, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "��ng Giao Ngoa", { 0, 154, 33, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
        { "item", "Kh�i Ph��ng Ngoa", { 0, 154, 34, 1, 4, -1, -1, -1, -1, -1, -1, -1, 9 } },
    },
}

table_Select_ShaXing = {
    "select", "T� Ch�n L�nh B�i Trang B� S�t Tinh (��u, ?o, Qu�n)",
    {
        { "item", "S�t Tinh L�nh B�i (��u)", { 2, 1, 31313, 1, 4 } },
        { "item", "S�t Tinh L�nh B�i (�o)", { 2, 1, 31314, 1, 4 } },
        { "item", "S�t Tinh L�nh B�i (Qu�n)", { 2, 1, 31315, 1, 4 } },
    },
}

CK_TASK_INDEX_BEGIN_SCORE_AWARD = 10001
CK_SCROE_AWARD_TABLE = {
    [1] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 1000, 10000000, 160, 160, 1400, 0, 177 },
        { "item", "Ma Tinh", { 2, 1, 30497, 500, 4 } },
        { "func", format("Chuy�n sinh %d c�p %d", 7, 90), ck_award_reborn, { 7, 90, 20000000 } },
        { "func", "�� th�ng c�nh gi�i V� Hi�n", award_wuzhe },
        { "func", "N�n chi�n cu�ng+9", award_zhankuangtou },
    },
    [2] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 1700, 30000000, 280, 280, 2200, 0, 179 },
        { "func", "�� th�ng c�nh gi�i V� T��ng", award_wujiang },
        { "func", "�o chi�n cu�ng+9", award_zhankuangyi },
        { "func", "Qu�n chi�n cu�ng+9", award_zhankuangku },
        { "item", "L�ng Ba Vi B�", { 0, 112, 78, 1, 4 } },
    },
    [3] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 2000, 40000000, 340, 340, 2600, 30000, 180 },
        { "func", "�� th�ng c�nh gi�i V� V��ng", award_wuwang },
        { "func", "V� kh� chi�n cu�ng+9", award_zhankuangwuqi },
    },
    [4] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 2400, 50000000, 400, 400, 3000, 0, 181 },
        { "item", "T� Ch�n B� Kim X� Lv4", { 2, 1, 31516, 1, 4 } },
    },
    [5] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 2800, 50000000, 460, 460, 3400, 30000, 182 },
        { "item", "V� H� H�o Hi�p L�nh (�o)", { 2, 1, 30945, 1, 4 } },
        { "func", "B�o Th�ch c�p 1*10", award_random_gem1_1 },
    },
    [6] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 3100, 50000000, 520, 520, 3800, 0, 183 },
        { "func", format("Chuy�n sinh %d c�p %d", 8, 90), ck_award_reborn, { 8, 90, 200000000 } },
        { "func", "�� qu� c�p 1*20", award_random_gem1_2 },
        { "func", "U�n Linh C�p 4", award_yunling4 },
    },
    [7] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 3500, 50000000, 580, 580, 4200, 0, 184 },
        { "func", "�� qu� caaps2*8", award_random_gem2_1 },
        { "item", "Linh �� Gi�i (tr�i)", { 0, 102, 30221, 1, 4 } },
        { "item", "Linh �� Gi�i (ph�i)", { 0, 102, 30222, 1, 4 } },
        { "item", "V� H� H�o Hi�p L�nh (Qu�n)", { 2, 1, 30946, 1, 4 } },
    },
    [8] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 4000, 50000000, 580, 580, 4200, 0, 185 },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 100 } },
        { "item", "V� H� H�o Hi�p L�nh (N�n)", { 2, 1, 30944, 1, 4 } },
    },
    [9] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 5000, 50000000, 580, 580, 4200, 0, 186 },
        { "func", "�� th�ng c�nh gi�i V� T�n", award_wuzun },
        -- {"func", "ս���+9", award_zhankuangku},
        { "func", "�� qu� caaps2*12", award_random_gem2_2 },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 200 } },
    },
    [10] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 6000, 50000000, 580, 580, 4200, 0, 187 },
        { "item", "T� Ch�n B� Kim X� Lv5", { 2, 1, 31517, 1, 4 } },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 300 } },
        --{"exchange", format("%dת%d��",8,90), format("    <color=gold>�ȼ��ﵽ%dת%d��<color>",7,92), judge_translife_needLv_792, award_8zhuan90,},

    },
    [11] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 7000, 50000000, 580, 580, 4200, 0, 188 },
        table_6Star_Jinshe9,
        { "item", "Hi�p Ngh�a Chi Ch�ng", { 2, 1, 30912, 1000, 4 } },
    },
    [12] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 8500, 50000000, 580, 580, 4200, 0, 189 },
        { "func", "�� th�ng C�nh Gi�i V� Ho�ng", award_wuhuang },
        { "item", "�m Huy�t y", { 0, 100, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "Danh hi�u bang h�i c�p 3", award_tong_title3 },
    },
    [13] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 9500, 50000000, 580, 580, 4200, 0, 190 },
        { "item", "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 30973, 1, 4 } },
        { "item", "Hi�p Ngh�a Chi Ch�ng", { 2, 1, 30912, 1000, 4 } },
        --{"item", "6�����龫��", {2,1,30668,4, 4}},
    },
    [14] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 13000, 60000000, 580, 580, 4200, 0, 191 },
        { "exchange", format("Chuy�n sinh %d c�p %d", 9, 90), format("    <color=gold>��t ��n CS %d Lv%d<color>", 8, 92), judge_translife_needLv_892, award_9zhuan90, },
        { "func", "�� qu� c�p 3*5", award_random_gem3_5 },
        { "item", "T�n V�t c�p 5", { 0, 155, 5, 1, 4 } },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 300 } },
        --{"item", "6�����龫��", {2,1,30668,6,4}},
        --{"item", "�߼����޵�", {2,1,30728,1,4}},
        --{"item", "��Ͼ�����������", {2,1,30973, 1, 4}},
    },
    [15] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 15000, 70000000, 580, 580, 4200, 0, 192 },
        table_6Star_Jinshe9,
        { "item", "�m Huy�t ��u", { 0, 103, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "�� qu� c�p 3*7", award_random_gem3_7 },
        { "item", "��ng T� Chi Nguy�n", { 2, 1, 30913, 42, 4 } },
        --{"item", "6�����龫��", {2,1,30668,8,4}},
    },
    [16] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 16000, 80000000, 0, 0, 0, 0, 193 },
        { "item", "�m Huy�t Trang", { 0, 101, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0 } },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 400 } },
        { "func", "�� qu� c�p 3*9", award_random_gem3_9 },
        { "item", "Thi�t tinh c�p 4", { 2, 1, 30612, 10, 4 } },
    },
    [17] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 17000, 90000000, 0, 0, 0, 0, 194 },
        table_6Star_Jinshe9,
        { "item", "Thi�t tinh c�p 4", { 2, 1, 30612, 20, 4 } },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 500 } },
    },
    [18] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 18000, 0, 0, 0, 0, 0, 176 },
        { "item", "T�i Kh�c B�n Ho�n M� (��u)", { 2, 1, 31518, 1, 4 } },
    },
    [19] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 19000, 0, 0, 0, 0, 0, 178 },
        { "item", "T�i Kh�c B�n Ho�n M� (�o)", { 2, 1, 31519, 1, 4 } },
    },
    [20] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 20000, 100000000, 0, 0, 0, 0, 195 },
        table_Select_ShaXing,
        { "item", "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1, 1 } },
        { "item", "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1, 1 } },
        { "item", "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1, 1 } },
        { "item", "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1, 1 } },
        { "item", "Thi�t tinh c�p 4", { 2, 1, 30612, 30, 4 } },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 600 } },
    },
    [21] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 21000, 0, 0, 0, 0, 0, 526 },
        { "item", "T�i Kh�c B�n Ho�n M� (Qu�n)", { 2, 1, 31520, 1, 4 } },
    },
    [22] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 22000, 150000000, 0, 0, 0, 0, 196 },
        { "exchange", format("Chuy�n sinh %d c�p %d", 10, 97), format("    <color=gold>��t ��n CS %d Lv%d<color>", 9, 92), judge_translife_needLv_992, award_10zhuan97, },
        --{"exchange", format("%dת%d��",10,94), format("    <color=gold>�ȼ��ﵽ%dת%d��,������%d��������<color>",9,94,1), judge_translife_needLv_994_fsd_1, award_10zhuan94_need994cost1fsd, },
        { "item", "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 2, 1 } },
        { "item", "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 2, 1 } },
        { "item", "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 2, 1 } },
        { "item", "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 2, 1 } },
    },
    [23] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 23000, 0, 0, 0, 0, 0, 527 },
        { "item", "T�i Kh�c B�n Ho�n M� (Nh�n)", { 2, 1, 31521, 1, 4 } },
    },
    [24] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 24000, 200000000, 0, 0, 0, 0, 197 },
        table_Select_ShaXing,
        { "item", "H�i Ti�n ��n", { 2, 1, 30847, 20, 4 } },
        { "item", "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1, 1 } },
        { "item", "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1, 1 } },
        { "item", "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1, 1 } },
        { "item", "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1, 1 } },
        { "func", "Danh hi�u Nhi�m V� ��t Nh�n", award_title },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 600 } },
    },
    [25] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 25000, 0, 0, 0, 0, 0, 528 },
        { "item", "T�i Kh�c B�n Ho�n M� (Eo)", { 2, 1, 31522, 1, 4 } },
    },
    [26] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 25500, 0, 0, 0, 0, 0, 198 },
        { "item", "Linh Ph�ch ��n", { 2, 1, 31239, 2, 4 } },
        { "func", "S�ch K� N�ng ��ng H�nh C�p 6 (Ng�u nhi�n)", award_petbook6, { 1 } },
    },
    [27] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 26000, 250000000, 0, 0, 0, 0, 199 },
        { "func", "�i�m c�ng hi�n bang", award_tongscore, { 600 } },
        --{"item", "�������ﵰ", {2, 1, 31169, 1, 4}},
        { "item", "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1, 1 } },
        { "item", "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1, 1 } },
        { "item", "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1, 1 } },
        { "item", "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1, 1 } },
    },
    [28] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 27000, 0, 0, 0, 0, 0, 200 },
        { "func", "�� th�ng C�nh Gi�i V� Th�nh", award_wusheng },
    },
    [29] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 28000, 0, 0, 0, 0, 0, 201 },
        { "item", "Huy�t Tr�ch Th�ch c�p 7", { 2, 22, 107, 2, 4 } },
        { "item", "Nguy�t B�ch Th�ch c�p 7", { 2, 22, 207, 2, 4 } },
        { "item", "H� Ph�ch Th�ch c�p 7", { 2, 22, 307, 2, 4 } },
        { "item", "H�c Di�u Th�ch c�p 7", { 2, 22, 407, 2, 4 } },
        --{"func", "���7����ʯ", award_random_gem7_2,{1}},
    },
    [30] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 32000, 0, 0, 0, 0, 0, 216 },
        { "item", "Linh Ph�ch ��n", { 2, 1, 31239, 8, 4 } },
    },
    [31] = {
        --score, EXP ����ֵ ʦ��ֵ ����ֵ ����
        { 35000, 0, 0, 0, 0, 0, 217 },
        { "item", "Th��ng H�i Ch�u Lv7 (Ch�a gi�m ��nh)", { 2, 102, 214, 2, 4 } },
    },
}
function ck_view_score_award(nType)
    local tSay = {
        format("\n Nh�n ph�n th��ng/#ck_get_score_award(%d)", nType),
        "\nT�i ch� xem xem th�i/nothing",
    }
    local tAward = CK_SCROE_AWARD_TABLE[nType]
    local tBase = tAward[1]
    local szMsg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", tBase[2], tBase[3], tBase[4], tBase[5], tBase[6])
    for i = 2, getn(tAward) do
        if tAward[i][1] == "item" then
            szMsg = format("%s,%s*%d", szMsg, tAward[i][2], tAward[i][3][4]);
        else
            szMsg = format("%s,%s", szMsg, tAward[i][2])
        end
    end
    Say(CK_NPC_NAME .. format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", szMsg), getn(tSay), tSay);
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
        Say(CK_NPC_NAME .. format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", nNeedScore), 0);
        return 0;
    end
    --if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, nType) ~= 0 then
    if ActCheckCondition(nAwardedFlagId) ~= 0 then
        Say(CK_NPC_NAME .. "�� nh�n ph�n th��ng n�y r�i!", 0);
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
        -- �����￪ʼ�콱
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
                Msg2Player(format("B�n nh�n ���c %d �i�m �� c�ng hi�n bang h�i", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (t[4] or 0), 1);
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
    local szTitle = format("%s: ��i %s c�n th�m:\n%s", CK_NPC_NAME, tAward[2], tAward[3])
    if tAward[4]() == 1 then
        tinsert(tSay, format("X�c ��nh /#ck_get_score_award_select_final(%d)", nType))
    else
        szTitle = szTitle .. "\n<color=red>Ch�a ��t y�u c�u!<color>"
    end
    tinsert(tSay, "H�y b�/nothing")
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
            local szTitle = format("%s: H�y ch�n %s", CK_NPC_NAME, tAward[2])
            local tSel = tAward[3]
            for k = 1, getn(tSel) do
                if tSel[k][1] == "item" then
                    tinsert(tDialog, format("%s*%d/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], tSel[k][3][4], nType, i, k));
                else
                    tinsert(tDialog, format("%s/#ck_get_score_award_select(%d, %d, %d)", tSel[k][2], nType, i, k));
                end
            end
            tinsert(tDialog, "\nTa ch� xem xem th�i/ck_get_score_award_select_cancle")
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
        -- �����￪ʼ�콱
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
                Msg2Player(format("B�n nh�n ���c %d �i�m �� c�ng hi�n bang h�i", t[4][1]))
            end
        elseif "item" == t[1] then
            gf_AddItemEx2(t[3], t[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (t[4] or 0), 1);
        elseif "select" == t[1] then
            local Index = g_RecordIndex[PlayerIndex][i];
            local tItem = t[3][Index];
            if "item" == tItem[1] then
                gf_AddItemEx2(tItem[3], tItem[2], "CDKEY", "Ph�n th��ng �i�m t�ch l�y", (tItem[4] or 0), 1);
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



