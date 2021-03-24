USE Northwind;

-- �ε��� ����
-- Clustered(���� ����) vs NonClustered(����)

-- Clustered
	-- ������ �����Ͱ� ���ĵǴ� ������ ������ �ش�
	-- ���������� �����Ͱ� ����Ǵ� ������ Ű �� ���� ������ �����ٰ� �߽��ϴ�.
	-- Leaf Page�� �� Data Page�� �ȴ�.
	-- Leaf Page�� Ʈ�� �� �������� �ִ� ��
	-- �����ʹ� Clustered Index �� �ɾ��� Ű ������ ���ĵȴ�.

-- NonClustered ? (��� Clustered Index�� ���̺� ������ ���� �ٸ��� ������ �Ѵ�.) > �ٽɳ���
	-- 1) Clustered Index�� ���� ���
		-- Clustered Index�� ������ �����ʹ� Heap Table�̶�� ���� ����
		-- HeapTable�� ��ȣ�� Heap RID�� ������ ������ �̸� �̿��� Heap Table�� �����Ͽ� ������ �����Ѵ�.

	-- 2) Clustered Index�� �ִ� ���
		-- Heap Table�� ���� ����. Leaf Table�� ���� �����Ͱ� ��� �ִ�.
		-- Clustered Index�� ���� Ű ���� ��� �ִ´�.

-- �ӽ� �׽�Ʈ ���̺��� ����� �����͸� �����ϴ� �۾�
SELECT * 
INTO TestOrderdetails
FROM [Order Details]; 

SELECT *
FROM TestOrderdetails

-- �ε��� �߰�
CREATE INDEX Index_OrderDetails
ON TestOrderdetails(OrderID, ProductID);

-- �ε��� ����
EXEC sp_helpindex 'TestOrderdetails';

-- �ε��� ��ȣ ã��
SELECT index_id, NAME
FROM sys.indexes
WHERE object_id = object_id('TestOrderdetails');

-- ��ȸ
-- PageType 1����(DATA PAGE) 2����(INDEX PAGE)
DBCC IND('Northwind', 'TestOrderdetails', 2);

--			 952
-- 864 896 897 898 899 900

DBCC PAGE('Northwind', 1, 864, 3);
-- ������ Heap RID([������ �ּ�(4)][����ID(2)][����(2)] ROW)
-- Heap Table�� �����ϹǷ� Heap RID�� �����Ѵ�.
-- Heap Table�� [ {Page} {Page} {Page} {Page} {Page} ]�� �����Ǿ� �ִ�.

-- Clustered �ε��� �߰�
CREATE Clustered INDEX Index_OrderDetails_Clustered
ON TestOrderdetails(OrderID);
-- PAGE ID�� ����ȴ�.

-- Non-Clustered
DBCC PAGE('Northwind', 1, 984, 3);
-- Heap RID�� �������

-- ��ȸ
-- PageType 1����(DATA PAGE) 2����(INDEX PAGE)
DBCC IND('Northwind', 'TestOrderdetails', 1);

--					976
-- 928 936 937 938 939 940 941 942 943 944