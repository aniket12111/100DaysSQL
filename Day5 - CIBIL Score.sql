CIBIL score, often referred to as a credit score, is a numerical representation of an individual's creditworthiness.While the exact formula used by credit bureaus like CIBIL may not be publicly disclosed and can vary slightly
  between bureaus, the following are some common factors that typically influence the calculation of a credit score:

**Payment History: **
  This accounts for the largest portion of your credit score. It includes factors such as whether you pay your bills on time, any late payments, defaults, bankruptcies, etc. Assume this accounts for 70 percent of your credit score.

**Credit Utilization Ratio: **
  This is the ratio of your credit card balances to your credit limits. Keeping this ratio low (ideally below 30%) indicates responsible credit usage. Assume it accounts for 30% of your score and below logic to calculate it: 

           Utilization below 30% = 1
           Utilization between 30% and 50% = 0.7
           Utilization above 50% = 0.5

Assume that we have credit card bills data for March 2023 based on that we need to calculate credit utilization ratio.

Final Credit score formula = (on_time_loan_or_bill_payment)/total_bills_and_loans * 70 + Credit Utilization Ratio * 30 

 
**Table: customers(primary key : customer_id )**

column name	data type 
customer_id 	int
credit_limit 	int
 

 

 

 

Table: loans(primary key : loan_id )

column name	data type 
customer_id 	int
loan_id 	int
loan_due_date 	date
 

 

 

 

 

Table: credit_card_bills(primary key : bill_id )

column name	data type 
customer_id 	int
bill_id 	int
bill_due_date 	date
balance_amount 	int
 

 

 

 

 

 

Table: customer_transactions(primary key : loan_bill_id )

column name	data type 
loan_bill_id 	int
transaction_type 	varchar(10)
transaction_date	date
 

 

 

 

 

Expected Output: 

customer_id	cibil_score
1	82.5
2	91.0
