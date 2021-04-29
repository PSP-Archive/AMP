
--<<title v0.2 doc>>--
-- 2009-12-14 by �׷�
--[���ױ���]--

---------------------------------------------
-- titleinit()
-- titlefini()
-- titlechose()
-- settitlexy(dx,dy)
-- settitleiconxy(dx,dy)
-- settitleiconstep(stepx,stepy)
-- settitlebg(file)
-- settitleicon(file,num)
---------------------------------------------

_title = {};		-- �����
_title.dx = 0;		-- ��������x
_title.dy = 0;		-- ��������y
_title.icondx = 0;	-- ѡ��ͼ�������x
_title.icondy = 0;	-- ѡ��ͼ�������y
_title.icon_stepx = 0;	-- ѡ��ͼ���ƶ�x
_title.icon_stepy = 0;	-- ѡ��ͼ���ƶ�y
_title.chose = 0;	-- ��ת�ñ��
_title.item = 0;	-- ѡ����Ŀ
_title.icon1 = 0;	-- ���ⱳ��
_title.icon2 = 0;	-- ������
_title.mode = 0;	-- ��������
_title.gamemode = 0;
_title.sound = nil;	-- ��Ч

TITLE_DX = 0;
TITLE_DY = 0;
TITLE_ICON_DX = 100;
TITLE_ICON_DY = 120;

function titleinit()
	-- ��ʼ�����Դ
	_title.mode = 1;
	_title.chose = 1;
	_title.icondx = TITLE_ICON_DX;
	_title.icondy = TITLE_ICON_DY;
end

function titlefini()
	-- ���������Դ
	if _title.icon1 then
		FreeImage(_title.icon1);
		_title.icon1 = 0;
	end
	if _title.icon2 then
		FreeImage(_title.icon2);
		_title.icon2 = 0;
	end
	_title.sound = 0;
	_title = nil;
end

function titlechose()
	if _title.mode==1 then
		KeyInit();
		_title.mode = 2;
		_title.gamemode = GetGameMode();
		_title.icondx = TITLE_ICON_DX;
		_title.icondy = TITLE_ICON_DY;
		_title.chose = 1;
		SetGameMode(DEFAULT_MODULE);
	elseif _title.mode==2 then
		titleupdate();
		titlerender();
	elseif _title.mode==3 then
		_title.mode = 1;
		SetGameMode(_title.gamemode);
		return _title.chose;
	end
	loop();
end

function titlechose2()
	if _title.mode==1 then
		KeyInit();
		_title.mode = 2;
		_title.gamemode = GetGameMode();
		_title.icondx = TITLE_ICON_DX;
		_title.icondy = TITLE_ICON_DY;
		_title.chose = 1;
		SetGameMode(DEFAULT_MODULE);
	elseif _title.mode==2 then
		titleupdate2();
		titlerender();
	elseif _title.mode==3 then
		_title.mode = 1;
		SetGameMode(_title.gamemode);
		return _title.chose;
	end
	loop();
end

function titleupdate()
	-- ��������
	if KeyDown(KEY_DOWN)==1 then
		_title.icondx = _title.icondx + _title.icon_stepx;
		_title.icondy = _title.icondy + _title.icon_stepy;
		_title.chose = _title.chose + 1;
		titlesoundplay();
	end
	if KeyDown(KEY_UP)==1 then
		_title.icondx = _title.icondx - _title.icon_stepx;
		_title.icondy = _title.icondy - _title.icon_stepy;
		_title.chose = _title.chose - 1;
		titlesoundplay();
	end

	if _title.chose > _title.item then
		_title.icondy = TITLE_ICON_DY;
		_title.chose = 1;
	elseif _title.chose < 1 then
		_title.icondy = TITLE_ICON_DY + (_title.icon_stepy * (_title.item - 1));
		_title.chose = _title.item;
	end

	if KeyDown(KEY_CIRCLE)==1 then
		-- playwav
		titlesoundplay();
		_title.mode = 3;
	end
end

function titleupdate2()
	-- ��������
	if KeyDown(KEY_RIGHT)==1 then
		_title.icondx = _title.icondx + _title.icon_stepx;
		_title.icondy = _title.icondy + _title.icon_stepy;
		_title.chose = _title.chose + 1;
		titlesoundplay();
	end
	if KeyDown(KEY_LEFT)==1 then
		_title.icondx = _title.icondx - _title.icon_stepx;
		_title.icondy = _title.icondy - _title.icon_stepy;
		_title.chose = _title.chose - 1;
		titlesoundplay();
	end

	if _title.chose > _title.item then
		_title.icondx = TITLE_ICON_DX;
		_title.chose = 1;
	elseif _title.chose < 1 then
		_title.icondx = TITLE_ICON_DX + (_title.icon_stepx * (_title.item - 1));
		_title.chose = _title.item;
	end

	if KeyDown(KEY_CIRCLE)==1 then
		-- playwav
		titlesoundplay();
		_title.mode = 3;
	end
end

function titlerender()
	-- ������ʾ
	ImageToScene( _title.icon1 , TITLE_DX, TITLE_DY);
	ImageToScene( _title.icon2 , _title.icondx, _title.icondy);
end

-- �������

function settitlexy(dx,dy)
	TITLE_DX = dx;
	TITLE_DY = dy;
end

function settitleiconxy(dx,dy)
	TITLE_ICON_DX = dx;
	TITLE_ICON_DY = dy;
	_title.icondx = dx;
	_title.icondy = dy;
end

function settitleiconstep(stepx,stepy)
	_title.icon_stepx = stepx;
	_title.icon_stepy = stepy;
end

function settitleitem(num)
	_title.item = num;
end

function settitlebg(file)
	if _title.icon1 > 0 then
		FreeImage(_title.icon1);
		_title.icon1 = 0;
	end
	_title.icon1 = LoadImage(file,4444);
end

function settitleicon(file,num)
	if _title.icon2 > 0 then
		FreeImage(_title.icon2);
		_title.icon2 = 0;
	end
	_title.icon2 = LoadImage(file,4444);
end

function settitlesound(file)
	if _title.sound == nil then
		_title.sound = file;
	end
end

function titlesoundplay()
	if _title.sound then
		playfile(_title.sound,4);
	end
end

---------------------------------------------
Print("title.lua Init success.\n");
