/*

�������� ����.

INDEX(����)�� �����͸� ���� ã�� �� �ְ� �������ش�.
�ε����� ����

-- PRIMARY KEY (CLUSTERED INDEX)
�������� ������ ���� ������ ����
��) ���� ������ ���ø��� �ȴ�

-- �Ϲ� INDEX (NON-CLUSTERED INDEX)
�ٷ� �����ϴ� ������ LOOKUP ���̺�
��) å �Ĺݿ� ������ ����

*/

-- �ε��� CREATE INDEX / DROP INDEX

CREATE UNIQUE INDEX i1 ON accounts(accountName);
-- �ε��� ����

DROP INDEX accounts.i1;
-- �ε��� ����

CREATE CLUSTERED INDEX i1 ON accounts(accountName);
-- ���̺� 'accounts'�� Ŭ�������� �ε����� �� �̻� ���� �� �����ϴ�. �ٸ� Ŭ�������� �ε����� ������� ���� Ŭ�������� �ε��� 'PK_Account'��(��) �����Ͻʽÿ�.
-- CLUSTERED �ε����� PK_Account�� �����Ƿ� i1 �ε����� �������� �ʴ´�.

CREATE UNIQUE INDEX i1 ON accounts(accountName, coins);
-- �ٸ� ���̺�� �Բ� �ε����� �����ؼ� Ű�� ����� �� �ִ�.
-- �׷� ���� �� ������.