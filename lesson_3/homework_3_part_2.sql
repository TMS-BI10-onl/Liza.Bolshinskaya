--Определить количество групп департаментов в структуре персонала
SELECT COUNT(DISTINCT GroupName) AS GroupNameQty
FROM [HumanResources].[Department]

--Определить среднее количество часов отпуска сотрудников
SELECT AVG(VacationHours) AS AVG_VacationHours
FROM [HumanResources].[Employee]

--Найти общее количество часов больничных всех сотрудников
SELECT SUM(SickLeaveHours) AS SickLeaveHours
FROM [HumanResources].[Employee]

--Определить самые длительные больничные сотрудников обоих полов
SELECT Gender, MAX(SickLeaveHours) AS SickLeaveHours
FROM [HumanResources].[Employee]
GROUP BY Gender

--Определить дату рождения самого старшего по возрасту сотрудника
SELECT MIN(BirthDate) AS MaxAge
FROM [HumanResources].[Employee]

--Вывести название должности и длину названия (количество символов)
SELECT JobTitle, LEN(JobTitle) AS JobTitle_SimbolsQty
FROM [HumanResources].[Employee]
GROUP BY JobTitle

--Вывести год найма на работу по каждому ID
SELECT BusinessEntityID, YEAR(HireDate) AS HireDate_Year
FROM [HumanResources].[Employee]

--Вывести месяц рождения по каждому ID
SELECT BusinessEntityID, MONTH(HireDate) AS MonthBirth
FROM [HumanResources].[Employee]

--Определить ID ассистенов маркетологов и месяцы, в которые их нанимали
SELECT BusinessEntityID, MONTH(HireDate) AS MonthNumber
FROM [HumanResources].[Employee]
WHERE JobTitle = 'Marketing Assistant'

-- В какой день месяца родился сотрудник с ID = 71?
SELECT DAY(BirthDate) AS BirthDate_Day
FROM [HumanResources].[Employee]
WHERE BusinessEntityID = 71

-- Определить текущую дату в формате YY-MM-DD HH:MI:SS
SELECT SYSDATETIME() AS Time

--Определить будущую дату в формате YY-MM-DD HH:MI:SS, которая наступит через 1000 дней
SELECT DATEADD(day, 1000, GETDATE()) AS Time

--Определить количество лет работы дольше всех работающего в компании сотрудника
SELECT DATEDIFF(yy, MIN (HireDate), SYSDATETIME()) AS TheLongestWorkExperience
FROM [HumanResources].[Employee]

--Определить каким был возраст сотрудников мужского пола при их найме на работу
SELECT BusinessEntityID, DATEPART(YY, HireDate) - DATEPART(YY, BirthDate) AS Age
FROM [HumanResources].[Employee]
WHERE Gender = 'M'

--Определить средний возраст сотрудников при приеме на работу
SELECT AVG(DATEDIFF(yy, BirthDate, HireDate)) AS AVG_Age
FROM [HumanResources].[Employee]

--Проверить, превышает ли количество дней отпуска кажного из сотрудников количество его больничных дней 
SELECT BusinessEntityID, IIF(VacationHours > SickLeaveHours, 'TRUE', 'FALSE') AS Result
FROM [HumanResources].[Employee]

--Округлить цены до целого значения
SELECT ProductID, CONVERT(decimal(10,0), ListPrice) AS Price
FROM [Production].[ProductListPriceHistory]

--Определить месяц рождения каждого сотрудника
SELECT BusinessEntityID, DATENAME(MONTH, Birthdate) AS Birthdate_Month
FROM [HumanResources].[Employee]

--Преобразовать буквы в названии "BusinessEntityID" в верхний регистр, в "JobTitle" - в нижний
SELECT UPPER(BusinessEntityID) AS BUSINESSENTITYID, LOWER(JobTitle) AS jobtitle
FROM [HumanResources].[Employee]

--Изменить порядок расположения символов в NationalIDNumber для BusinessEntityID, значение которых меньше 5
SELECT BusinessEntityID, REVERSE(NationalIDNumber) AS REVERSE_NationalIDNumber
FROM [HumanResources].[Employee]
WHERE BusinessEntityID < 5

--Округлить среднюю цену продукта до двух знаков после запятой
SELECT ROUND(AVG(ListPrice), 2) AS AVG_Price
FROM [Production].[ProductListPriceHistory]

--Изменить в названии позиций сотрудников'Senior', 'Junior'
SELECT JobTitle, REPLACE(JobTitle, 'Senior', 'Junior') AS NEW_JobTitle
FROM [HumanResources].[Employee]

--Исправить MiddleName сотрудников "J" на "JJ" и вывести корректные полные имена и ID
SELECT BusinessEntityID, FirstName, REPLICATE(MiddleName, 2) AS new_right_MiddleName, LastName
FROM [Person].[Person]
WHERE MiddleName = 'J'