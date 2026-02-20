--Lesson 10 - Aggregations (COUNT, SUM, AVG, GROUP BY) 
SELECT * FROM dbo.property25_detail_info
--SECTION 1 � COUNT Aggregations (10 Questions) 
--1. How many total properties are in the database? 
	SELECT COUNT(*) 
	AS Total_Properties
	FROM dbo.property25_detail_info

	--------------------------------////////////////////////------------------

--2. How many properties are listed in each province? 
	SELECT PROVINCE, COUNT(*)
	AS total_properties
	from dbo.property25_detail_info
	Group by [PROVINCE]
	----------------------//////////////////////////-------------------


								
								--3. How many properties are listed in each city? 
									SELECT CITY , COUNT(CITY)
									AS total_cities
									from property25_detail_info
									Group by [City]
	

--4. How many properties have more than 2 bedrooms? 
	SELECT CITY , COUNT(BEDROOMS)
	as Morethan_two_bedrooms
	from property25_detail_info
	Where BEDROOMS >=2
	Group by [city]
										-------///////////////------------
										SELECT CITY, PROVINCE , COUNT(BEDROOMS)
										as Morethan_two_bedrooms
										from property25_detail_info
										Where BEDROOMS >=2
										Group by city,province;
	

--5. How many properties have 2 or more bathrooms? 

SELECT CITY , COUNT(BATHROOMS)
	as Morethan_two_bathrooms
	from property25_detail_info
	Where BATHROOMS >=2
	Group by [city]
								----------IMPLIMENTING DEFFIRENT OPTIONS---------
								--------///////////////////////////////--------
									SELECT CITY, PROVINCE , COUNT(BATHROOMS)
									as Morethan_two_bathrooms
									from property25_detail_info
									Where BATHROOMS >=2
									Group by city,province;


--6. How many properties have parking for at least 2 cars? 
		
		SELECT 
		* FROM property25_detail_info
		WHERE PARKING = 2
		ORDER BY PARKING DESC
		
		---- NOW WE'RE ABLE TO GET ALL THE PROPERTIES WITH WITH 2 PARKING
		-- NOW WE HAVE TO GET PROPERTIES WITH MORETHAN 2 PARKING
				SELECT COUNT(PARKING)
					AS PROPERTY_WITH_2_PARKING 		
					FROM property25_detail_info
					WHERE PARKING = 2
						GROUP BY PARKING;
			
			
--7. How many properties are priced above R3,000,000? 
---------////////////////-------------------
		SELECT PROVINCE,CITY, COUNT(*)
		AS TOTAL_PROP_ABOVE_R3M
		FROM  property25_detail_info
		GROUP BY PROVINCE,CITY
								----NOW WE'RE SEEING LIGHT OF WHAT IS HAPPENING
								---------------------////////////-----------------
								SELECT COUNT(PROPERTY_PRICE)
								AS TOTAL_PROP_ABOVE_R3M
								FROM property25_detail_info
								WHERE PROPERTY_PRICE = 3000000

								
								
								
--8. How many properties are in Gauteng? 
			SELECT PROVINCE, COUNT(*)		
			AS total_properties_in_GAUTENG
			from property25_detail_info
			WHERE PROVINCE = 'GAUTENG'
			GROUP BY PROVINCE



--9. How many properties per province have floor size greater than 200? 
SELECT PROVINCE ,COUNT( PROVINCE)	
AS TOTAL_FLOOR_SIZE_PER_PROV
FROM property25_detail_info
WHERE FLOOR_SIZE >=200
GROUP BY PROVINCE

			
--10. How many distinct provinces are in the table? 
SELECT COUNT(DISTINCT PROVINCE)
	AS DISTINCT_PROVINCES
	FROM property25_detail_info
	--- WE TOOK ALL THE PROVINCES AND COUNTED THE DISTINCT PROVINCES IN THE TABLE




--SECTION 2 � SUM Aggregations (10 Questions) 

--11. What is the total value of all properties combined? 
--12. What is the total property value per province? 
--13. What is the total property value per city? 
--14. What is the total monthly repayment for all properties? 
--15. What is the total monthly repayment per province? 
--16. What is the total once-off cost for all properties? 
--17. What is the total once-off cost per province? 
--18. What is the total property value for Gauteng? 
--19. What is the total property value for properties priced above R4,000,000? 
--20. What is the total minimum gross monthly income required per province? 

--SECTION 3 � AVG Aggregations (10 Questions) 

--21. What is the average property price overall? 
--22. What is the average property price per province? 
--23. What is the average property price per city? 
--24. What is the average number of bedrooms per province? 
--25. What is the average number of bathrooms per province? 
--26. What is the average floor size per province? 
--27. What is the average monthly repayment per province? 
--28. What is the average once-off cost per province? 
--29. What is the average minimum gross monthly income per province? 
--30. What is the average property price for properties above R3,000,000? 


--SECTION 4 � GROUP BY + Filtering (10 Questions) 

--31. Which province has the highest average property price? 
--32. Which province has the lowest average property price? 
--33. Which city has the highest total property value? 
--34. Which city has the lowest average property price? 
--35. How many properties per province are priced above R2,000,000? 
--36. What is the average floor size per province for properties above R3,000,000? 
--37. What is the total property value per province for properties with 3 or more bedrooms? 
--38. What is the average monthly repayment per province for properties above R4,000,000? 
--39. How many properties per city have parking for 2 or more cars? 
--40. What is the average minimum gross monthly income per province for properties above 
--R5,000,000? 