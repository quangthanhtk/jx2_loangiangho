local FilePath = "\\script\\pet\\pet_get_booklv5.lua"


function pet_getbooklv5()
    PutinItemBox("§æi Kim Ngäc §iÖp" ,1 , "CÇn dïng 1 MËt TÞch Thó C­ng CÊp 5 bÊt kú vµ 50 vµng  ®æi 20 Kim Ngäc DiÖp, x¸c nhËn ®æi?", %FilePath, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
    -- print(param, idx, genre, detail, particular)
    if param ~= 1 then
        return 0;
    end
    --if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 or mod(particular,5) ~= 0 then
    if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 then
        Talk(1, "", "ChØ ®­îc ®Æt vµo MËt TÞch Thó C­ng CÊp 5.");
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
        Talk(1, "", "VËt phÈm ®Æt vµo kh«ng chÝnh x¸c.");
        return 0;
    end
    local t = GetPutinItem()
    if getn(t) ~= 1 then		-- ¶îÍâ¼ì²â
        Talk(1, "", "sè l­îng vËt phÈm b¹n ®¹t vµo kh«ng ®óng.");
        return 0;
    end
    if get_item_count(t) ~= 1 then
        Talk(1, "", "sè l­îng vËt phÈm b¹n ®¹t vµo kh«ng ®óng.");
        return 0;
    end
    --if GetCash() < 200000 then
    --    Talk(1, "", "Ng©n l­îng trªn ng­êi kh«ng ®ñ");
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
    --Ìí¼ÓÐÂÃØ¼®
        --CustomAwardGiveGroup("5ji_huoban_book", 0)
        AddItem(2,1,30729 ,20)
        AddRuntimeStat(47, 3, 0, 1)
    end
end
