----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: T¨ng tèc ®é luyÖn mËt tÞch
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_fix_SpeedUpReading_CheckStop()
    -- Hñy t¨ng tèc luyÖn mËt tÞch, fix lçi ®øng lªn ngåi xuèng qu¸ nhanh khiÕn kh«ng thÓ reset task ®­îc ë 2s
    local nReadBookSpeedAdd = GetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED);
    if IsReading() == 0 and nReadBookSpeedAdd ~= 0 then
        --Msg2Player("Hñy hiÖu qu¶ luyÖn nhanh mËt tÞch!");
        SetReadSpeed(0);
        SetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X2, 0);
        SetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X4, 0);
        SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, 0);
    end
end

function _w_fix_SpeedUpReading_CheckStart()
    -- T¨ng tèc luyÖn mËt tÞch
    if IsReading() == 1 then
        local nSpeedX4, nSpeedX2, nSpeedX1 = 16000 * 10, 8000 * 10, 4000 * 10;
        local nCurrentX4, nCurrentX2 = GetTask(2505), GetTask(2506);
        local sMsgX4, sMsgX2, sMsgX1 = "HiÖu qu¶ cña §¹i Nh©n S©m ®· cã t¸c dông!", "HiÖu qu¶ cña TiÓu Nh©n S©m ®· cã t¸c dông!", "Tèc ®é luyÖn mËt tÞch hiÖn t¹i lµ b×nh th­êng!";
        local nReadBookSpeedAdd = GetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED);
        if nReadBookSpeedAdd == 0 then
            local nLastX2 = GetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X2);
            local nLastX4 = GetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X4);
            if nLastX4 ~= 0 and nCurrentX4 < nLastX4 then
                Msg2Player(sMsgX4);
                SetReadSpeed(nSpeedX4);
                SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, nSpeedX4);
            elseif nLastX2 ~= 0 and nCurrentX2 < nLastX2 then
                Msg2Player(sMsgX2);
                SetReadSpeed(nSpeedX2);
                SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, nSpeedX2);
            elseif nCurrentX2 == nLastX2 and nCurrentX4 == nLastX4 then
                Msg2Player(sMsgX1);
                SetReadSpeed(nSpeedX1);
                SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, nSpeedX1);
            end
            SetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X2, nCurrentX2);
            SetTaskTemp(WARLORD_TMPTASK_LAST_READSPEED_X4, nCurrentX4);
        elseif nReadBookSpeedAdd > 0 then
            -- Chñ ®éng trõ ®iÓm v× sai speed chuÈn cña gs th× nã sÏ ko tù trõ ®iÓm nh©n s©m
            if nReadBookSpeedAdd == nSpeedX4 then
                if nCurrentX4 >= 0 then
                    SetTask(2505, nCurrentX4 - 8 * 18);
                else
                    Msg2Player(sMsgX1);
                    SetReadSpeed(nSpeedX1);
                    SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, nSpeedX1);
                end
            elseif nReadBookSpeedAdd == nSpeedX2 then
                if nCurrentX2 >= 0 then
                    SetTask(2506, nCurrentX2 - 4 * 18);
                else
                    Msg2Player(sMsgX1);
                    SetReadSpeed(nSpeedX1);
                    SetTaskTemp(WARLORD_TMPTASK_ON_BUFF_READSPEED, nSpeedX1);
                end
            end
        end
    end
end
