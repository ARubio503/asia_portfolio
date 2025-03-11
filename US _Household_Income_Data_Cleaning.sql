#US Household Income Data Cleaningus_household_income
SELECT*
FROM US_Project.us_household_income;

SELECT*
 FROM US_Project.us_household_income_statistics;


SELECT COUNT(id)
FROM US_Project.us_household_income
;


SELECT COUNT(id)
 FROM US_Project.us_household_income_statistics;
 
 
 
SELECT id,COUNT(id)
FROM US_Project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1 
;

SELECT row_id
	FROM(
	SELECT row_id,
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM US_Project.us_household_income) duplicates
WHERE row_num > 1;




DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM(
	SELECT row_id,
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM US_Project.us_household_income) duplicates
WHERE row_num > 1)
;


SELECT id,COUNT(id)
FROM US_Project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1 ;


SELECT State_Name, COUNT(State_Name)
 FROM US_Project.us_household_income_statistics
 GROUP By State_Name
 ;


SELECT *
 FROM US_Project.us_household_income
 WHERE County = 'Autauga County'
 ORDER BY 1
 ;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont' ;


SELECT Type,COUNT(Type)
FROM us_household_income
GROUP BY TYpe
 ;

UPDATE us_household_income
SET Type = 'Borough' 
WHERE Type = 'Boroughs' ;

SELECT ALand, AWater 
FROM US_Project.us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater IS Null)
AND (ALand = 0 OR ALand = '' OR ALand IS Null)
;

