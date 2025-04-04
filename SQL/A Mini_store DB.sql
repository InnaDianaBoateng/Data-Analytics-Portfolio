## Creation of BlossomGrude Database ##
CREATE DATABASE BlossomGrude;
USE BlossomGrude;

## Describing Table to know the various data types assigned to each value ##
DESCRIBE mini_store;

# Updating Unit Price column by removing non-numerical characters ("$" and ",")
UPDATE mini_store
SET `Unit Price` = REPLACE(`Unit Price`,'$','');

UPDATE mini_store
SET `Unit Price` = REPLACE(`Unit Price`, ',', '');

SELECT *
FROM mini_store;

# Changing data type of Unit Price to decimal ##
ALTER TABLE mini_store
MODIFY COLUMN `Unit Price` DECIMAL (10,2);

DESCRIBE mini_store;

## Altering table to change data type for date from text to date ##
UPDATE mini_store
SET Date = str_to_date(Date, '%m/%d/%Y');

## Altering table to change data type for date from text to date ##
ALTER TABLE  mini_store
MODIFY COLUMN Date Date;

DESCRIBE mini_store;

## QUESTION 1 : Retrieve all sales data on January 1, 2019 ##
SELECT *
FROM mini_store
WHERE Date = '2019-01-01';
## The date range is just for 2016 and so data from 2019 cannot be retrieved ##

## QUESTION 2: Find all transaction where the unit price exceeds the limit (10)
SELECT *
FROM mini_store
WHERE  Unit_Price > 10;

## QUESTION 3:  all the products that sells less than 5 units in the transaction ##
SELECT *
FROM mini_store
WHERE  Quantity < 5;

## QUESTION  4:  all the products together with their category that made sales greater than 2000 dollars ##
SELECT Product, Category, (Unit_Price*Quantity) AS Total_Sales
FROM mini_store
WHERE (Unit_Price*Quantity) > 2000;

## QUESTION  5: products that are less expensive (less than 500 dollars) but resulted in a total revenue of more than 30000 dollars ##
SELECT Product, SUM(Unit_Price*Quantity) AS Total_Revenue
FROM mini_store
WHERE Unit_Price < 500
GROUP BY Product
HAVING Total_Revenue > 30000;
###### ANSWER IS BANANA,CARROTS, CABBAGE,APPLE,ORANGE ######


## QUESTION 6: country WITH the highest total revenue ##
SELECT Country, SUM(Quantity * Unit_Price) AS Total_Revenue
FROM mini_store
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 1;
###### ANSWER IS United states######


## QUESTION 7: last five transactions made in the time period ##
SELECT *
FROM mini_store
ORDER BY `Date` DESC, `Order ID` DESC
LIMIT 5;

## QUESTION 8: country recorded the lowest total revenue ##
SELECT Country, SUM(Unit_Price*Quantity) AS Total_Revenue
FROM mini_store
GROUP BY Country 
ORDER BY Total_Revenue ASC
LIMIT 1;
###### ANSWER IS NEW ZEALAND ######


## QUESTION 9:Are there products that cost 15 dollars and have recorded less than 5 items. ##
SELECT Product
FROM mini_store
WHERE Unit_Price = 15 AND Quantity < 5;
###### ANSWER IS none ######


## QUESTION 10 : Which products are sold the most ##
SELECT Product, SUM(Quantity) AS Total_Quantity
FROM mini_store
GROUP BY Product
ORDER BY Total_Quantity DESC
LIMIT 1;
###### ANSWER IS BANANA ######

## QUESTION 11 : products sold the most in each of the countries ##
SELECT Country, Product, SUM(Quantity) AS Total_Quantity
FROM mini_store
GROUP BY Country, Product
ORDER BY Country, Total_Quantity DESC;



