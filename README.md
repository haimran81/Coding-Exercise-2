# Coding Exercise #2

This assignment demonstrates Oracle SQL table creation, data manipulation, and queries using the HR sample schema. All patient information is fictional.

## Files

| File | Contents |
| --- | --- |
| [oracle_sql_assignment.sql](oracle_sql_assignment.sql) | SQL statements with a note explaining each step |
| [SQL_Results.xlsx](SQL_Results.xlsx) | Exported query results on three worksheets |

## Part 1: create and modify a table

| Step | Action |
| --- | --- |
| 1 | Created `patient_visits` with 10 columns, using `VARCHAR2`, `INTEGER`, `NUMBER(10,2)`, `FLOAT`, and `TIMESTAMP` data types. |
| 2 | Inserted 12 fictional patient visit records. |
| 3 | Updated patient 1004's `visit_status` from `Scheduled` to `Completed`. |
| 4 | Added an `insurance_provider` column using `ALTER TABLE`, increasing the column count to 11. |
| 5 | Deleted the visit with a `Cancelled` status, leaving 11 rows. |

## Part 2: query the HR sample schema

| Excel worksheet | Query |
| --- | --- |
| `Selected_Fields` | Selected `employee_id`, `first_name`, `last_name`, `salary`, and `department_id` from `HR.EMPLOYEES`. |
| `Inner_Join` | Joined `HR.EMPLOYEES` and `HR.DEPARTMENTS` using an inner join on `department_id`. |
| `Outer_Join` | Joined the same tables using a left outer join on `department_id`. |

Each query includes `ORDER BY` and `FETCH FIRST 100 ROWS ONLY` to return a maximum of 100 rows in a defined order.

## Inner join and outer join comparison

The inner join combined employees with their matching departments using `department_id`. The left outer join also included employees without a matching department. For example, employee 178, Kimberely Grant, appeared in the outer join with blank department information but was excluded from the inner join. Both queries were limited to a maximum of 100 rows, so the difference is demonstrated by the employee records included rather than simply comparing the number of exported rows.

## Running the SQL

Run the numbered sections in order in Oracle FreeSQL. The table creation and inserts should be run in a personal schema where `patient_visits` has not already been created. The script assumes read access to the HR sample tables for Part 2. `COMMIT` saves the inserted, updated, and deleted data. The `CREATE TABLE`, `INSERT`, and `ALTER TABLE` steps are intended to be run once for this exercise.
