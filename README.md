# 🍽️ Swiggy Sales Analytics Dashboard | PostgreSQL + Microsoft Excel

A complete **Sales Analytics Project** built using **PostgreSQL** for data analysis and **Microsoft Excel** for creating an interactive dashboard. This project analyzes **197,430 Swiggy food orders** to generate business insights through SQL queries, KPIs, Pivot Tables, Pivot Charts, Slicers, and Excel Dashboard visualizations.

## 📊 Dashboard Preview
 **Swiggy Sales Analytics Dashboard**
 
**Dashboard KPIs**
* 💰 **Total Sales:** ₹53.01 Million
* ⭐ **Average Rating:** 4.34
* 👍 **Rating Count:** 5.59 Million
* 🛒 **Total Orders:** 197.43K
* 💳 **Average Order Value:** ₹268.51

The dashboard provides an interactive overview of sales performance across states, cities, restaurants, food categories, and different time periods.

## 🎯 Project Objective
The objective of this project is to analyze Swiggy sales data using **PostgreSQL** and present meaningful business insights through an interactive **Microsoft Excel Dashboard**.

This project helps answer key business questions such as:
* Which cities generate the highest sales?
* Which states contribute the most revenue?
* Which food categories are most popular?
* How do sales vary monthly, weekly, and daily?
* Which restaurants perform best based on revenue and ratings?

## 🛠️ Tools & Technologies
* **Database:** PostgreSQL
* **SQL Tool:** pgAdmin 4
* **Dashboard & Visualization:** Microsoft Excel
* **Excel Features Used:** Pivot Tables, Pivot Charts, Slicers, Conditional Formatting, KPI Cards, Maps
* **Dataset:** Swiggy Orders Dataset (197,430 Records)

## 📁 Dataset Overview
The dataset contains **197,430 food order records** with the following columns:

| Column          | Description                      |
| --------------- | -------------------------------- |
| State           | State where the order was placed |
| City            | Customer city                    |
| Order Date      | Date of order                    |
| Restaurant Name | Restaurant receiving the order   |
| Location        | Restaurant location              |
| Category        | Food category                    |
| Dish Name       | Ordered dish                     |
| Price (INR)     | Order amount                     |
| Rating          | Customer rating                  |
| Rating Count    | Number of customer ratings       |


## 🧹 Data Preparation in PostgreSQL
The raw dataset was imported into PostgreSQL and prepared for analysis by:
* Creating a structured SQL table.
* Importing CSV data using pgAdmin.
* Validating data types.
* Checking for missing values and duplicate records.
* Creating analytical columns such as:

  * Order Year
  * Order Month
  * Order Quarter
* Writing SQL queries to calculate KPIs and business metrics.

## 📌 SQL KPIs Created
The following KPIs were calculated using PostgreSQL:
* Total Sales Revenue
* Total Orders
* Average Order Value
* Average Customer Rating
* Total Restaurants
* Total Cities
* Revenue by State
* Revenue by City
* Revenue by Restaurant
* Most Ordered Food Category
* Monthly Sales Trend

## 📈 Excel Dashboard Features
The dashboard was built using **Microsoft Excel** with interactive filters and charts.

### Executive KPI Cards
* Total Sales
* Average Rating
* Rating Count
* Total Orders
* Average Order Value

### Interactive Visualizations
* 📈 Monthly Sales Trend
* 📊 Daily Sales Trend
* 📉 Weekly Sales Trend
* 🍩 Sales by Food Type (Veg vs Non-Veg)
* 🗺️ Sales by State (Map Chart)
* 🏙️ Top 5 Cities by Sales
* 📋 Quarterly Sales, Ratings & Orders Summary

### Interactive Filters (Slicers)
* Month
* Food Category
* Restaurant Name

These slicers allow users to dynamically explore sales performance across different dimensions.

## 💡 Business Insights
The analysis revealed several valuable insights:
* Bengaluru generated the highest sales among all cities.
* Non-Veg food contributed a larger share of overall sales compared to Veg food.
* Sales remained consistently strong throughout the year, with peak revenue during May and August.
* Saturday recorded the highest daily sales among all weekdays.
* Karnataka and Maharashtra were among the top revenue-generating states.
* Top-performing restaurants contributed significantly to overall revenue.

## 🚀 Skills Demonstrated
* PostgreSQL
* SQL (Joins, Aggregations, CTEs, Window Functions, Views)
* Data Cleaning & Feature Engineering
* KPI Development
* Microsoft Excel Dashboard Design
* Pivot Tables & Pivot Charts
* Slicers and Interactive Filters
* Business Analytics & Data Visualization


## 📷 Dashboard Snapshot

 Excel dashboard screenshot: https://github.com/sanjay-5802/swiggy-sales-analytics-sql-excel/blob/main/swiggy_dashboard_snap.png




## ⭐ Project Outcome

This project demonstrates a complete **SQL + Excel Business Analytics workflow**, where raw Swiggy sales data was analyzed in PostgreSQL and transformed into an interactive Excel dashboard. The project highlights SQL querying, KPI creation, data analysis, and dashboard design skills, making it suitable for **Data Analyst** and **Business Analyst** internship and fresher portfolios.
