create database finance_data;
use finance_data;
select * from finance;

-- 1.Total Loan applications
select count(distinct id) from finance;

-- 2.month to date mtd
select count(id) from finance where month(issue_date)=12 and year(issue_date)=2021;

-- 3.total funded amount
select sum(loan_amount) from finance;

-- 4.mtd total funded amount
select sum(loan_amount) from finance where month(issue_date)=12;

-- 5.Total Amount Received
select sum(total_payment) from finance;

-- 6.mtd total funded amount
select sum(total_payment) from finance where month(issue_date)=12;

-- 7.Average Interest Rate
select avg(int_rate)*100 from finance;

-- 8.MTD Average Interest
select avg(int_rate)*100 from finance where month(issue_date)=12;

-- 9.Avg DTI
select avg(dti)*100 from finance;

-- 10.MTD Avg DTI
select avg(dti)*100 from finance where month(issue_date)=12;

-- 11.Good Loan Percentage
select count(case when loan_status="Fully paid" or loan_status="Current" then id end)/count(id)*100 from finance;

-- 12.Good Loan Applications
select count(id) from finance where loan_status="Fully paid" or loan_status="Current";

-- 13.Good Loan Funded Amount
select sum(loan_amount) from finance where loan_status="Fully paid" or loan_status="Current";

-- 14.Bad Loan Percentage
select count(case when loan_status="Charged off" then id end)/count(id)*100 from finance;

-- 15.Bad Loan Applications
select count(id) from finance where loan_status="Charged off";

-- 16.Bad Loan Funded Amount
select sum(loan_amount) from finance where loan_status="Charged off";

-- 17.Bad loan received
select sum(total_payment) from finance where loan_status="Charged off";

-- 18.LOAN STATUS
select loan_status,count(id) as Loan_Count,
sum(loan_amount) as Total_amount_funded,
sum(total_payment) as Total_amount_received,
avg(int_rate)*100 as Interest_rate,
avg(dti)*100 as DTI from finance group by loan_status order by Loan_count desc;

-- 19.BANK LOAN REPORT by MONTH
select month(issue_date) as month_number,
monthname(issue_date) as month_name,
count(id) as Total_loan_applications,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received  
from finance group by month_number,month_name order by month_number;

-- 20.BANK LOAN REPORT by STATE
select address_state,
count(id) as Total_loan_applications,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received  
from finance group by address_state order by address_state;

-- 21.BANK LOAN REPORT by term
SELECT 
    term,
    COUNT(id) AS Total_loan_applications,
    SUM(loan_amount) AS Total_funded_amount,
    SUM(total_payment) AS Total_amount_received
FROM
    finance
GROUP BY term
ORDER BY term;

-- 22.employee_length
SELECT 
    emp_length,
    COUNT(id) AS Total_loan_applications,
    SUM(loan_amount) AS Total_funded_amount,
    SUM(total_payment) AS Total_amount_received
FROM
    finance
GROUP BY emp_length
ORDER BY emp_length;

-- 23.PURPOSE
select purpose,
count(id) as Total_loan_applications,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received  
from finance group by purpose order by purpose ;

-- 24.HOME OWNERSHIP
select home_ownership,
count(id) as Total_loan_applications,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received  
from finance group by  home_ownership order by  home_ownership ;


create procedure large_loan_amount() select * from finance where loan_amount>10000;

call large_loan_amount;

select * from





