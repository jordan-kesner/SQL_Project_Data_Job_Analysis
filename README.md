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

![Bar graph for top paying data scientist jobs in Los Angeles](assets/output (4).png)


# What I Learned
# Conclusions