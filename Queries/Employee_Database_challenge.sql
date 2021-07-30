-- Steps 1 - 7
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
	LEFT JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name,
	title
INTO retirement_titles_latest
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Get Counts of Retirements by Title
SELECT COUNT (title) as count, title 
INTO retirement_titles_counts
FROM retirement_titles_latest
GROUP BY title
ORDER BY count DESC;