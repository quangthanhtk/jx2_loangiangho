Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")

g_tBossInfo = {
	name = "��ng V�t G�y R�i",
	templateNpc = "��ng V�t G�y R�i",
	tMapXY = tPos_Boss[1],
	nDistance = 26,--NPC�뾶��
	nChangeBloodTime = 10,
	scriptFile = "\\script\\missions\\tong_activity\\stage\\tstage01.lua",
	}
	
g_tNpc_Sendout = {
	name = "S� Gi� Ho�t ��ng Bang",
	templateNpc = "Gia C�t C�m",
	tMapXY = tPos_Chefu[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_send_out.lua",
	}

g_tNpc_QiuJiang = {
	name = "Th��ng Nh�n C�u T��ng Nh�t Gan",
	templateNpc = "Th��ng Nh�n C�u T��ng Nh�t Gan",
	tMapXY = tPos_Qiujiang[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_qiujiang.lua",
	}

g_sz5SeriesScriptFile = "\\script\\missions\\tong_activity\\npc\\npc_5series.lua";

g_tNpc_5Series = {
	[1] = {
		name = "Ng� H�nh Kim S�",
		templateNpc = "Bang H�i Ng� H�nh Kim S�",
		tMapXY = tPos_5Series[1],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[2] = {
		name = "Ng� H�nh M�c S�",
		templateNpc = "Bang H�i Ng� H�nh M�c S�",
		tMapXY = tPos_5Series[2],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[3] = {
		name = "Ng� H�nh Th� S�",
		templateNpc = "Bang H�i Ng� H�nh Th� S�",
		tMapXY = tPos_5Series[5],
		scriptFile = g_sz5SeriesScriptFile,
		},								
	[4] = {
		name = "Ng� H�nh Th�y S�",
		templateNpc = "Bang H�i Ng� H�nh Th�y S�",
		tMapXY = tPos_5Series[3],
		scriptFile = g_sz5SeriesScriptFile,
		},
	[5] = {
		name = "Ng� H�nh H�a S�",
		templateNpc = "Bang H�i Ng� H�nh H�a S�",
		tMapXY = tPos_5Series[4],
		scriptFile = g_sz5SeriesScriptFile,
		},
	}
	
g_tNpc_PrizeBox = {
	[1] = {
		name = "R��ng Gi�i 1",
		templateNpc = "B�o r��ng l�n r�i tr�n m�t ��t",
		tMapXY = tPos_PrizeBox[1],
		scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
		},
	[2] = {
		name = "R��ng Gi�i 2",
		templateNpc = "B�o r��ng nh� r�i tr�n m�t ��t",
		tMapXY = tPos_PrizeBox[2],
		scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
		},
}

g_tNpc_RandomBox = {
	name = "R��ng T�ng B�o ��",
	templateNpc = "R��ng T�ng B�o �� r�i tr�n m�t ��t",
	tMapXY = tPos_RandomBox,
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_box.lua",
}

g_tNpc_ShiJie = {
	name = "Nga Mi ti�u s� t� ",
	templateNpc = "Bang H�i Nga Mi Ti�u S� T�",
	tMapXY = tPos_ShiJie[1],
	scriptFile = "\\script\\missions\\tong_activity\\npc\\npc_shijie.lua",
}