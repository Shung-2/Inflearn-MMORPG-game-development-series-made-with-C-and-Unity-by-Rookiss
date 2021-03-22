USE BaseballData;

-- SubQuery (��������/��������)
-- SQL ��ɹ� �ȿ� �����ϴ� �Ϻ� SELECT

-- ������ ��������� ���� ������ ������ ����
SELECT TOP 1 *
FROM salaries
ORDER BY salary DESC;

-- �ش� ������ rodrial01
-- �׷� �ش� ������ ������ ã������?
SELECT *
FROM players
WHERE playerID = 'rodrial01';

-- ���� ���� �ؾ��Ѵ�. �׷����� �̰� �Ź� �� �� ������ �̰� �ѹ��� �Ϸ���?
-- ���������� ����ϸ� �ȴ�.
-- ���� �� ��������
SELECT *
FROM players
WHERE playerID = (SELECT TOP 1 playerID FROM salaries ORDER BY salary DESC);

-- ���� �� �������� = (IN�� ������ָ� �ȴ�)
SELECT *
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC);

-- ���� �������� ���� �� �̻� ��ȯ�߽��ϴ�. ���� ���� �տ� =, !=, <, <=, >, >= ���� ���ų� ���� ������ �ϳ��� ������ ���� ��쿡�� ���� ���� ��ȯ�� �� �����ϴ�.
-- =�� ��ֶ� ���ƾ��ϴ��� �� �� �����Ƿ� ������ �����.
-- �̶� =�� IN���� �ٲ��ָ� �ȴ�.

-- ���������� WHERE���� ���� ���� ���ȴ�. �׷����� ������ ���������� ��� �����ϴ�.
SELECT (SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

-- INSERT������ ��� ����
SELECT *
FROM salaries
ORDER BY yearID DESC;

-- INSERT INTO�� ���������� �̿��� �����͸� �ִ� ��
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'SHUNG', (SELECT MAX(SALARY) FROM salaries))

-- INSERT SELECT
INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'SHUNG2', (SELECT MAX(SALARY) FROM salaries);

-- �׷� INSERT INTO�� INSERT SELECT�� �������� �����ΰ�?
-- ���̺��� ������ ��� �����ؼ� �ٸ� ���̺� �־��� �� �ִ� ��
/* 
INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT *
FROM salaries_temp;
*/ 

-- ��� ���� ��������
-- EXISTS, NOT EXISTS
-- ���� ��������� ����� ���ص� �Ǵ� ��︸ �ص� �ȴ�.

-- ����Ʈ ���� Ÿ�ݿ� ������ ������ ���
SELECT *
FROM players
WHERE playerID IN (SELECT playerID FROM battingpost);

-- ������踦 �̿��� ����Ʈ ���� Ÿ�ݿ� ������ ������ ���
SELECT *
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID);
-- SELECT playerID FROM battingpost WHERE players.playerID = battingpost.playerID �� ���������� ���ϴ�.
-- EXISTS�� ������ SELECT�ϰ� ������ SKIP�ض�.
-- WHERE�� �������� ���� �� �д�.