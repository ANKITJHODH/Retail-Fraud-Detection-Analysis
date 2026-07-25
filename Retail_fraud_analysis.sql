create database retail_fraud_analysis;
use retail_fraud_analysis;
select count(*) from retail_fraud_table;

-- Some Cleaning Process
-- 1 i need to change the data type of "transaction_timestamp"
alter table retail_fraud_table modify transaction_timestamp DATETIME;
select * from retail_fraud_table where transaction_timestamp is null;
DESCRIBE retail_fraud_table;
SELECT transaction_timestamp
FROM retail_fraud_table
WHERE STR_TO_DATE(transaction_timestamp, '%Y-%m-%d %H:%i:%s') IS NULL;

SELECT transaction_timestamp
FROM retail_fraud_table
WHERE transaction_timestamp LIKE '%56:23:09%';

UPDATE retail_fraud_table
SET transaction_timestamp = "56:23:09"
WHERE transaction_timestamp = '56:23:9';

ALTER TABLE retail_fraud_table
MODIFY transaction_timestamp timestamp;

select * from retail_fraud_table;
UPDATE retail_fraud_table
SET transaction_timestamp = TIMESTAMP(
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*730) DAY),
    SEC_TO_TIME(FLOOR(RAND()*86400))
)
WHERE transaction_timestamp IS NULL;
select count(*) from retail_fraud_table;
select distinct transaction_id from retail_fraud_table;
select * from retail_fraud_table where transaction_id is null;

-- 1 Total Number of transactions
select count(*) as Total_Transactions from retail_fraud_table;

-- 2 Total fraud transactions
select count(*) as Total_fraud_transactions from retail_fraud_table
where fraud_flag =1 ;

-- 3 Count International Transactions
select count(*) as International_Transactions from retail_fraud_table
where is_international = 1;

-- 4 Average Transaction Amount
select round(avg(transaction_amount),2) as avg_transaction_amount from retail_fraud_table;

-- 5 Highest and lowest transaction amount
select max(transaction_amount) as highest_transaction_amount,
min(transaction_amount) as lowest_transaction_amount from retail_fraud_table;

-- 6 Total Transaction by payment methods
select payment_method, count(transaction_id) as Total_transaction from retail_fraud_table
group by payment_method;

-- 7 Fraud transaction by device type
select device_type, count(fraud_flag) as fraud_transaction from retail_fraud_table
where fraud_flag =1
group by device_type;


-- Intermediate Level---
-- 8 Top 10 highest transaction amount
select transaction_id,transaction_amount from retail_fraud_table
order by transaction_amount desc 
limit 10;

-- 9 Fraud percentage by merchant category
select merchant_category, count(*) as transactions,
sum(case when fraud_flag =1 then 1 else 0 end) as fraud_transaction,
sum(case when fraud_flag =1 then 1 else 0 end)*100/count(*) as fraud_percentage
from retail_fraud_table
group by merchant_category;

-- 10 Customer with multiple failed transactions  as important
select customer_id, count(*) as fraud_count
from retail_fraud_table
where fraud_flag=1
group by customer_id
having count(*) >1
order by fraud_count desc ;

-- 11 Transaction with unusual amount flag   
select unusual_amount_flag, count(*) as Total_unusual_amount_flag from retail_fraud_table
group by unusual_amount_flag;

-- 12 High Risk device Transaction    as important problem
select device_type, count(*) as Total_transaction 
from retail_fraud_table
where high_risk_device_flag=1
group by device_type;

-- 13 Country wise fraud analysis
select location as country, 
count(*) as fraud_transaction
from retail_fraud_table
where fraud_flag =1
group by location
order by fraud_transaction;

-- 14 Payment method with highest fraud rate 
select payment_method, count(*) as Total_transaction,
suM(case when fraud_flag=1 then 1 else 0 end) as total_fraud_transaction,
suM(case when fraud_flag=1 then 1 else 0 end)/count(*)*100 as fraud_rate
from retail_fraud_table
group by payment_method
order by fraud_rate desc
limit 1;

select payment_method, count(*) as total_fraud_count 
from retail_fraud_table
where fraud_flag=1
group by payment_method
order by total_fraud_count desc
limit 1; 

-- 15 Day wise fraud transaction trend
select date(transaction_timestamp) as days,
count(*) as Total_fruad_transactions
-- suM(case when fraud_flag=1 then 1 else 0 end) as total_fraud_transaction
from retail_fraud_table
where fraud_flag=1
group by days
order by days;

-- Advanced Level
-- 16 Yearly fraud growth rate 

with yearly_growth as (select 
-- monthname(transaction_timestamp) as monthly,
year(transaction_timestamp) as yearly,
-- concat(monthname(transaction_timestamp) as monthly,year(transaction_timestamp) as yearly),
count(*) as fraud_transaction
-- sum(case when fraud_flag=1 then 1 else 0 end),
-- sum(case when fraud_flag=1 then 1 else 0 end)*100/count(*) as fraud_transaction_rate
from retail_fraud_table
where fraud_flag=1
group by 
-- monthly,
yearly
order by yearly)
select yearly, fraud_transaction, 
lag(fraud_transaction) over(order by yearly) as previous_month_fraud_transaction,
 fraud_transaction-lag(fraud_transaction) over(order by yearly)*100/lag(fraud_transaction) over(order by yearly)
 as fraud_growth_trend from yearly_growth ;

# Monthly wise fraud growth trends

with monthly_fraud_growth as 
(select monthname(transaction_timestamp) as monthly,count(*) as fraud_transaction 
from retail_fraud_table
where fraud_flag =1 
group by monthly
order by monthly)
select monthly, fraud_transaction, 
lag(fraud_transaction) over(order by monthly) as previousmonth_growth_transaction,
fraud_transaction- lag(fraud_transaction) over(order by monthly)/lag(fraud_transaction) over(order by monthly)*100 as fraud_growth_trends
from monthly_fraud_growth
order by fraud_growth_trends;


-- 17 Find detect suspicios customer

select customer_id, transaction_amount,failed_transaction_count_24h,fraud_flag,
case when transaction_amount >=1000 and failed_transaction_count_24h >=3 and 
fraud_flag=1 then "High Risk Customer"
when transaction_amount between 100 and 500 and failed_transaction_count_24h>=3 then "Medium Risk Customer" 
when transaction_amount between 0 and 100 and failed_transaction_count_24h>=3 then "Low Risk Customer" 
else 0 end as Customer_Risk
from retail_fraud_table;

-- 18 Running total of fraud transactions using window function

select transaction_id, transaction_timestamp,transaction_amount,
round(sum(transaction_amount) over(order by transaction_timestamp),2) as running_fraud_total
from retail_fraud_table;


-- 19 CTE for top risky customers 
with CTE as (select customer_id, count(*) as fraud_transaction,
round(sum(transaction_amount),2) as Total_fraud_amount
from retail_fraud_table
where fraud_flag=1
group by customer_id)
select * from CTE where fraud_transaction >=3
order by Total_fraud_amount desc ;

-- 20 Dense Rank Highest Fraud category
select merchant_category,count(*) as Fraud_transactions,dense_rank() over(order by count(*) desc) as fruad_rank
from retail_fraud_table
where fraud_flag=1
group by merchant_category;