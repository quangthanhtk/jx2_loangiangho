--�����̷�²
Import("\\script\\lib\\define.lua")

tInfo = {
	{3,"Kh�c 4 ch� l�n N�i nh�c v� l�m l�n m�t c�a h�n, khi�n h�n gi�y gi�a trong �au ��n.",},
	{5,"C�t ��t m�t ��t ng�n tay c�a h�n, k�u kh�c trong �au ��n.",},
	{8,"Ng��i d�ng s�c b� g�y c�c x��ng c�a h�n.",},
	{10,"Ng��i d�ng s�c ��nh g�y c�c g�n m�ch c�a h�n.",},
	{20,"Ng��i qu� t�n nh�n r�i, d�y v� h�n ��n ch�t.",},
	}
	
	
function nothing()
end
	
function kill(nNpcIdx,n)
	if not tInfo[n] or not nNpcIdx then
		return 0;
	end
	Talk(1,"",tInfo[n][2]);
	local nCurNum = GetTask(TASKID_SW_TASK935_FINISH);
	SetTask(TASKID_SW_TASK935_FINISH,tInfo[n][1] + nCurNum);
	nCurNum = tInfo[n][1] + nCurNum
	if nCurNum >= 75 then
		Talk(2,"","T� Binh Thi�n �m Gi�o: Ta bi�t r�ng s� kh� tho�t ���c n�n h�m nay, nh�ng d� ta c� ch�t c�ng kh�ng b�n ��ng Thi�n �m Gi�o. Ch� h�n b�n v� l�m nh�n s�....","Xem ra t�n t� binh �� c�n l��i t� t� r�i. Nh�ng c�u n�i cu�i c�ng c�a h�n l� sao? Vi�c n�y c� li�n quan g� ��n v� l�m nh�n s�?")
	end
end	
	
function main()
	local nNpcIdx = GetTargetNpc();
	local strtab = {
	"Kh�c ch� tr�n m�t/#kill(" ..nNpcIdx ..",1)",
	"C�t ��t ng�n tay/#kill(" ..nNpcIdx ..",2)",
	"B� g�y x��ng kh�p/#kill(" ..nNpcIdx ..",3)",
	"��nh g�y g�n m�ch/#kill(" ..nNpcIdx ..",4)",
	"L�ng tr�/#kill(" ..nNpcIdx ..",5)",
	"H�y b�/nothing",
		}
	Say("T� Binh Thi�n �m Gi�o :",
		getn(strtab),
		strtab)
end