SQL Developer Internship - Task 7: Views
Overview
This is my Task 7 submission for creating views in MySQL Workbench. I built a database internship_task7 with employees and departments tables. The SQL script (task7.sql) includes views: simple, complex, secure, and aggregated, addressing all 10 interview questions with examples.
I used joins, filters, and aggregations as per hints, and added short comments to show my thought process. No paid tools used; relied on MySQL Workbench Community and MySQL docs.
Steps

Created database and tables.
Added sample data.
Built views: simple, joined, secure, with CHECK, aggregated.
Explained interview questions with queries.
Tested updates, drops, and limitations.

Files

task7.sql: SQL script with views and comments.
 ER-DIAGRAM7
 create_views.png: Creating views.
query_views.png: Querying views.
update_attempt.png: Update failure on complex view.
with_check_option_error.png: CHECK OPTION error.



Key Learnings
Views simplify queries, enhance security, and reuse logic. Limitations include non-updatable complex views and no direct indexing.
Interview Questions

View? Virtual table from SELECT. See employee_overview.
Update view? Simple yes, complex no. employee_overview updatable, dept_employee_details not.
Materialized view? Stores data. Simulated with materialized_employee.
View vs table? Table stores, view queries. employees vs employee_overview.
Drop view? DROP VIEW. Example in script.
Why views? Abstraction, security. See dept_employee_details.
Indexed views? Only materialized. See idx_salary.
Secure with views? Limit columns. See public_employee_info.
Limitations? No updates for complex views. Example in script.
WITH CHECK? Enforces WHERE. See high_earners.

Run task7.sql in MySQL Workbench. Thanks for reviewing!
