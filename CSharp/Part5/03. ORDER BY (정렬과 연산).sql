-- 3�� ORDER BY (���İ� ����)

USE BaseballData;

-- TOP�� T SQL������ ���ȴٴ� ������ �ִ�.
-- ���� : 100���� 200���� Ȯ���� �� ����


SELECT TOP 1 PERCENT *
FROM players
WHERE birthYear IS NOT NULL
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC;

-- 100~200�� �˻�
SELECT *
FROM players
WHERE birthYear IS NOT NULL
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC
OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;