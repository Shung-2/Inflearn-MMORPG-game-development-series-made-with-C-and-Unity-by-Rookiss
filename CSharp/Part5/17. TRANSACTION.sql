USE GameDB;

SELECT *
FROM accounts;

DELETE accounts;

-- BEGIN TRAN;���� �����Ѵ�
-- COMMIT;
-- ROLLBACK; �� �� �ϳ��� �����Ͽ� �����Ѵ�.

-- ALL OR NOTGING(���ڼ�)
-- �ŷ��� �Ѵٰ� �����غ���
-- A�� �κ��丮���� ������ ����
-- B�� �κ��丮���ٰ� ������ �߰�
-- ������� ���� A�� ��� ����

INSERT INTO accounts VALUES (1, 'SHUNG', 100, GETUTCDATE());
-- TRAN�� ������� ������ �ڵ����� COMMIT �ϰ� �ȴ�.

-- COMMIT�� ROLLBACK�� ���� �˾ƺ���
-- ��) ������ �����ٰ� �����غ��� (BEGIN TRAN)
-- ���� ���ΰ�? (COMMIT)
-- ����� ���ΰ�? (ROLLBACK)

-- ����/���� ���ο� ���� COMMIT (= COMMIT�� �������� �ϰڴ�)
BEGIN TRAN;
	INSERT INTO accounts VALUES (2, 'SHUNG2', 100, GETUTCDATE());
ROLLBACK;

BEGIN TRAN;
	INSERT INTO accounts VALUES (2, 'SHUNG2', 100, GETUTCDATE());
COMMIT;

-- ������
BEGIN TRY
	BEGIN TRAN;
		INSERT INTO accounts VALUES (1, 'SHUNG2', 100, GETUTCDATE());
		INSERT INTO accounts VALUES (3, 'SHUNG3', 100, GETUTCDATE());
	COMMIT;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 -- ���� Ȱ��ȭ�� Ʈ����� ���� ��ȯ�Ѵ�.
		ROLLBACK
	PRINT('ROOLBACK����')
END CATCH

-- TRAN ����� �� ������ ��
-- TRAN �ȿ��� �� ���������� ����� �ֵ鸸 ���� ��.
-- C# List<Player> List<Salary> ���������� ���� -> Lock�� ��� �����ߴ�. -> WrItelock (��ȣ��Ÿ���� ��) Readlock (���� ��)

BEGIN TRAN;
	INSERT INTO accounts VALUES (1, 'SHUNG', 100, GETUTCDATE());
ROLLBACK;