SELECT * FROM UTIL_REP_2022;

SELECT Resource_grade, Month_Beginning, Unavailability_hours, Booking_hours, Work_hours, overall_util_rate
INTO UTILIZATION_REPORT
FROM UTIL_REP_2022
UNION ALL
SELECT Resource_grade, Month_Beginning, Unavailability_hours, Booking_hours, Work_hours, overall_util_rate
FROM UTIL_REP_2023
UNION ALL
SELECT Resource_grade, Month_Beginning, Unavailability_hours, Booking_hours, Work_hours, overall_util_rate
FROM UTIL_REP_2024
UNION ALL
SELECT Resource_grade, Month_Beginning, Unavailability_hours, Booking_hours, Work_hours, overall_util_rate
FROM UTIL_REP_2025

SELECT * FROM UTILIZATION_REPORT

SELECT * FROM UTILIZATION_REPORT WHERE BOOKING_HOURS>WORK_HOURS