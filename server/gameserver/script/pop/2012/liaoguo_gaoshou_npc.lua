--�ɹ�����
Import("\\script\\lib\\globalfunctions.lua")

function fighting(nNpcIdx)
	if nNpcIdx then
		ChangeNpcToFight(nNpcIdx);
	end
end
function main()
	local nNpcIdx = GetTargetNpc();
	local strtab = {
		"Ngoan ngo�n giao ra c�ng ph�m!/#fighting(" .. nNpcIdx .. ")",
		}
	Say("Cao Th� Li�u Qu�c:",
		getn(strtab),
		strtab)
end

function OnDeath(nNpcIdx)
	gf_AddItemEx({2,96,116,1,4},"C�ng ph�m b� m�t");
	RemoveNpc(nNpcIdx);
end
