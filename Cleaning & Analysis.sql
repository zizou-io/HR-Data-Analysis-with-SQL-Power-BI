SELECT * FROM `Human Resource DB`.hr;

-- DATA CLEANING --

-- changing column name from id to emp id
alter table hr
change column id emp_id VARCHAR(20) null;

-- Checking datatypes
describe hr;

select birthdate from hr;

-- turning off safemode in order to update data
set sql_safe_updates = 0;

-- cleaning inconsistent birthdates data
update hr
set birthdate = case
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d- %Y'), '%Y-%m-%d')
else null
end;

-- changing birthdate datatype from text to date
alter table hr
modify column birthdate DATE;

-- cleaning inconsistent hiredates data
update hr
set hire_date = case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d- %Y'), '%Y-%m-%d')
else null
end;

-- changing hire date datatype from text to date
alter table hr
modify column hire_date DATE;

-- cleaning termdate column by keeping only date and removing time
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

-- changing termdate datatype from text to date
alter table hr
modify column termdate DATE;

-- adding a new collumn 'age' to hr table
alter table hr add column age INT;

update hr
set age = timestampdiff(year,birthdate,curdate());

-- checking for min & max age
select min(age) as youngest, max(age) as oldest from hr

-- removing employee details for emp with age below 18
select count(*) from hr where age <18;

delete from hr
where age <18;

-- DATA ANALYSIS --

-- Questions:
-- 1. What is the gender breakdown of employees in the company?

select gender,count(emp_id) as count_of_emp
from hr
where age >=18 and termdate = 0000-00-00
group by gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?

select race,count(*) as count
from hr
where age >=18 and termdate = 0000-00-00
group by race
order by count(*) desc;

-- -- 3. What is the age distribution of employees in the company?

select case 
when age >= 18 and age <= 24 then '18-24'
when age >= 25 and age <= 34 then '25-34'
when age >= 35 and age <= 44 then '35-44'
when age >= 45 and age <= 54 then '45-54'
when age >= 55 and age <= 64 then '55-64'
else '65+' end as age_group, count(*) as count
from hr
where age >=18 and termdate = 0000-00-00
group by age_group
order by age_group 

select case 
when age >= 18 and age <= 24 then '18-24'
when age >= 25 and age <= 34 then '25-34'
when age >= 35 and age <= 44 then '35-44'
when age >= 45 and age <= 54 then '45-54'
when age >= 55 and age <= 64 then '55-64'
else '65+' end as age_group,gender, count(*) as count
from hr
where age >=18 and termdate = 0000-00-00
group by age_group, gender
order by age_group, gender 

-- 4. How many employees work at headquarters versus remote locations?

select location, count(*)
from hr
where age >=18 and termdate = 0000-00-00
group by location

-- 5. What is the average length of employment for employees who have been terminated?

select round(avg(datediff(termdate,hire_date))/365,0) as avg_length
from hr
where age >=18 and termdate != 0000-00-00 and termdate <= curdate()


-- 6. How does the gender distribution vary across departments and job titles?

select department, gender, count(*)
from hr
where age >=18 and termdate = 0000-00-00
group by department, gender
order by department, gender

-- 7. What is the distribution of job titles across the company?

select jobtitle, count(*)
from hr
where age >=18 and termdate = 0000-00-00
group by jobtitle
order by jobtitle desc

-- 8. Which department has the highest turnover rate?

select department, total_count, terminated_count, 
(terminated_count/total_count) as termination_rate
from (
	select department, count(*) as total_count,
	sum(case when termdate != '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminated_count
	from hr
	where age >= 18
	group by department) as subquery
order by termination_rate desc

-- 9. What is the distribution of employees across locations by city and state?

select location_state, count(*)
from hr
where age >=18 and termdate = 0000-00-00
group by location_state
order by count(*) desc

select location_city, count(*)
from hr
where age >=18 and termdate = 0000-00-00
group by location_city
order by count(*) desc

-- 10. How has the company's employee count changed over time based on hire and term dates?

 select year, hires, terminations, (hires-terminations) as net_change,
 round(((hires-terminations)/hires)*100,2) as net_change_percent
 from (
	 select year(hire_date) as year,
	 count(*)as hires,
	 sum(case when termdate != 0000-00-00 and termdate >= curdate() then 1 else 0 end )as terminations
	 from hr
     where age >= 18
	 group by year(hire_date))as subquery
order by year asc

-- 11. What is the tenure distribution for each department?

select department, round(avg(datediff(termdate,hire_date))/365,0) as avg_tenure
from hr
where age >=18 and termdate <= curdate() and termdate != '0000-00-00'
group by department
