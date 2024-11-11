Import("\\script\\lib\\globalfunctions.lua")

local tAwardList = {
    {
        {0,120,142,1,5},--������
        {0,120,143,1,5},
        {0,120,144,1,5},
        {0,120,145,1,5},
        "X� Thi�n Lang",
    },
    {
        {0,120,178,1,5},--��������
        {0,120,179,1,5},
        {0,120,180,1,5},
        {0,120,181,1,5},
        "T� B�",
    },
    {
        {0,120,150,1,5},--�������
        {0,120,151,1,5},
        {0,120,152,1,5},
        {0,120,153,1,5},
        "Nghi�ng n��c nghi�ng th�nh",
    },
    {
        {0,120,100,1,5},--����ֽ�
        {0,120,101,1,5},
        {0,120,102,1,5},
        {0,120,103,1,5},
        "H� �i�p Ch� Di�n",
    },
}


function OnUse(nItemidx)
    local nBody = GetBody()
    if gf_Judge_Room_Weight(1, 0) ~= 1 then 
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") 
        return 
    end
    local nRand = random(1, 100)
    local nGet = 1;
    if DelItemByIndex(nItemidx, 1) == 1 then
        if nRand > 0 and nRand <=30 then nGet = 1;
        elseif nRand > 30 and nRand <=50 then nGet = 2;
        elseif nRand > 50 and nRand <=80 then nGet = 3;
        elseif nRand > 80 and nRand <=100 then nGet = 4;
        end 
        local tAward = %tAwardList[nGet][nBody];
        local _, nAwardIndex = AddItem(tAward[1], tAward[2], tAward[3], tAward[4], tAward[5])
        SetItemExpireTime(nAwardIndex,30*24*3600)
    end
end