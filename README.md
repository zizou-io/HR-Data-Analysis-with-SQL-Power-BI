# HR-Data-Analysis-with-SQL-Power-BI

<img width="811" alt="Screenshot 2024-03-05 at 16 47 32" src="https://github.com/zizou-io/HR-Data-Analysis-with-SQL-Power-BI/blob/main/WPS%20Office.png">

<img width="815" alt="Screenshot 2024-03-05 at 16 48 01" src="https://github.com/zizou-io/HR-Data-Analysis-with-SQL-Power-BI/blob/main/_WPS%20Office.png">

# HUMAN RESOURCE DATA ANALYSIS

Welcome to the HR Data Analysis project repository! This project delves into the intricacies of HR analytics, employing rigorous data cleaning & analysis in SQL and data visualization in PowerBI to extract valuable insights into employee demographics, tenure, turnover rates, and more.




## OBJECTIVE

Our aim is to uncover actionable insights that drive informed decision-making and enhance organizational effectiveness. Through meticulous data cleaning and in-depth analysis, we endeavor to provide stakeholders with the knowledge they need to optimize workforce management strategies.


## DATA

**Dataset Information:** The dataset utilized comprises HR data spanning from the year 2000 to 2020, containing over 22,000 records.

**Data Processing:** For data processing and analysis, MySQL Workbench was employed to refine and analyze the dataset.

**Data Visualization:** To visualize the insights extracted from the HR dataset, PowerBI was utilized, enabling comprehensive data visualization and analysis.

## DATA CLEANING PROCESS

During the data cleaning phase, we commenced with a dataset containing 22,000 rows of information. To streamline analysis, we first renamed relevant columns and also focused on standardizing the format of date columns to ensure consistency across the dataset. This involved formatting dates and aligning them with a uniform structure. Additionally, we adjusted data types as needed and introduced an age column for clarity. To ensure data integrity and compliance, we filtered out records where individuals were below 18 years of age.


## PROBLEM STATEMENT

The organization aims to gain comprehensive insights into various aspects of its workforce through analytical exploration. The following topics will be addressed:

- **Gender Distribution:** Understanding the breakdown of gender within the workforce to ensure gender diversity and equity.
- **Ethnic Diversity:** Exploring the distribution of race/ethnicity among employees to foster an inclusive and diverse workplace environment.
- **Age Profile:** Analyzing the distribution of employee ages to gain insights into the generational composition of the workforce.
- **Work Location:** Examining the distribution of employees between headquarters and remote locations to aid in workforce management and resource allocation.
- **Tenure Analysis:** Investigating the average tenure of terminated employees to understand retention patterns and factors influencing employee turnover.
- **Gender Dynamics by Department and Job Title:** Understanding how gender distribution varies across departments and job titles to identify areas for gender equality initiatives.
- **Job Title Distribution:** Exploring the distribution of job titles across the organization to gain insights into the organizational structure and hierarchy.
- **Turnover Rate:** Identifying departments with the highest turnover rates to address retention challenges.
- **Employee Distribution by State:** Analyzing the geographic distribution of employees to understand the regional presence and potential areas for expansion or recruitment.
- **Employee Count Trends:** Examining trends in the company's employee count over time to identify growth patterns and anticipate future workforce needs.
- **Tenure Distribution by Department:** Understanding tenure distribution within each department to gain insights into employee loyalty and career progression opportunities.

Addressing these analytical questions will enhance the organization's understanding of workforce dynamics and facilitate informed decision-making to support organizational growth and development.



## SUMMARY OF FINDINGS

- The workforce is predominantly male.
- White ethnicity is the most prevalent, while Native Hawaiian and American Indian ethnicities are the least prevalent.
- The age range of employees spans from 21 to 58 years old.
- Employees were categorized into five age groups: 18-24, 25-34, 35-44, 45-54, and 55-64, with the highest concentration in the 35-44 age group, followed by 25-34, and the lowest in the 55-64 group.
- A majority of employees work at the headquarters rather than remotely.
- Terminated employees had an average tenure of approximately 8 years.
- Gender distribution across departments is relatively balanced, with a slightly higher number of male employees overall.
- The Marketing department exhibits the highest turnover rate, followed by Training. Departments with the lowest turnover rates include Research and Development, Support, and Legal.
- The majority of employees originate from Ohio, while the fewest are from Wisconsin.
- There has been a net increase in employee count over the years.
- The average tenure within each department is approximately 8 years.

## LIMITATIONS

- Records with negative ages (967 records) were excluded during querying, and ages considered were 18 years and above.
- Term dates far into the future (1599 records) were not included in the analysis; only term dates less than or equal to the current date were considered.



## CONCLUSION

In conclusion, the HR Data Analysis project sheds light on critical aspects of workforce dynamics and organizational effectiveness. Through meticulous data cleaning, analysis, and visualization, valuable insights into employee demographics, tenure, turnover rates, and more have been extracted. The findings provide a deeper understanding of workforce composition, retention patterns, and regional distribution, empowering stakeholders to make informed decisions to drive organizational growth and development. Despite some limitations in data consistency, the analysis offers a comprehensive view of workforce trends and highlights areas for further exploration and improvement in HR management practices.
