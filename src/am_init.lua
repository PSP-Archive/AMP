
dofile("game.ini");

Include("sys_callback.lua");
Include("sys_graphic.lua");
Include("sys_io.lua");
Include("sys_media.lua");
Include("sys_script.lua");
Include("sys_setting.lua");
Include("sys_stage.lua");
Include("sys_text.lua");
Include("sys_fairy.lua");

Include("module_switch.lua");
Include("module_select.lua");
Include("select_plus.lua");
Include("module_find.lua");
Include("module_menu.lua");
Include("module_title.lua");
Include("module_sav.lua");

--================================================================


--================--
-- <ϵͳ��������> --
-- {

	-- ��������
	FG_DX_A = 0;
	FG_DY_A = 0;
	FG_DX_B = 0;
	FG_DY_B = 0;
	FG_DX_C = 0;
	FG_DY_C = 0;
	FG_DX_D = 0;
	FG_DY_D = 0;
	FG_DX_E = 0;
	FG_DY_E = 0;
	FG_DX_F = 0;
	FG_DY_F = 0;

	-- ������������
	TFG_DX_A = 0;
	TFG_DY_A = 0;
	TFG_DX_B = 0;
	TFG_DY_B = 0;
	TFG_DX_C = 0;
	TFG_DY_C = 0;
	TFG_DX_D = 0;
	TFG_DY_D = 0;
	TFG_DX_E = 0;
	TFG_DY_E = 0;
	TFG_DX_F = 0;
	TFG_DY_F = 0;

	-- �Ի�����������,����
	MSG_BOX_NUM = 10;
	MSG_BOX_DX = 0;
	MSG_BOX_DY = 185;

	-- ��������,�����������
	NAME_NUM = 7;
	NAME_DX = 0;
	NAME_DY = 0;

-- }
--================--


--================--
-- <��Ϸ�������> --
-- {
	-- ��Ϸ������
	GAMENAME("ģ��");

	-- ��������
	-- {
		fontnull();				-- ������������
		textclear();				-- ����
		font("font/font.ttf",13);		-- ��ȡttf����
		fontcolor(255,255,255,255);		-- ����Ĭ����ɫ
		fontwidth(22);				-- д�ֿ��
		fontheight(20);				-- д�ָ߶�
		textspeed(10);				-- д���ٶ�,��ֵԽСԽ��
		textlen(39);				-- �������ַ�����,��������
		textline(3);				-- ����������,����������
		textmode(TEXT_HALFSCENE);		-- ����ģʽ,TEXT_HALFSCENE,TEXT_FULLSCENE
		textxy(21,198);				-- ������ʾ����
		namexy(27,156);				-- ������ʾ����
		texton();				-- ���ֿ���

		SetMsgBoxNum(MSG_BOX_NUM);		-- ��ǶԻ�����������,����ģʽ��Ҫ
		SetNameBoxNum(0);			-- ������ֿ���������,����ģʽ��Ҫ

		setdialogicon("dialog_icon.png");	-- ���ù��
		setdialogiconxy(435,210);		-- ��������
		setdialogiconspeed(18);			-- ���Ƶ��
	-- }

	-- ���ױ�������
	-- {
		titleinit();
		settitlexy(0,0);			-- ���ñ����ļ�����
		settitleiconxy(290,152);		-- ���ù���ļ�����
		settitleiconstep(0,22);			-- ���ù���ƶ�����
		settitleitem(3);			-- ����ѡ������
		--settitlebg("");			-- ���ñ����ļ�
		settitleicon("title_icon.png",nil);	-- ���ù���ļ�
		settitlesound("sound_bi.wav");		-- ���ñ���ѡ����Ч
	-- }

	-- ��֧����
	-- {
		selectinit();
		setselectxy(100,43);			-- ��֧��ť����ʾ����
		setselecticonxy(115,50);		-- ��֧������ʾ����
		setselecticonstep(0,36);		-- ��֧�����ƶ�����
		setselectbuttonstep(0,36);		-- ��֧��ť�ļ��
		setselectbg("select_bg.png");		-- ��֧�ı����ļ�
		setselectbgmode(2);			-- 1Ϊ��ʾһ��,2Ϊ��ʾn��
		setselectbgxy(60,37);			-- ��֧�����ļ�����
		setselecticon("select_icon.png",nil);	-- ��֧�Ĺ���ļ�
		setselectsound("sound_bi.wav");		-- ��֧��Ч
	-- }


	-- �˵��������
	-- {
		setmenubg("menu_bg.png");		-- �˵��ļ�
		setmenubgxy(186,68);			-- �˵�����
		setmenuicon("menu_icon.png");		-- ����ļ�
		setmenuiconxy(159,70);			-- �������
		setmenuiconstep(0,24);			-- ����ƶ�����
		setmenuitemsize(5);			-- ѡ������
		setmenusound("sound_bi.wav");		-- ��Ч
	-- }

	-- �����������
	-- {
		setfindicon("find_icon.png");		-- ������
		setfindiconxy(230,128);			-- �������
		setfindsound("sound_bi.wav");		-- ��Ч
	-- }

	-- �浵�������
	-- {
		savsetloadimage("amsav_ui.jpg");	-- ��������
		savsetsaveimage("amsav_ui.jpg");	-- �浵����
		savseticon("select_icon.png");		-- ����ļ�
		savseticonxy(0,0);			-- �������
		savsetitemxy(0,0);			-- ѡ������
		savsetitemstep(0,25);			-- ����ƶ�����(����)
		savsetsound("sound_bi.wav");		-- ��Ч
	-- }
-- }


--================--
--  �û��Զ�����  --
--================--

function uservalueinit()

	-- �û��Զ�������ʼ��

	myvalue = 0;

end

function uservaluesave()

	-- ϵͳ����64��λ�ñ����Լ��ı���

	usersetvalue(1,myvalue);

end

function uservalueload()

	-- ��ȡ�浵���Զ�������ֵ

	myvalue = usergetvalue(1);

end


--================================================================

----------------------
--===�򵥷�װ����===--
----------------------

--�ȴ�����
function waitforkey(key)
	if KeyDown(key)==1 then
		return;
	else loop(); end
end

function pause(num)
	wait(num);
end

function QUIT()
	SetGameMode(QUIT_MODULE);
end

----------------------

jump("am_start.lua");		-- ����ű����
sysMode(EVENT_MODE);		-- �ܾ���

--================================================================
Print("am_init.lua Init success.\n");
Print("\n>>> am_start.lua begin. <<<\n\n");
