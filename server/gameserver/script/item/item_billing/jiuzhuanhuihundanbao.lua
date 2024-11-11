--IBÎïÆ·£º¾Å×ª»Ø»êµ¤°ü¹ü
--¹¦ÄÜÃèÊö£º¡­¡­
--´úÂë±àĞ´ÈË£ºÎâÖ¾Íş
--´úÂë±àĞ´Ê±¼ä£º2008Äê6ÔÂ18ÈÕ

Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 3
dabaoyuntie_id = 3380
--**********************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı************************************
function OnUse(goods_index)
	local isBind = GetItemSpecialAttr(goods_index,"BIND")
	Say("B¹n cã muèn dïng Cöu ChuyÓn Håi Hån §¬n Bao §æi Cöu ChuyÓn Håi Hån §¬n"..goods_num.."?",
	2,
	format("§æi/#use_determine(%d)",isBind),
	"§Ó suy nghÜ/end_dialog")
end
function use_determine( isBind )
	if GetItemCount(2,1,dabaoyuntie_id) == 0 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cã <color=red>Cöu ChuyÓn Håi Hån §¬n Bao<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,30) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntie_id,1) ~= 1 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cã <color=red>Cöu ChuyÓn Håi Hån §¬n Bao<color>!")
		return
	end
	local add_flag = 0;
	if isBind == 1 then
		add_flag = AddItem(1,0,32,goods_num,4)
	else
		add_flag = AddItem(1,0,32,goods_num,5)
	end
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n dïng Cöu ChuyÓn Håi Hån §¬n Bao §æi "..goods_num.." Cöu ChuyÓn Håi Hån §¬n!")
	else
		WriteLog(GetName()..":Dïng Cöu ChuyÓn Håi Hån §¬n Bao §æi Cöu ChuyÓn Håi Hån §¬n thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag)
	end
end
