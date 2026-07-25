                                         Retail Fraud Detection Analysis using SQL
                                       --------------------------------------------

## PROJECT OVERVIEW
A retail company is facing increasing online transaction fraud. The company wants to identify suspicious transactions, high-risk customers, unusual payment behavior, and fraud patterns using SQL analysis. The goal of this project is to analyze transaction data and detect fraud trends that can help improve transaction security and reduce financial losses.

The project demonstrates how SQL can be used to solve real-world business problems by transforming raw transactional data into meaningful business insights.


## BUSINESS PROBLEMS

A retail company is experiencing an increase in online transaction fraud. The objective of this project is to analyze transaction records and identify:

1. Fraudulent transactions
2. Suspicious customers
3. High-risk payment methods
4. Unusual transaction patterns
5. Country-wise fraud distribution
6. Fraud growth trends

The insights generated can help businesses strengthen fraud detection systems and reduce financial losses.


## TOOLS AND TECHNOLOGIES
- SQL
- MySQL Workbench
- Excel (Data Preparation)

## DATASET INFORMATION

The dataset contains retail transaction records including:

* Transaction ID
* Customer ID
* Transaction Timestamp
* Transaction Amount
* Merchant Category
* Payment Method
* Device Type
* Location
* Fraud Flag
* International Transaction Flag
* High Risk Device Flag
* Failed Transaction Count
* Unusual Amount Flag


## DATA CLEANING AND PREPARATION AND SOLVED BASIC TO ADVANCED LEVEL BUSINESS PROBLEMS

Before analysis, the following preprocessing steps were performed:

- Modified data types
- Converted timestamp columns into DATETIME format
- Removed duplicate Transaction IDs
- Checked NULL values
- Validated transaction records
- Standardized dataset for SQL analysis



### BASIC ANALYSIS

- Total Transactions
- Total Fraud Transactions
- International Transactions
- Average Transaction Amount
- Highest & Lowest Transaction Amount
- Transactions by Payment Method
- Fraud Transactions by Device Type

### INTERMEDIATE ANALYSIS

- Top 10 Highest Transactions
- Fraud Percentage by Merchant Category
- Customers with Multiple Fraud Transactions
- High-Risk Device Analysis
- Country-wise Fraud Analysis
- Payment Method with Highest Fraud Rate
- Daily Fraud Trend

### ADVANCED ANALYSIS

- Monthly Fraud Growth Rate
- Detect Suspicious Customers using CASE Statement
- Running Total of Fraud Transactions
- Top Risky Customers using CTE
- Merchant Category Ranking using DENSE_RANK()

## KEY BUSINESS INSIGHTS AND RECOMMENDATIONS

- Identified payment methods with the highest fraud rates.
- Detected suspicious customers based on transaction amount and failed transaction attempts.
- Analyzed fraud distribution across merchant categories and locations.
- Measured monthly fraud growth trends using Window Functions.
- Ranked merchant categories based on fraud frequency.
- Identified high-risk devices contributing to fraudulent activities.
- Strengthen verification for high-risk payment methods.
- Monitor customers with repeated failed transactions.
- Implement additional authentication for high-value transactions.
- Track fraud trends regularly using automated SQL reports.
- Monitor high-risk devices to reduce fraudulent activities.
- Develop fraud alerts based on transaction patterns.






















