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
									SELECT SUM(cast(PROPERTY_PRICE as bigint))
									AS TOTAL_VALUE_OF_ALL_PROPERTIES
										from property25_detail_info

--12. What is the total property value per province? 
		SELECT PROVINCE ,SUM(CAST(PROPERTY_PRICE AS bigint))
		AS TOTAL_PROPERT_PRICE_PER_PROVINCE
		FROM property25_detail_info
		GROUP BY PROVINCE
	
--13. What is the total property value per city? 
											SELECT CITY,
											SUM(cast(PROPERTY_PRICE as bigint))
											AS TOTAL_VALUE_PER_CITY
											FROM property25_detail_info
											GROUP BY CITY

--14. What is the total monthly repayment for all properties? 
		SELECT SUM(cast(monthly_repayment as bigint))
		AS total_monthly_repayment_All_prop
		FROM property25_detail_info

--15. What is the total monthly repayment per province? 
											SELECT PROVINCE, SUM(monthly_repayment)
											as total_monthly_repayment_per_province
											from property25_detail_info
											group by Province 
											Order by total_monthly_repayment_per_province desc;

--16. What is the total once-off cost for all properties? 
				SELECT sum(cast(Total_Once_off_Costs as bigint))
				as total_once_off_cost_for_all_properties
				from property25_detail_info

--17. What is the total once-off cost per province? 
									SELECT PROVINCE, sum(cast(Total_Once_off_Costs as bigint))
													as total_once_off_cost_for_per_properties
													from property25_detail_info
													group by Province;
--18. What is the total property value for Gauteng? 
SELECT PROVINCE, sum(cast(PROPERTY_PRICE as bigint))
				as total_property_value_for_GAUTENG
				from property25_detail_info
				where PROVINCE = 'GAUTENG'
				group by Province;
--19. What is the total property value for properties priced above R4,000,000?
									SELECT SUM(cast(PROPERTY_PRICE as bigint))
									AS TOTAL_VALUE_OF_PROP_ABOVE_R4M
										FROM  property25_detail_info
									Where PROPERTY_PRICE >= 4000000;

--20. What is the total minimum gross monthly income required per province? 
			SELECT PROVINCE,SUM(Min_Gross_Monthly_income)
			as total_minimum_gross_monthly_income_required_per_province
			from property25_detail_info
			group by  PROVINCE

--SECTION 3 � AVG Aggregations (10 Questions) 


--21. What is the average property price overall? 
	SELECT AVG(cast(PROPERTY_PRICE as bigint))
	AS AVERAGE_PROPERTY_PRICE_OVERALL
	FROM property25_detail_info

									--22. What is the average property price per province? 
									SELECT PROVINCE, AVG(cast(PROPERTY_PRICE as bigint))
									AS AVG_PROP_PER_PROVINCE
									FROM property25_detail_info
									GROUP BY PROVINCE;




--23. What is the average property price per city? 
	SELECT CITY , AVG(CAST (PROPERTY_PRICE AS BIGINT))
	AS AVG_PROP_PRICE_PER_CITY
	FROM property25_detail_info
	GROUP BY CITY

--24. What is the average number of bedrooms per province? 
		SELECT PROVINCE,  AVG(PROPERTY_PRICE) 
		AS NUMBER_OF_BEDROOMS_PER_PROVINCE
		FROM property25_detail_info
		GROUP BY PROVINCE;

--25. What is the average number of bathrooms per province? 

--26. What is the average floor size per province? 
SELECT PROVINCE,  AVG(PROPERTY_PRICE) 
		AS NUMBER_OF_BEDROOMS_PER_PROVINCE
		FROM property25_detail_info
		GROUP BY PROVINCE;


--27. What is the average monthly repayment per province? 
SELECT PROVINCE,  AVG(CAST(PROPERTY_PRICE AS bigint)) 
		AS NUMBER_OF_BEDROOMS_PER_PROVINCE
		FROM property25_detail_info
		GROUP BY PROVINCE;


--28. What is the average once-off cost per province? 
SELECT PROVINCE,  AVG(CAST(Total_Once_off_Costs AS bigint)) 
		AS NUMBER_OF_BEDROOMS_PER_PROVINCE
		FROM property25_detail_info
		GROUP BY PROVINCE;


--29. What is the average minimum gross monthly income per province? 
									SELECT PROVINCE,  AVG(CAST(Min_Gross_Monthly_income AS bigint)) 
											AS NUMBER_OF_BEDROOMS_PER_PROVINCE
											FROM property25_detail_info
											GROUP BY PROVINCE;


--30. What is the average property price for properties above R3,000,000? 
SELECT AVG(cast(PROPERTY_PRICE as bigint))
	AS AVERAGE_PROPERTY_PRICE_ABOVE_R3M
	FROM property25_detail_info
	WHERE PROPERTY_PRICE >= 3000000


--SECTION 4 � GROUP BY + Filtering (10 Questions) 

--31. Which province has the highest average property price? 
										SELECT TOP 1 PROVINCE, AVG(cast(PROPERTY_PRICE as bigint))
											AS AVG_PROP_PER_PROVINCE
											FROM property25_detail_info
											GROUP BY PROVINCE
											Order by AVG_PROP_PER_PROVINCE DESC


--32. Which province has the lowest average property price? 
SELECT TOP 1 PROVINCE, AVG(cast(PROPERTY_PRICE as bigint))
	AS AVG_PROP_PER_PROVINCE
	FROM property25_detail_info
	GROUP BY PROVINCE
	Order by AVG_PROP_PER_PROVINCE ASC


--33. Which city has the highest total property value? 
											SELECT TOP 1 CITY, SUM(cast(PROPERTY_PRICE as bigint))
												AS TOTAL_VALUE_PER_CITY
												FROM property25_detail_info
												GROUP BY CITY
												Order by TOTAL_VALUE_PER_CITY DESC


--34. Which city has the lowest average property price? 
SELECT TOP 1 CITY , AVG(CAST (PROPERTY_PRICE AS BIGINT))
	AS AVG_PROP_PRICE_PER_CITY
	FROM property25_detail_info
	GROUP BY CITY
	Order by AVG_PROP_PRICE_PER_CITY ASC

--35. How many properties per province are priced above R2,000,000? 
									SELECT PROVINCE, COUNT(*)
									AS TOTAL_PROP_ABOVE_R2M
									FROM  property25_detail_info
									WHERE PROPERTY_PRICE >= 2000000


--36. What is the average floor size per province for properties above R3,000,000? 
										SELECT PROVINCE, AVG(FLOOR_SIZE)
										AS AVG_FLOOR_SIZE_PER_PROVINCE_ABOVE_R3M
											FROM property25_detail_info
											WHERE PROPERTY_PRICE >= 3000000
											GROUP BY PROVINCE

--37. What is the total property value per province for properties with 3 or more bedrooms? 
SELECT PROVINCE, SUM(cast(PROPERTY_PRICE as bigint))
AS TOTAL_PROP_VALUE_PER_PROVINCE_3_BEDROOMS
	FROM property25_detail_info
WHERE BEDROOMS >= 3



--38. What is the average monthly repayment per province for properties above R4,000,000? 
											SELECT PROVINCE, AVG(Monthly_Repayment)
												AS AVG_MONTHLY_REPAYMENT_PER_PROVINCE_ABOVE_R4M
												FROM property25_detail_info
													WHERE PROPERTY_PRICE >= 4000000
														GROUP BY PROVINCE

	
--39. How many properties per city have parking for 2 or more cars? 
			SELECT CITY, COUNT(*)	
			AS TOTAL_PROP_WITH_2_PARKING_PER_CITY
			FROM property25_detail_info
			WHERE PARKING >= 2
			GROUP BY CITY
--40. What is the average minimum gross monthly income per province for properties above 
--R5,000,000? 
										SELECT PROVINCE, AVG(Min_Gross_Monthly_income)
										AS AVG_MIN_GROSS_MONTHLY_INCOME_PER_PROVINCE_ABOVE_R5M
											FROM property25_detail_info
										WHERE PROPERTY_PRICE >= 5000000	
										GROUP BY PROVINCE
