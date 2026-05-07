-- Section 1: KPI Queries

-- Total Appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- Total No-Shows
SELECT COUNT(*) AS total_no_shows
FROM appointments
WHERE no_show = 1;

-- Overall No-Show Rate
SELECT ROUND(AVG(no_show) * 100, 2) AS overall_no_show_rate
FROM appointments;

-- Total Estimated Revenue Loss From No-Shows
SELECT ROUND(SUM(estimated_revenue_loss_gbp), 2) AS total_no_show_revenue_loss_gbp
FROM appointments
WHERE no_show = 1;

-- Total Staff Idle Cost From No-Shows
SELECT ROUND(SUM(staff_idle_cost_gbp), 2) AS total_no_show_staff_idle_cost_gbp
FROM appointments
WHERE no_show = 1;

-- Section 1 Results:
-- Total Appointments: 10,000
-- Total No-Shows: 2,143
-- Overall No-Show Rate: 21.43%
-- Total Estimated Revenue Loss From No-Shows: £221,343 GBP
-- Total Staff Idle Cost From No-Shows: £77,470.05 GBP


-- Section 2: Segmentation Queries

-- No-Show Rate By Appointment Type
SELECT appointment_type,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY appointment_type
ORDER BY no_show_rate DESC;

-- No-Show Rate By Clinic Type
SELECT clinic_type,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY clinic_type
ORDER BY no_show_rate DESC;

-- No-Show Rate By Gender
SELECT gender,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY gender
ORDER BY no_show_rate DESC;

-- No-Show Rate By Weekend Status
SELECT is_weekend,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY is_weekend
ORDER BY no_show_rate DESC;

-- No-Show Rate By SMS Reminder Sent
SELECT sms_reminder_sent,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY sms_reminder_sent
ORDER BY no_show_rate DESC;

-- No-Show Rate By Appointment Hour
SELECT appointment_hour,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY appointment_hour
ORDER BY no_show_rate DESC;

-- No-Show Rate By Postcode Area
SELECT postcode_area,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY postcode_area
ORDER BY no_show_rate DESC;

-- No-Show Rate By Reminder Response
SELECT reminder_response,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY reminder_response
ORDER BY no_show_rate DESC;

-- Section 2 Results:
-- Appointment Type With Highest No-Show Rate: New Patient – 21.47%
-- Clinic Type With Highest No-Show Rate: Physiotherapy – 21.79%
-- Gender With Highest No-Show Rate: Male – 22.11%
-- Weekend Or Non-Weekend Higher No-Show Rate: Non-Weekend – 21.46%
-- SMS Sent Or Non-SMS Sent Higher No-Show Rate: Non-SMS Sent – 26.61%
-- Appointment Hour With Highest No-Show Rate: 17:00 (5 PM) – 23.88%
-- Postcode Area With Highest No-Show Rate: LS1 – 22.96%
-- Reminder Response With Highest No-Show Rate: Cancelled – 29.7%


-- Section 3: Operational / Financial Queries

-- Total Estimated Revenue Loss By Clinic Type For No-Shows
SELECT clinic_type,
       ROUND(SUM(estimated_revenue_loss_gbp), 2) AS total_rev_loss_by_clinic_type_no_shows
FROM appointments
WHERE no_show = 1
GROUP BY clinic_type
ORDER BY total_rev_loss_by_clinic_type_no_shows DESC;

-- Total Estimated Revenue Loss By Postcode Area For No-Shows
SELECT postcode_area,
       ROUND(SUM(estimated_revenue_loss_gbp), 2) AS total_rev_loss_by_postcode_area_no_shows
FROM appointments
WHERE no_show = 1
GROUP BY postcode_area
ORDER BY total_rev_loss_by_postcode_area_no_shows DESC;

-- Total Staff Idle Cost By Clinic Type For No-Shows
SELECT clinic_type,
       ROUND(SUM(staff_idle_cost_gbp), 2) AS total_staff_idle_cost_gbp_by_clinic_type_no_shows
FROM appointments
WHERE no_show = 1
GROUP BY clinic_type
ORDER BY total_staff_idle_cost_gbp_by_clinic_type_no_shows DESC;

-- No-Show Rate By Days-In-Advance Group
SELECT CASE
           WHEN days_in_advance <= 1 THEN '0-1 Days'
           WHEN days_in_advance <= 7 THEN '2-7 Days'
           WHEN days_in_advance <= 14 THEN '8-14 Days'
           WHEN days_in_advance <= 30 THEN '15-30 Days'
           ELSE '31+ Days'
       END AS days_in_advance_group,
       ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY CASE
             WHEN days_in_advance <= 1 THEN '0-1 Days'
             WHEN days_in_advance <= 7 THEN '2-7 Days'
             WHEN days_in_advance <= 14 THEN '8-14 Days'
             WHEN days_in_advance <= 30 THEN '15-30 Days'
             ELSE '31+ Days'
         END
ORDER BY no_show_rate DESC;

-- Section 3 Results:
-- Highest Revenue Loss From No-Shows By Clinic Type: Physiotherapy – £43,955 GBP
-- Highest Revenue Loss By Postcode Area: CF10 – £23,661 GBP
-- Highest Staff Idle Cost By Clinic Type: GP (General Practitioner) – £26,446.35 GBP
-- Highest No-Show Rate By Days-In-Advance Group: 15-30 Days – 24.76%