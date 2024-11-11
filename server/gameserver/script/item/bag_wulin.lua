--ÎäÁÖÀñ°ü
Import("\\script\\lib\\globalfunctions.lua")
--Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

T_WULING_FREE = {
	tAward = {
		"3v3_free_Wllibao_1",
		"3v3_free_Wllibao_2",
	},
	tRuntimeStat = {8, 7, 1},
}
T_WULING_IB = {
	tAward = {
		"3v3_IB_Wllibao_1",
		"3v3_IB_Wllibao_2",
	},
	szConsume = "csm_1_tianjiaoling",
	costIb = 1,
	tRuntimeStat = {8, 7, 2},
}
T_HAOXIA_FREE = {
	tAward = {
		"3v3_free_Hxlibao_1",
		"3v3_free_Hxlibao_2",
	},
	tRuntimeStat = {8, 8, 1},
}
T_HAOXIAO_IB = {
	tAward = {
		"3v3_IB_Hxlibao_1",
		"3v3_IB_Hxlibao_2",
	},
	szConsume = "csm_2_tianjiaoling",
	costIb = 2,
	tRuntimeStat = {8, 8, 2},
	}

T_WULING_SX_FREE = {
	tAward = {
		"3v3_free_Wllibao_1",
		"3v3_free_Wllibao_2",	
	},
	tRuntimeStat = {8, 15, 1},
}
T_WULING_SX_IB = {
	tAward = {
		"3v3_IB_Wllibao_1",
		"3v3_IB_Wllibao_2",
	},
	szConsume = "csm_1_tianjiaoling",
	costIb = 1,
	tRuntimeStat = {8, 16, 1},
}
T_HAOXIA_SX_FREE = {
	tAward = {
		"3v3_free_Hxlibao_1",
		"3v3_free_Hxlibao_2",
	},
	tRuntimeStat = {8, 17, 1},
}
T_HAOXIAO_SX_IB = {
	tAward = {
		"3v3_IB_Hxlibao_1",
		"3v3_IB_Hxlibao_2",
	},
	szConsume = "csm_100_tianjiaoling",
	costIb = 100,
	tRuntimeStat = {8, 18, 1},
}

T_WULING_DX_FREE = {
	tAward = {
		"3v3_free_Wllibao_1",
		"3v3_free_Wllibao_2",
	},
	tRuntimeStat = {8, 19, 1},
}
T_WULING_DX_IB = {
	tAward = {
		"3v3_IB_Wllibao_1",
		"3v3_IB_Wllibao_2",
	},
	szConsume = "csm_1_tianjiaoling",
	costIb = 1,
	tRuntimeStat = {8, 20, 1},
}
T_HAOXIA_DX_FREE = {
	tAward = {
		"3v3_free_Hxlibao_1",
		"3v3_free_Hxlibao_2",
	},
	tRuntimeStat = {8, 21, 1},
}
T_HAOXIAO_DX_IB = {
	tAward = {
		"3v3_IB_Hxlibao_1",
		"3v3_IB_Hxlibao_2",
	},
	szConsume = "csm_2_tianjiaoling",
	costIb = 2,
	tRuntimeStat = {8, 22, 1},
}







T_BOX={
	[200130575] = {T_WULING_SX_FREE, T_WULING_SX_IB,},--ÎäÁÖÀñ°ü£¨ÉÙÏÀ£©
	[200130576] = {T_HAOXIAO_SX_IB,},----ÎäÁÖºÀÏÀÀñ°ü£¨ÉÙÏÀ£©
	[200131192] = {T_WULING_DX_FREE, T_WULING_DX_IB,},--ÎäÁÖÀñ°ü£¨´óÏÀ£©
	[200131193] = {T_HAOXIA_DX_FREE, T_HAOXIAO_DX_IB,},----ÎäÁÖºÀÏÀÀñ°ü£¨´óÏÀ£©
}

function OnUse(nItemIndex)
	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
		return 0;
	end
	return onUse_Confirm(nItemIndex, 0)
end

function onUse_Confirm(nItemIndex, bConfirm)
	local ID = GetItemGenre(nItemIndex)*1000*100000 + GetItemDetail(nItemIndex)*100000+GetItemParticular(nItemIndex)
	local tCfg = T_BOX[ID]
	if tCfg then
		if getn(tCfg) > 1 then
			Say(format("[%s] cã %d c¸ch më.",GetItemName(nItemIndex),getn(tCfg)),
				3,
				format("\nMë miÔn phÝ/#onUse_Real(%d,%d,%d)", nItemIndex, 1, 0),
				format("\nDïng ®¹o cô më/#onUse_Real(%d,%d,%d)", nItemIndex, 2, 0),
				"\nBá qua/nothing");
			return
		elseif getn(tCfg) == 1 then
			onUse_Real(nItemIndex, 1, 0)
			return
		end
	end
end

function onUse_Real(nItemIndex, nOpenIndex, bConfirm)
	local nG,nD,nP = GetItemInfoByIndex(nItemIndex)
	local ID = nG*1000*100000 + nD*100000+nP
	local tCfg = T_BOX[ID]
	if tCfg then
		local szConsume = tCfg[nOpenIndex].szConsume
		if szConsume and 1~= bConfirm then
			local szConsumeDesc = CustomAwardGroupDesc(szConsume)
			Say(format("Më [%s] cÇn <color=yellow>[%s]<color>, ®ång ý më kh«ng?",GetItemName(nItemIndex), szConsumeDesc),
			2,
			format("\n x¸c nhËn më/#onUse_Real(%d,%d,%d)", nItemIndex, nOpenIndex, 1),
			"\nBá qua/nothing");
			return
		end
		local szFunc = format("onInputNumCallBack_%d_%d",ID, nOpenIndex)
		local nMax = GetItemCount(nG,nD,nP)
		AskClientForNumber(szFunc, 1, nMax, "Muèn më mÊy c¸i?")
	end
end

function onInputNumCallBack_200130575_1(nNum)
	onOpenBoxReal(nNum,200130575,1)	
end
function onInputNumCallBack_200130575_2(nNum)
	onOpenBoxReal(nNum,200130575,2)
end
function onInputNumCallBack_200130576_1(nNum)
	onOpenBoxReal(nNum,200130576,1)
end
function onInputNumCallBack_200130576_2(nNum)
	onOpenBoxReal(nNum,200130576,2)
end
function onInputNumCallBack_200131192_1(nNum)
	onOpenBoxReal(nNum,200131192,1)
end
function onInputNumCallBack_200131192_2(nNum)
	onOpenBoxReal(nNum,200131192,2)
end
function onInputNumCallBack_200131193_1(nNum)
	onOpenBoxReal(nNum,200131193,1)
end
function onInputNumCallBack_200131193_2(nNum)
	onOpenBoxReal(nNum,200131193,2)
end

function onOpenBoxReal(nNum, nId, nOpenIndex)
	local tCfg = T_BOX[nId]
	if tCfg then
		for i=1,nNum do
			if 1 ~= onOpenBoxReal_Once(nId, nOpenIndex) then
				break
			end
		end
	end
end

function onOpenBoxReal_Once(nId, nOpenIndex)
	local tCfg = T_BOX[nId]
	local nRet = 0
	if tCfg then
		local tAward = tCfg[nOpenIndex]
		if tAward then
			--ÁÙÊ±´¦ÀíÏÂ¾­Ñé´ïµ½ÉÏÏÞµÄÎÊÌâ£¬ÍêÕû·½°¸ÐèÒªCustomAwardÖ§³Ö
			--20161116 ²ß»®ÓÖËµµÃ²»ÁË¾­Ñé¾Í²»¸ø¾­Ñé
--			if CanModifyExp(40000000) ~= 1 then
--				Talk(1,"", "¾­ÑéÒÑ´ïÉÏÏÞ")
--				return 0
--			end

			local costIb = tAward.costIb
			local szConsume = tAward.szConsume
			if szConsume then
				if 1~=CustomAwardCheckAndConsumeGroup(szConsume,0) then
					return 0
				end
			end
			local nG = floor(nId/(1000*100000))
			local nD = floor(mod(nId,(1000*100000))/100000)
			local nP = mod(nId,100000)
			if 1 ~= DelItem(nG,nD,nP,1) then
				return 0
			end
			if szConsume then
				if 1~=CustomAwardCheckAndConsumeGroup(szConsume,1) then
					return 0
				end
				if costIb then
					FireEvent("event_ib_cost", 2,97,236,costIb)
				end
			end
			local t = tAward.tAward
			for i=1,getn(t) do
				local szAward = t[i]
				local bGiveAll =  i
				if bGiveAll ~= 1 or getn(t)==1 then bGiveAll = 0 end
				if CustomAwardGiveGroup(t[i], bGiveAll)<=0 then
					return 0
				end
				nRet = 1
			end
			local tRuntimeStat = tAward.tRuntimeStat
			if nRet == 1 and tRuntimeStat then
				local nMainId, nSubId, nExtId = unpack(tRuntimeStat)
				AddRuntimeStat(nMainId, nSubId, nExtId, 1)
			end
			return nRet
		end
	end
	return 0
end

function nothing()
end