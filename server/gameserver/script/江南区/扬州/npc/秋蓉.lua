--����
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_����\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 10 then
        task_10_00();
    elseif nStep == 11 or nStep == 12 or nStep == 13 then
        task_13_qr_00();
    elseif nStep == 14 then
        task_14_00();
    elseif nStep == 15 then
        Talk(1,"","Ch�ng ph�i ng��i n�i �� ��nh b�i K� L�n g� �� sao? Sao l�i ��i � th�?");
    elseif nStep == 16 then
        task_16_00();
    else
        if GetSex() == 1 then
            Talk(1,"","Ng��i c� mu�n v�o ��y c�ng ta nh�m ch�t m� t�u? Ha ha ha!");
        elseif GetSex() == 2 then
            Talk(1,"","Mu�i mu�i! D� ng��i hay � trung nh�n c�a ng��i ��u r�i xa n�i n�y!");
        end;
    end;
end;