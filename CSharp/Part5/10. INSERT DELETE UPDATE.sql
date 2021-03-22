USE BaseballData;

-- INSERT, DELETE, UPDATE, 

SELECT *
FROM salaries
ORDER BY yearID DESC

-- INSERT
-- ��) INSERT INTO [���̺��] VALUE (��, ...)
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'SHUNG', 9000000);

-- �����͸� �ϳ� ��������? -> ERROR�� �߻��Ѵ�.
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'SHUNG2');

-- INSERT INTO [���̺��] (��, ...) VALUE (��, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'SHUNG2', 'NL', 123456789);

-- ������ ������ SQL��
-- INSERT INTO [���̺��] (��, ...) VALUE (��, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'SHUNG3', 'NL');

-- DELETE
-- DELETE FROM [���̺��] WHERE [����]
DELETE FROM salaries
WHERE playerID = 'SHUNG3'

-- UPDATE
-- UPDATE [���̺��] SET [�� = ��, ] WHERE [����]
UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1
WHERE teamID = 'KOR'

-- �߰��� ������ ����!
DELETE FROM salaries
WHERE yearID >= 2020

-- DELETE vs UPDATE
-- �������� vs ������

