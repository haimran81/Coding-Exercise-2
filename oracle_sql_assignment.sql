-- CODING EXERCISE #2: ORACLE SQL
-- All patient information in this script is fictional.
-- Run one numbered section at a time and check its results.
-- Keep this file: the comments provide a note for each assignment step.
-- Query outputs are saved separately in SQL_Results.xlsx.
-- Do not rerun completed CREATE, INSERT, or ALTER steps without checking first.

-- STEP 1: CREATE A TABLE WITH 10 COLUMNS
-- VARCHAR2 stores variable-length text (Oracle's recommended VARCHAR type).
-- INTEGER stores whole numbers. NUMBER(10,2) stores fixed decimal amounts.
-- FLOAT demonstrates a floating-point numeric type.
-- TIMESTAMP stores both the date and time.
-- PRIMARY KEY makes patient_id unique and prevents a blank patient_id.

CREATE TABLE patient_visits (
    patient_id      INTEGER PRIMARY KEY,
    first_name      VARCHAR2(30),
    last_name       VARCHAR2(30),
    age             INTEGER,
    gender          VARCHAR2(20),
    department      VARCHAR2(40),
    visit_cost      NUMBER(10,2),
    temperature     FLOAT,
    visit_datetime  TIMESTAMP,
    visit_status    VARCHAR2(20)
);

-- Check: the table exists, with 10 columns and no rows yet.
SELECT *
FROM patient_visits;

-- STEP 2: POPULATE THE TABLE WITH 12 ROWS
-- Each INSERT adds one fictional patient's visit.
-- The column list specifies where each value belongs.
-- TIMESTAMP literals avoid dependence on the account's date display settings.

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1001, 'Maya', 'Brooks', 34, 'Female', 'Cardiology',
     250.50, 98.6, TIMESTAMP '2026-10-01 09:00:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1002, 'Omar', 'Reed', 52, 'Male', 'Endocrinology',
     180.75, 98.4, TIMESTAMP '2026-10-01 10:30:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1003, 'Lena', 'Patel', 27, 'Female', 'Primary Care',
     120.00, 99.1, TIMESTAMP '2026-10-02 08:45:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1004, 'Noah', 'Rivera', 41, 'Male', 'Orthopedics',
     310.25, 98.7, TIMESTAMP '2026-10-02 11:00:00', 'Scheduled');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1005, 'Ava', 'Chen', 63, 'Female', 'Neurology',
     275.80, 98.2, TIMESTAMP '2026-10-03 09:15:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1006, 'Eli', 'Morgan', 19, 'Male', 'Primary Care',
     95.50, 98.9, TIMESTAMP '2026-10-03 13:30:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1007, 'Sara', 'Ali', 46, 'Female', 'Cardiology',
     225.00, 98.5, TIMESTAMP '2026-10-04 10:00:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1008, 'Leo', 'Bennett', 58, 'Male', 'Pulmonology',
     198.40, 99.0, TIMESTAMP '2026-10-04 14:00:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1009, 'Nina', 'Davis', 31, 'Female', 'Dermatology',
     145.25, 98.6, TIMESTAMP '2026-10-05 08:30:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1010, 'Adam', 'Wilson', 67, 'Male', 'Endocrinology',
     205.60, 98.3, TIMESTAMP '2026-10-05 11:15:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1011, 'Zoe', 'Thomas', 24, 'Female', 'Primary Care',
     110.00, 98.8, TIMESTAMP '2026-10-06 09:45:00', 'Completed');

INSERT INTO patient_visits
    (patient_id, first_name, last_name, age, gender, department,
     visit_cost, temperature, visit_datetime, visit_status)
VALUES
    (1012, 'Ryan', 'Scott', 39, 'Male', 'Orthopedics',
     290.00, 98.6, TIMESTAMP '2026-10-06 15:00:00', 'Cancelled');

-- COMMIT saves the inserted rows.
COMMIT;

-- Check: total_rows should be 12 at this stage.
SELECT COUNT(*) AS total_rows
FROM patient_visits;

SELECT *
FROM patient_visits
ORDER BY patient_id;

-- STEP 3: UPDATE INFORMATION IN ONE COLUMN
-- Change patient 1004's visit_status from Scheduled to Completed.
-- WHERE identifies the specific row to change.

-- Before the update: Scheduled.
SELECT patient_id, first_name, last_name, visit_status
FROM patient_visits
WHERE patient_id = 1004;

UPDATE patient_visits
SET visit_status = 'Completed'
WHERE patient_id = 1004;

COMMIT;

-- After the update: Completed.
SELECT patient_id, first_name, last_name, visit_status
FROM patient_visits
WHERE patient_id = 1004;

-- STEP 4: ALTER THE TABLE TO ADD A COLUMN
-- Add insurance_provider without replacing the existing table or its rows.
-- The table now has 11 columns. The new column initially contains NULL.

ALTER TABLE patient_visits
ADD (insurance_provider VARCHAR2(50));

-- Check the added column; blank values are expected at this point.
SELECT patient_id, first_name, insurance_provider
FROM patient_visits
ORDER BY patient_id;

-- Check the table structure: expect 11 column definitions.
-- Oracle may display INTEGER columns as NUMBER in its metadata.
SELECT column_id, column_name, data_type
FROM user_tab_columns
WHERE table_name = 'PATIENT_VISITS'
ORDER BY column_id;

-- STEP 5: DELETE A ROW BASED ON A CRITERION
-- Remove visits whose status is Cancelled.
-- In this dataset, only patient 1012 has that status.

-- Preview the row that matches the deletion criterion.
SELECT patient_id, first_name, last_name, visit_status
FROM patient_visits
WHERE visit_status = 'Cancelled';

DELETE FROM patient_visits
WHERE visit_status = 'Cancelled';

COMMIT;

-- Check: total_rows should now be 11.
SELECT COUNT(*) AS total_rows
FROM patient_visits;

-- Check: this query should now return no rows.
SELECT patient_id, first_name, last_name, visit_status
FROM patient_visits
WHERE visit_status = 'Cancelled';

-- STEP 6A: SELECT SPECIFIC FIELDS AND LIMIT THE RESULT TO 100 ROWS
-- Use the HR sample schema, which contains human-resources tables.
-- Select five fields instead of every field in the employees table.
-- ORDER BY defines which rows come first.
-- FETCH FIRST 100 ROWS ONLY returns no more than 100 rows.
-- Save this actual query result to Excel sheet: Selected_Fields.

SELECT employee_id,
       first_name,
       last_name,
       salary,
       department_id
FROM hr.employees
ORDER BY employee_id
FETCH FIRST 100 ROWS ONLY;

-- STEP 6B: INNER JOIN TWO TABLES, LIMITED TO 100 ROWS
-- e and d are short table names called aliases.
-- Join employees and departments using their shared department_id.
-- An INNER JOIN includes only rows with a matching department.
-- Save this actual query result to Excel sheet: Inner_Join.

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
    ON e.department_id = d.department_id
ORDER BY e.department_id NULLS FIRST, e.employee_id
FETCH FIRST 100 ROWS ONLY;

-- STEP 6C: LEFT OUTER JOIN THE SAME TWO TABLES, LIMITED TO 100 ROWS
-- LEFT OUTER JOIN preserves employees even without a matching department.
-- For unmatched employees, department_name is NULL (blank in many displays).
-- NULLS FIRST places unassigned employees early enough to see in this export.
-- Both exports may contain 100 rows because both queries are capped at 100.
-- Compare the employee records and blank departments, not only row totals.
-- Save this actual query result to Excel sheet: Outer_Join.

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
LEFT OUTER JOIN hr.departments d
    ON e.department_id = d.department_id
ORDER BY e.department_id NULLS FIRST, e.employee_id
FETCH FIRST 100 ROWS ONLY;

-- OBSERVED INNER JOIN AND OUTER JOIN COMPARISON
-- The inner join includes employees with a matching department.
-- The left outer join also retains employees without a matching department.
-- Employee 178, Kimberely Grant, appeared in the outer join with blank
-- department_id and department_name values (NULL) but is excluded from the
-- inner join because there is no matching department.
-- Both queries are capped at 100 rows, so compare the employee records
-- included rather than relying only on the exported row counts.
-- The required query outputs are in SQL_Results.xlsx on the Selected_Fields,
-- Inner_Join, and Outer_Join worksheets.
