/* 
Question: What are the top-paying data scientist jobs?
-Identify the 10 highest-paying Data Scientist roles that are available in Los Angeles.
-Focuses on job postings with specified salaries (remove nulls).
-Why? Highlight top-paying opportunities for Data Scientists, offers insight into employment.
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location LIKE '%Los Angeles%' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;