#1.High Value Customer Segments

#Top 10 Highest spending customers
select s.customer_id, c.age_group, c.city, c.occupation, c.gender, c.marital_status, 
sum(s.spend) as total_spent
from spends s
inner join customers c on s.customer_id = c.customer_id
group by s.customer_id, c.age_group, c.city, c.occupation, c.gender, c.marital_status
order by total_spent desc limit 10;

#Customers with Highest Income Utilisation
select c.customer_id, c.city, c.occupation, c.gender, c.avg_income, 
SUM(s.spend) AS total_spend, ROUND(SUM(s.spend)/c.avg_income*100,2) as income_util_pct
from customers c
JOIN spends s ON c.customer_id = s.customer_id 
group by c.customer_id, c.city, c.occupation, c.gender, c.avg_income
order by income_util_pct desc LIMIT 10;

#2.Customer Segmentation & Trends
#Segment Customers by Income Group

 select customer_id, 
 CASE when avg_income > 70000 then 'High Income'
 WHEN avg_income BETWEEN 40000 AND 70000 then 'Middle Income'
 else 'Low Income' END as income_group
from customers;

#Avg Monthly spend by city
select c.city, s.month, ROUND(avg(s.spend),2) as avg_spend
from customers c
INNER JOIN spends s ON c.customer_id=s.customer_id
group by c.city, s.month
order by avg_spend desc;

#3. Spend pattern Analysis
#Spending share by category

select category, SUM(spend) as total_spend,
ROUND(SUM(spend)/(select SUM(spend) from spends)*100,2) as pct_share
from spends group by category
order by pct_share desc;


#Most popular payment type by category
select category, payment_type, SUM(spend) as total_spend
from spends group by category, payment_type
order by total_spend desc;

#4. Demographic Spend Insights
# Average spend by gender & occupation
select c.gender, c.occupation, AVG(s.spend) as avg_spend
from customers c
INNER JOIN spends s ON c.customer_id=s.customer_id
group by c.gender, c.occupation
order by avg_spend desc;

#Spend distribution by Age group
select c.age_group, SUM(s.spend) as total_spend
from customers c
INNER JOIN spends s ON c.customer_id=s.customer_id
group by c.age_group
order by total_spend;

#5. Frequency and loyalty Analysis
# Customers with frequency transactions
select c.customer_id, c.city, COUNT(s.spend) as num_transactions, SUM(s.spend) as total_spend
from customers c INNER JOIN spends s ON c.customer_id=s.customer_id
group by c.customer_id, c.city 
having num_transactions >10
order by num_transactions desc;

#6. Category prefernce by city
select c.city, s.category, SUM(s.spend) as total_spend
from customers c 
INNER JOIN spends s ON c.customer_id=s.customer_id 
group by c.city, s.category
order by total_spend desc;


# 7.Gender based category share
select c.gender, s.category, SUM(s.spend) as spend_by_gender,
ROUND(SUM(s.spend)/(select SUM(spend) from spends where category = s.category)*100,2) as pct_category_share
from spends s 
INNER JOIN customers c ON c.customer_id=s.customer_id 
group by c.gender, s.category
order by s.category, spend_by_gender desc;

#The percentage contribution of that gender to the total spend of that specific category, calculated as:
#pct_category_share= (total spend in that category/sum spend by gender and category)×100
#The subquery (SELECT SUM(spend) FROM fact_spends WHERE category = s.category) gets the total spend for that category (across all genders).


# 8.Identify the most valuable customers for marketing and loyalty offers
#Frequency & Monetary
select c.customer_id, COUNT(s.spend) as frequency, SUM(s.spend) as monetary
from spends s 
INNER JOIN customers c ON c.customer_id=s.customer_id 
GROUP BY c.customer_id
ORDER BY monetary DESC, frequency DESC
LIMIT 15;

# Month on Month (MoM) spend growth by category
SELECT s.category, 
       s.month, 
       SUM(s.spend) AS total_spend
FROM spends s
GROUP BY s.category, s.month
ORDER BY s.category, FIELD(s.month, 'May','June','July','August','September','October');

#Insight: Identify seasonal or promotional spikes in specific categories (e.g., Electronics during certain months).

#Active vs Inactive Customers
SELECT 
  CASE WHEN SUM(CASE WHEN s.month='October' THEN 1 ELSE 0 END) > 0 THEN 'Active in October'
       ELSE 'Inactive in October' END AS activity_status,
  COUNT(DISTINCT s.customer_id) AS num_customers
FROM spends s;

#Product Affinity: Top Categories per Occupation
SELECT c.occupation, s.category, SUM(s.spend) AS total_occupation_category_spend
FROM spends s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.occupation, s.category
ORDER BY c.occupation, total_occupation_category_spend DESC;
#Insight: Allows cross-sell or co-branded offers (e.g., tie up with electronics brands for IT employees).
  
  
# Payment Preference by Demographic
SELECT c.age_group, c.gender, s.payment_type, COUNT(*) AS txn_count, SUM(s.spend) AS total_spend
FROM customers c
JOIN spends s ON c.customer_id = s.customer_id
GROUP BY c.age_group, c.gender, s.payment_type
ORDER BY c.age_group, c.gender, total_spend DESC;
#Insight: Preferred payment methods for each demographic—refine card, UPI, or net banking strategies.


# Spend Concentration (Pareto Analysis: 80-20 Rule)
SELECT
  CONCAT(ROUND((ROW_NUMBER() OVER (ORDER BY total_spent DESC) / COUNT(*) OVER ()) * 100,2),'%') AS percentile,
  customer_id, total_spent
FROM (
  SELECT customer_id, SUM(spend) AS total_spent
  FROM spends
  GROUP BY customer_id
) ordered_customers
ORDER BY total_spent DESC;
#Insight: Visualize what percentage of customers drive 80% of spending—helpful for targeted loyalty programs


#Category Spend Distribution by Income Group
SELECT 
  CASE
     WHEN c.avg_income > 70000 THEN 'High Income'
     WHEN c.avg_income BETWEEN 40000 AND 70000 THEN 'Middle Income'
     ELSE 'Low Income'
  END AS income_group,
  s.category,
  SUM(s.spend) AS total_spend
FROM customers c
JOIN spends s ON c.customer_id = s.customer_id
GROUP BY income_group, s.category
ORDER BY income_group, total_spend DESC;
#Insight: Helps in tailoring offers (such as EMI or premium rewards) based on income and spend categories.








