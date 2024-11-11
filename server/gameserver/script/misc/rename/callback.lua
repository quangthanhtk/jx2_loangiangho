-- Rename Callback
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szInfoHeader = "<color=green>Hé Bé ThÞ Lang<color>: "

function RenameQuerySubmitedNameCallBack(nResult, szOldName, szNewName, nType)
    if nResult == 0 and nType == RENAME_TYPE_TONG then
        KsgNpc:Talk(g_szInfoHeader .. "Ch­a cã bang héi hoÆc bang héi ch­a thµnh lËp, kh«ng thÓ ®æi tªn!")
        return 0
    end
    local tSay = {}
    if _g_tbTypeNames[nType] then
        --§æi tªn bang héi
        if IsTongMaster() ~= 1 and nType == RENAME_TYPE_TONG then
            -- Bang chñ míi ®­îc ®æi
            KsgNpc:Talk(g_szInfoHeader .. "ChØ cã bang chñ míi cã quyÒn xin ®æi tªn Bang héi!")
            return 0
        end
        local szTypeName = _g_tbTypeNames[nType]
        --§æi tªn nh©n vËt
        if szNewName == "" then
            tSay = {
                format(g_szInfoHeader .. "Tªn %s míi <color=red>yªu cÇu ph¶i cã %d-%d ký tù vµ kh«ng chøa ký tù ®Æc biÖt<color>. Ng­¬i x¸c ®Þnh ®æi tªn %s chø?", szTypeName, RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, szTypeName),
                format("Ta quyÕt ®Þnh ®æi tªn %s. H·y gióp ta!/#request_rename(%d)", szTypeName, nType),
                "\nTa muèn suy nghÜ l¹i mét l¸t/no",
            }
            KsgNpc:SayDialog(tSay)
        else
            tSay = {
                g_szInfoHeader .. format("Ng­¬i ®· chän ®æi tªn %s thµnh <color=yellow>%s<color>, cã muèn thay ®æi hay hñy bá kh«ng?", szTypeName, szNewName),
                format("Ta muèn ®æi l¹i tªn %s/#request_rename(%d)", szTypeName, nType),
                format("Hñy ®æi tªn %s/#cancel_rename(%d)", szTypeName, nType),
                "\nTho¸t/no",
            }
            KsgNpc:SayDialog(tSay)

        end
    else
        WriteLog("[RENAME] [§æi tªn gÆp lçi]: RenameQuerySubmitedNameCallBack tham sè nType : " .. tostring(nType))
    end
end

function RenameSumbitCallBack(nResult, szOldName, szNewName, nType)
    if nResult <= 0 then
        KsgNpc:Talk(g_szInfoHeader .. "Tªn ®¹i hiÖp chän ®· cã hoÆc kh«ng ®óng quy t¾c, vui lßng thö l¹i!")
        return 0
    end
    local nTime = tonumber(date("%Y%m%d%H%M%S"))
    if szNewName == "" then
        Say(g_szInfoHeader .. "§¹i hiÖp ®· hñy bá thao t¸c ®æi tªn thµnh c«ng!", 0)
        WriteLog(format("[RENAME] Hñy bá thao t¸c ®æi tªn, Thêi gian: %d, Tµi kho¶n: %s, Nh©n vËt: %s", nTime, GetAccount(), GetName()))
        return 0
    end
    if _g_tbTypeNames[nType] then
        local szType = _g_tbTypeNames[nType]
        Say(g_szInfoHeader .. format("§¹i hiÖp ®· yªu cÇu ®æi tªn %s thµnh <color=yellow>%s<color> thµnh c«ng!<enter>Vµo b¶o tr× ®Þnh kú hµng ngµy tªn míi cña ®¹i hiÖp sÏ ®­îc cËp nhËt, trong thêi gian chê ®îi ®¹i hiÖp cã thÓ chän 1 tªn kh¸c hoÆc hñy thao t¸c nµy!<enter><color=red>(NÕu sau b¶o tr× mµ tªn míi cña ®¹i hiÖp kh«ng ®­îc cËp nhËt, rÊt cã thÓ tªn ®¹i hiÖp chän ®· bÞ chiÕm dông, cÇn thao t¸c l¹i tõ ®Çu.)<color>", szType, szNewName), 0)
        local szCurrentName = GetName()
        if nType == RENAME_TYPE_TONG then
            szCurrentName = GetTongName()
        end
        WriteLog(format("[RENAME] Yªu cÇu ®æi tªn %s, Thêi gian: %d, Tµi kho¶n: %s, Nh©n vËt: %s, Tªn hiÖn t¹i: %s, Tªn míi: %s", szType, nTime, GetAccount(), GetName(), szCurrentName, szNewName))
    else
        WriteLog("[RENAME] [§æi tªn thÊt b¹i]: RenameSumbitCallBack trÞ sè nType lµ " .. tostring(nType))
    end
end

function request_rename(nType)
    if nType == RENAME_TYPE_PLAYER then
        AskClientForString("submit_name_p", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "NhËp vµo tªn Nh©n vËt")
    elseif nType == RENAME_TYPE_TONG then
        AskClientForString("submit_name_t", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "NhËp vµo tªn Bang Héi")
    end
end

function submit_name_p(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_PLAYER)
end

function submit_name_t(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_TONG)
end

function cancel_rename(nType)
    RenameSubmit("", nType)
end
