USE Northwind;

-- �ε��� ���� ���(Access)
-- Index Scan vs Index Seek

CREATE TABLE TestAccess
(
	id INT NOT NULL,
	name NCHAR(50) NOT NULL,
	dummy NCHAR(1000) NULL
);
GO

CREATE CLUSTERED INDEX TestAccess_CI
ON TestAccess(id);
GO

CREATE NONCLUSTERED INDEX TestAccess_NCI
ON TestAccess(name);


DECLARE @i INT
SET @i = 1;
WHILE (@i <= 500)
BEGIN
	INSERT INTO TestAccess
	VALUES (@i, 'Name' + CONVERT(VARCHAR, @i), 'HELLO WORLD' + CONVERT(VARCHAR, @i));
	SET @i = @i +1;
END

-- �ε��� ����
EXEC sp_helpindex 'TestAccess';

-- �ε��� ��ȣ 
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestAccess');

-- ��ȸ
DBCC IND('Northwind', 'TestAccess', 1);
DBCC IND('Northwind', 'TestAccess', 2);

-- CLUSTERED(1) : id
--			9121
-- 840 ~ 9120 (167)

-- NONCLUSTERED(2) : name
--		833
-- 837 ~ 832 (13)

-- ���� �б� > ���� �����͸� ã�� ���� ���� ��������
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- INDEX SCAN = LEAF PAGE�� ���������� �˻��ϴ� ��
SELECT *
FROM TestAccess;

-- INDEX SEEK 
SELECT *
FROM TestAccess
WHERE id = 104;
-- �� ���� �бⰡ 2�ΰ�? 
-- CLUSTERED(1) : id
--			9121
-- 840 ~ 9120 (167)����
-- 9121�� ���� �˻��ϰ� ������ �� �ؿ� 840 ~ 9120���̿� ���� �˻��� ���̹Ƿ� 2��

-- INDEX SEEK + KEY LOOKUP
SELECT *
FROM TestAccess
WHERE name = 'name5';
-- �� ���� ����� 4�ΰ�?
-- NONCLUSTERED(2) : name
--		833
-- 837 ~ 832 (13) 833�������� ���� NAME 5�� ã�� ������ � �������� �����ϴ°�?
-- �˸´� 832�� �ִ� �׷� 833 1��, 832 2���� �ȴ�. �׷����� NONCLUSTERED ���� ���������� ������ ����Ǿ� �ִ°� �ƴ϶�
-- CLUSTERED�� Ű���� ������ �����Ƿ� Ű���� ID�̹Ƿ� 832�� �ִٰ� �ϴ��� NAME 5���� �ش��ϴ� ID ���� ������ ������
-- CLUSTERED������ �Ѿ�� 2���� �߰��ϹǷ� 4�� �ȴ�.

-- INDEX SCAN + KEY LOOKUP
-- N * 2 + @
SELECT TOP 10 *
FROM TestAccess
ORDER BY name;
-- INDEX SCAN �� ���ٰ� �ؼ� �� ���۰� �ƴϴ�.
-- �׷� �� ���� �бⰡ 13�ΰ�? > TOP 5�� ORDER BY�� ���� �׷���

-- NONCLUSTERED(2) : name
--		833
-- 837 ~ 832 (13)���� 837 ���� 5���� �����ϰ� ������ �ǹǷ� �ε��� ��ĵ������ ������ ����ȴ�.
-- 5���� ������ ������ CLUSTERED���� �����Ѵ�.
-- CLUSTERED(1) : id
--			9121
-- 840 ~ 9120 (167)
-- �̷� ���� �뷫������ 13���� ���°��� �� �� �ִ�.