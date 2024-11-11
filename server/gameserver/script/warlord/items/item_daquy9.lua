--É±ÐÇÁîÅÆ£¨Í·,ÒÂ,¿ã£©
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\warlord\\preload.lua");
szItemName="M¶nh §¸ Quý 9";
szAwardName="Bao §¸ Quý 9"

function OnUse(nItem)
  local szItemName = GetItemName(nItem);
  Say(format("Sö dông 100 <color=gold>%s<color> cã thÓ hîp thµnh 1 <color=gold>%s<color>, x¸c nhËn sö dông kh«ng?", szItemName, szAwardName), 2,
      format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
end

function OnUseItem(nItem)
  local tbConsume = {
    tbItems = {
      { tbProp = { 2, 1, 31681 }, nCount = 100 }, --M¶nh B¶o Th¹ch CÊp 9
    }
  };
  if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
    gf_AddItemEx({2, 1, 31631, 1,4}, "Tói §¸ Quý CÊp 9 ")
  else
    return WEnv.RETCODE_CONSUMEERROR;
  end
end
