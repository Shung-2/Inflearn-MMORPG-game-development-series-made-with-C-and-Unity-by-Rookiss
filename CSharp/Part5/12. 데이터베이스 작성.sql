
-- �켱 �����ͺ��̽��� ������ �Ѵ�.
-- baseballdata�� ����� ��ó��.
-- �̸� ��Ű��(schema)��� �Ѵ�.

CREATE DATABASE GameDB;

USE GameDB;

-- ���̺� ����(CREATE)/����(DROP)/����(ALTER)
-- CREATE TABLE ���̺��(���̸� �ڷ��� [DEFAULT �⺻��] [NULL | NOT NULL](����) ,,,)

CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
	-- PRIMARY KEY(accountID)�� ���� ���� �� �ִ�.
);

-- C#���� ġ�� int accountID, string accountName, int coins, datetime createTime�� ����ſ� �Ȱ���.

SELECT * 
FROM accounts;
-- ���̺� ����� �� ���� �ƹ��� ���� ����.

-- ���̺� ���� (���� ������ ��.)
DROP TABLE accounts;

-- ���̺� ���� (ALTER)
-- �� �߰�(ADD)/����(DROP)/����(ALTER)
ALTER TABLE accounts
ADD lastEnterTime DATETIME;

ALTER TABLE accounts
DROP COLUMN lastEnterTime;

ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20) NOT NULL;

-- ����(CONSTRAINT) �߰�/����
-- NOT NULL, UNIQUE, PRIMARY KEY(�ſ� X 100 �߿�), FOREIGN KEY

-- C# class Player() { }
-- List<Player> ���� : �����Ͱ� ������ �����ϱ� �����ϴ�. ���� : �����Ͱ� ������ �� �ӵ����鿡�� ��������. (��� ��ȸ�ؾ��ϹǷ�)
-- Dictionary<int, Player> : int�� Key������ ����Ѵ�.

ALTER TABLE accounts
ADD PRIMARY KEY (accountID);

ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);
-- CONSTRAINT�� �̿��� PRIMARY KEY�� ������ ����� �� �� �ִ�.

ALTER TABLE accounts
DROP CONSTRAINT PK_Account;
-- DROP�� CONSTRAINT�� �̿��� PRIMARY KEY�� �����Ѵ�.

SELECT *
FROM accounts
WHERE accountId = 1111;

-- List<Account>			// �����̸Ӹ� Ű�� ���ָ� List ������� �����ȹ�� �����
-- Dictionary<int, Account> // �����̸Ӹ� Ű�� �����ϸ� Dictinary ������� �����ȹ�� �����. (�̰� �� ����)