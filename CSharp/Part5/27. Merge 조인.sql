USE BaseballData;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

-- Merge (����) ���� = Sort Merge(���� ����) ����

-- NonClustered
--		1
-- 2 3 4 5 6

-- Clustered
--		1
-- 2 3 4 5 6

SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;


-- One-To-Many (outer�� unique�ؾ� �Ѵ�. > PK, Unique)
-- Merge ���ε� ������ �ٰ� �ȴ�.
-- ������ Random Access > Clustered Scan �� �����ϰ� �ȴ�.

SELECT *
FROM schools AS s
	INNER JOIN schoolsplayers AS p
	ON p.schoolID = s.schoolID;

-- ������ ��� --
-- Merge > Sort Merge ����
-- 1) ���� ������ Sort(����)�ϰ� Merge(����)�Ѵ�
	-- �̹� ���ĵ� ������ �����Ͷ�� Sort(����)�� �����ȴ�.
	-- ������ �����Ͱ� �ʹ� ������ GG - Hash ������ �̿��Ѵ�
-- 2) Random Access ���ַ� ��������� �ʴ´�. 
-- 3) Many-To-Many(�ٴ��)���ٴ� One-To-Many(�ϴ��) ���ο� ȿ�����̴�.
		-- PK, UNIQUE
