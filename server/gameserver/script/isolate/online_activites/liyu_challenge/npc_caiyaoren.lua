Include("\\script\\isolate\\online_activites\\liyu_challenge\\main.lua")
Import("\\script\\lib\\globalfunctions.lua")
function main()
    local nCurNpcIndex = GetTargetNpc()
    if liyu_check_ms_date() ~= 1 then 
        Talk(1,"","Ho�t ��ng �� k�t th�c") 
        SetNpcLifeTime(nCurNpcIndex,0)
        return 
    end
    local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
    if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- �˶η�ˢ
    if liyu_condition_check()~=1 then return end
    local szSex = ""
	local nCurNpcIndex = GetTargetNpc()
    if GetSex()==1 then szSex = "Thi�u hi�p" else szSex = "N� hi�p " end 
	if (nCurNpcIndex == 0) then
		return
	end
    local nRand = random(1,100);
    if nRand <= 40 then 
        if gf_Judge_Room_Weight(1, 0) == 1 then
            SetNpcLifeTime(nCurNpcIndex,0)
            gf_AddItemEx({2,1,31151,1}, "R��ng Nguy�n Li�u Thu�c");
            Talk(1,"",szSex.."��n ��ng l�c l�m. Ta v�a ��n D��c V��ng C�c h�i thu�c v�, t�ng ng��i m�t �t nguy�n li�u thu�c.")
        else
            Talk(1,"","Kh�ng gian h�nh trang kh�ng d�")
            AddUnitStates(nCurNpcIndex, 0, -100)
        end
    else
        SetNpcLifeTime(nCurNpcIndex,0)
        Talk(1,"",szSex.."��ng lo, ta �ang ��nh ��n D��c V��ng C�c h�i thu�c.")
    end
end;