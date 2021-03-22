USE BaseballData;

SELECT *, 
	CASE birthMonth
		WHEN 1 THEN N'�ܿ�'
		WHEN 2 THEN N'�ܿ�'
		WHEN 3 THEN N'��'
		WHEN 4 THEN N'��'
		WHEN 5 THEN N'��'
		WHEN 6 THEN N'����'
		WHEN 7 THEN N'����'
		WHEN 8 THEN N'����'
		WHEN 9 THEN N'����'
		WHEN 10 THEN N'����'
		WHEN 11 THEN N'����'
		WHEN 12 THEN N'�ܿ�'
		ELSE N'�����'
	END AS birthSeason
FROM players;

-- CASE ���� ���� SELECT �� ���� ���� �ʿ�� ����.

SELECT *, 
	CASE 
		WHEN birthMonth <= 2 THEN N'�ܿ�'
		WHEN birthMonth <= 5 THEN N'��'
		WHEN birthMonth <= 8 THEN N'����'
		WHEN birthMonth <= 11 THEN N'����'
		ELSE N'�ܿ�'
	END AS birthSeason
FROM players;

-- C��� IF-ELSE�� ������ �����̴�.

-- ���� ���ǻ��� 
-- ELSE ���� �ۼ����� ������ birthSeason�� NULL�� �ȴ�.

SELECT *, 
	CASE 
		WHEN birthMonth <= 2 THEN N'�ܿ�'
		WHEN birthMonth <= 5 THEN N'��'
		WHEN birthMonth <= 8 THEN N'����'
		WHEN birthMonth <= 11 THEN N'����'
		WHEN birthMonth IS NULL THEN N'�����' -- NULL üũ
		ELSE N'�ܿ�'
	END AS birthSeason
FROM players;