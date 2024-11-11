----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: §Þnh nghÜa c¸c hàm entrypoint ®Ó t­¬ng t¸c víi hµm trong functions
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\giftcode_alphatest\\functions.lua");
----------------------------------------------------------------------------------------------------
function WGIFTCODE_ALPHATEST_Act1()
    if WLib:IsTestServer() ~= WEnv.TRUE then
        WNpc:Talk("Sù kiÖn nµy chØ diÔn ra ë m¸y chñ thö nghiÖm!", WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbSay = { "Tham gia chiÕn tr­êng chÝnh Nh¹n M«n Quan 20h-21h c¸c ngµy 21,22,23 vµ ®¹t TOP 1-10 sÏ nhËn ®­îc 1 m· GiftCode t­¬ng øng. H·y l­u l¹i ®Ó sö dông ë server chÝnh thøc!" };
    tinsert(tbSay, format("%s/nothing", "§a t¹, ta ®· hiÓu!"));
    WNpc:SayDialog(tbSay);
end

function WGIFTCODE_ALPHATEST_Act2(nTaskIdx)
    if WLib:IsTestServer() ~= WEnv.TRUE then
        WNpc:Talk("Sù kiÖn nµy chØ diÔn ra ë m¸y chñ thö nghiÖm!", WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    nTaskIdx = tonumber(nTaskIdx) or 0;

    local tbSay = { "Hoµn thµnh c¸c nhiÖm vô d­íi ®©y <sex> sÏ nhËn ®­îc 1 m· GiftCode t­¬ng øng. H·y l­u l¹i ®Ó sö dông ë server chÝnh thøc!" };

    if nTaskIdx == 0 then
        for i = 1, getn(WGIFTCODE_ALPHATEST.tbTaskReqAwardDef) do
            tinsert(tbSay, format("%s %d/#WGIFTCODE_ALPHATEST_Act2(%d)", "Xem ho¹t ®éng AlphaTest mèc", i, i));
        end

        tinsert(tbSay, format("%s/nothing", "§a t¹, ta ®· hiÓu!"));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local bCompleteAll, tbTaskStatus = WGIFTCODE_ALPHATEST:GetAllTaskReqStatus(nTaskIdx);

    tbSay[1] = tbSay[1] .. "\n" .. WLib:Join(tbTaskStatus, "\n");

    if bCompleteAll == WEnv.TRUE then
        tinsert(tbSay, format("%s %d/#WGIFTCODE_ALPHATEST:GiveTaskReqAward(%d)", "NhËn th­ëng ®· hoµn thµnh c¸c môc tiªu AlphaTest mèc", nTaskIdx, nTaskIdx));
        tinsert(tbSay, format("%s/nothing", "T¹m thêi ch­a muèn nhËn."));
    else
        tinsert(tbSay, format("%s/nothing", "§a t¹, ta ®· hiÓu!"));
    end

    WNpc:SayDialog(tbSay);
end
