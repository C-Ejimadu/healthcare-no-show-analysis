# Healthcare Appointment No-Show Analysis Using SQL

## Overview
This project analyzes **UK clinic appointment data** to identify patterns associated with missed appointments and measure the operational and financial impact of no-shows. The dataset includes **10,000 appointment records** and uses **GBP-based financial fields** and **UK post-code areas**, making the analysis specific to a **United Kingdom clinic setting**.

## Objective
The goal of this project was to:
- measure the overall scale of appointment no-shows
- identify segments with higher no-show rates
- estimate the financial and operational impact of missed appointments

## Features
- SQL analytics
- KPI calculations
- Revenue loss tracking

## Installation
Download the project and open MySQL Workbench.

## Tools Used
- MySQL
- SQL

## Dataset Context
This dataset represents **UK clinic appointment data** and includes fields related to:
- patient demographics
- clinic and appointment type
- scheduling and booking timing
- reminder activity
- estimated revenue loss in **GBP**
- staff idle cost in **GBP**
- postcode areas
- no-show outcome

## Key Findings

### KPI Summary
- **Total Appointments:** 10,000  
- **Total No-Shows:** 2,143  
- **Overall No-Show Rate:** 21.43%  
- **Total Estimated Revenue Loss From No-Shows:** £221,343  
- **Total Staff Idle Cost From No-Shows:** £77,470.05  

### Segmentation Insights
- **Highest No-Show Rate by Appointment Type:** New Patient — **21.47%**
- **Highest No-Show Rate by Clinic Type:** Physiotherapy — **21.79%**
- **Highest No-Show Rate by Gender:** Male — **22.11%**
- **Higher No-Show Rate by Weekend Status:** Non-Weekend — **21.46%**
- **Higher No-Show Rate by SMS Reminder Status:** No SMS Reminder Sent — **26.61%**
- **Highest No-Show Rate by Appointment Hour:** 17:00 (5 PM) — **23.88%**
- **Highest No-Show Rate by Post-code Area:** LS1 — **22.96%**
- **Highest No-Show Rate by Reminder Response:** Cancelled — **29.7%**

### Operational / Financial Insights
- **Highest Revenue Loss by Clinic Type:** Physiotherapy — **£43,955**
- **Highest Revenue Loss by Post-code Area:** CF10 — **£23,661**
- **Highest Staff Idle Cost by Clinic Type:** GP (General Practitioner) — **£26,446.35**
- **Highest No-Show Rate by Days-In-Advance Group:** 15–30 Days — **24.76%**

## Business Takeaways
- No-shows affect more than **1 in 5 appointments** in this UK clinic dataset.
- Appointments with **no SMS reminder sent** had a noticeably higher no-show rate.
- **Late afternoon appointments** showed the highest no-show rate by hour.
- **Physiotherapy** had both the highest clinic-type no-show rate and the highest revenue loss from missed appointments.
- Patients booked **15–30 days in advance** showed the highest no-show rate, suggesting longer lead times may increase appointment risk.
- Certain **UK post-code areas**, especially **LS1** and **CF10**, showed elevated no-show-related impact.

## Recommendations
- Strengthen reminder workflows, especially for appointments with **no SMS reminder sent**.
- Target **new patients** and **Physiotherapy appointments** for additional attendance support.
- Review scheduling strategy for **late afternoon appointments**.
- Monitor bookings made **15–30 days in advance**, since that group showed the highest no-show rate.
- Prioritize intervention in higher-impact post-code areas such as **LS1** and **CF10**.

## SQL Skills Demonstrated
- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- `COUNT()`
- `AVG()`
- `SUM()`
- `ROUND()`
- `CASE WHEN`

## Project Files
- `healthcare_no_show_analysis.sql`
- `README.md`

## Conclusion
This project shows how **UK clinic appointment data** can be analyzed with SQL to uncover no-show patterns, quantify financial impact in **GBP**, and highlight opportunities for operational improvement.