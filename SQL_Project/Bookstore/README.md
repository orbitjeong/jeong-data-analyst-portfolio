📘 Book Analysis Project – SQL Practice with `book_shop` Database

🧩 Overview

This project demonstrates the use of SQL to explore and analyze book data stored in a `books` table within the `book_shop` database.
Through this project, I practiced SQL fundamentals such as **aggregation, grouping, sorting, and subqueries** to summarize and gain insights from data.


🗂️ Database Table: `books`

| Column           | Description                 |
| ---------------- | --------------------------- |
| `book_id`        | Unique book ID              |
| `title`          | Title of the book           |
| `author_fname`   | Author’s first name         |
| `author_lname`   | Author’s last name          |
| `released_year`  | Year of publication         |
| `stock_quantity` | Number of books in stock    |
| `pages`          | Number of pages in the book |


⚙️ Technologies Used

* MySQL 8.0
* SQL Queries (SELECT, WHERE, GROUP BY, ORDER BY, LIMIT, Subqueries)
* Data Aggregation & Analysis


📊 Key Queries & Results

1️⃣ Total number of books

```sql
SELECT COUNT(*) AS total_books FROM books;
```

📈 *Result:* 19 books total



2️⃣ Number of books released each year

```sql
SELECT released_year, COUNT(*) AS books_count
FROM books
GROUP BY released_year
ORDER BY released_year;
```

🗓️ *Insight:* Most books were released in **2001** and **2003**.

---

3️⃣ Total number of books in stock


SELECT SUM(stock_quantity) AS total_stock FROM books;

📦 *Result:* Around **3,380 total books** in stock.


4️⃣ Average released year per author

SELECT author_fname, author_lname, AVG(released_year) AS avg_release_year
FROM books
GROUP BY author_lname, author_fname
ORDER BY author_lname, author_fname;


🧑‍💻 *Insight:* Neil Gaiman’s works have an average release year around **2006**, showing consistent output in the 2000s.


5️⃣ Author of the longest book

SELECT CONCAT(author_fname, ' ', author_lname) AS author
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

📚 *Result:* **Michael Chabon** wrote *The Amazing Adventures of Kavalier & Clay (634 pages)*.


6️⃣ Yearly summary – number of books and average pages

SELECT released_year AS year,
       COUNT(*) AS '# books',
       AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;


🧾 *Insight:* Average pages increased in later years, indicating longer modern publications.


🧠 What I Learned

* How to **aggregate data** using SQL functions (`COUNT`, `SUM`, `AVG`, `MAX`)
* How to **group and order** results with `GROUP BY` and `ORDER BY`
* How to use **subqueries** to answer more complex analytical questions
* How to derive **insights from structured data**


🏆 Key Takeaways

> This project helped me understand how to use SQL as a tool for data analysis.
> Even a simple table like `books` can reveal meaningful insights through proper querying and summarization.


✨ Future Improvements

* Add a **view** for summarized data (`vw_books_summary`)
* Create a **stored procedure** to automate reports
* Visualize results using **Python (Pandas + Matplotlib)**


