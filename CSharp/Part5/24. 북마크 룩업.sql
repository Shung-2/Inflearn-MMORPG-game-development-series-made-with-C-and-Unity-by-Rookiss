USE Northwind;

-- �ϸ�ũ ���

-- �ε��� ���� ���(Access)
-- Index Scan vs Index Seek
-- Index Scan �׻� ���� ���� �ƴϰ�
-- Index Seek �׻� ���� ���� �ƴϴ�.
-- �� �ε����� Ȱ���ϴµ� ��� ������ ��� ������?
-- �װ� �ٷ� �ϸ�ũ ������� ���� �׷���

-- NonClustered
--		1
-- 2 3 4 5 6
-- Leap�� �����Ͱ� �ִ°� �ƴ϶� �������� Ű(����)�� ������ �ִ�.
-- ���� Clustered INDEX�� ���� ������ �� ���̺��� �����.
-- Heap Table�� [ {Page} {Page} {Page} {Page} {Page} ]�� �����Ǿ� �ִ�.
-- RID�� �̿��� �����̺� ã�ư���.

-- Clustered
--		1
-- 2 3 4 5 6
-- ���������� �����͸� ������ �ִ�.

-- Clustered�� ��� INDEX SEEK�� ���� ���� ����.
-- ��? �����͸� ���������� ������ �����Ƿ�

-- NonClustered�� �����Ͱ� Leaf PAGE�� �����Ƿ� �ѹ� �� Ÿ�� ����
-- 1) RID > HEAP TABLE (BOOKMARK LOOKUP)
-- 2) KEY > Clustered

SELECT * 
INTO TestOrders
FROM Orders;

SELECT * 
FROM TestOrders;

CREATE NonClustered INDEX Orders_Index01
ON TestOrders(CustomerID);

-- �ε��� ��ȣ 
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrders');

-- ��ȸ
DBCC IND('Northwind', 'TestOrders', 2);

-- 1112
-- 1072 1080 1081 
-- ���� Clustered Heap�� ����� ���� �ʾ�����
-- HEAP Table�� �����ǰ� ���� ���� [ {Page} {Page} {Page} {Page} {Page} ]�� �����Ǿ� �ִ�.

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

-- �⺻ Ž���� �غ���
SELECT * 
FROM TestOrders
WHERE CustomerID = 'QUICK';

-- ������ �ε����� �̿��ϰ� �غ���
SELECT * 
FROM TestOrders WITH (INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK';
-- ���� �бⰡ 20���� 30���� ����
-- �ε����� �ɻ簡 �ƴϴ�.

-- ����� ���̱� ���� ���θ�
SELECT * 
FROM TestOrders WITH (INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

DROP INDEX TestOrders.Orders_Index01;

-- �˻��� �Ϸ��� ��� �÷����� �˲� ä���� �ִ� ���� 
-- Covered Index��� �Ѵ�.
CREATE NonClustered INDEX Orders_Index01
ON TestOrders(CustomerID, ShipVia);

-- 8�� ����� �õ��ؼ� 8�� �� �ξ��� ã�� �Ȱ��̴�.
SELECT * 
FROM TestOrders WITH (INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

-- Q) �׷� ���� 1 AND ���� 2 �ʿ��ϸ� ������ INDEX (���� 1, ���� 2)�� �߰����ָ� �Ǵ°�?
-- A) NO! �� �׷������� �ʴ�. �˻��ҋ����� �������� DML �۾�(INSERT, DELETE) �� �� �۾��� ���ϰ� �����ϰ� �ȴ�.
-- ��Ī�ϴ� �۾��� �ʿ��ϴٸ� �������� DML �۾��� �����ϸ� ���� �ʰ� �ȴ�.

DROP INDEX TestOrders.Orders_Index01;

CREATE NonClustered INDEX Orders_Index01
ON TestOrders(CustomerID) INCLUDE (ShipVia);
-- NonClustered
--		1
-- 2(DATA(SHIPVIA = 3), 3 4 5 6
-- ������ ���� SHIPVIA�� ���� ��Ʈ�� �༭
-- NonClustered �ܰ迡�� �ΰ� ������ ã�� �����͸� ã�� �� �ְ� �ȴ�.

-- 8�� ����� �õ��ؼ� 8�� �� �ξ��� ã�� �Ȱ��̴�.
SELECT * 
FROM TestOrders WITH (INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;
-- ������ ����� ������ �ȴ�.

-- ���� ���� �����ܿ� ��¿��� ���� ���ٸ�?
-- Clustered INDEX�� Ȱ���� ����� �� �ִ�.
-- Clustered INDEX�� ���̺�� �Ѱ��� ����� �� �ֱ� ������ ���� �߿��� �����׸� �ɾ���� �Ѵٴ� ���̴�.

-- ���
-- NONClustered INDEX�� �ǿ�Ȳ�� �ִ� ���?
	-- �ϸ�ũ ����� �ɰ��� ���ϸ� �߱��� ����
-- �����?
	-- �ɼ� 1) COVERED INDEX (�˻��� ��� �÷��� ���Խ�Ų��)
	-- �ɼ� 2) INDEX���ٰ� INCLUDE�� ��Ʈ�� �����ش�.
	-- �ɼ� 3) Clustered�� ����Ѵ� (�ѹ��� ����� �� �ִ� �ִ�) > NONClustered���� �ǿ����� ��ĥ �� �����Ƿ� ���ǰ� ���Ѵ�.
-- �ε����� ������ �Ǵٰ� �ؼ� ������ �������ٴ� ���� �ƴϴ�.

