Import("\\script\\lib\\globalfunctions.lua")
--����
DebugOutput = nothing

--�����ʱ��
IC_START_TIME = { 2021, 2, 1, 0, 0, 0 };
IC_END_TIME = { 2021, 3, 1, 0, 0, 0 };

--����������
IC_TASK_GROUP = { 8, 31 };

--��������
IC_INVITE_CODE_SALT = "QGacMYxIdfCfML\0KC4H6MjICYjY9jiU"

--ʹ�õ����ݿ������
IC_MYSQL_TABLE_NAME = "invite_code_1816"

--������Ϊ����
IC_QUERY_TYPE_REG = 1; --ע��
IC_QUERY_TYPE_QRY = 2; --��ѯ
IC_QUERY_TYPE_MDY = 3; --�޸�

--�������ʱ��s
IC_CLICK_TIME = 15;

--�����߽�������
IC_FINISH_INVITE_TYPE1 = 1; --�����¿�
IC_FINISH_INVITE_TYPE2 = 2; --8ת90��
IC_FINISH_INVITE_TYPE3 = 3; --10ת96��
IC_FINISH_INVITE_TYPE4 = 4; --��������2000XU
IC_FINISH_INVITE_TYPE5 = 5; --��������5000XU

IC_FINISH_INVITE_TYPE6 = 6; --�������3������
IC_FINISH_INVITE_TYPE7 = 7; --�������4������
IC_FINISH_INVITE_TYPE8 = 8; --�������5������

G_PLAYER_SCORE_CASH = {} --��һ��ֻ���

function ck_GiveRandGem6()
    local VET_RandGem = {
        { 1, 25, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 25, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 25, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 25, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem7()
    local VET_RandGem = {
        { 1, 25, "Huy�t Tr�ch Th�ch c�p 7", { 2, 22, 107, 1 }, nil, nil, nil, 1 },
        { 1, 25, "Nguy�t B�ch Th�ch c�p 7", { 2, 22, 207, 1 }, nil, nil, nil, 1 },
        { 1, 25, "H� Ph�ch Th�ch c�p 7", { 2, 22, 307, 1 }, nil, nil, nil, 1 },
        { 1, 25, "H�c Di�u Th�ch c�p 7", { 2, 22, 407, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem456()
    --Faction Cloth 9
    local VET_RandGem456 = {
        { 1, 9, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 9, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 9, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 9, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 8, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 8, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
        { 1, 8, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 8, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem456, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem345()
    --Faction Cloth 9
    local VET_RandGem345 = {
        { 1, 8, "Huy�tTr�chTh�ch Lv3", { 2, 22, 103, 1 }, nil, nil, nil, nil },
        { 1, 8, "Nguy�tB�chTh�ch Lv3", { 2, 22, 203, 1 }, nil, nil, nil, nil },
        { 1, 8, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 1 }, nil, nil, nil, nil },
        { 1, 8, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 1 }, nil, nil, nil, nil },
        { 1, 9, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 9, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 9, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 9, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 8, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 8, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 8, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem345, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem45TwoTimes()
    --Faction Cloth 9
    local VET_RandGem45 = {
        { 1, 12, "Huy�tTr�chTh�ch Lv4", { 2, 22, 104, 1 }, nil, nil, nil, nil },
        { 1, 12, "Nguy�tB�chTh�ch Lv4", { 2, 22, 204, 1 }, nil, nil, nil, nil },
        { 1, 13, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 }, nil, nil, nil, nil },
        { 1, 13, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 }, nil, nil, nil, nil },
        { 1, 13, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 13, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem45, 100, 1, "InvitCode", "InvitCode")
    gf_EventGiveRandAward(VET_RandGem45, 100, 1, "InvitCode", "InvitCode")
end
function ck_GiveRandGem56TwoTimes()
    local VET_RandGem56 = {
        { 1, 12, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, nil },
        { 1, 12, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, nil },
        { 1, 13, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, nil },
        { 1, 13, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, nil },
        { 1, 13, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 13, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem56, 100, 1, "InvitCode", "InvitCode")
    gf_EventGiveRandAward(VET_RandGem56, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem67TwoTimes()
    local VET_RandGem67 = {
        { 1, 12, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 12, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
        { 1, 12, "Huy�t Tr�ch Th�ch c�p 7", { 2, 22, 107, 1 }, nil, nil, nil, 1 },
        { 1, 12, "Nguy�t B�ch Th�ch c�p 7", { 2, 22, 207, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H� Ph�ch Th�ch c�p 7", { 2, 22, 307, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H�c Di�u Th�ch c�p 7", { 2, 22, 407, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem67, 100, 1, "InvitCode", "InvitCode")
    gf_EventGiveRandAward(VET_RandGem67, 100, 1, "InvitCode", "InvitCode")
end

function ck_GiveRandGem56()
    --Faction Cloth 9
    local VET_RandGem56 = {
        { 1, 13, "Huy�tTr�chTh�ch Lv5", { 2, 22, 105, 1 }, nil, nil, nil, 1 },
        { 1, 13, "Nguy�tB�chTh�ch Lv5", { 2, 22, 205, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 }, nil, nil, nil, 1 },
        { 1, 13, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 }, nil, nil, nil, 1 },
        { 1, 12, "Huy�tTr�chTh�ch Lv6", { 2, 22, 106, 1 }, nil, nil, nil, 1 },
        { 1, 12, "Nguy�tB�chTh�ch Lv6", { 2, 22, 206, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 }, nil, nil, nil, 1 },
        { 1, 12, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 }, nil, nil, nil, 1 },
    }
    gf_EventGiveRandAward(VET_RandGem56, 100, 1, "InvitCode", "InvitCode")
end

IC_T_YUNLING5 = {
    { 1, 2, "H-Li�t Nham-Lv5", { 0, 148, 69, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Ph� Kh�ng-Lv5", { 0, 148, 70, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�y Ki�m-Lv5", { 0, 148, 71, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�t Phong-Lv5", { 0, 148, 72, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�n V�-Lv5", { 0, 148, 73, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-�ng T�p-Lv5", { 0, 148, 74, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Linh T�m-Lv5", { 0, 148, 75, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Th�n L�c-Lv5", { 0, 148, 76, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Ng�ng Th�n-Lv5", { 0, 148, 77, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-V� Gian-Lv5", { 0, 148, 78, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-V� C�c-Lv5", { 0, 148, 79, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Cu�ng Nh�n-Lv5", { 0, 148, 80, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-L�ng Nhu�-Lv5", { 0, 148, 81, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Linh Vi�n-Lv5", { 0, 148, 82, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-H�i V�n-Lv5", { 0, 148, 83, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-H�i T�m-Lv5", { 0, 148, 84, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Li�t Nham-Lv5", { 0, 149, 70, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Ph� Kh�ng-Lv5", { 0, 149, 71, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�y Ki�m-Lv5", { 0, 149, 72, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�t Phong-Lv5", { 0, 149, 73, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�n V�-Lv5", { 0, 149, 74, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Qu�n Th�ch-Lv5", { 0, 149, 75, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-N� Ng�m-Lv5", { 0, 149, 76, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Xuy�n V�n-Lv5", { 0, 149, 77, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Th�n L�c-Lv5", { 0, 149, 78, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Ng�ng Th�n-Lv5", { 0, 149, 79, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-V� Gian-Lv5", { 0, 149, 80, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-V� C�c-Lv5", { 0, 149, 81, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Cu�ng Nh�n-Lv5", { 0, 149, 82, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-L�ng Nhu�-Lv5", { 0, 149, 83, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Linh Vi�n-Lv5", { 0, 149, 84, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-H�i V�n-Lv5", { 0, 149, 85, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-H�i T�m-Lv5", { 0, 149, 86, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Li�t Nham-Lv5", { 0, 150, 69, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Ph� Kh�ng-Lv5", { 0, 150, 70, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�y Ki�m-Lv5", { 0, 150, 71, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�t Phong-Lv5", { 0, 150, 72, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�n V�-Lv5", { 0, 150, 73, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� L��ng-Lv5", { 0, 150, 74, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-M�c Minh-Lv5", { 0, 150, 75, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Th�n L�c-Lv5", { 0, 150, 76, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Ng�ng Th�n-Lv5", { 0, 150, 77, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� Gian-Lv5", { 0, 150, 78, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� C�c-Lv5", { 0, 150, 79, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Cu�ng Nh�n-Lv5", { 0, 150, 80, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-L�ng Nhu�-Lv5", { 0, 150, 81, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Linh Vi�n-Lv5", { 0, 150, 82, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 3, "T-H�i V�n-Lv5", { 0, 150, 83, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 3, "T-H�i T�m-Lv5", { 0, 150, 84, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
}

IC_T_YUNLING6 = {
    { 1, 2, "H-Li�t Nham-Lv6", { 0, 148, 85, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Ph� Kh�ng-Lv6", { 0, 148, 86, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�y Ki�m-Lv6", { 0, 148, 87, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�t Phong-Lv6", { 0, 148, 88, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-T�n V�-Lv6", { 0, 148, 89, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-�ng T�p-Lv6", { 0, 148, 90, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Linh T�m-Lv6", { 0, 148, 91, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Th�n L�c-Lv6", { 0, 148, 92, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Ng�ng Th�n-Lv6", { 0, 148, 93, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-V� Gian-Lv6", { 0, 148, 94, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-V� C�c-Lv6", { 0, 148, 95, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Cu�ng Nh�n-Lv6", { 0, 148, 96, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-L�ng Nhu�-Lv6", { 0, 148, 97, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-Linh Vi�n-Lv6", { 0, 148, 98, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-H�i V�n-Lv6", { 0, 148, 99, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "H-H�i T�m-Lv6", { 0, 148, 100, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Li�t Nham-Lv6", { 0, 149, 87, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Ph� Kh�ng-Lv6", { 0, 149, 88, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�y Ki�m-Lv6", { 0, 149, 89, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�t Phong-Lv6", { 0, 149, 90, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-T�n V�-Lv6", { 0, 149, 91, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Qu�n Th�ch-Lv6", { 0, 149, 92, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-N� Ng�m-Lv6", { 0, 149, 93, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Xuy�n V�n-Lv6", { 0, 149, 94, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Th�n L�c-Lv6", { 0, 149, 95, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Ng�ng Th�n-Lv6", { 0, 149, 96, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-V� Gian-Lv6", { 0, 149, 97, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-V� C�c-Lv6", { 0, 149, 98, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Cu�ng Nh�n-Lv6", { 0, 149, 99, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-L�ng Nhu�-Lv6", { 0, 149, 100, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-Linh Vi�n-Lv6", { 0, 149, 101, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-H�i V�n-Lv6", { 0, 149, 102, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "C-H�i T�m-Lv6", { 0, 149, 103, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Li�t Nham-Lv6", { 0, 150, 85, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Ph� Kh�ng-Lv6", { 0, 150, 86, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�y Ki�m-Lv6", { 0, 150, 87, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�t Phong-Lv6", { 0, 150, 88, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-T�n V�-Lv6", { 0, 150, 89, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� L��ng-Lv6", { 0, 150, 90, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-M�c Minh-Lv6", { 0, 150, 91, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Th�n L�c-Lv6", { 0, 150, 92, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Ng�ng Th�n-Lv6", { 0, 150, 93, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� Gian-Lv6", { 0, 150, 94, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-V� C�c-Lv6", { 0, 150, 95, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Cu�ng Nh�n-Lv6", { 0, 150, 96, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-L�ng Nhu�-Lv6", { 0, 150, 97, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 2, "T-Linh Vi�n-Lv6", { 0, 150, 98, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 3, "T-H�i V�n-Lv6", { 0, 150, 99, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
    { 1, 3, "T-H�i T�m-Lv6", { 0, 150, 100, 1, 1, -1, -1, -1, -1, -1, -1 }, nil, nil, nil, nil },
}

function giveYunLing5()
    gf_EventGiveRandAward(IC_T_YUNLING5, 100, 1, "InvitCode", "InvitCode")
end

function giveYunLing6()
    gf_EventGiveRandAward(IC_T_YUNLING6, 100, 1, "InvitCode", "InvitCode")
end

function _icCheckVip()
    if IsActivatedVipCard() ~= 1 then
        return 0
    end
    return 1
end

function _icCheckLevel(nReborn, nLevel)
    if gf_CheckLevel(nReborn, nLevel) ~= 1 then
        return 0
    end
    return 1
end

function _icCheckCostXu(nCost)
    if IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) < nCost then
        return 0
    end
    return 1
end

function _icCheckFinishCnt(nCnt)
    if _ic_getFinisCount() < nCnt then
        return 0
    end
    return 1
end

--�����߽���
IC_YAOQING_AWARD = {
    [1] = { "item", 1, "Ti�u B�ch D��ng (30 ng�y)", { 0, 105, 30055, 1, 4, -1, -1, -1, -1, -1, -1 }, 30 * 24 * 3600 },
    [2] = { "item", 6, "Hu�n ch��ng anh h�ng", { 2, 1, 30499, 20, 4 } },
    [3] = { "item", 12, "��i ��nh H�n Thi�n Th�ch Th�n Th�ch (7 Ng�y)", { 2, 1, 1113, 1, 4, -1, -1, -1, -1, -1, -1 }, 7 * 24 * 3600 },
    [4] = { "item", 24, "Thi�n Th�ch Linh Th�ch (7 ng�y)", { 2, 1, 1068, 1, 4 }, 7 * 24 * 3600 },
    [5] = { "func", 36, format("B�o Th�ch C�p %d (Ng�u nhi�n %d)", 6, 1), ck_GiveRandGem6 },
    [6] = { "item", 50, "Thi�n Cang L�nh", { 2, 95, 204, 1 } },
    [7] = { "item", 60, "H�a Th� B�ch (15 ng�y)", { 2, 1, 1001, 1 }, 15 * 24 * 3600 },
    [8] = { "func", 80, format("B�o Th�ch C�p %d (Ng�u nhi�n %d)", 7, 1), ck_GiveRandGem7 },
}

--�����߽���
IC_BeiYAO_AWARD = {
    [IC_FINISH_INVITE_TYPE1] = { 1, "exp", 1000000000 },
    [IC_FINISH_INVITE_TYPE2] = { 1, "item", { "C�o n�m �u�i", { 0, 105, 161, 1, 4, -1, -1, -1, -1, -1, -1 }, 30 * 24 * 3600 } },
    [IC_FINISH_INVITE_TYPE3] = { 3, "item", { "L�ng Ba Vi B� to�n t�p", { 0, 112, 158, 1, 4 }, 0 } },
    [IC_FINISH_INVITE_TYPE4] = { 3, "item", { "L�nh b�i C�ng Hi�n Bang", { 2, 1, 30914, 1, 4 }, 7 * 24 * 3600 } },
    [IC_FINISH_INVITE_TYPE5] = { 4, "item", { "Thi�n M�n Kim L�nh", { 2, 1, 30370, 1, }, 0 } },
    -- [IC_FINISH_INVITE_TYPE6] = {0, "exp",  2000000},
    -- [IC_FINISH_INVITE_TYPE7] = {0, "exp",  10000000},
    -- [IC_FINISH_INVITE_TYPE8] = {0, "exp",  20000000},
}

--�������콱����
IC_BeiYAO_AWARD_CONDITION = {
    [IC_FINISH_INVITE_TYPE1] = { "K�ch ho�t th� th�ng", {}, _icCheckVip },
    [IC_FINISH_INVITE_TYPE2] = { "��t ��n CS %d Lv%d", { 8, 90 }, _icCheckLevel },
    [IC_FINISH_INVITE_TYPE3] = { "��t ��n CS %d Lv%d", { 10, 96 }, _icCheckLevel },
    [IC_FINISH_INVITE_TYPE4] = { "Nh�n m� m�i v� v�o Ng� C�c ti�u ph� %d Xu", { 2000 }, _icCheckCostXu },
    [IC_FINISH_INVITE_TYPE5] = { "Nh�n m� m�i v� v�o Ng� C�c ti�u ph� %d Xu", { 5000 }, _icCheckCostXu },
    -- [IC_FINISH_INVITE_TYPE6] = {"�������%d������", {3}, _icCheckFinishCnt},
    -- [IC_FINISH_INVITE_TYPE7] = {"�������%d������", {4}, _icCheckFinishCnt},
    -- [IC_FINISH_INVITE_TYPE8] = {"�������%d������", {5}, _icCheckFinishCnt},
}

--����
IC_YAOYANG_JIEZI_1 = {
    { "Di�u D��ng-� L�n B�o Gi�i", { 0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-T� Giao Ng�c B�i", { 0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-V�n H� L�nh", { 0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-X�ch T��c Ho�n", { 0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng-B�ch Quy Li�n", { 0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1 } },
}

IC_YAOYANG_JIEZI_2 = {
    { "Di�u D��ng To�i Ho�ng-� L�n B�o Gi�i", { 0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng To�i Ho�ng-T� Giao Ng�c B�i", { 0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng To�i Ho�ng-V�n H� L�nh", { 0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng To�i Ho�ng-X�ch T��c Ho�n", { 0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1 } },
    { "Di�u D��ng To�i Ho�ng-B�ch Quy Li�n", { 0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1 } },
}
