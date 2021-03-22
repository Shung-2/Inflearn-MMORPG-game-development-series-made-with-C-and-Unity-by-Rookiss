-- JOIN (����)
-- �� �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���

USE GameDB;

CREATE TABLE testA
(
	A INTEGER
)

CREATE TABLE testB
(
	B VARCHAR(10)
)

-- A(1, 2, 3)
INSERT INTO testA VALUES(1);
INSERT INTO testA VALUES(2);
INSERT INTO testA VALUES(3);

-- B('A', 'B', 'C')
INSERT INTO testB VALUES('A');
INSERT INTO testB VALUES('B');
INSERT INTO testB VALUES('C');

-- CROSS JOIN (���� ����)
SELECT * 
FROM testA
	CROSS JOIN testB;

SELECT *
FROM testA, testB;

--------------------------------

USE BaseballData;

SELECT *
FROM players
ORDER BY playerID;

SELECT *
FROM salaries
ORDER BY playerID;

-- INNER JOIN (�� ���� ���̺��� ���η� �����ϸ� ���� ������ ON���� ����Ѵ�)
-- playerID�� players, salaries ���ʿ� �� �ְ� ��ġ�ϴ� �ֵ��� �����Ѵ�.
SELECT *
FROM players AS P INNER JOIN salaries AS S
ON P.playerID = S.playerID;

-- OUTER JOIN (�ܺ� ����)
	-- LEFT / RIGHT
	-- ��� ���ʿ��� �����ϴ� �����Ͱ� �ִٰ� �ϸ�? ��å�� ��� �ҷ�?

-- LEFT JOIN (�� ���� ���̺��� ���η� ���� + ���� ������ ON���� ����Ѵ�)
-- playerID�� ����(Left)�� ������ ������ ǥ��. ������(Salarise)�� ������ ������ ������ NULL�� ä��.
SELECT *
FROM players AS P LEFT JOIN salaries AS S
ON P.playerID = S.playerID;

-- RIGHT JOIN (�� ���� ���̺��� ���η� ���� + ���� ������ ON���� ����Ѵ�)
-- playerID�� ������(Right)�� ������ ������ ǥ��. ����(players)�� ������ ���� ������ NULL�� ä��.
SELECT *
FROM players AS P RIGHT JOIN salaries AS S
ON P.playerID = S.playerID;