USE BaseballData;

-- ����
-- 2004�⵵ ������ �Ҽ����� ������ �������� Ÿ�� ����
SELECT *
FROM BATTING
WHERE YEARID = 2004 AND TEAMID = 'BOS';

-- 2004�⵵ ������ �Ҽ����� �����ؼ� ���� Ȩ�� ����
SELECT SUM (HR)
FROM BATTING
WHERE YEARID = 2004 AND TEAMID = 'BOS';

-- 2004�⵵�� ���� ���� Ȩ���� ���� ����?
SELECT *
FROM BATTING
WHERE YEARID = 2004
ORDER BY TEAMID;

-- ������ ��� �����ΰ��� �м��ϰ� �ʹ� -> grouping
SELECT TEAMID, COUNT(TEAMID) AS playerCount, SUM(HR) AS homeRuns
FROM BATTING
WHERE YEARID = 2004
GROUP BY TEAMID;

-- 2004�⵵�� ���� ���� Ȩ���� ���� ����?
SELECT TEAMID, SUM(HR) AS homeRuns
FROM BATTING
WHERE YEARID = 2004
GROUP BY TEAMID
ORDER BY homeRuns DESC;

-- 2004�⵵�� 200Ȩ�� �̻��� ���� ���� ���
SELECT TEAMID, SUM(HR) AS homeRuns
FROM BATTING
WHERE YEARID = 2004
GROUP BY TEAMID
HAVING SUM(HR) >= 200
ORDER BY homeRuns DESC;

-- ������ ����Ǵ� ������ ����(������)
-- FROM			å�󿡼�
-- WHERE		����
-- GROUP BY		���󺰷� �з��ؼ�
-- HAVING		�з��� ������ �������� �����ϰ�
-- SELECT		���� ���ּ���
-- ORDER BY		ũ�� ���� �������ּ���

-- ���� �⵵�� ���� ���� Ȩ���� ���� ����?
SELECT TEAMID, YEARID, SUM(HR) AS homeRuns
FROM BATTING
GROUP BY TEAMID, yearID
ORDER BY homeRuns DESC;