
--<<media v0.7 doc>>--
-- 2010-04-25 by �׷�
--[��ý��ӿ�,������,��������,���þ���Ч��]--

----------------------------------------------

--------------------------
-- ����pmp����,ֻ��һ����Ե���
-- pmplay(file);
--------------------------

--------------------------
-- ����mp3,������˵:
-- file		�ļ�·����
-- vol		������С,vol��ȡֵ��Χ0-128
-- times	���Ŵ���,0Ϊ����ѭ��
-- speed	Ч��ʱ��,Խ��ʱ��Խ��
--------------------------
-- mp3load(file,index)
-- mp3loadbybuf(file,index)
-- mp3play(index)
-- mp3pause(index)
-- mp3resume(index)
-- mp3stop(index)
-- mp3replay(index)
-- mp3unload(index)
-- mp3volume(index,vol)
-- mp3playtimes(index,times)
-- mp3fadein(index,vol,speed,step)
-- mp3fadeout(index,vol,speed,step)
--------------------------

--------------------------
-- ����ogg,wav,������˵:
-- file		�ļ�·����
-- index	���ò��Ż�������,indexȡֵ��Χ�� 1-4 (��������ֵ,�������Ը�)
-- vol		Ϊ������С,vol��ȡֵ��Χ1-128
-- times	���Ŵ���,0Ϊ����ѭ��
-- speed	Ч��ʱ��,Խ��ʱ��Խ��
-- * ��Ϊogg��wav�Ĵ������
--------------------------
-- *load(file,index)
-- *loadbybuf(file,index)
-- *play(index)
-- *pause(index)
-- *resume(index)
-- *stop(index)
-- *replay(index)
-- *unload(index)
-- *volume(index,vol)
-- *playtimes(index,times)
-- *fadein(index,vol,speed,step)
-- *fadeout(index,vol,speed,step)
--------------------------


--------------------------
-- ���ײ����ļ�,������˵:
-- file		�ļ�·����
-- index	���ò��Ż�������,index��ȡֵ��Χ�� 1-4 (��������ֵ,�������Ը�)
--------------------------
-- playfile(file,index)
-- stopfile(postfix,index)
--------------------------




--------------------------
-----����Ϊ����������-----
--------------------------

-----------------------------------------------

function pmplay(file)
	mLoad(file);
end

-----------------------------------------------

function mp3load(file,index)
	mLoad(file,index);
end

function mp3loadbybuf(file,index)
	mLoadbybuf(file,index);
end

function mp3play(index)
	mPlay("mp3",index);
	--mp3playtimes(0);
end

function mp3pause(index)
	mPause("mp3",index);
end

function mp3resume(index)
	mResume("mp3",index);
end

function mp3stop(index)
	mStop("mp3",index);
end

function mp3replay(index)
	mReplay("mp3",index);
end

function mp3unload(index)
	mUnLoad("mp3",index);
end

function mp3volume(index,vol)
	mSetVol("mp3",index,vol);
end

function mp3playtimes(index,times)
	mSetTimes("mp3",index,times);
end


function mp3fadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("mp3",nil,vol);
		mp3volume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			mp3volume(index,_sound.vol);
			--SetVol("mp3",nil,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function mp3fadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("mp3",nil,vol);
		mp3volume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			mp3volume(index,_sound.vol);
			--SetVol("mp3",nil,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function oggload(file,index)
	mLoad(file,index);
end

function oggloadbybuf(file,index)
	mLoadbybuf(file,index);
end

function oggplay(index)
	mPlay("ogg",index);
	--oggplaytimes(index,1);
end

function oggpause(index)
	mPause("ogg",index);
end

function oggresume(index)
	mResume("ogg",index);
end

function oggstop(index)
	mStop("ogg",index);
end

function oggreplay(index)
	mReplay("ogg",index);
end

function oggunload(index)
	mUnLoad("ogg",index);
end

function oggvolume(index,vol)
	mSetVol("ogg",index,vol);
end

function oggplaytimes(index,times)
	mSetTimes("ogg",index,times);
end

function oggfadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("ogg",index,vol);
		oggvolume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			oggvolume(index,_sound.vol);
			--SetVol("ogg",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function oggfadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("ogg",index,vol);
		oggvolume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			oggvolume(index,vol);
			--SetVol("ogg",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function wavload(file,index)
	mLoad(file,index);
end

function wavloadbybuf(file,index)
	mLoadbybuf(file,index);
end

function wavplay(index)
	mPlay("wav",index);
	--wavplaytimes(index,1);
end

function wavpause(index)
	mPause("wav",index);
end

function wavresume(index)
	mResume("wav",index);
end

function wavstop(index)
	mStop("wav",index);
end

function wavreplay(index)
	mReplay("wav",index);
end

function wavunload(index)
	mUnLoad("wav",index);
end

function wavvolume(index,vol)
	mSetVol("wav",index,vol);
end

function wavplaytimes(index,times)
	mSetTimes("wav",index,times);
end

function wavfadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("wav",index,vol);
		wavvolume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			wavvolume(index,_sound.vol);
			--SetVol("wav",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function wavfadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("wav",index,vol);
		vavvolume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			wavvolume(index,_sound.vol);
			--SetVol("wav",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function playfile(file,index)
	if isfiletrue(file)==1 then mLoad(file,index);
	else mLoadbybuf(file,index); end
	mPlay(file,index);
end

function stopfile(postfix,index)
	mUnLoad(postfix,index);
end

----------------------------------------------------------------

_sound = {};
_sound.vol = 0;
_sound.count = 0;
_sound.mode = 0;

function sound_effect_init()
	_sound.vol = 0;
	_sound.count = 0;
	_sound.mode = 0;
end

function mediafini()
	local i;
	for i=1,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(1);
	mp3unload(2);
	i = nil;
end

function sound_systemfini()
	local i;
	for i=2,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(2);
	i = nil;
end

-----------------------------------------------
Print("media.lua Init success.\n");