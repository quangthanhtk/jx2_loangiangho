--�ű����ƣ����ǿ����ű�
--�ű����ܣ�������ǿ����Ļص��ű�����Ҫ���ڿ����������ж�
--���뿪���ˣ������
--���뿪��ʱ�䣺2010-3-23
--�����޸ļ�¼��
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
function main(szSoulName)
	--���ǵȼ��Ļ�ȡ���ж�
	local nSoulChoose = 0;
	for i = 1, getn(VIE_201005_REBORN_TB_WeaponEffectInfo) do
		if VIE_201005_REBORN_TB_WeaponEffectInfo[i][1] == szSoulName then
			nSoulChoose = i;
			break;
		end
	end
	if nSoulChoose == 0 then
		return 0;
	end

	
	--���ǿ��������ж�
	--local bFlag = dostring(VIE_201005_REBORN_TB_WeaponEffectInfo[nSoulChoose][6]) 
    --if bFlag == 0 then
    --    Talk(1,"","<color=green>��ʾ<color>������ǰ�޷���������<color=yellow>"..szSoulName.."<color>���ٻ�����-"..VIE_201005_REBORN_TB_WeaponEffectInfo[nSoulChoose][3].."����ʱ�޷��ٻ����ǡ�")
    --end
    --return bFlag;
    return 1;
end
