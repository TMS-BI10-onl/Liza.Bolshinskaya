--���������� ���������� ����� ������������� � ��������� ���������
SELECT COUNT(DISTINCT GroupName) AS GroupNameQty
FROM [HumanResources].[Department]

--���������� ������� ���������� ����� ������� �����������
SELECT AVG(VacationHours) AS AVG_VacationHours
FROM [HumanResources].[Employee]

--����� ����� ���������� ����� ���������� ���� �����������
SELECT SUM(SickLeaveHours) AS SickLeaveHours
FROM [HumanResources].[Employee]

--���������� ����� ���������� ���������� ����������� ����� �����
SELECT Gender, MAX(SickLeaveHours) AS SickLeaveHours
FROM [HumanResources].[Employee]
GROUP BY Gender

--���������� ���� �������� ������ �������� �� �������� ����������
SELECT MIN(BirthDate) AS MaxAge
FROM [HumanResources].[Employee]

--������� �������� ��������� � ����� �������� (���������� ��������)
SELECT JobTitle, LEN(JobTitle) AS JobTitle_SimbolsQty
FROM [HumanResources].[Employee]
GROUP BY JobTitle

--������� ��� ����� �� ������ �� ������� ID
SELECT BusinessEntityID, YEAR(HireDate) AS HireDate_Year
FROM [HumanResources].[Employee]

--������� ����� �������� �� ������� ID
SELECT BusinessEntityID, MONTH(HireDate) AS MonthBirth
FROM [HumanResources].[Employee]

--���������� ID ���������� ������������ � ������, � ������� �� ��������
SELECT BusinessEntityID, MONTH(HireDate) AS MonthNumber
FROM [HumanResources].[Employee]
WHERE JobTitle = 'Marketing Assistant'

-- � ����� ���� ������ ������� ��������� � ID = 71?
SELECT DAY(BirthDate) AS BirthDate_Day
FROM [HumanResources].[Employee]
WHERE BusinessEntityID = 71

-- ���������� ������� ���� � ������� YY-MM-DD HH:MI:SS
SELECT SYSDATETIME() AS Time

--���������� ������� ���� � ������� YY-MM-DD HH:MI:SS, ������� �������� ����� 1000 ����
SELECT DATEADD(day, 1000, GETDATE()) AS Time

--���������� ���������� ��� ������ ������ ���� ����������� � �������� ����������
SELECT DATEDIFF(yy, MIN (HireDate), SYSDATETIME()) AS TheLongestWorkExperience
FROM [HumanResources].[Employee]

--���������� ����� ��� ������� ����������� �������� ���� ��� �� ����� �� ������
SELECT BusinessEntityID, DATEPART(YY, HireDate) - DATEPART(YY, BirthDate) AS Age
FROM [HumanResources].[Employee]
WHERE Gender = 'M'

--���������� ������� ������� ����������� ��� ������ �� ������
SELECT AVG(DATEDIFF(yy, BirthDate, HireDate)) AS AVG_Age
FROM [HumanResources].[Employee]

--���������, ��������� �� ���������� ���� ������� ������� �� ����������� ���������� ��� ���������� ���� 
SELECT BusinessEntityID, IIF(VacationHours > SickLeaveHours, 'TRUE', 'FALSE') AS Result
FROM [HumanResources].[Employee]

--��������� ���� �� ������ ��������
SELECT ProductID, CONVERT(decimal(10,0), ListPrice) AS Price
FROM [Production].[ProductListPriceHistory]

--���������� ����� �������� ������� ����������
SELECT BusinessEntityID, DATENAME(MONTH, Birthdate) AS Birthdate_Month
FROM [HumanResources].[Employee]

--������������� ����� � �������� "BusinessEntityID" � ������� �������, � "JobTitle" - � ������
SELECT UPPER(BusinessEntityID) AS BUSINESSENTITYID, LOWER(JobTitle) AS jobtitle
FROM [HumanResources].[Employee]

--�������� ������� ������������ �������� � NationalIDNumber ��� BusinessEntityID, �������� ������� ������ 5
SELECT BusinessEntityID, REVERSE(NationalIDNumber) AS REVERSE_NationalIDNumber
FROM [HumanResources].[Employee]
WHERE BusinessEntityID < 5

--��������� ������� ���� �������� �� ���� ������ ����� �������
SELECT ROUND(AVG(ListPrice), 2) AS AVG_Price
FROM [Production].[ProductListPriceHistory]

--�������� � �������� ������� �����������'Senior', 'Junior'
SELECT JobTitle, REPLACE(JobTitle, 'Senior', 'Junior') AS NEW_JobTitle
FROM [HumanResources].[Employee]

--��������� MiddleName ����������� "J" �� "JJ" � ������� ���������� ������ ����� � ID
SELECT BusinessEntityID, FirstName, REPLICATE(MiddleName, 2) AS new_right_MiddleName, LastName
FROM [Person].[Person]
WHERE MiddleName = 'J'