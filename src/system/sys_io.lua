--<<io v0.2 doc>>--
-- 2010-02-09 by �׷�
--[��io�ӿ�]--

-- �򿪻���һ���ļ�,����һ���ļ�����
-- modeȡֵFILE_READ��FILE_WRITE
-- fopen(filename,mode)

-- �ر�һ���ļ�����,��ʹ�üǵùر�,������Ϊй©
-- fclose(fp)

-- ���ļ���ǰλ��д��һ������
-- typeΪ��������,TYPE_INT,TYPE_FLOAT,TYPE_CHAR,TYPE_BYTE
-- fwrite(fp,type,value)

-- ���ļ���ǰλ�ö���һ����������
-- typeΪ��������,TYPE_INT,TYPE_FLOAT,TYPE_CHAR,TYPE_BYTE
-- fread(fp,type)

-- �����ļ���ʼ��
-- rewind(fp)

-- ���ļ�λ���ƶ�offset���ֽ�
-- modeΪ�ļ�λ��,SEEK_SET(��ͷ),SEEK_END(���)
-- fseek(fp,offset,mode)


-- ���������������ݵĴ�С
-- sizeofint()

-- ���ظ����������ݵĴ�С
-- sizeoffloat()

-- >>> ������ <<< --

-- fp = fopen("aaa.bin",FILE_WRITE);	-- ����һ��aaa.bin�Ķ������ļ�
-- fwrite(fp,TYPE_INT,9999);		-- д��һ������
-- fwrite(fp,TYPE_FLOAT,0.9878);	-- д��һ��������
-- fwrite(fp,TYPE_CHAR,"kkkkkkkkk");	-- д��һ���ַ���
-- fclose(fp);				-- �رղ������ļ�
-- fp = fopen("aaa.bin",FILE_READ);	-- ��һ���ļ�
-- value = fread(fp,TYPE_INT);		-- ��ȡһ������
-- Print(value,"\n");
-- value = fread(fp,TYPE_FLOAT);	-- ��ȡһ��������
-- Print(value,"\n");
-- value = fread(fp,TYPE_CHAR);		-- ��ȡһ���ַ���
-- Print(value,"\n");
-- fclose(fp);
-- fp = nil;

-- >>> -------- <<< --

function isfiletrue(filename)
	local fp = fopen(filename,FILE_READ);
	if fp > 0 then
		fclose(fp);
		fp = nil;
		return 1;
	else
		fp = nil;
		return 0;
	end
end

------------------------------------------
Print("io.lua Init success.\n");