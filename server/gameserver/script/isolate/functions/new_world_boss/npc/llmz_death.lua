Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.llmz[1]
    local ntime = nwb_bossaward.llmz[2]
    local maxrate = nwb_bossaward.llmz[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("B�c L�c L�m Minh Ch�")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "B�c L�c L�m Minh Ch�")
    nwb_CreateBox("T�i c�a B�c L�c L�m Minh Ch�",m,x,y,20)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end