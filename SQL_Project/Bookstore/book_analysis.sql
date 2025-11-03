SELECT * FROM books;

USE books;

-- =====================================
--  BOOK ANALYSIS PROJECT
--  Author: Jeong
--  Database: book_shop
--  Table: books
--  Description: Basic SQL analysis queries for books dataset
-- =====================================

-- 1) Print the number of books in the database
SELECT COUNT(*) AS total_books
FROM books;

-- 2) Print out how many books were released in each year
SELECT released_year,
       COUNT(*) AS books_count
FROM books
GROUP BY released_year
ORDER BY released_year;

-- 3) Print out the total number of books in stock
SELECT SUM(stock_quantity) AS total_stock
FROM books;

-- 4) Find the average released_year for each author
SELECT
  author_fname,
  author_lname,
  AVG(released_year) AS avg_release_year
FROM books
GROUP BY author_lname, author_fname
ORDER BY author_lname, author_fname;

-- 5) Find the full name of the author who wrote the longest book (using subquery)
SELECT CONCAT(author_fname, ' ', author_lname) AS author
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

-- Alternative: ORDER BY + LIMIT
SELECT CONCAT(author_fname, ' ', author_lname) AS author
FROM books
ORDER BY pages DESC
LIMIT 1;

-- 6) Yearly summary (year, number of books, average pages)
SELECT
  released_year AS year,
  COUNT(*)      AS '# books',
  AVG(pages)    AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;
