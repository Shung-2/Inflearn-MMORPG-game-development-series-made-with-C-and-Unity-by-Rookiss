  -- �н����
  
  /* 
  1�� SSMS �Թ�
  �ּ� �ٴ¹� : /* */ ��ü, -- ����

  -- SQL�̶�? ������ ������ ���̽�(RRDBMS)�� �����ϱ� ���� ��ɾ�
  -- +@ T-SQL �ִ��� ǥ�ؿ� ���缭 �ۼ��ѵ�
  -- CRUD (Create-Read-JUpdate-Delete) : ���� �⺻���� �����̴� 
  */ 

  /* 
  2�� SELECT FROM WHERE

  SELECT *
  FROM players
  -- å�󿡼� ~�� ������ּ���� å���� 1, ~�� ������ּ���� 2�� �����̴�.
  -- �׷����� �̴� �ѱ���� ���Ǵ� ���̸� 'FROM : å�󿡼� SELECT : ~�� ������ּ���'�� �ȴ�.
  -- ������ ����� �� �ݴ��̴�.

  -- ���� from, where, select!
  -- where ���� IF���� �����ϴ�

  -- NULL�� IS NULL, IS NOT NULL�� ���Ѵ�.

  -- ���ڿ� �񱳴� ����(LIKE)���� ����Ѵ�. �̴� ũ�� %�� _�� ���� �� �ִ�
  -- % ������ ���ڿ�
  -- _ ������ ���� 1��
  */

  /* 3�� ORDER BY (���İ� ����)

  ASC ���� ���ڿ��� ū ����
  DESE ū ���ڿ��� ���� ����

  -- TOP�� T SQL������ ���ȴٴ� ������ �ִ�.
  -- ���� : 100���� 200���� Ȯ���� �� ����
 
  SELECT TOP 1 PERCENT(��������) *
  FROM players
  WHERE birthYear IS NOT NULL
  ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC;
  
  -- 100~200�� �˻��ϴ� ��
  SELECT *
  FROM players
  WHERE birthYear IS NOT NULL
  ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC
  (�߰�) OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;
  */ 