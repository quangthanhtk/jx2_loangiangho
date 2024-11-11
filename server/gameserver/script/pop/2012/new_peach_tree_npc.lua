--	["����"] 		 = {{928,947,},	{2,96,129,1,4},"���ʵ�����",}, -- ��NPC name��={{taskid,},[{item info}],"item name",[sTalkMsg]} 
Include("\\script\\online\\template\\flash_npc.lua");
Import("\\script\\class\\mem.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\misc\\autocleaner\\autocleaner_head.lua")

tPeachTree = { --
	nstartDate = 20120301, --���ʼʱ��
	nEndDate = 20301230, --�����ʱ��
	nCheckRoute = 0,  --�Ƿ�Ҫ��������
	strNpcMod = "��o Hoa th�",  --Npcģ��
	strNpcName = "Nh�nh ��o", --npc����
	nCampType = 1,   --�Ի�npc����ս��npc
	nNeedRoom = 0,   --����ǶԻ�npc����Ҫ�жϱ����ռ䣨���ݽ���������
	nNeedWeight = 0, --����ǶԻ�npc����Ҫ�жϱ������أ����ݽ���������
	strThisFile = "\\script\\pop\\2012\\new_peach_tree_npc.lua",  
	tNpcPos = {
		[5079]={
{4062,11255},	
{4051,11269},	
{4018,11255},	
{4030,11276},	
{4047,11290},	
{4066,11287},	
{4046,11302},	
{4023,11306},	
{3995,11195},	
{3974,11165},	
{4017,11200},	
{4011,11156},	
{4009,11137},	
{4097,11159},	
{4087,11154},	
{4073,11148},	
{4066,11158},	
{4106,11156},	
{3975,11076},	
{3984,11070},	
{4028,11086},	
{4041,11081},	
{4035,11068},	
{4025,11057},	
{4011,11044},	
{4061,11001},	
{4070,11036},	
{4045,11008},	
{4050,10991},	
{3992,11000},	
{3985,10910},	
{3973,10912},	
{3996,10910},	
{4016,10936},	
{4026,10924},	
{4032,10917},	
{4160,10988},	
{4187,10971},	
{4200,10968},	
{4207,10945},	
{4216,10941},	
{4227,10932},	
{4240,10955},	
{4255,10962},	
{4274,10974},	
{4284,10990},	
{4282,11016},	
{4310,11021},	
{4285,11030},	
{4268,11022},	
		
			},
	},
	-- ��Ҫʵ�����½ӿں���
	onTalk = nil,						--�Ի�npc���
	giveDeathAward = nil,	  --ɱ��npc�������
	giveTalkAward = nil,		--�Ի�npc�������
};

tPeachTree = inherit(tFlashNpcInfo,tPeachTree);

function main()
	autoclean();
	tPeachTree:npc_main();
end

function tPeachTree.create_tree_npc()
	tPeachTree:createFlashNpc(5079,20);
end
	

function tPeachTree:giveTalkAward()
	gf_AddItemEx({2,96,130,1,4},"H�t gi�ng c�y ��o");
end
	
tTaskId = {928,947}
function tPeachTree:onTalk()
	local nHasTask = 0;
	if BigGetItemCount(2,96,130) >= 5 then
		Talk(1,"","Thi�u hi�p �� thu th�p �� h�t gi�ng r�i, h�y mang �i gieo tr�ng n�o!");
		return 0;
	end
	
	for i = 1,getn(tTaskId) do
		if tGtTask:check_cur_task(tTaskId[i]) == 1 then
			nHasTask = 1;
			break;
		end
	end
	if nHasTask ~= 1 then
			return 0;
	end
	if gf_Judge_Room_Weight(1,10,"Nh�nh ��o") ~= 1 then return 0; end
	tPeachTree:talkCallBack(); 
end
