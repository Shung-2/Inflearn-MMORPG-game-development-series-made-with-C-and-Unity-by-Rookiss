-- 4�� ��ġ�� ���ڿ�

USE BaseballData;

-- �ѱ����� ���� (2021 - �ƹ��⵵)
-- �ٸ� ���α׷��� ���������� ��Ģ������ ������(+, -, *, /, %)

SELECT 2021 - birthYear AS koreanAge
FROM players
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND (2021-birthYear) <= 80
ORDER BY koreanAge

-- ����(�Ʒ��� ���� �а� �����ؾ� �Ѵ�)
-- frem, where - select - orderby
-- å�󿡼�, ����������, �������, ũ�� ������ �����ض�

SELECT 2021 - NULL
-- NULL�� ��Ģ���� �� ������ �ص� NULL�̴�.

-- ������ ����� ������
SELECT 3.0 / 0
-- ������ ������ �������̹Ƿ� �Ҽ� ���� �� ����
-- �տ� �Ҽ����� �ٿ��ָ� �ذ� �ȴ�.
-- 0���δ� ���� �� ����

SELECT ROUND(3.141592, 3);
SELECT POWER(2, 3)
SELECT COS(0)

/* ���� ���ڿ� ���� �ð� ���� */
SELECT 'HELLO WORLD'
SELECT N'�ȳ��ϼ���'
-- �ѱ��� �տ� N�� �ٿ�����Ѵ�.

SELECT 'HELLO' + 'WORLD'
-- �� ���ڿ��� ���Ҷ� ����Ѵ�

SELECT SUBSTRING ('20210311', 1, 4);
-- ���° ���ں��� ����� ���ڱ��� ����Ұ��ΰ�?

SELECT TRIM('                        HELLOWORLD');
-- �տ� �����̽��� �����ִ� ����� ���� �Լ�

SELECT nameFirst + ' ' + nameLast AS fullname
FROM players
WHERE nameFirst IS NOT NULL AND nameLast IS NOT NULL

-- nameFirst�� nameLast�� Ǯ�������� �о���̴� SQL��
-- ��� nameFirst�� nameLast�� ���� �ƴϿ��� �Ѵ�.