# 🏅 Olympics SQL Data Analysis Project

## 📌 Project Overview

This project explores historical **Olympics dataset** using SQL to uncover meaningful insights about medal distribution, athlete performance, participation trends, and event statistics.

The goal of this project is to demonstrate **real-world SQL data analysis skills** suitable for entry-level **Data Analyst / SQL Analyst** roles.

---

## 📊 Dataset Description

The dataset used in this project contains historical information about the **Olympic Games**, including details about athletes, countries, events, participation, and medals won across different years.

### Key Columns in the Dataset

* **Name** – Athlete’s name
* **Sex** – Gender of the athlete
* **Age** – Age during participation
* **Team / Country** – Country represented in the Olympics
* **Year** – Olympic year of participation
* **Sport** – Sport category
* **Event** – Specific event within the sport
* **Medal** – Type of medal won (Gold, Silver, Bronze, or NULL if none)

This dataset enables analysis of **performance trends, participation patterns, and medal distributions** across countries and athletes over time.

---

## 🧠 Project Objective

The primary objective of this SQL project is to perform **exploratory data analysis using SQL** to answer real-world analytical questions related to the Olympic Games.

The project focuses on:

* Understanding **which countries dominate medal counts**
* Identifying **top-performing athletes in Olympic history**
* Analyzing **event growth and participation trends over the years**
* Comparing **gender participation in the Olympics**
* Demonstrating **practical SQL skills used in data analyst roles**

---

## 🔎 Analysis Approach

The analysis was carried out using structured SQL queries that include:

* **Data filtering** to remove NULL medal values
* **Aggregations** such as COUNT and DISTINCT
* **Grouping** by country, athlete, gender, and year
* **Sorting and ranking** to identify top performers
* **Trend analysis** across multiple Olympic years

This approach simulates how SQL is used in **real business and analytics environments** to transform raw data into meaningful insights.

---

## 📈 Business-Style Insights Generated

From the SQL analysis, the following high-level insights were derived:

* Certain countries consistently achieve **higher total medal counts**, indicating strong sports infrastructure and athlete development programs.
* A small group of athletes contributes to **multiple medal wins**, highlighting elite performance and long-term participation.
* The number of Olympic events has **expanded over time**, reflecting the global growth of sports.
* **Female participation has steadily increased**, showing progress toward gender equality in international sports.

---

## 🎯 Learning Outcome

Through this project, I strengthened my ability to:

* Work with **real-world structured datasets**
* Write **efficient and meaningful SQL queries**
* Perform **data aggregation and trend analysis**
* Convert raw data into **clear analytical insights**
* Present findings in a **professional, portfolio-ready format**

This project represents an important step in my journey toward becoming a **Data Analyst**.

## 📂 Project Files

* **[Uploading dataset_olympics.csv…]()
** → Raw Olympics dataset
* **[Uploading Olympics_Data_Queries_Project.sql…]()
** → All SQL queries used for analysis
* **[Final SQL Project Ppt_olympics.pptx](https://github.com/user-attachments/files/25107397/Final.SQL.Project.Ppt_olympics.pptx)
** → Project presentation
* **(https://drive.google.com/file/d/1QkAqK0HXB4K-a7hoJlJFFuhUtNDN47eY/view?usp=classroom_web&authuser=0)** → Linked below

---

## 🎥 Project Explanation Video

Watch the complete explanation of SQL queries and insights:

➡️ **([VIDEO_LINK_HERE](https://drive.google.com/file/d/1QkAqK0HXB4K-a7hoJlJFFuhUtNDN47eY/view?usp=classroom_web&authuser=0))**



---

## 🧠 Key Analysis Performed

### 1️⃣ Total Medals Won by Each Country

```sql
SELECT Team, COUNT(Medal) AS Total_Medals
FROM olympics
WHERE Medal IS NOT NULL
GROUP BY Team
ORDER BY Total_Medals DESC;
```

### 2️⃣ Top 10 Athletes with Most Medals

```sql
SELECT Name, COUNT(Medal) AS Medal_Count
FROM olympics
WHERE Medal IS NOT NULL
GROUP BY Name
ORDER BY Medal_Count DESC
LIMIT 10;
```

### 3️⃣ Number of Events Conducted Each Year

```sql
SELECT Year, COUNT(DISTINCT Event) AS Total_Events
FROM olympics
GROUP BY Year
ORDER BY Year;
```

### 4️⃣ Gender Participation Distribution

```sql
SELECT Sex, COUNT(*) AS Participants
FROM olympics
GROUP BY Sex;
```



---

## 📊 Insights Generated

* Identified **top performing countries** in Olympics history
* Found **athletes with highest medal counts**
* Analyzed **year-wise event growth**
* Compared **male vs female participation trends**

---

## 🛠️ Skills Demonstrated

* SQL Data Analysis
* Aggregations, GROUP BY, ORDER BY
* Filtering & NULL handling
* Real dataset exploration
* Insight generation for decision making

---

## 🎯 Career Relevance

This project is part of my **Data Analyst portfolio**, showcasing my ability to:

* Work with real datasets
* Write structured SQL queries
* Generate meaningful insights
* Present analysis professionally

---

## 👨‍💻 Author

**Gobikrishnaa S**
Aspiring **Data Analyst | SQL | Excel | Data Analytics**

---

## ⭐ Support

If you found this project useful, please consider giving this repository a **star ⭐**.

