/* 
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focus on roles with specified salaries, regardless of location
- Why? Reveals how different skills impact salary levels for Data Analysts 
and helps identify the most financially rewrading skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Asana ($215K) – Indicates value placed on data science managers and team leads skilled in agile project management and workflow orchestration.

Airtable ($201K) – Reflects the rise of hybrid low-code data tools for collaborative data ops and prototyping.

Red Hat ($189K) – Signals strong demand for engineers comfortable deploying models and pipelines in enterprise Linux environments.

Watson ($187K) – Emphasizes the premium on enterprise AI/ML and NLP skills, especially in IBM ecosystems.

Elixir ($171K) – Suggests that scalable, concurrent backend development for AI systems is highly rewarded.

Overall, high-paying skills lean toward operational and integration tools — connecting AI, infrastructure, and workflow automation — rather than just modeling frameworks. 
*/