USE BaseballData;

-- ���� ����
	-- 1) Nested Loop (NL) ����
	-- 2) Merge (����) ����
	-- 3) Hash (�ؽ�) ����

-- NonClustered
--		1
-- 2 3 4 5 6

-- Clustered
--		1
-- 2 3 4 5 6

-- Merge
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- NL
SELECT TOP 5 *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- Hash
SELECT *
FROM salaries AS s
	INNER JOIN teams AS t
	ON s.teamID = t.teamID;

-- NL
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(LOOP JOIN);

-- NL
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(FORCE ORDER, LOOP JOIN);

-- ������ ���
-- NL�� Ư¡
-- ���� ������(�׼���)�� OUTER ���̺��� �ο츦 ���� ���� ��ĵ�� �ϸ� ��(OUTER TALBE)�� ��� (INNER)���̺� ���� ������ �ϰ� �ȴ�.
-- �ι��� ������ (INNER)���̺� �ε����� ������ ���� ����. (���) (�ſ� ����)
-- �κ� ���� ó���� ���� (EX, TOP 5)