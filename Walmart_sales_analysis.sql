SELECT * FROM walmart;

-- Total records
select count(*) from walmart;
-- Walmart cleaned data - Exploration

-- Distinct payment types and their count
select distinct payment_method from walmart;

select payment_method, count(*)
from walmart
group by payment_method;

-- Distinct stores
select count(distinct branch) from walmart;

-- Maximum and minimum quantity
select max(quantity), min(quantity) from walmart;

-- Business Problems

-- Q.1 For different payment methods, find number of transactions and number of quantity sold

select payment_method, count(*) as no_of_transactions, sum(quantity) as no_quantity
from walmart
group by payment_method
order by no_of_transactions desc;

-- Q.2 Identify the highest-rated category in each branch, displaying the branch, category and Avg Rating

SELECT * 
FROM
   (	SELECT 
		branch,
		category,
		AVG(rating) as avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) as ranks
	     FROM walmart
	     GROUP BY 1, 2
	) as t
WHERE ranks = 1;

-- Q.3 Identify the busiest day for each branch based on the number of transactions

select * 
from
		(select branch, 
				dayname(str_to_date(date, '%d/%m/%y')) as day_name,
				count(*) as no_of_transactions,
				rank() over(partition by branch order by count(*) desc) as ranks
		from walmart
		group by 1,2
		) as t1
	where ranks = 1;

-- Q.4 Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.

SELECT 
	 payment_method,
	 -- COUNT(*) as no_payments,
	 SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Q.5 Determine the average, minimum, and maximum rating of category for each city. 
-- List the city, average_rating, min_rating, and max_rating.

select city,
       category,
       avg(rating) as avg_rating, 
       min(rating) as min_rating, 
       max(rating) as max_rating
	from walmart
    group by city, category ;

-- Q.6 Calculate the total profit for each category by considering total_profit as (unit_price * quantity * profit_margin). 
-- List category and total_profit, ordered from highest to lowest profit.

SELECT 
	category,
	SUM(total) as total_revenue,
	SUM(total * profit_margin) as profit
FROM walmart
GROUP BY 1
order by 3 desc;

-- Q.7 Determine the most common payment method for each Branch. Display Branch and the preferred_payment_method.

with t2 as 
		(select  branch,
				payment_method,
				count(*) as total_transactions,
				rank() over(partition by branch order by count(*) desc) as ranks
		from walmart
		group by 1,2
		order by 1) 

select * from t2
where ranks = 1;

-- Q.8 Categorize sales into 3 group MORNING, AFTERNOON, EVENING 
-- Find out each of these shift and number of invoices

select  
		branch,
        case 
        when hour(STR_TO_DATE(time, '%H:%i:%s')) < 12 then 'Morning'
        when hour(STR_TO_DATE(time, '%H:%i:%s')) between 12 and 17 then 'Afternoon'
        else 'Evening'
        end 'shift',
        count(*)
 from walmart
 group by 1,2
 order by 1, 3 desc;
 
-- Q.9 Identify 5 branches with highest decrease ratio in revenue compared to last year(current year 2023 and last year 2022)
-- rdr(revenue decrease ratio) == ((last_rev-cr_rev)/ls_rev)*100
 
select *,
year((str_to_date(date, '%d/%m/%y'))) as formatted_date
from walmart;

-- 2022 sales for each branch
with revenue_2022
as
(
		select branch,
				sum(total) as revenue
		from walmart
		where year((str_to_date(date, '%d/%m/%y'))) = 2022
		group by 1
		order by 1      
 ),
 
 revenue_2023 as
 (
		select branch,
				sum(total) as revenue
		from walmart
		where year((str_to_date(date, '%d/%m/%y'))) = 2023
		group by 1
		order by 1 
 )
 
 select ls.branch,
		ls.revenue as last_year_revenue,
		cs.revenue as cr_year_revenue,
        round((ls.revenue-cs.revenue)/ls.revenue * 100,2) as rev_dec_ration
	 from revenue_2022 as ls
	 join revenue_2023 as cs
	 on ls.branch = cs.branch
	 where ls.revenue > cs.revenue
     order by 4 desc
     limit 5;
 
-- Q.10. Identify top 5% customers (based on total) who contribute disproportionately to revenue.

WITH ranked_sales AS (
    SELECT 
        invoice_id,
        total,
        NTILE(20) OVER (ORDER BY total DESC) AS percentile    -- customers with percentile 1 are top 5%
    FROM walmart
)
SELECT COUNT(*) AS top_customers, ROUND(SUM(total), 2) AS total_revenue
FROM ranked_sales
WHERE percentile = 1;







