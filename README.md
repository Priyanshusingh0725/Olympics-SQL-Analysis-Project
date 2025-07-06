# 🏅 Olympics SQL Analysis Project

This project explores 120+ years of Olympic Games data using structured SQL queries to gain insights into athlete performance, medal trends, and country-level statistics.  
It is built as part of my portfolio to showcase SQL skills, data exploration capabilities, and query optimization — targeted for data analyst roles.

---

## 📌 Project Objectives

- Understand participation and medal trends across years, countries, and sports.
- Practice SQL concepts ranging from beginner to advanced (including window functions and aggregation).
- Demonstrate real-world data querying for resume and interviews.

---

## 📊 Dataset Overview

| Column        | Description                                      |
|---------------|--------------------------------------------------|
| ID            | Unique ID of the athlete                         |
| Name          | Athlete's name                                   |
| Sex           | Gender (M/F)                                     |
| Age           | Age of the athlete                               |
| Height        | Height in cm                                     |
| Weight        | Weight in kg                                     |
| Team          | Country/Team name                                |
| NOC           | National Olympic Committee code                  |
| Games         | Name of the Olympic event (e.g. 2012 Summer)     |
| Year          | Year of the event                                |
| Season        | Summer/Winter                                    |
| City          | Host city                                        |
| Sport         | Sport category (e.g. Swimming, Athletics)        |
| Event         | Specific event (e.g. 100m sprint)                |
| Medal         | Medal won (Gold, Silver, Bronze, NA)             |

**Source:**  
> [Kaggle – 120 Years of Olympic History: Athletes and Results](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)

---

## 🧠 Query Levels & Topics Covered

- ✅ **Basic Queries** – DISTINCT, COUNT, WHERE, LIKE
- ✅ **Intermediate Queries** – GROUP BY, HAVING, Subqueries
- ✅ **Advanced Queries** – Window Functions (`RANK()`), Aggregation by multiple dimensions
- ✅ **Real-world Patterns** – Medal trends, Age distributions, Country dominance, Duplicate checks

---

## 🔍 Sample Questions Answered

- Which country has won the most medals?
- Which city has hosted the Olympics the most times?
- Which athletes participated in multiple Olympic events?
- What is the average height/weight of medal winners per sport?
- Who are the most decorated Olympians?
- Which events are dominated by a single country?

---

## 📁 Project Structure

```

olympics-sql-analysis/
│
├── README.md                       # Project documentation
├── olympics\_dataset.csv            # Source data (or link to source)
└── queries/
├── olympics\_queries.sql        # 26 grouped queries (basic → advanced)

````

---

## 🧾 Preview of SQL Techniques

Here are a few highlighted SQL examples used in this project:

### 🔹 Ranking Athletes by Medals (Window Function)
```sql
SELECT 
  Name, 
  COUNT(Medal) AS Total_Medals,
  RANK() OVER (ORDER BY COUNT(Medal) DESC) AS Medal_Rank
FROM olympic.`olympics dataset`
WHERE Medal != 'NA'
GROUP BY Name;
````

### 🔹 Medal Count by Country

```sql
SELECT NOC, COUNT(*) AS Medal_Count
FROM olympic.`olympics dataset`
WHERE Medal != 'NA'
GROUP BY NOC
ORDER BY Medal_Count DESC;
```

### 🔹 Events Dominated by a Country

```sql
SELECT NOC, Sport, COUNT(*) AS Dominance
FROM olympic.`olympics dataset`
WHERE Medal != 'NA'
GROUP BY NOC, Sport
ORDER BY Dominance DESC;
```

---

## 🔬 Tools Used

* **SQL** – MySQL / SQLite-compatible syntax
* **VS Code / MySQL Workbench** – For query writing
* *(Optional)* Power BI / Excel – For visualizing medal trends (can be added)

---

## 📌 Future Enhancements

* Build Power BI dashboards from these queries.
* Turn this into a Streamlit data app.
* Add visual charts for city hosting, medal distribution, and age trends.

---

## 👨‍💻 About Me

I'm **Priyanshu Singh**, a Statistics (Hons) student from BHU aspiring to become a **Data Analyst**. This project is part of my resume portfolio to demonstrate SQL skills and curiosity in data storytelling.

📫 **Connect With Me:**

* [LinkedIn](https://www.linkedin.com/in/your-profile) *(Replace this with your actual profile link)*
* 📧 Email: [your-email@example.com](mailto:your-email@example.com) *(Optional)*

---

## ⭐ If you found this useful...

Please ⭐ star this repository or fork it to show support. Thank you for visiting!

```

