Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

t_FairBossAward = {
    ["Yªu Thi Ngµn N¨m"] = {
        gTaskId = 581,
        item = { 2, 1, 31257 },
    },
    ["Thiªn T­íng Thñ Hé"] = {
        gTaskId = 582,
        item = { 2, 1, 31258 },
    },
}

function OnDeath(npcIndex)
    local szName = GetNpcName(npcIndex)
    local tAward = t_FairBossAward[szName]
    if PlayerIndex <= 0 then
        return
    end
    if GetTeamSize() > 0 then
        local oldPlayerIndex = PlayerIndex
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            if tGtTask:check_cur_task(tAward.gTaskId) == 1 then
                if GetFreeItemRoom() < 1 then
                    Talk(1, "", "Kh«ng gian hµnh trang kh«ng ®ñ")
                else
                    AddItem(tAward.item[1], tAward.item[2], tAward.item[3], 1, 4)
                end
            end
        end
        PlayerIndex = oldPlayerIndex
    else
        if tGtTask:check_cur_task(tAward.gTaskId) == 1 then
            if GetFreeItemRoom() < 1 then
                Talk(1, "", "Kh«ng gian hµnh trang kh«ng ®ñ")
            else
                AddItem(tAward.item[1], tAward.item[2], tAward.item[3], 1, 4)
            end
        end
    end
end