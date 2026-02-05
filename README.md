# 🏅 Olympics SQL Data Analysis Project

## 📌 Project Overview

This project explores historical **Olympics dataset** using SQL to uncover meaningful insights about medal distribution, athlete performance, participation trends, and event statistics.

The goal of this project is to demonstrate **real-world SQL data analysis skills** suitable for entry-level **Data Analyst / SQL Analyst** roles.

---

## 📂 Project Files

* **dataset_olympics.csv[Uploading dataset_olympics.csv…]()
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

