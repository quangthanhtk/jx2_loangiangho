--����ϵͳ�������
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--ָ��Ѩλָ���ȼ����������������Ƿ���
--1=�Ѵ��
--0=δ���
function CheckCondition(nLevel, bNotify)
	--print(format("[%s]undefined meridian level %d", GetName(), nLevel))
	--return 0
	
	if 5 ~= nLevel then
		return 0
	end
	if 1 ~= meridianlevel_check_require(nLevel, bNotify) then
		return 0
	end
	--������������ж�
	return 1;
end

--��ȡָ��Ѩλָ���ȼ����������������ı�
--����szDescription
function GetConditionDesc(nLevel)
	local szNpcDesc = format("K�ch ho�t c�nh gi�i %s c� th� t�m <color=yellow>Nh�c B�t Qu�n<color> khai th�ng", meridianlevel_getname(nLevel - 1))
	local str = format("%s\nho�c%s", format("Ho�n th�nh %s d�y nhi�m v�","V� Ho�ng"), szNpcDesc)
	
	local str=""
	return str;
end

--��������ǰ����������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoBeforeLevelUpdateCallBack(nNewLevel)
	return 1;
end


--��������������������Ҫִ�еĲ���
--1=�����ɹ�
--0=����ʧ��
function DoAfterLevelUpdateCallBack(nNewLevel)
	merdiantitle_check_add_title(0)--������ӳƺ�
	return 1;
end

function do_update_lv_5()
	local nMeridianLevel = MeridianGetLevel();
	if nMeridianLevel == 4 then
		MeridianUpdateLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0);
		
		local str = format("Ch�c m�ng %s%s k�ch ho�t V� Ho�ng th�nh c�ng!", GetName(), gf_GetPlayerSexName());
		Say("<color=green>Nh�c B�t Qu�n:<color>"..str, 0);
		Msg2Global(msg);
	end
end

