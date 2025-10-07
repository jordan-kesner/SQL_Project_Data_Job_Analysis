# Introduction
Diving into the data job market! Focusing on data scientist roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high slary in data science.

SQL Queries? Check them out here: [project_sql folder](/project_sql/)
# Background
Data comes from Luke Barousse's [SQL For Data Analytics Course](https://www.lukebarousse.com/products/sql-for-data-analytics).

### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data scientist jobs in Los Angeles?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data scientists?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used
For my dive into the data science job market, I used several tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and discover important insights.
- **PostgreSQL:** The chosen database management system, ideal for handling this type of data.
- **VS Code:** My IDE of choice for programming and database management, as well as executing SQL queries.
- **Git and GitHub:** Essential for version control and sharing my SQL scripts and analysis.
# Analysis
Each query for this project is aimed at inspecting key aspects of the data science job market.

### 1. Top Paying Data Scientist Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
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
```

💰 Salary Insights

- Average salary: ≈ $254K

- Highest: $282.5K at Snapchat

- Lowest: $225K at Riot Games

- Salary range is narrow, showing that top roles are highly competitive and senior-level (mostly manager, lead, or director).

Los Angeles’ top-paying data-science roles are:

- Heavily concentrated in tech and entertainment-adjacent industries

- Managerial or lead-level, blending data leadership, ML deployment, and product impact

- Best-compensated at companies linking AI + product personalization (Snapchat, Stripe) or AI + media (INgrooves, Riot Games).

![Bar graph for top paying data scientist jobs in Los Angeles](assets/top_jobs_graph.png)

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
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
```

Here’s an analysis of the skill distribution for the top 10 data scientist roles in Los Angeles (2023):

- Python dominates all listings, appearing in nearly every role (10/10). It’s the primary language for modeling, data cleaning, and production-level pipelines.

- SQL is the second most common (8 mentions), emphasizing the need for strong database querying and data wrangling skills.

- Scikit-learn appears frequently (7 mentions), showing that classical machine learning and model deployment remain key requirements.

- R and TensorFlow tie (5 mentions each), reflecting dual needs — statistical modeling (R) and deep learning (TensorFlow).

- Overall, hiring trends suggest hybrid proficiency — Python + SQL + ML libraries — as the foundation for data scientists in LA, with bonus points for deep learning and statistical expertise.

![](assets/top_skills.png)

### 3. In-Demand Skills for Data Scientists
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

| **Company**             | **Role**                      | **Avg Salary ($)** | **Focus Area / Industry**                  |
|--------------------------|------------------------------|--------------------|--------------------------------------------|
| Snapchat                 | Lead Data Scientist           | 282,500            | Social media personalization, ML ranking   |
| Stripe                   | Data Science Manager (Risk)   | 281,450            | Fintech, risk modeling, fraud detection    |
| Circle                   | Director, Data Science        | 272,500            | Crypto, financial analytics                |
| INgrooves Music Group     | Data Scientist                | 250,000            | Music analytics, recommendations           |
| DoorDash                 | Data Scientist                | 245,000            | Operations optimization, delivery logistics|
| Riot Games               | Data Scientist                | 229,500            | Gaming analytics, player behavior          |





# What I Learned
# Conclusions