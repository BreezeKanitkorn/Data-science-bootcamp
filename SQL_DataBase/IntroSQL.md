## Intro to SQL

**Structured Query Language (SQL)**

พัฒนาขึ้นครั้งแรกโดย IBM ≈ 1970s

ใช้ในการทำงานร่วมกับ database

**SQL** ยากตรงการทำความเข้าใจ business ว่า data อะไรเก็บอยู่ที่ table อะไรบ้าง หน้างานจริงมักไม่มี ER Diagram ที่เข้าใจได้ง่ายๆ ต้องอาศัย On the Job Training

SQLite ไม่มี DateTime มันจะเก็บค่าด้วย ‘TEXT’

SQL เป็น case insensitive และ space ไม่มีผล 

---

## **Relationship**

- **one-many** relationship เช่น 1 วงดนตรี มีหลาย อัลบั้ม
- **many-many** relationship เรามักสร้าง bridge table มาตรงกลางไว้เชื่อมมัน (ภายใน bridge table จะเป็น 🔑composite key คือการเชื่อม 2 column เข้าด้วยกันทำให้เกิด Unique Value)
- **one-one** แค่จับ table มา merge กันก็ได้ ไม่จำเป็นต้องสร้าง relationship


---

`AS` = alias แปลว่า create name เป็น optional ใส่ไม่ใส่ก็ได้ แต่แนะนำให้ใส่ทำให้อ่านง่ายขึ้น

---

## Value Function

**VALUE Function** จะไปเปลี่ยน Format ของ column นั้น แต่ไม่ได้เปลี่ยนค่ามัน เช่น 

- `ROUND()`
- `LOWER()`
- `UPPER()`

---

## STRFTIME

`STRFTIME()` = String Format (Date)Time

```sql
SELECT
	invoicedate,
    STRFTIME("%Y", invoicedate) AS year,
    STRFTIME("%m", invoicedate) AS month,
    STRFTIME("%d", invoicedate) AS day,
    STRFTIME("%Y-%m-%d", invoicedate) AS dateid
FROM invoices
WHERE dateid LIKE '2009-01-__';
```

---

> เรียน เขียน แชร์
> 

## Physical Table

**Physical Table** สร้าง Table ใหม่จาก Query ที่เรา `SELECT` ออกมา

```sql
CREATE TABLE eu_customers AS
  SELECT firstname, country, email
  FROM customers
  WHERE country IN ('Belgium', 'France', 'Italy');
```

---

## WHERE

ใน SQLite `WHERE` cluase จะ run ก่อน `SELECT` 

เราควรมี `WHERE` เสมอเพื่อดึงเฉพาะสิ่งที่เราจำเป็นต้องใช้ จะทำให้ประมวลผลได้เร็วขึ้น

```sql
SELECT 
	name,
    composer,
    bytes/(1024*1024) AS MB
FROM tracks
--WHERE MB > 8; เป็น Syntax พิเศษดึงได้เฉพาะใน SQLite เท่านั้น
WHERE bytes/(1024*1024) >=8 AND composer LIKE 'Smith%';
```

`LIKE` operation ใน SQLite จะ match ทั้งตัวเล็กตัวใหญ่

```sql
SELECT 
	name,
    composer,
    bytes/(1024*1024) AS MB
FROM tracks
--WHERE composer IS NULL; --missing value
WHERE bytes/(1024*1024) BETWEEN 9 AND 10 --inclusive
LIMIT 10;
```

---

## Aggregate Function

**Aggregate Function** ไม่สนใจค่า NULL

- `AVG()`
- `SUM()`
- `MIN()`
- `MAX()`
- `COUNT()`

```sql
SELECT 
	COUNT(*)   AS total_songs,
    ROUND(AVG(bytes),2) AS avg_bytes,
    ROUND(SUM(bytes)/(1024*1024),2) AS sum_mb,
    MIN(bytes) AS min_bytes,
    MAX(bytes) AS max_bytes
FROM tracks;
```

---

## CASE WHEN THEN ELSE END

IF ELSE in SQL

`CASE` → `WHEN` → `THEN` → `ELSE` → `END`

```sql
SELECT 
	bytes/(1024*1024) AS mb,
    -- IF ELSE in SQL
    CASE
    	WHEN bytes/(1024*1024) >= 8 THEN 'Large'
        WHEN bytes/(1024*1024) >= 3 THEN 'Medium'
        ELSE 'Small'
    END AS segment
FROM tracks;
```

```sql
SELECT 
	bytes/(1024*1024) AS mb,
    -- IF ELSE in SQL
    CASE
    	WHEN bytes/(1024*1024) >= 8 THEN 'Large'
        WHEN bytes/(1024*1024) >= 3 THEN 'Medium'
        ELSE 'Small'
    END AS segment,
    COUNT(*) AS num_songs --สร้าง column ใหม่และ GROUP BY column นั้นเลย
FROM tracks
GROUP BY segment;
```

Clean `NULL` values

```sql
SELECT 
	company,
	COALESCE(company, 'B2C') AS clean_company, --replace ค่า NULL
	CASE 
    	WHEN company IS NULL THEN 'B2C'
    	ELSE 'B2B'
    END AS segment
FROM customers;
```

---

## GROUP BY, WHERE, HAVING

`GROUP BY` มากกว่า 1 column

```sql
SELECT 
	CASE 
    	WHEN company IS NULL THEN 'B2C'
    	ELSE 'B2B'
    END AS segment,
    country,
    COUNT(*) AS num_customers
FROM customers
WHERE country IN ('Belgium', 'France', 'Italy')
GROUP BY 1,2 --column ไหนที่ไม่ใช่ Aggregate Function ต้องเอามาใส่ใน GROUP BY ทั้งหมด
HAVING num_customers > 1;
```

`WHERE` กรองก่อน run ได้เร็วกว่า

`HAVING` กรองหลัง GROUP BY

---

## JOIN TYPE

**JOIN TYPE** หลักๆใช้ 2 แบบ

- `INNER JOIN` เอาค่าที่ overlap กัน (default)
- `LEFT JOIN` เอาซ้ายตั้ง ค่าไหนไม่เจอจะเป็น NULL

```sql
-- JOIN syntax
SELECT *
FROM artists AS ar
/*JOIN albums USING(artistid) -- USING ใช้ตอนที่ PK กับ FK ชื่อเดียวกัน*/
JOIN albums AS al 
ON ar.artistid = al.artistid;
```

`USING` เป็น syntax พิเศษใช้ได้เฉพาะตอน 🔑Primary Key ชื่อเดียวกับ Foreign Key

```sql
-- JOIN syntax
SELECT 
	ar.name  AS artist_name,
    al.title AS album_title,
    tr.name  AS track_name,
    ge.name  AS genre,
    milliseconds, --ถ้าไม่ซ้ำกันใส่แค่ชื่อ column ก็ได้
    bytes,
    unitprice
FROM artists AS ar
JOIN albums AS al 
	ON ar.artistid = al.artistid
JOIN tracks AS tr
	ON tr.albumid = al.AlbumId
JOIN genres AS ge 
	ON ge.genreid = tr.genreid
```

ใช้ tablename.column_name เพื่อดึงเฉพาะข้อมูลที่ต้องการ

เหตุผลที่เราใส่ชื่อ table ไว้ข้างหน้าเพราะชื่อ column มีโอกาสซ้ำกัน ถ้าไม่ซ้ำกันใส่แค่ชื่อ column ก็ได้

 

```sql
-- JOIN syntax
SELECT 
	ge.name,
    COUNT(*) AS count_tracks,
    AVG(milliseconds)  AS avg_milliseconds
FROM artists AS ar
JOIN albums AS al 
	ON ar.artistid = al.artistid
JOIN tracks AS tr
	ON tr.albumid = al.AlbumId
JOIN genres AS ge 
	ON ge.genreid = tr.genreid
GROUP BY 1
ORDER BY 3 DESC
limit 5;
```

---

## CREATE VIEW

`CREATE VIEW`

**Virtual Table**

ในมุม user ไม่ต่าง

ในมุม database มันจะ run code ใหม่ทั้งหมด ไม่ได้เก็บค่าไว้ และจะ update อัตโนมัติให้เราเมื่อ run

```sql
-- virtual table => VIEW 
CREATE VIEW genre_stats AS
  SELECT 
      ge.name,
      COUNT(*) AS count_tracks,
      AVG(milliseconds)  AS avg_milliseconds
  FROM artists AS ar
  JOIN albums AS al 
      ON ar.artistid = al.artistid
  JOIN tracks AS tr
      ON tr.albumid = al.AlbumId
  JOIN genres AS ge 
      ON ge.genreid = tr.genreid
  GROUP BY 1
  ORDER BY 3 DESC;
```

---

## Subqueries

**Subqueries (Select ซ้อน Select)**

- breakdown our long query into steps
- โดยจะอ่านจาก inner ก่อน outer

```sql
-- subqueries
SELECT firstname, country
FROM (SELECT * FROM customers) AS sub --ใน() เรียกว่า inner query
WHERE country = 'United Kingdom';

-- WITH: common table expression
WITH sub AS (
	SELECT * FROM customers
)
SELECT firstname, country
FROM sub 
WHERE country = 'United Kingdom';
```

Example Subqueries + WITH clause

<aside>
💡 Query `American` customers who purchase our products in 2009-10 (invoices)

</aside>

```sql
-- basic query
SELECT
	firstname,
	lastname,
	email,
	COUNT(*) count_order
FROM customers c
JOIN invoices i ON c.customerid = i.customerid
WHERE country = 'USA' AND STRFTIME('%Y-%m', i.invoicedate) = '2009-10'
GROUP BY 1,2,3;

-- WITH clause
WITH use_customers AS (
	SELECT * FROM customers
	WHERE country = 'USA'
), invoice_2009 AS (
	SELECT * FROM invoices
	WHERE STRFTIME('%Y-%m', invoicedate) = '2009-10'
)

SELECT firstname, lastname, email, COUNT(*)
FROM use_customers t1
JOIN invoice_2009 t2
ON t1.customerid = t2.customerid
GROUP BY 1,2,3;

-- Standard subqueries
SELECT firstname, lastname, email, COUNT(*)
FROM (
	SELECT * FROM customers
	WHERE country = 'USA'
) AS t1
JOIN (
	SELECT * FROM invoices
	WHERE STRFTIME('%Y-%m', invoicedate) = '2009-10' 
) AS t2
ON t1.customerid = t2.customerid
GROUP BY 1,2,3;
```
