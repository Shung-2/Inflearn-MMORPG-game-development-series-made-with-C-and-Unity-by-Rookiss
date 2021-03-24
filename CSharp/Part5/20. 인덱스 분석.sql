USE Northwind;

-- DB ���� ���캸��
EXEC sp_helpdb 'Northwind';

-- �ӽ� ���̺� ������ (�ε��� �׽�Ʈ��)
CREATE TABLE Test
(
	EmployeeID	INT NOT NULL,
	LastName	NVARCHAR(20) NULL,
	FirstName	NVARCHAR(20) NULL,
	HireDate	DATETIME NULL
);
GO

INSERT INTO Test
SELECT EmployeeID, LastName, FirstName, HireDate
FROM Employees;

SELECT *
FROM Test;

-- FILLFACTOR (���� ������ ���� 1%�� ���) 
-- PAD_INDEX (FILLFACTOR �߰� ������ ����)
-- ������������ �߰� �������� ���߿� ���´�.
CREATE INDEX Test_Index ON Test(LastName)
WITH (FILLFACTOR = 1, PAD_INDEX = ON)
GO

-- �ε��� ��ȣ ã��
SELECT INDEX_ID, NAME
FROM SYS.INDEXES -- �ε��� ������ ������ �ִ� ��
WHERE OBJECT_ID = OBJECT_ID('TEST');

-- 2�� �ε��� ���� ���캸��
DBCC IND('Northwind', 'Test', 2);

-- �ε��� ������ ���캾�ô�
-- 0���� ���� ���� 1�� ��� 2�� �����
-- Root(2) > Branch(1) > Leaf(0)

--						849(Leverling)
--			872(Dodsworth)			848(Leverling)
--		832(Buchana..)	840(Dodsworth..)	841(Leverling..)

-- Table[ {Page} {Page} {Page} {Page} {Page} ]
-- callahan
-- HEAP RID([������ �ּ�(4)][����ID(2)][���Թ�ȣ(2)] ������ ROW �ĺ���, ���̺��� ���� ����
DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 832/*��������ȣ*/, 3/*��¿ɼ�*/);
DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 840/*��������ȣ*/, 3/*��¿ɼ�*/);
DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 841/*��������ȣ*/, 3/*��¿ɼ�*/);

DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 872/*��������ȣ*/, 3/*��¿ɼ�*/);
DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 848/*��������ȣ*/, 3/*��¿ɼ�*/);
DBCC PAGE('Northwind', 1/*���Ϲ�ȣ*/, 849/*��������ȣ*/, 3/*��¿ɼ�*/);

-- Random Access (�� �� �б� ���� �� �������� ����)
-- Bookmark Lookup (RID�� ���� ���� ã�´�)