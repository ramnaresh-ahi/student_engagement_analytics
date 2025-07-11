# 📊 Student Engagement Analytics

This project analyzes **student engagement** with various academic activities including **learning modules**, **quizzes**, and **exams**. It also identifies top-performing **courses** based on student ratings and participation. The pipeline is built using **dbt (Data Build Tool)** on top of **Snowflake**, and follows modern data modeling practices with staging, intermediate, and marts layers.

---

## 📌 Project Overview

- **Goal:** Track how students engage with different types of academic content and identify the most effective courses.
- **Key Use Cases:**
  - Identify the most and least engaged students.
  - Track participation in learning, quizzes, and exams.
  - Evaluate course ratings and detect top-rated content.
  - Power dashboards and decision-making for education teams.

---

## 🗃️ Data Source

- **Origin:** Kaggle  
- **Dataset:** [Student Engagement with Tableau - Kaggle](https://www.kaggle.com/datasets/thedevastator/student-engagement-with-tableau-a-data-science-p?select=365_student_engagement.csv)

---

## 🏗️ Tech Stack

| Tool         | Purpose                          |
|--------------|----------------------------------|
| dbt          | Data transformation & modeling   |
| Snowflake    | Cloud data warehouse             |
| dbt Cloud    | CI/CD & orchestration            |
| GitHub       | Version control                  |

---

## 🧱 Project Structure

This project follows a **standard dbt architecture**:

student_engagement_analytics/
│
├── models/
│   ├── staging/           # Raw data cleaned and standardized
│   ├── intermediate/      # Business logic and transformations
│   ├── marts/             # Fact and dimension tables
│   │   ├── facts/
│   │   └── dims/
│   └── snapshots/         # SCD implementation
│
├── macros/                # Custom dbt macros
├── tests/                 # dbt tests
├── dbt_project.yml        # dbt project config
└── README.md              # Project documentation


---

## 🧩 Core Models

### 📂 Fact Tables

| Table Name                  | Description                                       |
|----------------------------|---------------------------------------------------|
| `fact_course_ratings`      | Student ratings for courses                       |
| `fact_learnings`           | Student participation in learning modules         |
| `fact_quizzes`             | Quiz attempts and correctness metrics             |
| `fact_exams`               | Exam submissions and outcomes                     |
| `fact_students_engagements`| Summary of student participation across activities|

### 📂 Dimension Tables

| Table Name     | Description                    |
|----------------|--------------------------------|
| `dim_students` | Student metadata               |
| `dim_courses`  | Course metadata                |

---

## 📸 Snapshots

| Snapshot Name           | Purpose                                | Strategy       |
|-------------------------|----------------------------------------|----------------|
| `dim_students_snapshot` | Capture SCD changes for student data   | Timestamp-based|

- Snapshot is implemented on `stg_students`
- Tracks changes in `country` and `registered_date`

---

## 🛠️ Custom Macros

- **`custom_schemas`**: Enables dynamic schema allocation (e.g., dev, prod) based on environment.

---

## ✅ Data Quality

- **Generic Tests**:
  - `unique`, `not_null` on primary keys
  - `relationships` to enforce foreign key integrity
- **Custom Checks**:
  - Valid ranges for course ratings
  - Boolean conversions for engagement flags

---

## 📊 Example Use Cases

- ✅ Identify top engaged students (participated in all modules)
- ✅ List top-rated courses by average score
- ✅ Track students with low quiz or exam performance
- ✅ Compare participation across different countries

---

## 🚀 How to Run This Project

```bash
# Step 1: Install dependencies
dbt deps

# Step 2: Run transformations
dbt run

# Step 3: Run tests
dbt test

# Step 4: Generate and view docs
dbt docs generate
dbt docs serve

---
## 📌 Status

- ✅ Models and marts implemented  
- ✅ Snapshots and incremental strategies in place  
- ✅ Testing and documentation completed  
- 🔄 Ready for visualization or dashboarding tools  

---

## 👤 Author

**Ramnaresh Ahirwar**  
_Analytics Engineer \| Data Enthusiast_  
[GitHub Profile](https://github.com/ramnaresh-ahi)

---

## 📬 Contributions & Feedback

Feel free to fork the project, create issues, or suggest improvements.  
Together, let’s build better education analytics! 📈
