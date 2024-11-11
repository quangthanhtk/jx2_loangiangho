Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szNpcName = "<color=green>Hé Bé ThÞ Lang<color>: "

function main()
    local tSay = {
        g_szNpcName .. "Ta ®©y qu¶n lý viÖc ®¹i sù, ng­¬i ®Õn lµ muèn ®æi tªn <color=yellow>nh©n vËt vµ bang héi<color> sao? \nChi tiÕt xem t¹i trang chñ."
    }
    if RENAME_SWITCH == 1 then
        for nType, szTypeName in _g_tbTypeNames do
            tinsert(tSay, format("§æi tªn %s/#request_rename(%d)", szTypeName, nType))
        end
    end
    tinsert(tSay, "\nTa chØ tiÖn ghÐ qua/no")

    KsgNpc:SayDialog(tSay)
end

function request_rename(nType)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "TÝnh n¨ng nµy hiÖn ch­a më!")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "Nhµ ng­¬i ®· sö dông <color=gold>ThÎ ®æi tªn<color> ch­a? §õng ®ïa víi bæn quan!")
    end
    if _g_tbSwitches[nType] and _g_tbSwitches[nType] ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "TÝnh n¨ng nµy hiÖn ch­a më!")
    end
    if nType == RENAME_TYPE_PLAYER then
        request_rename_player()
    elseif nType == RENAME_TYPE_TONG then
        request_rename_tong()
    else
        return KsgNpc:Talk(g_szNpcName .. "TÝnh n¨ng nµy hiÖn ch­a më!")
    end
end

function request_rename_player()
    local isTongMember = IsTongMember() or 0
    local szTong = GetTongName() or ""
    if szTong ~= "" or isTongMember > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Ng­¬i ®· cã bang héi! CÇn rêi khái bang tr­íc míi cã thÓ ®æi tªn!")
    end

    RenameQuerySubmitedName(GetName(), RENAME_TYPE_PLAYER)
end

function request_rename_tong()
    if IsTongMaster() ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "ChØ cã bang chñ míi cã quyÒn ®æi tªn Bang Héi!")
    end
    RenameQuerySubmitedName(GetTongName(), RENAME_TYPE_TONG)
end
