local FilePath = "\\script\\pet\\pet_get_booklv5.lua"


function pet_getbooklv5()
    PutinItemBox("��i Kim Ng�c �i�p" ,1 , "C�n d�ng 1 M�t T�ch Th� C�ng C�p 5 b�t k� v� 50 v�ng  ��i 20 Kim Ng�c Di�p, x�c nh�n ��i?", %FilePath, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
    -- print(param, idx, genre, detail, particular)
    if param ~= 1 then
        return 0;
    end
    --if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 or mod(particular,5) ~= 0 then
    if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 then
        Talk(1, "", "Ch� ���c ��t v�o M�t T�ch Th� C�ng C�p 5.");
        return 0;
    end
    return 1;
end

function get_item_count(t)
    local nCnt = 0;
    for i=1,getn(t) do
        --if t[i][2]==2 and t[i][3]==150 and t[i][4]>67 and t[i][4]<=86 and mod(t[i][4],5)==0 then
        if t[i][2]==2 and t[i][3]==150 and t[i][4]>=67 and t[i][4]<=86 then
            nCnt = nCnt + 1;
        end
    end
    return nCnt;
end

function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", "V�t ph�m ��t v�o kh�ng ch�nh x�c.");
        return 0;
    end
    local t = GetPutinItem()
    if getn(t) ~= 1 then		-- ������
        Talk(1, "", "s� l��ng v�t ph�m b�n ��t v�o kh�ng ��ng.");
        return 0;
    end
    if get_item_count(t) ~= 1 then
        Talk(1, "", "s� l��ng v�t ph�m b�n ��t v�o kh�ng ��ng.");
        return 0;
    end
    --if GetCash() < 200000 then
    --    Talk(1, "", "Ng�n l��ng tr�n ng��i kh�ng ��");
    --    return 0;
    --end
    local nResult = 1;
    for i = 1, getn(t) do
	if DelItemByIndex(t[i][1], -1) ~= 1 then
	    nResult = 0;
	end
    end
    --if nResult == 1 and Pay(200000) == 1 then
    if nResult == 1 and Pay(500000) == 1 then
    --������ؼ�
        --CustomAwardGiveGroup("5ji_huoban_book", 0)
        AddItem(2,1,30729 ,20)
        AddRuntimeStat(47, 3, 0, 1)
    end
end
