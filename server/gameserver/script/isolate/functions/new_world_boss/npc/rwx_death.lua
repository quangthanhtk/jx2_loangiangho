Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.rwx[1]
    local ntime = nwb_bossaward.rwx[2]
    local maxrate = nwb_bossaward.rwx[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("Nh�m Ng� H�nh")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "Nh�m Ng� H�nh")
    nwb_CreateBox("T�i C�a Nh�m Ng� H�nh",m,x,y,20)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end