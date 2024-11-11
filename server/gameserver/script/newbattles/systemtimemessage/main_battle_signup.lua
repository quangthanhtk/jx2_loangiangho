Include("\\script\\newbattles\\head.lua");
Import("\\script\\ksgvn\\functions\\battle_functions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function main()
	if g_WCFG_NEWBATTLES_MAIN:IsDateOpen() ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end
	if g_WCFG_NEWBATTLES_MAIN:IsTimeOpen() ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	local _,nCurGs = GetRealmType();
	if nCurGs == 1 then
		return 0;
	end
	WriteLog("[NewBattle]:Initialize Main-Battle");
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nHour = tonumber(date("%H"));
		AddGlobalNews("Th¸m m· håi b¸o, Nh¹n M«n Quan-chiÕn dÞch chÝnh s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.");
		Msg2Global("Th¸m m· håi b¸o, Nh¹n M«n Quan-chiÕn dÞch chÝnh s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.");
		battle_ClearSignUp()
		local nOldSubWorld = SubWorld;
		SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+3);	--ÉèÎªXX3£¬×¢Òâ£¬ÕâÀïµÄXX¿ÉÄÜºÍ¸±Õ½³¡µÄXX²»Ò»ÑùÅ¶
		SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
		if RANDOM_CAMP_PLACE == 1 then
			SetGlbValue(GLB_RANDOM_PLACE_MAIN,random(0,1));
		end
		if SubWorld >= 0 then
			WriteLog("[NewBattle]:Opening Main-Battle");
			OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
		else
			WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
		end
		SubWorld = nOldSubWorld;
	end
end
