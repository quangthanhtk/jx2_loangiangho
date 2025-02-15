--把一个列表中的所有物品给玩家
--表结构 = {
--      {类型=1(物品), 名字, {id1,id2,id3,count}, 存在时间(无限制填0), 是否Msg2Player},
--      {类型=2(经验), 数量, 1=要Msg2Player，0或不填表示不需},
--}
--{类型=3(金钱), 数量（单是铜）}
--{类型=4(声望), 数量, 1=要Msg2Player，0不需要}
--{类型=5(师门贡献度), 数量, 1=要Msg2Player，0或不填表示不需要}
--...参见gf_EventGiveCustomAward中的索引值，此处索引比其索引值大1
--{类型=31(自定义命令), "自定的命令（需要dostring的代码）", "自定义的Msg2Player，如果不填表示不需要"}
--参数：szLogTitle 日志记录标题
--参数：szLogAction 日记中记录的行为
function gf_EventGiveAllAward(AllAwardList, szLogTitle, szLogAction,tAddRate)
    for i = 1, getn(AllAwardList) do
        local tbSubAward = AllAwardList[i];
        local nType = tbSubAward[1];
        if nType == 1 then--物品
            gf_AddItemEx2(tbSubAward[3], tbSubAward[2], szLogTitle, szLogAction, tbSubAward[4], tbSubAward[5]);
        else
            gf_EventGiveCustomAward(nType - 1, tbSubAward[2], tbSubAward[3], szLogTitle, szLogAction, 0, tAddRate);
        end
    end
end


--开箱子给随机奖励,调用此函数前请先判断背包和负重
--参数：RandAwardList =
--{类型=1(物品), 概率, 名字, {id1,id2,id3,count}, 存在时间(无限制填0), （特殊处理0为无特殊处理1为按体型给2为按流派给）}
--当第六个参数是1时，是按体型给，所以参数4的是个table，其内容是
--                                                     {
--                                                      {"物品名字", {id1,id2,id3,count}}, --体型1
--                                                      {"物品名字", {id1,id2,id3,count}}, --体型2
--                                                      {"物品名字", {id1,id2,id3,count}}, --体型3
--                                                      {"物品名字", {id1,id2,id3,count}}, --体型4
--                                                     }
--当第六个参数是2时，是按流派给，所以参数4也是个table，但是此时要设一下第7个参数，用来表示如果玩家没有入流派给一个别的物品的索引，其内容是
--                                                     {
--                                                      --流派对应物品的列表
--                                                        [1] = {
--                                                        {"名字"， 概率, {id1,id2,id3,数量...}},--由于某些流派有多种东西，所以这里还是要随机一下
--                                                        {"名字"， 概率, {id1,id2,id3,数量...}},
--                                                        {"名字"， 概率, {id1,id2,id3,数量...}},
--                                                      },
--                                                      {--如果只有一个物品，概率就填100
--                                                        [2] = {"名字", 100概率, {id1,id2,id3,数量...}},
--                                                      },
--                                                     }
-- 四种体型的物品集合列表
--{类型=2(经验), 概率, 数量, 1=要Msg2Player，0或不填表示不需}
--{类型=3(金钱), 概率, 数量（单是铜）}
--{类型=4(声望), 概率, 数量, 1=要Msg2Player，0不需要}
--{类型=5(师门贡献度), 概率, 数量, 如果玩家没入门派选择代替的索引, 1=要Msg2Player，0或不填表示不需要}
--...参见gf_EventGiveCustomAward中的索引值，此处索引比其索引值大1
--{类型=31(自定义命令), 概率, "自定的命令（需要dostring的代码）", "自定义的Msg2Player，如果不填表示不需要"}
--参数：nMaxPE 是概率的最大值
--参数：nDefault 如果没有随机到，则使用此默认值
--参数：szLogTitle 日志记录标题
--参数：szLogAction 日记中记录的行为
function gf_EventGiveRandAward(RandAwardList, nMaxPE, nDefault, szLogTitle, szLogAction, nRand, bZhenQiTag)
	if RandAwardList == nil or getn(RandAwardList) == 0 or nMaxPE ==0 or nMaxPE == nil then
		return 0;
	end
	if nRand == nil or nRand < 1 then
  	nRand = gf_GetRandItemByTable(RandAwardList, nMaxPE, nDefault);
  end
  local nPlayerRoute = GetPlayerRoute();
  local tbSelected = RandAwardList[nRand];
  if tbSelected[1] == 5 and nPlayerRoute == 0 then
    nRand = tbSelected[4];
    tbSelected = RandAwardList[nRand];--如果随机到的是给师门贡献度且玩家没入门派，则换一个预定好的选项
  end
  if tbSelected[1] == 1 and (tbSelected[7] ~= 0 and tbSelected[7] ~= nil) then
    if gf_CheckPlayerRoute(nPlayerRoute) == 0 then--没入流派
      nRand = tbSelected[7];
      tbSelected = RandAwardList[nRand];--如果随机到按流派给东西但是玩家没入流派，则换一个预定好的选项
    end
  end
  --全服广播
  if tbSelected[8] ~= nil and tbSelected[8] == 1 then
  	Msg2Global(format("Ch骳 m鮪g ngi ch琲 %s trong %s nh薾 頲 %s*%d",GetName(),szLogAction,tbSelected[3],tbSelected[4][4]));
  end
  local nType = tbSelected[1];
  if nType == 1 then
   	 local nSpecial = tbSelected[6];
  	 if not nSpecial or nSpecial == 0 then --给物品不需特殊处理
    	 	gf_AddItemEx2(tbSelected[4], tbSelected[3], szLogTitle, szLogAction, tbSelected[5], 1);
    	 	return nRand;
 	   elseif nSpecial == 1 then --按体型给的
				local nBody = GetBody();
				local sItem = tbSelected[4]; -- 体型集合的列表
				local nSize = getn(sItem) or 1
				for i = 1, nSize do
					gf_AddItemEx2(sItem[i][nBody][2], sItem[i][nBody][1], szLogAction, szLogAction, tbSelected[5], 1)
				end
				return nRand;
     elseif nSpecial == 2 then --按流派给的
				local sItem = tbSelected[4][nPlayerRoute];
				local tbRandRouteTable = {
				      [1] = {2, 3, 4},
				      [5] = {6},
				      [7] = {8, 9},
				      [10] = {11, 12},
				      [13] = {14, 15},
				      [16] = {17, 18},
				      [19] = {20, 21},
				      [22] = {23},
				      [28] = {29, 30},
				  };
				local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 29, 30};
				--如果玩家没入流派，要有一个算法，如果入了门派，就在门派里面随机，如果门派都没入，就所有的随机一个
				if nPlayerRoute == 0 then
				  local nRandRoute = tbRouteTable[random(1, getn(tbRouteTable))];
				  sItem = tbSelected[4][nRandRoute];
				else
				  if tbRandRouteTable[nPlayerRoute] ~= nil then --入了门派没入流派
				      local nRandRoute = tbRandRouteTable[nPlayerRoute][random(1, getn(tbRandRouteTable[nPlayerRoute]))];
				      sItem = tbSelected[4][nRandRoute];
				  end
				end
				local nMaxRoutePE = 0;   --概率基数
				local nRouteDefault = 0; --默认索引
				for i = 1, getn(sItem) do
				  nMaxRoutePE = nMaxRoutePE + sItem[i][2];
				  if sItem[i][2] > nRouteDefault then
				      nRouteDefault = sItem[i][2];
				  end
				end
				local nRouteRand = gf_GetRandItemByTable(sItem, nMaxRoutePE, nMaxRoutePE);
				--全都处理完了，可以给东西了
				gf_AddItemEx2(sItem[nRouteRand][3], sItem[nRouteRand][1], szLogAction, szLogAction, tbSelected[5], 1);
				return nRand;
      end
  else
    gf_EventGiveCustomAward(nType - 1, tbSelected[3], tbSelected[4] or 1, szLogTitle, szLogAction, bZhenQiTag);
    return nRand;
  end
end

--越南版常用到的添加经验、金钱、师门贡献度、声望的操作封装，注意当添加师门贡献度之前必须在外部保证玩家已经入门派
--参数 nType = 1经验、2金钱、3声望、4师门贡献度、5小白驹丸、6大白驹丸、7白驹仙丹、8神农丹、9六神丸、10强效六神丸、11六神仙丹、12三清丸、13强效三清丸、14三清仙丹、15蓬莱仙水、16蓬莱仙露、17蓬莱仙丹、18蓬莱露水、19-25 1级灵石－7级灵石
--30自定义命令, nValue是要执行命令的字符串、nMsg2Player是要提示给玩家的字符串，如果为空，则不提示
--参数 nValue 添加的值（金钱单位是铜。白驹丸，神农丹，六神丸，时间是分钟）
--参数 nMsgPlayer 获得师门贡献度和声望是否需要通行玩家
--参数szLogTitle 记录log的标题
--参数szLogAction 记录log中的action参数，如果不填或填nil，则用函数中定好的来替换
--tAddRate = {nExpAddRate=1.5, nJunGongAddRate = 1.2,}
function gf_EventGiveCustomAward(nType, nValue, nMsg2Player, szLogTitle, szLogAction, bZhenQiTag,tAddRate)
    nMsg2Player = nMsg2Player or 0;
    --szLogAction = szLogAction or "";
    local szMsg2Player = "";
    local szItemName = "";
    local szLogDefAction = "";
    if nType == 1 then
    	local nExp = nValue
    	if tAddRate and tAddRate.nExpAddRate and type(tAddRate.nExpAddRate) == "number" then
    		nExp = nExp * tAddRate.nExpAddRate
    	end
        ModifyExp(nExp);
        szMsg2Player = format("Thu 頲 %d 甶觤 kinh nghi謒", nExp);
        szItemName = "Kinh nghi謒";
        szLogDefAction = "Nh薾 甶觤";
    elseif nType == 2 then
        Earn(nValue);
        --szMsg2Player = format("你获得了%d个铜钱", nValue);
        szMsg2Player = "";
        szItemName = " Kim ";
        szLogDefAction = "Nh薾 頲 ti襫";
    elseif nType == 3 then
        ModifyReputation(nValue, 1);
        szMsg2Player = format("Thu 頲 %d 甶觤 danh v鋘g", nValue);
        szItemName = "Danh v鋘g";
        szLogDefAction = "Thu 頲 danh v鋘g";
        nMsg2Player = 0;--增加声望的指令本身的提示消息，所以这里不提示
    elseif nType == 4 then
        SetTask(336, GetTask(336) + nValue);
        szMsg2Player = format("Thu 頲 %d 甶觤 c鑞g hi課 s� m玭", nValue);
        szItemName = "觤 s� m玭";
        szLogDefAction = "Thu 頲 甶觤 c鑞g hi課 s� m玭";
    elseif nType == 5 then
        SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 b筩h c﹗ ho祅", nValue);
        szItemName = "Th阨 gian 駓 th竎 b筩h c﹗ ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 b筩h c﹗ ho祅";
    elseif nType == 6 then
        SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 i b筩h c﹗ ho祅", nValue);
        szItemName = "Th阨 gian 駓 th竎 i b筩h c﹗ ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 i b筩h c﹗ ho祅";
    elseif nType == 7 then
        SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 b筩h c﹗ ti猲 n", nValue);
        szItemName = "Th阨 gian 駓 th竎 b筩h c﹗ ti猲 n";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 b筩h c﹗ ti猲 n";
    elseif nType == 8 then
        SetTask(GLB_TASK_SHENGNONGDAN, GetTask(GLB_TASK_SHENGNONGDAN) + nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 th莕 n玭g n", nValue);
        szItemName = "Th阨 gian 駓 th竎 th莕 n玭g n";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 th莕 n玭g n";
    elseif nType == 9 then
        EatLiushen(1, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 l鬰 th莕 ho祅", nValue);
        szItemName = "Th阨 gian 駓 th竎 l鬰 th莕 ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian l鬰 th莕 ho祅";
    elseif nType == 10 then
        EatLiushen(2, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 cng l鬰 th莕 ho祅", nValue);
        szItemName = "Th阨 gian 駓 th竎 cng l鬰 th莕 ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 cng l鬰 th莕 ho祅";
    elseif nType == 11 then
        EatLiushen(3, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 l鬰 th莕 ti猲 n", nValue);
        szItemName = "Th阨 gian 駓 th竎 l鬰 th莕 ti猲 n";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 l鬰 th莕 ti猲 n";
    elseif nType == 12 then
        EatSanqin(1, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 tam thanh ho祅", nValue);
        szItemName = "Th阨 gian 駓 th竎 tam thanh ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 tam thanh ho祅";
    elseif nType == 13 then
        EatSanqin(2, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 cng tam thanh ho祅", nValue);
        szItemName = "Th阨 gian cng tam thanh ho祅";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 cng tam thanh ho祅";
    elseif nType == 14 then
        EatSanqin(3, nValue);
        szMsg2Player = format("Nh薾 頲 %d ph髏 tam thanh ti猲 n", nValue);
        szItemName = "Th阨 gian 駓 th竎 tam thanh ti猲 n";
        szLogDefAction = "Nh薾 頲 th阨 gian 駓 th竎 tam thanh ti猲 n";
    elseif nType == 15 then
        EatXcl(1, nValue);
        szMsg2Player = format("Чi hi謕  nh薾 頲 %d ph髏 B錸g Lai Ti猲 Th駓", nValue/60);
        szItemName = "Th阨 gian B錸g Lai Ti猲 Th駓";
        szLogDefAction = "Nh薾 頲 th阨 gian B錸g Lai Ti猲 Th駓";
    elseif nType == 16 then
        EatXcl(2, nValue);
        szMsg2Player = format("Чi hi謕  nh薾 頲 %d ph髏 B錸g Lai Ti猲 L�", nValue/60);
        szItemName = "Th阨 gian B錸g Lai Ti猲 L�";
        szLogDefAction = "Nh薾 頲 th阨 gian B錸g Lai Ti猲 L�";
    elseif nType == 17 then
        EatXcl(3, nValue);
        szMsg2Player = format("Чi hi謕  nh薾 頲 %d ph髏 B錸g Lai Ti猲 Кn", nValue/60);
        szItemName = "Th阨 gian B錸g Lai Ti猲 Кn";
        szLogDefAction = "Nh薾 頲 th阨 gian B錸g Lai Ti猲 Кn";
    elseif nType == 18 then
        EatXcl(4, nValue);
        szMsg2Player = format("Чi hi謕  nh薾 頲 %d ph髏 B錸g Lai L� Th駓", nValue/60);
        szItemName = "Th阨 gian B錸g Lai L� Th駓";
        szLogDefAction = "Nh薾 頲 th阨 gian B錸g Lai L� Th駓";
    elseif nType >= 19 and nType <= 25 then
        lspf_AddLingShiInBottle(nType-18,nValue)
        szMsg2Player = format("Ch骳 m鮪g b筺  nh薾 頲 %d linh th筩h c蕄 %d, linh th筩h n祔 頲 ch璦 trong t� linh nh", nType-18, nValue);
        szItemName = format("Linh th筩h c蕄 %d",nType-18);
        szLogDefAction = format("Nh薾 頲 linh th筩h c蕄 %d",nType-18);
		elseif nType == 26 then
        ModifyPopur(nValue)
        szMsg2Player = format("C竎 h�  nh薾 頲 %d 甶觤 tu luy謓", nValue);
        szItemName = "Luy謓";
        szLogDefAction = "Nh薾 頲 tu luy謓";
    elseif nType == 27 then
    		nMsg2Player = 0;
    		if bZhenQiTag == 1 then
    			AwardGenuineQi(nValue);
    		else
	    		if ActivityAwardGenuineQiDaily(nValue) ~= 0 then
	        	szMsg2Player = format("C竎 h� nh薾 頲 %d 甶觤 ch﹏ kh�", nValue);
	        	szItemName = "Ch﹏ kh�";
	        	szLogDefAction = "Nh薾 ch﹏ kh�";
	        	nMsg2Player = 0; 
	        end
	      end   
    elseif nType == 30 then
        dostring(nValue);
        nMsg2Player = 0;
    elseif nType == 31 then
    	    local nJunGong = nValue
    		if tAddRate and tAddRate.nJunGongAddRate and type(tAddRate.nJunGongAddRate) == "number" then
    			nJunGong = nJunGong * tAddRate.nJunGongAddRate
    		end
    	
    	  if GetTask(701) >= 0 then
    	  	SetTask(701, GetTask(701) + nJunGong)
    	  else
    	  	SetTask(701, GetTask(701) - nJunGong)
    	  end
    	  szMsg2Player = format("C竎 h� nh薾 頲 %d 甶觤 qu﹏ c玭g", nJunGong)
        szItemName = "C玭g tr筺g"
        szLogDefAction = "Nh薾 頲 qu﹏ c玭g"
    elseif nType == 32 then
    	  SetTask(707, GetTask(707) + nValue)
    	  szMsg2Player = format("C竎 h� nh薾 頲 %d t輈h l騳 chi課 trng", nValue)
        szItemName = " 甶觤 t輈h l騳 chi課 trng"
        szLogDefAction = "Nh薾 頲 甶觤 t輈h l騳 chi課 trng"
    elseif nType == 33 then
    		SetTask(3105, GetTask(3105) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C竎 h�  nh薾 頲 %d ph髏 T� Linh Ho祅", nValue)
        szItemName = "Th阨 gian T� Linh Ho祅"
        szLogDefAction = "Nh薾 頲 th阨 gian T� Linh Ho祅"   
    elseif nType == 34 then
    		SetTask(3106, GetTask(3106) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C竎 h� nh薾 頲 %d ph髏 Чi T� Linh Ho祅", nValue)
        szItemName = "Th阨 gian Чi T� Linh Ho祅"
        szLogDefAction = "Nh薾 頲 th阨 gian Чi T� Linh Ho祅"  
    elseif nType == 35 then
    		SetTask(3107, GetTask(3107) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C竎 h� nh薾 頲 %d ph髏 T� Linh Ti猲 Кn", nValue)
        szItemName = "Th阨 gian T� Linh Ti猲 Кn"
        szLogDefAction = "Nh薾 頲 th阨 gian T� Linh Ti猲 Кn"   		
    elseif nType == 36 then
    		ModifyJinJuan(nValue, 1);
    		nMsg2Player = 0;
        szItemName = "Phi誹 V祅g";
        szLogDefAction = "Nh薾 頲 Phi誹 V祅g";
    elseif nType == 37 then
    		local nCurr, nMax = ModifyEnergy(0, 1);
    		local nLast = nMax - nCurr;
    		if nLast < 0 then
    			return
    		end
    		if nValue > nLast then
    			nValue = nLast
    		end
    		ModifyEnergy(nValue, 1);
        nMsg2Player = 0;
        szItemName = "Tinh L鵦";
        szLogDefAction = "Nh薾 頲 Tinh l鵦";    
    end

    if nMsg2Player ~= 0 then
        Msg2Player(szMsg2Player);
    end
    if szLogTitle then
        szLogAction = szLogAction or szLogDefAction;
        gf_WriteLogEx(szLogTitle, szLogAction, nValue, szItemName, nil, GetTongName())
    end
end

--根据添加物品新封装，在调用前请判断玩家背包和负重
--参数：tbItemIds添加物品的IDtable，strName物品名字,szLogTitle日记头,nExpireTime存在时间
--      szNpcName交互的NPC的名字，nNoticeMsg是否提示玩家空间或负重不足
--      nMsg2Player 是否提示玩家已经获得了物品
--返回值：0错误调用,1成功,-1空间或负重不够
function gf_AddItemEx2(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t tham s� l鏸!");
		return 0;
	end
	
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--默认值应该为1(已鉴定)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	
--	if tbItemIds[5] ~= nil then
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],1,tbItemIds[5],tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--					SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	else
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3], 1);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--				SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	end
	
	local szMsg1 = format("Th猰 th祅h c玭g %d c竔, th猰 th蕋 b筰 %d c竔, r琲 t %d c竔", nOkCount, nFailedCount, nDropCount);--备注一
	local szMsg2 = "Th阨 gian t錸 t筰 v藅 ph萴 頲 t th祅h %d gi﹜";--备注二
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--备注三
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("B筺 nh薾 頲 "..strName.."x"..nOkCount);
	end
	
	--采用新日志记录格式
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end