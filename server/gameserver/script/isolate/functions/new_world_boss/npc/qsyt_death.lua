Import("\\script\\isolate\\functions\\new_world_boss\\main.lua")

function OnDeath(id, f, x)
    local taward = nwb_bossaward.yt[1]
    local ntime = nwb_bossaward.yt[2]
    local maxrate = nwb_bossaward.yt[3]
    local m,x,y = GetNpcWorldPos(id)
    nwb_kill_announce("Th��ng Th�n Doanh Thi�n")
    nwb_dropaward(taward, ntime, m,x,y, maxrate, "Th��ng Th�n Doanh Thi�n")
    nwb_CreateBox("T�i c�a Th��ng Th�n Doanh Thi�n",m,x,y,20)
	FireEvent("event_mission_affairs", "worldboss", "killboss", id)
end