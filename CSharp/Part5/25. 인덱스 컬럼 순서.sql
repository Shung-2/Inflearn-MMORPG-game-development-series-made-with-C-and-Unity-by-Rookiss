USE Northwind;

-- ���� �ε��� �÷� ����
-- Index(A, B, C)

-- NonClustered
--		1
-- 2 3 4 5 6

-- Clustered
--		1
-- 2 3 4 5 6

-- Heap Table�� [ {Page} {Page} {Page} {Page} {Page} ]�� �����Ǿ� �ִ�.

-- �ϸ�ũ ���
-- Leaf Page Ž���� ������ �����ϱ� ����
-- [����, ����] �ε��� ��) (56, �޸�)

-- (56, �޸�)�̶� �����Ͱ� �ϳ��� ������ ����.
-- Clustered
--		1
-- 2 3 4[(56, �޸�),(56, �޸�),(56, �޸�),(56, �޸�)] �׷��Ƿ� ������ ���� ���� �� ���� ��ĵ�� ����Ѵ�.
-- �ᱹ ���� �������� ������ ��ĵ�� �ʿ伺�� �����.

-- �׷��� (56~60 �޸�)�� ��� �Ǵ°�?
-- �� �κ��� �н� ������ �ȴ�.

SELECT * 
INTO TestOrders
FROM Orders;

DECLARE @i INT = 1;
DECLARE @emp INT;
SELECT @emp = MAX(EmployeeID) FROM Orders;

-- ���� �����͸� ��û �ø��� �۾� (830 * 1000)�̶�� �۾��� �Ѵ�.
WHILE (@i < 1000)
BEGIN
	INSERT INTO TestOrders(CustomerID, EmployeeID, OrderDate)
	SELECT CustomerID, @emp + @i, OrderDate
	FROM Orders;
	SET @i = @i + 1;
END

CREATE NONCLUSTERED INDEX idx_emp_ord
ON TestOrders(EmployeeID, OrderDate);

CREATE NONCLUSTERED INDEX idx_ord_emp
ON TestOrders(OrderDate, EmployeeID);

-- ������� �� ������ �׽�Ʈ�� �Ѵ�.

-- �м��� ���� ���� �غ�
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- �� �� ��
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

-- �� ���� ��� ���� �� ������?
-- ���� ���캸��
SELECT * 
FROM TestOrders
ORDER BY EmployeeID, OrderDate;

SELECT * 
FROM TestOrders
ORDER BY OrderDate, EmployeeID;

-- ������ ã�´ٸ�?
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103';
-- >= '19970101' AND OrderDate <= '19970103'

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103';

-- �� ���� �б⿡�� ���̰� ���°�?
-- ���� ���캸��
SELECT * 
FROM TestOrders
ORDER BY EmployeeID, OrderDate;

SELECT * 
FROM TestOrders
ORDER BY OrderDate, EmployeeID;

-- ���
-- INDEX(A, B, C)�� �����Ǿ��� �����ε����� ���࿡ BETWEEN ����� �� ��� ������ �ε��� ����� ���� ����� �� ����
-- ��, A���� BETWEEN�� ����ϸ� B�� C�� �ε��� ����� ���� ����Ѵ�.
-- ���� BEWTEEN�� ����ҰŸ� ���࿡ �ɾ�� �Ѵ�.

-- �׷� BETWWEN ���� �񱳰� �����ϸ��� �ε��� ������ ������ �ٲ��ָ� �Ǵ°��ΰ�? > �ƴϴ�.
-- BETWEEN ������ ���� ������ > IN-LIST�� ��ü�ϴ� ���� ����ؾ� �Ѵ�.
SET STATISTICS PROFILE ON;

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');
-- ���� �бⰡ �پ���.

-- ���캸��
-- 19970101�� ���캸�� 19970102�� ���캸�� 19970103�� ���캻��.
-- ������ �̿��ϴ� ���� �ƴ϶� == �̶�� �񱳿����� �̿��ϴ� ��.
-- ��ǻ� ������ =�� ����ϴ� ���̴�.

-- �׷��ٰ��ؼ� BETWEEN�� ������ IN-LIST�� �ٲٴ� ���� �׻� ���� ���� �ƴϴ�. 
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');
-- ���� ���� 5���� 11��.
-- �ᱹ, ������ BETWEEN�� IN���� �ٲٴ� ���� �׻� ���� ���� �ƴϴ�.

-- ������ ���
-- ���� �÷� �ε����� (����, ����)�� ���� ��� ������ ������ �� �� �ִ�.
-- BETWEEN, �ε�ȣ(>, <) ���࿡ ����, ������ �ε����� ����� ����Ѵ�.
-- ���� BETWEEN�� ������ ������ IN-LIST�� ��ü�ϸ� ���� ��찡 �ִ�. �ٸ�  �׻� �׷� ���� �ƴϸ� ���࿡ BETWEEN�� �� ��쿡�� �׷���.
-- ���� ������ =,�̰� ������ BETWWEN�̸� �ƹ��� ������ ���� ������ IN-LIST�� �׻� �������� �ʴ�.