use sql_pro;
select * from amazon;
-- 1.What is the count of distinct cities in the dataset?
SELECT COUNT(DISTINCT city) AS cities_count
FROM amazon;

-- 2.For each branch, what is the corresponding city?
SELECT branch, city
FROM amazon
GROUP BY branch, city; -- 3 unique branches corresponding to 3 unique city


-- 3.What is the count of distinct product lines in the dataset?
SELECT COUNT(DISTINCT product_line) AS distinct_productlines
FROM amazon;

-- 4.Which payment method occurs most frequently?
SELECT payment, COUNT(*) AS frequency
FROM amazon
GROUP BY Payment
ORDER BY frequency DESC
LIMIT 1;

-- 5.Which product line has the highest sales?
SELECT product_line, SUM(total) AS total_sales
FROM amazon
GROUP BY product_line
ORDER BY total_sales DESC
LIMIT 1;

-- 6.How much revenue is generated each month?
SELECT 
    month_name,
    SUM(Total) AS monthly_rev
FROM 
    amazon
GROUP BY 
    month_name
ORDER BY 
    monthly_rev DESC;

    
-- 7.In which month did the cost of goods sold reach its peak?
SELECT 
    month_name,
    SUM(cogs) AS total_cogs
FROM 
    amazon
GROUP BY 
    month_name
ORDER BY 
    total_cogs DESC;

-- 8.Which product line generated the highest revenue?
 Select * from amazon;
SELECT 
    product_line,
    SUM(total) AS total_revenue
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- 9.In which city was the highest revenue recorded?
SELECT 
    city,
    SUM(total) AS total_revenue
FROM 
    amazon
GROUP BY 
    city
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- 10.Which product line incurred the highest Value Added Tax?
SELECT 
    'product line',
    SUM('Tax 5%') AS total_VAT
FROM 
    amazon
GROUP BY 
    'product line'
ORDER BY 
    total_VAT DESC
LIMIT 1;

-- 11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT 
    product_line,
    SUM(total) AS total_sales,
    CASE 
        WHEN SUM(total) > (SELECT AVG(total) FROM amazon) THEN 'Good'
        ELSE 'Bad'
    END AS sales_category
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY
    total_sales;
    
-- 12.Identify the branch that exceeded the average number of products sold
SELECT 
    branch,
    SUM(quantity) AS total_quantity_sold,
    CASE 
        WHEN SUM(quantity) > (SELECT AVG(quantity) FROM amazon) THEN 'Exceeded'
        ELSE 'Below Average'
    END AS sales_performance
FROM 
    amazon
GROUP BY 
    branch;
-- 13.Which product line is most frequently associated with each gender?
SELECT 
    gender,
    product_line,
    COUNT(*) AS frequency
FROM 
    amazon
GROUP BY 
    gender, product_line
ORDER BY 
    gender, frequency DESC;
    
-- 14.Calculate the average rating for each product line
SELECT 
    product_line,
    AVG(rating) AS average_rating
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    average_rating;
    select * from amazon;
-- 15.Count the sales occurrences for each time of day on every weekday.
SELECT 
    day_name,Time_of_day,count(*) as sales_occurrences
    
FROM 
    amazon
GROUP BY 
    day_name, Time_of_day
ORDER BY 
    day_name, Time_of_day;

    

-- 16.Identify the customer type contributing the highest revenue.
SELECT 
    customer_type,
    SUM(total) AS total_revenue
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    total_revenue DESC
LIMIT 1;

select * from amazon;
-- 17.Determine the city with the highest VAT percentage.
SELECT 
    city,
    SUM(VAT) AS high_vat,
    SUM(Total) as total_rev,
    (SUM(VAT) / SUM(Total) * 100) AS vat_percentage
FROM 
    amazon
GROUP BY 
    city
ORDER BY 
    vat_percentage DESC
LIMIT 1;

-- 18.Identify the customer type with the highest VAT payments.
SELECT 
    customer_type,
    SUM(VAT) AS total_VAT_payments
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    total_VAT_payments DESC
LIMIT 1;
-- 19.What is the count of distinct customer types in the dataset?
SELECT COUNT(DISTINCT customer_type) AS distinct_customer_types_count
FROM amazon;

-- 20.What is the count of distinct payment methods in the dataset
SELECT COUNT(DISTINCT payment) AS distinct_payment_methods_count
FROM amazon;

-- 21.Which customer type occurs most frequently?
SELECT 
    customer_type,
    SUM(Quantity) AS frequency
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    frequency DESC
LIMIT 1;

-- 22.Identify the customer type with the highest purchase frequency.
SELECT 
    customer_type,
    COUNT(*) AS purchase_frequency
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    purchase_frequency DESC
LIMIT 1;
-- 23.Determine the predominant gender among customers.
SELECT 
    gender,
    COUNT(*) AS frequency
FROM 
    amazon
WHERE 
    gender IS NOT NULL
GROUP BY 
    gender
ORDER BY 
    frequency DESC
LIMIT 1;


-- 24.Examine the distribution of genders within each branch.
SELECT 
    branch,
    gender,
    COUNT(*) AS gender_count
FROM 
    amazon
WHERE 
    gender IS NOT NULL
GROUP BY 
    branch, gender
ORDER BY 
    branch, gender;


-- 25.Identify the time of day when customers provide the most ratings.
SELECT 
    Time_of_day,COUNT(Rating) as rating_count
from amazon
GROUP BY 
    Time_of_day
ORDER BY 
    rating_count DESC
LIMIT 1;



-- 26.Determine the time of day with the highest customer ratings for each branch.
SELECT 
    branch,Time_of_day,Count(Rating) as rating_count
    from amazon
GROUP BY 
    branch, Time_of_day
ORDER BY 
    branch DESC;



-- 27.Identify the day of the week with the highest average ratings.
SELECT 
    day_name,
    AVG(rating) AS average_rating
FROM 
    amazon
GROUP BY 
    day_name
ORDER BY 
    average_rating DESC
LIMIT 1;
-- 28.Determine the day of the week with the highest average ratings for each branch.
SELECT 
    branch,
    day_name,
    AVG(rating) AS average_rating
FROM 
    amazon
GROUP BY 
    branch, day_name
ORDER BY 
    branch, average_rating DESC;









    










