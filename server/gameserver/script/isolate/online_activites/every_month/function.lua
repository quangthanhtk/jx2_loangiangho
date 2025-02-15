--主要功能都在这里实现

Include("\\script\\isolate\\online_activites\\every_month\\head.lua")

function add_material(nType, nNum)
    local t = tConfig.tMaterials[nType]
    local g, d, p = unpack(t[2])
    AddItem(g, d, p, nNum)
    Msg2Player(format("Ch骳 m鮪g t 頲 %sx%d", t[1], nNum))
end

function get_product_use_count(nType)
    if nType >= 1 and nType <= getn(tConfig.tProducts) then
        return get_task(format("task_use_item%d_count", nType))
    end
    return -1
end
--Modify by trungbt
LIB_Award = {
    szLogTitle = "",
    szLogAction = "",
}
function LIB_Award:Award(tbAwardList)
    --	local nResult = 0
    -- Award Kinh Nghiem
    if type(tbAwardList["nExp"]) == "number" then
        if type(tbAwardList["nCheckExp"]) == "number" and tbAwardList["nCheckExp"] ~= 0 then
            if GetPlayerRebornParam(0) < 1 then
                if tbAwardList["nExp"] > (2000000000 - GetExp()) then
                    Msg2Player("觤 kinh nghi謒  t gi韎 h筺 t鑙 產 n猲 c竎 h� kh玭g th� nh薾 th猰!!!")
                    --					return 0
                end
            end
        end
        ModifyExp(tbAwardList["nExp"])
        Msg2Player("觤 kinh nghi謒 t╪g th猰 " .. tbAwardList["nExp"] .. ".")
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nExp"], "Kinh nghi謒")
        end
    end
    -- Award Item
    if type(tbAwardList["item"]) == "table" then
        local tbItemSet = tbAwardList["item"]
        for i = 1, getn(tbItemSet) do
            local tbItem = tbItemSet[i]["gdp"]
            -- Add nhieu item co han su dung hoac co dinh hon
            if type(tbItemSet[i]["nExpired"]) == "number" or type(tbItemSet[i]["nDinhhon"]) == "number" then
                for j = 1, tbItemSet[i]["gdp"][4] do
                    local nRet, nItemIdx = 0, 0
                    if tbItemSet[i]["gdp"][5] ~= nil then
                        nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
                    else
                        nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
                    end
                    if nRet == 1 then
                        --Talk(1,"","Item name: " .. tbItemSet[i]["name"])
                        --Talk(1,"","Log Title: " .. self.szLogTitle)
                        -- Set Expired date
                        if type(tbItemSet[i]["nExpired"]) == "number" then
                            SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
                        end
                        -- Set dinh hon
                        if type(tbItemSet[i]["nDinhhon"]) == "number" then
                            Msg2Player("Set dinh hon: -- " .. tbItemSet[i]["nDinhhon"])
                            if tbItemSet[i]["nDinhhon"] == 7 then
                                SetItemSpecialAttr(nItemIdx, "DING7", 1)
                            else
                                SetItemSpecialAttr(nItemIdx, "DING10", 1)
                            end
                        end
                    end
                end
            else
                -- Add nhieu item xep chong
                if tbItemSet[i]["gdp"][5] ~= nil then
                    nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
                else
                    nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
                end
            end
            -- WriteLog
            if self.szLogTitle ~= "" then
                if tbItemSet[i]["name"] == nil then
                    local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, szItemName)
                    Msg2Player("B筺 nh薾 頲 " .. tbItemSet[i]["gdp"][4] .. " " .. szItemName .. ".")
                else
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, tbItemSet[i]["name"])
                    Msg2Player("B筺 nh薾 頲 " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"] .. ".")
                end
            end
        end
    end
    -- Award Task
    if type(tbAwardList["task"]) == "table" then
        local tbTaskSet = tbAwardList["task"]
        for i = 1, getn(tbTaskSet) do
            SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) + tbTaskSet[i][2])
            if type(tbTaskSet[i][3]) == "string" then
                Msg2Player(tbTaskSet[i][3] .. " t╪g th猰 " .. tbTaskSet[i][2] .. ".")
            end
            if self.szLogTitle ~= "" then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbTaskSet[i][2], "Task " .. tbTaskSet[i][1])
            end
        end
    end
    -- Award Chan Khi
    if type(tbAwardList["nChankhi"]) == "number" then
        if MeridianGetLevel() > 0 then
            local nRet = AwardGenuineQi(tbAwardList["nChankhi"])
            if self.szLogTitle ~= "" and nRet == 1 then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nChankhi"], "Ch﹏ kh�")
            end
        end
    end
    -- Award Quan Cong
    if type(tbAwardList["nQuancong"]) == "number" then
        if GetTask(701) ~= 0 then
            if GetTask(701) > 0 then
                SetTask(701, GetTask(701) + tbAwardList["nQuancong"])
            elseif GetTask(701) < 0 then
                SetTask(701, GetTask(701) - tbAwardList["nQuancong"])
            end
            Msg2Player("觤 c玭g tr筺g t╪g th猰 " .. tbAwardList["nQuancong"] .. ".")
            if self.szLogTitle ~= "" then
                gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nQuancong"], "Qu﹏ c玭g")
            end
        end
    end
    -- Award Danh Vong
    if type(tbAwardList["nDanhvong"]) == "number" then
        ModifyReputation(tbAwardList["nDanhvong"], 0)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nDanhvong"], "Danh v鋘g")
        end
    end
    -- Award Su Mon
    if type(tbAwardList["nSumon"]) == "number" then
        SetTask(336, GetTask(336) + tbAwardList["nSumon"])
        Msg2Player("觤 s� m玭 t╪g th猰 " .. tbAwardList["nSumon"] .. ".")
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nSumon"], "S� m玭")
        end
    end
    -- Award Gold
    if type(tbAwardList["nGold"]) == "number" then
        Earn(tbAwardList["nGold"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nGold"], "Ng﹏ lng")
        end
    end
    -- Award Exp Pet
    if type(tbAwardList["nPetExp"]) == "number" then
        if mod(GetTask(TASK_VNG_PET), 100) >= 1 then
            SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (tbAwardList["nPetExp"] * 100))
            Msg2Player("觤 n﹏g c蕄 b筺 ng h祅h t╪g th猰 " .. tbAwardList["nPetExp"])
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetExp"], "甶觤 n﹏g c蕄 pet")
        end
    end
    -- Award Linh luc Pet
    if type(tbAwardList["nPetLinhluc"]) == "number" then
        if mod(GetTask(TASK_VNG_PET), 100) >= 2 then
            -- 觤 n﹏g c蕄, 甶觤 luy謓, v祅g, th竔 d辌h, 甶觤 linh l鵦 c莕, 甶觤 linh l鵦 t鑙 產, s� l莕 luy謓 linh l鵦 1 ng祔
            tRequireElement = {
                [1] = { 0, 7000, 1000000, 10, 0, 0, 0 },
                [2] = { 300, 7000, 1000000, 20, 0, 200, 5 },
                [3] = { 600, 7000, 1000000, 30, 200, 600, 5 },
                [4] = { 1200, 7000, 1000000, 40, 600, 1500, 5 },
            }
            if IsPlayerDeath() ~= 1 then
                local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT) / 100)
                local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT), 100)
                local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
                if nCurGodPoint + tbAwardList["nPetLinhluc"] <= tRequireElement[nCurLevel][6] then
                    nCurGodPoint = nCurGodPoint + tbAwardList["nPetLinhluc"]
                    SetTask(TASK_VNG_PET_GODPOINT, nCurGodPoint * 100 + nQuestGPCount)
                    Msg2Player("觤 linh l鵦 pet t╪g th猰 " .. tbAwardList["nPetLinhluc"])
                    gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetLinhluc"], "甶觤 linh l鵦 pet")
                else
                    nCurGodPoint = tRequireElement[nCurLevel][6]
                    SetTask(TASK_VNG_PET_GODPOINT, nCurGodPoint * 100 + nQuestGPCount)
                    Msg2Player("B筺 уng H祅h  t 頲 甶觤 Linh L鵦 t鑙 產 c馻 c蕄, kh玭g th� t╪g th猰.")
                end
            end
        end
    end
    -- Award Bach Cau
    if type(tbAwardList["nBachCau1"]) == "number" then
        SetTask(2501, GetTask(2501) + tbAwardList["nBachCau1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau1"], "B筩h C﹗ Ho祅")
        end
    end
    if type(tbAwardList["nBachCau2"]) == "number" then
        SetTask(2507, GetTask(2507) + tbAwardList["nBachCau2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau2"], "Чi B筩h C﹗ Ho祅")
        end
    end
    if type(tbAwardList["nBachCau3"]) == "number" then
        SetTask(2508, GetTask(2508) + tbAwardList["nBachCau3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau3"], "B筩h C﹗ Ti猲 Кn")
        end
    end
    -- Award Tam Thanh
    if type(tbAwardList["nTamThanh1"]) == "number" then
        EatSanqin(1, tbAwardList["nTamThanh1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh1"], "Tam Thanh Ho祅")
        end
    end
    if type(tbAwardList["nTamThanh2"]) == "number" then
        EatSanqin(2, tbAwardList["nTamThanh2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh2"], "Чi Tam Thanh Ho祅")
        end
    end
    if type(tbAwardList["nTamThanh3"]) == "number" then
        EatSanqin(3, tbAwardList["nTamThanh3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh3"], "Tam Thanh Ti猲 Кn")
        end
    end
    -- Award Luc Than
    if type(tbAwardList["nLucThan1"]) == "number" then
        EatLiushen(1, tbAwardList["nLucThan1"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan1"], "L鬰 Th莕 Ho祅")
        end
    end
    if type(tbAwardList["nLucThan2"]) == "number" then
        EatLiushen(2, tbAwardList["nLucThan2"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan2"], "Чi L鬰 Th莕 Ho祅")
        end
    end
    if type(tbAwardList["nLucThan3"]) == "number" then
        EatLiushen(3, tbAwardList["nLucThan3"])
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan3"], "L鬰 Th莕 Ti猲 Кn")
        end
    end
    -- Award Tu Linh
    if type(tbAwardList["nTuLinh1"]) == "number" then
        SetTask(3105, GetTask(3105) + tbAwardList["nTuLinh1"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh1"], "T� Linh Ho祅")
        end
    end
    if type(tbAwardList["nTuLinh2"]) == "number" then
        SetTask(3106, GetTask(3106) + tbAwardList["nTuLinh2"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh2"], "Чi T� Linh Ho祅")
        end
    end
    if type(tbAwardList["nTuLinh3"]) == "number" then
        SetTask(3107, GetTask(3107) + tbAwardList["nTuLinh3"], TASK_ACCESS_CODE_OFFLINELIVE)
        if self.szLogTitle ~= "" then
            gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh3"], "T� Linh Ti猲 Кn")
        end
    end
    -- Award Function
    if type(tbAwardList["fn"]) == "string" then
        dostring(tbAwardList["fn"])
    end
    return 1
end

