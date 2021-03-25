USE BaseballData;

-- Sorting (����)�� �ð��� ������.

-- O(NLogN) > DB�� �����Ͱ� ���ϰ� ����
-- �ʹ� �뷮�� Ŀ�� ���� �޸𸮷� Ŀ���� ���� �ʴ´ٸ� > ��ũ���� ã�ư��� �ȴ� (���� �߻�)
-- �׷��ٸ� ���� Sorting�� �Ͼ���� �ľ��ؾ� �Ѵ�

-- Sorting�� �Ͼ ��
-- 1) SORT MERGE JOIN
-- 2) ORDER BY
-- 3) GROUP BY
-- 4) DISTINCT
-- 5) UNION
-- 6) RANKING WINDOES FUNCTION
-- 7) MIX, MAX

-- 1) �� ����

-- 2) ORDER BY
-- ���� : ORDER BY ������ ����� �ؼ� �����ؾ� �ϱ� ������ SORT�� �Ͼ��.

SELECT *
FROM players
ORDER BY college;

-- 3) GROUP BY
-- ���� : ���踦 �ϱ� ����
SELECT College, COUNT(College)
FROM players
WHERE college LIKE '%C'
GROUP BY college;

-- 4) DISTINCT
-- ���� : �ߺ��� �����ϱ� ���� ���ȴ�
SELECT DISTINCT College
FROM players
WHERE college LIKE '%C'

-- 5) UNION
-- ���� : ���������� �������� �ߺ��� �����ϱ� ���� ���ȴ�
SELECT College
FROM players
WHERE college LIKE 'B%'
UNION
SELECT College
FROM players
WHERE college LIKE 'C%'

-- 6) ���� ������ �Լ�
-- ���� : ���踦 �ϱ� ����
SELECT ROW_NUMBER() OVER (ORDER BY College)
FROM players;

-- ������ ���
-- Sorting�� ������.

-- O(NLogN) > DB�� �����Ͱ� ���ϰ� ����
-- �ʹ� �뷮�� Ŀ�� ���� �޸𸮷� Ŀ���� ���� �ʴ´ٸ� > ��ũ���� ã�ư��� �ȴ� (���� �߻�)
-- �׷��ٸ� ���� Sorting�� �Ͼ���� �ľ��ؾ� �Ѵ�

-- Sorting�� �Ͼ ��
-- 1) SORT MERGE JOIN
-- 2) ORDER BY
-- 3) GROUP BY
-- 4) DISTINCT
-- 5) UNION
-- 6) RANKING WINDOES FUNCTION
-- 7) MIX, MAX