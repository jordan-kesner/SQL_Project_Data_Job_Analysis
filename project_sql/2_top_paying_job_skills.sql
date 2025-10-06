/* 
Question: What skills are required for the top paying Data Scientist roles?
- Use the top 10 highest paying Data Scientist jobs in Los Angeles from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills.
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id


/*
Python dominates all listings, appearing in nearly every role (10/10). It’s the primary language for modeling, data cleaning, and production-level pipelines.

SQL is the second most common (8 mentions), emphasizing the need for strong database querying and data wrangling skills.

Scikit-learn appears frequently (7 mentions), showing that classical machine learning and model deployment remain key requirements.

R and TensorFlow tie (5 mentions each), reflecting dual needs — statistical modeling (R) and deep learning (TensorFlow).

Overall, hiring trends suggest hybrid proficiency — Python + SQL + ML libraries — as the foundation for data scientists in LA, with bonus points for deep learning and statistical expertise.
*/