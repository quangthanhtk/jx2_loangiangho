--ɱ�����ƣ�ͷ,��,�㣩
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\warlord\\preload.lua");
szItemName="M�nh �� Qu� 9";
szAwardName="Bao �� Qu� 9"

function OnUse(nItem)
  local szItemName = GetItemName(nItem);
  Say(format("S� d�ng 100 <color=gold>%s<color> c� th� h�p th�nh 1 <color=gold>%s<color>, x�c nh�n s� d�ng kh�ng?", szItemName, szAwardName), 2,
      format("\n��ng � d�ng/#OnUseItem(%d)", nItem), "\n�� ta suy ngh� l�i/nothing");
end

function OnUseItem(nItem)
  local tbConsume = {
    tbItems = {
      { tbProp = { 2, 1, 31681 }, nCount = 100 }, --M�nh B�o Th�ch C�p 9
    }
  };
  if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
    gf_AddItemEx({2, 1, 31631, 1,4}, "T�i �� Qu� C�p 9 ")
  else
    return WEnv.RETCODE_CONSUMEERROR;
  end
end
