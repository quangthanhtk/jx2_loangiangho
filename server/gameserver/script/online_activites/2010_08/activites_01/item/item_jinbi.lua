--=============================================
--create by zhangming 2010.7.15
--describe:Խ�ϰ�2010��8�»1 ��ҽű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--�ͷ�ļ�
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\items\\item_ib_goldcoin.lua");
----------------------------------------------------------------------------------------------------

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[6][1], 2, 1);

function OnUse_khongdungden(nItemIdx) --LongDaiKa: b� h�m n�y, chuy�n ��n h�m s� d�ng xu nh�n l�i xu ng� c�c
	do	return	end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(30000)
    end
end
