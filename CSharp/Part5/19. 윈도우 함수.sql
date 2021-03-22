USE BaseballData;

-- ������ �Լ�
-- ����� ���� ������ �������, �� ��ķ� ����� �ؼ� ��Į��(���� ����)���� ����ϴ� �Լ�

-- ������ GROUPING�̶� ����Ѱ�?
-- SUM, COUNT, AVG ���� �Լ�

SELECT *
FROM salaries
ORDER BY salary DESC;

SELECT playerID, MAX(salary)
FROM salaries
GROUP BY playerID
ORDER BY MAX(salary) DESC;

-- ����ϸ鼭 ���� ������ �Լ�
-- ~OVER ������ ����
-- ~OVER ([PARTITION] [ORDER BY] [ROWS])
-- PARTITION�� ������� ��� �׷��� �Ұ�����?
-- ORDER BY�� ������ ��� �� ������?
-- ROWS�� ������ ��� ����� ������?

-- ��ü �����͸� ���� ������ �����ϰ�, ���� ǥ��
SELECT *,
	ROW_NUMBER() OVER (ORDER BY salary DESC), -- ��#��ȣ
	RANK() OVER (ORDER BY salary DESC), -- ��ŷ
	DENSE_RANK() OVER (ORDER BY salary DESC), -- ��ŷ 
	NTILE(100) OVER (ORDER BY salary DESC) -- ���� �� %? (�����)
FROM salaries;

-- playerID �� ������ ���� �ϰ� �ʹٸ�
SELECT *,
	RANK () OVER (PARTITION BY playerID ORDER BY salary DESC)
FROM salaries
ORDER BY playerID;

-- LAG(�ٷ� ����), LEAD(�ٷ� ����)
SELECT *,
	RANK () OVER (PARTITION BY playerID ORDER BY salary DESC),
	LAG(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary, 
	LEAD(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary
FROM salaries
ORDER BY playerID;

-- FIRST_VALUE, LAST_VALUE
-- BRAME : FIRST ~ CURRENT
SELECT *,
	RANK () OVER (PARTITION BY playerID ORDER BY salary DESC),
	FIRST_VALUE(salary) OVER (PARTITION BY playerID ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS best,
	LAST_VALUE(salary) OVER (PARTITION BY playerID ORDER BY salary DESC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS worst
FROM salaries
ORDER BY playerID;
-- ������ ó������ �������̹Ƿ� 1�� ������ 1�ุ, 2�� ������ 2�ุ ���ԵǴ� ���̴�.