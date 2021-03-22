USE BaseballData;

-- playerID (���� ID)
-- yearID (���� �⵵)
-- teamID (�� ��Ī, 'BOS' = ������)
-- G_batting (���� ��� + Ÿ��)
-- AB (Ÿ��)
-- H (��Ÿ)
-- R (���)
-- 2B (2��Ÿ)
-- 3B (3��Ÿ)
-- HR (Ȩ��)
-- BB (����)

SELECT *
FROM BATTING;

-- 1) ������ �Ҽ� �������� �����鸸 ��� ���
SELECT *
FROM BATTING
WHERE TEAMID = 'BOS';

-- 2) ������ �Ҽ� �������� ���� ���? (��, �ߺ��� ����)
SELECT COUNT (DISTINCT PLAYERID)
FROM BATTING
WHERE TEAMID ='BOS'

-- 3) ������ ���� 2004�⵵�� ģ Ȩ�� ����
SELECT SUM(HR)
FROM BATTING
WHERE TEAMID ='BOS' AND YEARID = '2004'

-- 4) ������ �� �Ҽ����� ���� �⵵ �ִ� Ȩ���� ģ ����� ����
SELECT TOP 1 *
FROM BATTING
WHERE TEAMID ='BOS'
ORDER BY HR DESC;