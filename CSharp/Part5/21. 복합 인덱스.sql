USE Northwind;
-- 5340

-- �ֹ� �� ������ ���캸��
SELECT * 
FROM [Order Details]
ORDER BY OrderID;

-- �ӽ� �׽�Ʈ ���̺��� ����� �����͸� �����Ѵ�
SELECT *
INTO TestOrderdetails
FROM [Order Details];

-- ������ ������ Ȯ��
SELECT *
FROM TestOrderdetails;

-- ���� �ε��� �߰�
CREATE INDEX Index_TestOrderDetails
ON TestOrderDetails(OrderID, ProductID);

-- �ε��� ���� ���캸��
EXEC sp_helpindex 'TestOrderDetails';

-- (OrderID, ProductID) ���� ��Ī? OrderID? ProductID? ���� ��Ī?
-- INDEX SCAN (INDEX FULL SCAN) > �ε����� ��� ���ϰ� ��ä�� ã�� ���. (���� ���̽�)
-- INDEX SEEK > (���� ���̽� -- �ε����� ���������� Ȱ��ȴٰ� �� �� �ִ�.)

-- �ε��� ���� �׽�Ʈ1 > (�ΰ��� ���ÿ� ã�� ���) > SEEK�� �߻��Ͽ���
SELECT * 
FROM TestOrderDetails
WHERE OrderID = 10248 AND ProductID = 11;

-- �ε��� ���� �׽�Ʈ2 > GOOD
SELECT * 
FROM TestOrderDetails
WHERE ProductID = 11 AND OrderID = 10248;

-- �ε��� ���� �׽�Ʈ3 > GOOD
SELECT * 
FROM TestOrderDetails
WHERE OrderID = 10248;

-- �ε��� ���� �׽�Ʈ4 > BAD (�ε��� Ǯ ��ĵ)
SELECT * 
FROM TestOrderDetails
WHERE ProductID = 11 ;

-- �� ProductID�� �ε��� Ǯ ��ĵ�� ����ұ�?
-- ��Ī�ϴ� ������ �Ʒ��� �����Ƿ�
-- ON TestOrderDetails(OrderID, ProductID);
-- ProductID

--INDEX ����
DBCC IND ('Northwind', 'TestOrderDetails', 2);

-- �ش� �ε����� Ʈ�� ����
--				880
-- 824 848 849 850 851 852

DBCC PAGE ('Northwind', 1, 864, 3);
-- DBCC PAGE ('Northwind', 1, 864, 3);�� ���캸��
-- ON TestOrderDetails(OrderID, ProductID);���� ����
-- OrderID�� ���� ������ �Ǿ� (�ݸ޴�), ProductID(���޴�)�� �ȴ�.
-- ���� �����Ͱ� ����Ǿ� �ִ� ������ (OrderID, ProductID);�̱� ������ ProductID�� �̿��Ͽ� ������ �ϸ� ���̺� Ǯ ��ĵ�� �ȴ�.

-- ��� �ε��� (A,B)�� ������̶�� �ε���(A)�� ��� �����ϴ�
-- ������ B ������ �̿��� B�ε� �˻��� �ʿ��ϸ� �ε��� (B)�� ������ �ɾ���� �Ѵ�.
-- �װ� �ƴϸ� �ε��� ��ĵ�� ���� ���ϰ� Ǯ ��ĵ�� �ϰ� �ȴ�.

-- ��� �ε������ ���� �����Ͱ� �߰� / ���� / ���� �Ǿ ���� �Ǿ�� �Ѵ�.
-- �����Ͱ� 50���� ������ �־��.
-- 1) 10248 / 11
-- ������) 10387 / 24

DECLARE @i INT = 0;
WHILE @i < 50
BEGIN
	INSERT INTO TestOrderdetails
	VALUES (10248, 100 + @i, 10, 1, 0);
	SET @i = @i + 1;
END

-- �����͸� �ְ� ��  �� �ε����� ����
DBCC IND ('Northwind', 'TestOrderDetails', 2);

--				880
-- 824 [881] 848 849 850 851 852
DBCC PAGE ('Northwind', 1, 929, 3);
DBCC PAGE ('Northwind', 1, 896, 3);
-- �ε��� �����͵��� ������ ������ ��ġ�� �������� �߶� �ٸ� �������� �����Ѵ�
-- ��� : �������� ���� ������ ���ٸ� > ������ ���� (SPLIT) �߻�

-- ���� �׽�Ʈ
SELECT LastName
INTO TestEmployees
FROM Employees;

SELECT * FROM TestEmployees;
-- 9���� ����� ������ ���� �� �� �ֵ�.

-- �ε��� �߰�
CREATE INDEX Index_TestEmployees
ON TestEmployees(LastName);

-- INDEX SCAN > BAD
SELECT * 
FROM TestEmployees
WHERE SUBSTRING(Lastname, 1, 2) = 'Bu';
-- �ε����� �ɾ��ٰ� �ؼ� 100% Ȯ���� ������ ã���شٴ� ������ ����.
-- SUBSTRING�� Lastname�� ��� �������� �𸣹Ƿ� �ε��� ��ĵ���� ����ȴ�.

-- INDEX SEEK
SELECT * 
FROM TestEmployees
WHERE Lastname LIKE 'Bu%';
-- ���� ��ȹ�� ���캸�� ������ �߿��ϴ�

-- ������ ���
-- ���� �ε��� (A,B)�� ����Ҷ� ������ ���� �ؾ� �Ѵ�. 
-- (A���� B������ �˻��ϱ� ������ A,B�� ���ÿ� ����ϰų� A�� ����ϴ°� �������� A�� �ǳʶٰ� B�� ����ϸ� ���� �ε����� ����� �� ����)
-- �ε��� ��� ��, ������ �߰��� ���� ������ ���� ������ ������ SPLIT
-- Ű ������ �� ��������!
