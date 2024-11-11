-- rename_card
Import("\\script\\function\\rename\\rename_npc.lua")

function OnUse(nItemIdx)
    _rename_card_AskUse(nItemIdx)
end

function _rename_card_AskUse(nItemIdx, bSure)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk("TÝnh n¨ng nµy t¹m ch­a më!")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) == 1 then
        return KsgNpc:Talk("C¸c h¹ ®· sö dông <color=gold>ThÎ ®æi tªn<color> råi, cÇn ®æi tªn tr­íc míi cã thÓ dïng l¹i!")
    end
    if not bSure then
        local tbSay = {
            "Sau khi sö dông <color=gold>ThÎ ®æi tªn<color> nhËn ®­îc <color=red>1 lÇn c¬ héi<color> ®æi tªn Nh©n vËt hoÆc tªn Bang héi, ng­¬i cã ®ång ý sö dông kh«ng?<enter><color=green>(Sau khi sö dông sÏ ®­îc truyÒn tèng ®Õn chç Hé Bé ThÞ Lang)<color>",
            format("§óng vËy/#_rename_card_AskUse(%d, 1)", nItemIdx),
            "Tho¸t/nothing",
        }
        return KsgNpc:SayDialog(tbSay)
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD, 0)
        WriteLog(format("[RENAME] [Use RenameCard] [Acc:%s, Role:%s]", GetAccount(), GetName()))
        NewWorld(200, 1469, 2752)
    end
    -- Nªn add vµo stat ®Ó thèng kª t¹i ®©y
end

