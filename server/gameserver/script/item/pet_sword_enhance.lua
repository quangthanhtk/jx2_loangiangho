--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--����ʱ�䣺2012-04-20
--�����޸ļ�¼

function OnUse(nItemIndex)
	if 32 ~= GetPlayerRoute() then
		Talk(1, "", "V�t ph�m d�nh cho C�n L�n Ki�m T�n.");
		return
	end

	SendScript2Client('Open([[EnhanceItem2]],205);');
end
