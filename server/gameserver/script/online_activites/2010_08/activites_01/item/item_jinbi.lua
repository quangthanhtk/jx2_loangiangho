--=============================================
--create by zhangming 2010.7.15
--describe:Ô½ÄÏ°æ2010Äê8ÔÂ»î¶¯1 ½ð±Ò½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--»î¶¯Í·ÎÄ¼þ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\items\\item_ib_goldcoin.lua");
----------------------------------------------------------------------------------------------------

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[6][1], 2, 1);

function OnUse_khongdungden(nItemIdx) --LongDaiKa: bá hµm nµy, chuyÓn ®Õn hµm sö dông xu nhËn l¹i xu ngù c¸c
	do	return	end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(30000)
    end
end
