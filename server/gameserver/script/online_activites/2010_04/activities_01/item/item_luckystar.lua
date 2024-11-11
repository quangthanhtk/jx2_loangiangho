Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\online_activites\\2010_09\\activites_02\\head.lua")
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Import("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")

Import("\\script\\ksgvn\\lib.lua")

-- LUCKY_STAR_MAX_USE = 8
LUCKY_STAR_MAX_USE = 32
--LUCKY_STAR_MAX_USE = 24

-- TSK_LUCKY_STAR_201011 
-- hai so ( hang chuc + hang don vi ) luu so lan su dung trong ngay
-- so ( hang tram ) luu timer  : 
--     + 0: giay thu 15s 
--     + 1: giay thu 30s 
--     + 2: giay thu 45s 
--     + 3: giay thu 60s	
	
function OnUse(nItemIdx)
	-- ngµy ®Çu tiªn më server kh«ng cho sö dông n÷ oa b¶o h¹p
	if WDate:Today() < 20230101 then
		WNpc:Talk("Ng«i Sao May M¾n sÏ më vµo 0 giê ngµy 01/01/2023, h·y thö l¹i sau!", WEnv.TRUE);
		do return 0; end
	end
	
	if GetTask(2711) == 0 then	--TSK_TRANS_POINT_ALLOW = 2711 --l­u gi¸ trÞ b¶o l­u, ko cho phÐp tham gia chiÕn tr­êng
		if GetTask(701) > 0 then
			Talk(1, "", "H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ sö dông Ng«i Sao May M¾n!");
			return 0;
		elseif GetTask(701) < 0 then
			Talk(1, "", "H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ sö dông Ng«i Sao May M¾n!");
			return 0;
		else
			Talk(1, "", "H·y tham gia Tèng Liªu vµ chän Phe tr­íc míi cã thÓ sö dông Ng«i Sao May M¾n!");
			return 0;
		end
	end
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 10 then
		Talk(1,"","Nh©n vËt ph¶i cã ®¼ng cÊp 10 trë lªn míi cã thÓ sö dông Ng«i Sao May M¾n")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	
	local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
	if (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
		Talk(1,"","Ng«i Sao May M¾n chØ cã thÓ sö dông ë 7 ®¹i thµnh thÞ!")
		return	
	end

	--if IsActivatedVipCard() == 1 then --LongDaiKa: t¾t tÝnh n¨ng ¨n x2 khi kÝch ho¹t VIP
	--	LUCKY_STAR_MAX_USE = 32
	--end
	
	local nUsed = mod(GetTask(TSK_LUCKY_STAR_201011), 100) 				-- 2 so cuoi luu so lan su dung trong ngay
	
	if nUsed >= LUCKY_STAR_MAX_USE then
		Talk(1,"","Mçi ngµy chØ cã thÓ sö dông " .. nUsed .. "/"..LUCKY_STAR_MAX_USE.." Ng«i Sao May M¾n");
		return
	end
	
	--Do bÞ bug sö dông v­ît qu¸ sè lÇn tõ item nªn ph¸t sinh thªm chÆn ë ®©y
	if WTASKID_USE_NGOISAO_DAILY == nil then
		print("Error, task WTASKID_USE_NGOISAO_DAILY is null", GetAccount(), GetName());
		return 0;
	end
	WTask:ResetDaily();
	local nMax = 32;
	if WTask:Get(WTASKID_USE_NGOISAO_DAILY) >= nMax  or mod(GetTask(TSK_LUCKY_STAR_201011), 100) >= nMax then
		WNpc:Talk(format("§· nhËn tèi ®a %d phÇn th­ëng tõ Ng«i Sao May M¾n, kh«ng thÓ nhËn thªm__!", nMax));
		return 0;
	end
	
	if GetTrigger(VET_201009_02_TIME_USER_DEFINE) ~= 0 then 							-- 0,1,2,3: tuong ung voi 15s, 30s, 45s, 60s
		Talk(1,"","B¹n ®ang sö dông 1 Ng«i Sao May M¾n kh¸c råi!")
		return
	end
	
	-- local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 100) / 10)	   -- 
	local nTimes = floor(mod(GetTask(TSK_LUCKY_STAR_201011), 1000) / 100)	   -- ( lay so hang tram - luu trigger timer )  = 0
	
	if DelItemByIndex(nItemIdx, 1) == 1 then
		CreateTrigger(1, VET_201009_02_TIME_TB_DEFINE, VET_201009_02_TIME_USER_DEFINE);
        	ContinueTimer(GetTrigger(VET_201009_02_TIME_USER_DEFINE))
        	
        	-- luu so lan su dung trong ngay
        	SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) + 1)
        	
        	-- SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) - (nTimes * 10))  	-- Reset Timer
        	SetTask(TSK_LUCKY_STAR_201011, GetTask(TSK_LUCKY_STAR_201011) - (nTimes * 100))  	-- Reset Timer (so hang tram - luu timer )    	

--        	VietLuckyStar()	--thªm nguyªn liÖu event hµng th¸ng
        	Use_Award_NgoiSao() --phÇn th­ëng khi sö dông Ng«i Sao        
        	gf_WriteLogEx("SO LAN SU DUNG NGOI SAO 12/2016", "NhËn thµnh c«ng", 1, "Sö dông ng«i sao")		
        	if nUsed == 15 then
        		Use_Award_NgoiSao_16() --phÇn th­ëng thø 16
        		gf_WriteLogEx("SO LAN SU DUNG NGOI SAO 12/2016", "NhËn thµnh c«ng", 1, "Sö dông ng«i sao lÇn thø 16")		
        	end	
        	gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ Ng«i sao")		
        	----------- Chuçi nhiÖm vô ChuyÓn Sinh 6
        	local nCS6_NS =  floor(GetTask(TSK_CS6_COUNTB)/10000000)
			local nCS6_NS_Num = mod(GetTask(TSK_CS6_COUNTB),10000000)
			if mod(nCS6_NS,1000) < 160 and GetTask(TSK_CS6_TULINH) < 2 then
				nCS6_NS = (nCS6_NS + 1) * 10000000 + nCS6_NS_Num
				SetTask(TSK_CS6_COUNTB, nCS6_NS)
			end

		if mod(GetTask(TSK_LUCKY_STAR_201011), 100) == 16 and nDate <= 130120 then
			gf_AddItemEx2({2,1,30030, 140}, "TiÓu Nh­ Y1", "NIEN THU NHU Y", "hoµn thµnh 16 Ng«i Sao ")
		end
		KsgTask:Modify(TASKID_NSMM_COUNT, 1)
		KsgPlayer:Msg(format("§· sö dông %d/%d Ng«i Sao May M¾n trong ngµy.", mod(GetTask(TSK_LUCKY_STAR_201011), 100), LUCKY_STAR_MAX_USE))
		FireEvent("event_mission_task_award", "ksgsystem", "luckystar", nUsed + 1)
   		
   		FireEvent("event_cost_item", 2,1,30191,1);

		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLuckyStart()")
		if KsgTask:Get(TASKID_NSMM_COUNT) >= 16 then
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2213)")
		end
	end

end
