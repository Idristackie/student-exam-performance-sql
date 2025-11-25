# 📘 Student Performance Analysis Using SQL
[![Tech](https://img.shields.io/badge/Tech-SQL-blue)]()
[![Database](https://img.shields.io/badge/DB-PostgreSQL-lightgrey)]()
[![Focus](https://img.shields.io/badge/Focus-Data%20Analysis-success)]()

## 🎯 Project Overview  
This project explores how various behavioral and environmental factors influence student exam performance. Using SQL, I analyzed a dataset containing student study habits, attendance, sleep patterns, tutoring sessions, and extracurricular activity participation. The goal was to identify which factors have the strongest impact on exam success and develop data-driven insights that can support better educational decision-making.

---

## 🗂️ Dataset Description  

The analysis is based on the **`student_performance`** table, which contains:

| Column                     | Description                                      | Data Type |
|---------------------------|--------------------------------------------------|-----------|
| attendance                | Percentage of classes attended                   | float     |
| hours_studied             | Number of hours studied per week                 | float     |
| extracurricular_activities| Participation in extracurriculars (Yes/No)       | varchar   |
| sleep_hours               | Average number of sleep hours per night          | float     |
| tutoring_sessions         | Tutoring sessions attended per month             | integer   |
| teacher_quality           | Teacher quality rating (Low/Medium/High)         | varchar   |
| exam_score                | Final exam score                                 | float     |

---

## 🧠 Key SQL Questions Answered  

### **1️⃣ How do study hours influence exam performance?**  

This query groups students by study-hour ranges and calculates their average exam score:

```sql
SELECT
    CASE
        WHEN hours_studied BETWEEN 1 AND 5 THEN '1–5 hours'
        WHEN hours_studied BETWEEN 6 AND 10 THEN '6–10 hours'
        WHEN hours_studied BETWEEN 11 AND 15 THEN '11–15 hours'
        ELSE '16+ hours'
    END AS hours_studied_range,
    ROUND(AVG(exam_score)::numeric, 2) AS avg_exam_score
FROM student_performance
GROUP BY hours_studied_range
ORDER BY avg_exam_score DESC;
```

```sql

Insight:   Higher study brackets consistently achieved higher exam scores, with the 16+ hours group performing best.
```


### **2️⃣ Do extracurricular activities affect performance for highly studious students?**  

```sql
SELECT
    hours_studied,
    ROUND(AVG(exam_score)::numeric, 2) AS avg_exam_score
FROM student_performance
WHERE hours_studied > 10
  AND extracurricular_activities = 'Yes'
GROUP BY hours_studied
ORDER BY hours_studied DESC
LIMIT 30;
```
```
Insight:
Students who study more than 10 hours and participate in extracurriculars still perform strongly,
 proving that extracurricular activities do not hinder academic success when balanced with study time.
```

### **3️⃣ Which students rank highest based on exam performance?**

```sql
SELECT
    attendance,
    hours_studied,
    sleep_hours,
    tutoring_sessions,
    DENSE_RANK() OVER (ORDER BY exam_score DESC) AS exam_rank
FROM student_performance
ORDER BY exam_rank
LIMIT 30;
```
```
Insight:
Top-ranked students consistently show high attendance and strong study habits (20–28 hours per week).
Sleep and tutoring vary, but attendance + study hours emerge as the most reliable predictors of success.
```
## 📊 Summary of Findings

✔ Students studying **16+ hours per week** perform the best  
✔ Higher study time → **higher exam score**, with steady improvements  
✔ Extracurricular activities do **not negatively impact** high performers  
✔ Top scorers share two essential habits:
- **High attendance**  
- **Consistent study hours**  
✔ Sleep and tutoring have mixed influence but still contribute positively  

---

## 🧩 Skills Demonstrated

- SQL (PostgreSQL)  
- Aggregations & `GROUP BY`  
- `CASE` statements  
- Window functions (`DENSE_RANK`)  
- Data analysis & pattern identification  
- Insight communication  

---

## 🏁 Project Conclusion

This SQL project highlights that **dedicated study time and strong attendance** are the most important drivers of high exam performance. While tutoring, sleep patterns, and extracurricular activities provide additional benefits, their impact is less consistent. The results reinforce the importance of structured study habits and regular class engagement for long-term academic success.


