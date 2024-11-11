Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.lxl[1]
    local ntime = nwb_bossaward.lxl[2]
    local maxrate = nwb_bossaward.lxl[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("L·nh H­¬ng L¨ng")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "L·nh H­¬ng L¨ng")
    nwb_CreateBox("Tói cña L·nh H­¬ng L¨ng",m,x,y,20)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end