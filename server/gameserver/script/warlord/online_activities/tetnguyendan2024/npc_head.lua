--Include("\\script\\warlord\\online_activites\\tetnguyendan2024\\event_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("script\\warlord\\online_activities\\tetnguyendan2024\\event_head.lua");
--Import("\\script\\warlord\\preload.lua");
--thanhdz
--5/12/2019
strNpcName="��i S� N�m M�i: "
function main()
	local nDate = tonumber(date("%Y%m%d"))

	local tSay = {}
	--tinsert(tSay,"Bang h�i danh gi�")
	if GetAccount()=="thanhtk" then
		tinsert(tSay, format("%s/#CreateBossEvent2024()", "Goi Bosss"));
	end
	tinsert(tSay, format("%s/#DoiEvent()", "Gh�p M�m Ng� Qu�"));
	tinsert(tSay, format("%s/#DoiEvent2024(1)", "��i Ti�n Xu May M�n"));
	tinsert(tSay, format("%s/#DoiEvent2024(2)", "��i th� g�i Boss Ni�n Th�"));
	tinsert(tSay, format("%s/#DoiEvent2024(3)", "��i Thi�p Ch�c Ph�c"));
	tinsert(tSay, format("%s/#menu_event_hatGiong_NguyenDan()", "��i H�t Gi�ng C�y Hoa T�t"));
	--tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top h� ph�i/get_top_faction_info")
	--	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top 3 chi�n tr��ng/get_top_nation_info")
	--	tinsert(tSay,"Xem t�nh h�nh ��ng k� nh�n th��ng m�t t�ch/get_top100_award_info")
	--	tinsert(tSay,"Ph�t th��ng bang h�i/PhatThuongBangHoi")
	tinsert(tSay,"Ta bi�t r�i/dlgover")

	if nDate <= 20240317 then
		local strSay = strNpcName.."Hoa ��o n�, n�m m�i ��n. Ch�c c�c b�ng h�u g�n xa s�c kh�e d�i d�o!\nPh�n th��ng r�t nhi�u �ang ch� c�c b�ng h�u! Nhanh ch�n ��i th��ng nh�!<color=yellow>\nC�ng Th�c:\n1 M�m Ng� Qu� = 10 Qu� m�i lo�i+5 xu\nTi�n Xu May m�n = 10 C�nh ��o+10 C�nh Mai+10 Xu\nThi�p Ch�c Ph�c = 5 Ni�n Th� C�t+10 xu\nTh� g�i Boss = 20 xu<color>"
		Say(strSay,getn(tSay),tSay)
	end


	--local tbSayDialog = {};
	--local nSaySize = 0;
	--local szSayHead = "Hoa ��o n�, n�m m�i ��n. Ch�c c�c b�ng h�u g�n xa s�c kh�e d�i d�o!\nPh�n th��ng r�t nhi�u �ang ch� c�c b�ng h�u! Nhanh ch�n ��i th��ng nh�!"
	----tinsert(tbSayDialog,"��i h�p qu� N�m M�i/DoiEvent")
	--tinsert(tbSayDialog,"��i H�t Gi�ng C�y Hoa T�t/menu_event_hatGiong_NguyenDan")
	--tinsert(tbSayDialog, format("%s/#DoiEvent()", "Gh�p M�m Ng� Qu�"));
	----tinsert(tbSayDialog, format("%s/#NhanThuong_TichLuy()", "�i�m t�ch l�y ��i ph�n th��ng"));
	--tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	--nSaySize = getn(tbSayDialog);
	--Say(szSayHead, nSaySize, tbSayDialog);
end

function menu_event_hatGiong_NguyenDan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "C�ng Th�c ��i H�t Gi�ng:\n M�i h�t gi�ng c� gi� 5xu/1"
	tinsert(tbSayDialog, format("%s/#DoiHatGiongEvent(1)", "��i h�t gi�ng c�y ��o"));
	tinsert(tbSayDialog, format("%s/#DoiHatGiongEvent(2)", "��i h�t gi�ng c�y Mai"));
	--tinsert(tbSayDialog,"��i h�t gi�ng c�y ��o/DoiHatGiongEvent")
	--tinsert(tbSayDialog,"��i h�t gi�ng c�y Mai/DoiHatGiongEvent1")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end