
function on_server_start()
	do return 0; end --LongDaiKa: t�t npc H�a Ph�ng T�
	local nNpcIndex;
	--�Ի�NPC����
	nNpcIndex = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n","H�a Ph�ng T�",100,1451,2821);
	SetNpcScript(nNpcIndex,"\\script\\������\\Ȫ��\\npc\\�����.lua")
	
	nNpcIndex = CreateNpc("L� n��ng b�nh","H�a Long ��nh",329,1753,3438);
	SetNpcScript(nNpcIndex,"\\script\\task\\huofengtask\\npc_update_huofeng_lv2.lua");
	
--	nNpcIndex = CreateNpc("�Ļ��̽�����","TYT_HHHLJ",0,0,0);
--	SetNpcScript(nNpcIndex,"");
	
	nNpcIndex = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n","H�a Ph�ng T�",8011,1552,3211);
	SetNpcScript(nNpcIndex,"\\script\\task\\huofengtask\\npc_update_huofeng_lv3.lua")
end
	