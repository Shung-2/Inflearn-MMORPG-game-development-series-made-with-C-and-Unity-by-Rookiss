-- 5�� DATATIME (��¥�� �ð�)

-- DATE ��/��/��
-- TIME ��/��/��
-- DATETIME ��/��/��/��/��/��


USE [BaseballData]
GO

  --SELECT CAST('20210311 21:04:05' AS DATETIME)
  ---- CAST �������
  ---- YYYYMMDD
  ---- YYYYMMDD hh:mm:ss.nnn
  ---- YYYY-MM-DDThh:mm

  ---- ����ð� ����
  --SELECT GETDATE() -- T SQL ����
  --SELECT CURRENT_TIMESTAMP -- ǥ��

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           ('20070909')
GO
-- ���� �ð� �����͸� �ִ� ���

-- �Ʒ��� ���� �ð��� Ȯ���ϴ� ���
SELECT *
FROM DATETIMETEST
-- �ð��� ���ϴ� �� (WHERE���� ����Ѵ�)
WHERE time >= '20100101'

-- UTC �����͸� ����ؼ� ���ϴ¹�
-- GMT(Greenwich Mean Time)
-- �ַ� ���� �� �ð��� �ٷ궧 �Ʒ� ǥ���� ����Ѵ�
SELECT GETUTCDATE();

-- �ð��� ���õ� ����(�ð��� ���ϰ� ���� �Լ�)
SELECT DATEADD (YEAR, 1, '20200426')
SELECT DATEADD (DAY, 5, '20200426')
SELECT DATEADD (SECOND, 123123, '20200426')
SELECT DATEADD (SECOND, -123123, '20200426')

-- �� �ð������� ���̸� ���ϴ� �Լ�
SELECT DATEDIFF(SECOND, '20200426', '20200503')
SELECT DATEDIFF(DAY, '20200426', '20200503')

-- � Ư�� ��¥���� ��,��,���� �̾ƿË� ����ϴ� �Լ�)
SELECT DATEPART(DAY, '20200826')
SELECT YEAR ('20200826')
SELECT MONTH ('20200826')
SELECT DAY ('20200826')