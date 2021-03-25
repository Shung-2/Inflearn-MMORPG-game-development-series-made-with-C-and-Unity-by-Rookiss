USE Northwind;

-- Hash(�ؽ�) ����

SELECT * INTO TestOrders FROM Orders;
SELECT * INTO TestCustomers FROM Customers;

SELECT * FROM TestOrders; --830
SELECT * FROM TestCustomers; --91

-- HASH
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

-- NL (Inner ���̺� �ε����� ����)
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, LOOP JOIN);

-- Merge (Outer, Inner ��� Sort �ؾ� �Ѵ�. �� (Many-To-Many))
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, MERGE JOIN);

-- HASH
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

-- ������ ��� --
-- Hash ����
-- 1) ������ �ʿ����� �ʴ�. > �����Ͱ� �ʹ� ���Ƽ� Merge�� �δ㽺���� ���� Hash�� ����� �� �� �ִ�.
-- 2) �ε��� ������ ������ ���� �ʴ´�. (�� �ټ��� �߿�)
	-- NL/Merge�� ���� Ȯ���� �����̴�.
	-- �׷����� �ε����� �ذ� ��� �ȵȴ�.
	-- HashTable�� ����� ����� �����ϸ� �ȵȴ�. (���� �󵵰� ���� ������ ����ٰ� �����ϸ� > �ᱹ �ε����� �߰��� ������ �ʿ��ϴ�)
	-- ���� ����ϸ� �ؽ������� �̿��� �ε��� ���� ����ϰ� �� ��� NL, ������ ���� ȿ�����̴�
-- 3) ���� ������ ���ַ� ������� �ʴ´�.
-- 4) �����Ͱ� ���� ���� HashTable�� ����� ���� �����ϴ�.
