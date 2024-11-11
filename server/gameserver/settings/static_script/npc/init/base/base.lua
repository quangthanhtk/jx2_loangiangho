--NPC_INIT = {
--{attr,value,time=-1,replace=0,id=1024,type=0},
--}

function OnCreate(nIndex)
	for i=1,getn(NPC_INIT) do
		local t = NPC_INIT[i]
		CastState2Npc(nIndex, t[1], t[2], t[3], t[4], t[5], t[6])
	end
end