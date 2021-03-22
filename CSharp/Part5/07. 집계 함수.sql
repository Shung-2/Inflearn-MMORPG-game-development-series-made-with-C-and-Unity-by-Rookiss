USE BaseballData;

-- COUNT, SUM, AVG, MIN, MAX

SELECT *
FROM players;

-- COUNT
SELECT COUNT(*)
FROM players;
-- *�� ���� �� �ִ� �ִ� COUNT�� �����ϴ�

SELECT COUNT(birthYear)
FROM players;
-- ���� �Լ��� ������ NULL�̸� �����Ѵ�.
-- �׷��� �� ��� ���� COUNT(*)�� �Ʒ� SQL�� COUNT(birthYear)�� ��� ���� �������� �����

SELECT DISTINCT birthCity
FROM players;
-- DISTINCT�� �ߺ� �����̴�

SELECT DISTINCT birthYear, birthMonth, birthDay
FROM players
ORDER BY BIRTHYEAR;
-- DISTINCT�� ���� �������� ������ ��� ������ ���ڰ��� �� ���ƾ� �ߺ�ó���� �Ѵ�.

SELECT DISTINCT COUNT(birthCity)
FROM players;
-- �� SQL�� COUNT�� ���� ������ �Ǳ� ������ 16108�� ó�� �ȴ�.
-- �׷� ��� �ؾ��ϳ�?

-- �����Լ�(DISTINCT ����)
SELECT COUNT(DISTINCT birthCity)
FROM players;
-- ���� ���� �ؾ��Ѵ�.

SELECT *
FROM players;

-- �������� ��� ������(WEIGHT)�� ���غ��� (���� : POUND)
SELECT AVG(WEIGHT)
FROM players;

-- �� �Ʒ��� ������ �����̴�.
SELECT SUM(WEIGHT) / COUNT(WEIGHT)
FROM players;

-- �������� ��� ������(WEIGHT)�� ���غ��� (���� : POUND)
-- ��, WEIGHT = NULL�� ����� WEIGHT = 0���� ģ��
-- �ǻ�Ȱ���� �̷� ���� �������� ���ӿ����� �ʱ� ��� ���� NULL�� �����ϰ� ����� ����� ���Ҷ� NULL�� �񱳵Ǹ� �ȵǱ� ������ 0���� ó���Ѵٰ� ���� �� �� �ִ�.
SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE WEIGHT END)
FROM players;

-- MIN, MAX
SELECT MIN(WEIGHT), MAX(weight)
FROM players;
-- MIN, MAX�� ���ڿ��̳� ��¥���� ������ �� �ִ� Ư¡�� �ִ�.