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


## DATA CLEANING AND PREPARATION 

Before analysis, the following preprocessing steps were performed:

- Modified data types
- Converted timestamp columns into DATETIME format
- Removed duplicate Transaction IDs
- Checked NULL values
- Validated transaction records
- Standardized dataset for SQL analysis




## SOLVED REAL TIME BUSINESS PROBLEMS TO REDUCE FRAUD TRANSACTIOS

- Top 10 Highest Transactions
What does it identify?
It finds the 10 transactions with the highest transaction amounts.

How does it reduce fraud?
Fraudsters often attempt large transactions to maximise their gains.

Company Action
Review high-value transactions before approval.
Require OTP or 2FA.
Temporarily hold suspicious transactions.
Contact the customer for confirmation.

Example
A customer who usually spends ₹5,000 suddenly makes a ₹2,00,000 transaction.

Action: The company places the transaction on hold and verifies it with the customer, preventing a potential fraud.




- Fraud Percentage by Merchant Category
What does it identify?
It shows which merchant categories have the highest fraud percentage.

How does it reduce fraud?
If one category has significantly more fraud than others, the company can strengthen security specifically for that category.

Company Action
Increase verification for risky categories.
Audit merchants.
Set lower transaction limits.
Monitor transactions more closely.

Example
Electronics has a 15% fraud rate while Grocery has only 2%.

Action: Require OTP and manual review for expensive electronics purchases.


- High-Risk Device Analysis
What does it identify?
Devices frequently used in fraudulent transactions.

How does it reduce fraud?
Fraudsters often reuse the same phone, laptop, browser or device ID.

Company Action
Block the device.
Prevent new account registrations.
Require additional verification.

Example
Device D101 is linked to 30 fraud cases.

Action: Blacklist Device D101.

- Country-wise Fraud Analysis
  What does it identify?
Countries generating the highest number of fraudulent transactions.

How does it reduce fraud?
The company can apply stricter security measures to transactions from high-risk countries.

Company Action
Require OTP.
Limit transaction amounts.
Perform manual reviews.
Block transactions from particularly risky locations if appropriate.

Example
Country X has the highest fraud rate.

Action: Every transaction from Country X requires extra verification.

- Payment Method with Highest Fraud Rate
What does it identify?
The payment method with the highest fraud percentage.

How does it reduce fraud?
Different payment methods have different levels of fraud risk.

Company Action
Enable 3D Secure.
Require OTP.
Reduce transaction limits.
Increase monitoring.

Example
Credit cards have a 12% fraud rate.

Action: Enable mandatory 3D Secure for all credit card payments.

- Daily Fraud Trend
  What does it identify?
The number of fraud transactions occurring each day.

How does it reduce fraud?
A sudden increase may indicate an ongoing fraud attack.

Company Action
Alert the fraud team.
Increase monitoring.
Investigate immediately.
Apply temporary restrictions if needed.

Example
Daily fraud increases from 15 to 60 transactions.

Action: Launch an immediate investigation before the attack spreads.

### ADVANCED ANALYSIS

- Monthly Fraud Growth Rate
  What does it identify?
Whether fraud is increasing or decreasing month by month.

How does it reduce fraud?
An increasing trend signals that current fraud controls are not effective enough.

Company Action
Update fraud detection rules.
Allocate more investigators.
Improve security measures.

Example
Fraud grows by 35% in one month.

Action: Strengthen fraud detection policies.


- Detect Suspicious Customers
What does it identify?
Customers classified into Low, Medium, High or Critical risk based on predefined conditions.

How does it reduce fraud?
Instead of treating all customers equally, security checks are applied according to risk level.

Company Action
Low Risk → Normal processing
Medium Risk → OTP
High Risk → Manual review
Critical Risk → Block account

Example
A customer with five fraud transactions is classified as High Risk.

Action: Every future transaction requires manual approval.


- Running Total of Fraud Transactions
What does it identify?
The cumulative number of fraud transactions over time.

How does it reduce fraud?
It helps management recognise whether fraud is continuously increasing.

Company Action
Increase fraud monitoring.
Review fraud policies.
Allocate additional resources.

Example
Running total rises sharply during a single week.

Action: Deploy more fraud investigators immediately.


- Top Risky Customers using CTE
What does it identify?
The customers responsible for the highest number or value of fraudulent transactions.

How does it reduce fraud?
The company focuses investigations on the highest-risk individuals first.

Company Action
Freeze accounts.
Conduct detailed investigations.
Block repeat offenders.

Example
Top five customers account for 70% of all fraud.

Action: Prioritise investigation of these five customers.


- Top 10 Highest Transactions + Detect Suspicious Customers
Findings
A High Risk customer attempts a ₹5,00,000 transaction.

Company Action
Hold the transaction.
Request identity verification.
Conduct a manual review.

Result
Prevents large fraudulent transactions before money is lost.


-Daily Fraud Trend + Monthly Fraud Growth Rate
Findings
Daily fraud spikes suddenly.
Monthly fraud has been increasing steadily.

Company Action
Investigate the cause.
Strengthen fraud detection rules.
Increase staffing for fraud monitoring.

Result
Allows the company to respond quickly while also improving long-term fraud prevention.


## CONCLUSION
These SQL analyses work together to create a complete fraud detection and prevention strategy. They help the company identify who is committing fraud (customers), where it is happening (countries and merchant categories), how it is happening (devices and payment methods), when it is increasing (daily and monthly trends), and which transactions require immediate attention (high-value and high-risk transactions). By combining these insights, the company can implement targeted actions such as account blocking, device blacklisting, OTP/2FA, manual reviews, merchant audits, and enhanced monitoring—significantly reducing fraudulent transactions while protecting genuine customers and minimising financial losses.









