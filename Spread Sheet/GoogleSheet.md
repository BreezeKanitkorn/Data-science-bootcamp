ไฟล์แบบฝึกหัด https://docs.google.com/spreadsheets/d/1mB0vZkRyJPc9YXA81CumicmzdWESi96f5tb4xFjU-tQ/edit#gid=0

---

## Intro to Google Spread Sheets

> We’re going to practice a lot.
**Do** or **Do Not**, There is no Try.
> 

เรามอง spreadsheet เป็น software ไม่ใช่แค่ data analysis

สร้าง Google spreadsheet ใหม่ Type `[sheets.new](http://sheets.new)` in web brownser

ถ้าจะ Zoom ให้กด Double click ที่ cell ก่อน แล้วจะสามรถ `ctrl`+`scroll mouse` ได้

**ISO8601** DATE FORMAT = YYYY-MM-DD เมื่อกด Double click จะ show calendar view ขึ้นมา

ตั้งชื่อ column ไม่ควรมี space ให้ใช้ _ แทน

Google Sheet **ทำ Multiselection ไม่ได้**

---

## **Data Type** ใน Spreadsheet

- **Numeric**
- **String: “text”**
- **Boolean: TRUE, FALSE**
- **Date**

หัวใจสำคัญของ Spreadsheet คือ **Function** ❤️

---

## ArrayFormula

ค่าไหนก็ตามที่มีการ update บ่อยๆ อย่าเอาไป hard quote ใส่ตาราง ให้แยก cell ออกมา input แล้วใช้ `ArrayFormula` ช่วย

> **Test Small → Scale Big**
> 

ลองสูตรบรรทัดเดียวก่อนแล้วถ้าผลลัพธ์ถูกค่อยทำเป็น `ArrayFormula`

`=IMPORTDATA(”http://…..csv”)`  ได้เฉพาะ .csv เท่านั้น

`ArrayFormula` จะใส่สูตรให้ทั้ง Data Range ที่เราเลือกโดยเขียนแค่บรรทัดเดียว
ข้อดีของ Array
• ช่วยให้ประมวลผลเร็วขึ้น
• ช่วยลดขนาด File size ให้เล็กลง
• เพิ่มความรวดเร็วเวลา update ข้อมูล ทำงานแบบ dynamic ได้ดีกว่า เช่น
`=ARRAYFORMULA(A:A*(1+B1))`

---

## การตั้งชื่อ

**การตั้งชื่อ Cells, Ranges ของข้อมูล**
• กดที่ `Name Box` (ctrl + j) อยู่มุมซ้ายบน
• `Data` → `Named Ranges`

การตั้งชื่อ dataset ใช้ **capital** **ห้ามขึ้นต้นด้วยตัวเลขห้ามมีspace**

---

## FILTER

**FILTER กรองข้อมูลตามเงื่อนไข**
• ถ้า FILTER โดยใช้ menu bar จะมี AND เป็นค่า Default เสมอ
• ถ้า FILTER โดยใช้สูตร

AND = `*`
OR = `+`

`ArrayFormula` ไม่สามารถใช้ AND OR ได้ ต้องใช้ `+` `*` โดยจะ return ค่าเป็น 1 (TRUE) กับ 0 (FALSE)

---

## เทสีข้าม column

เลือก data ที่ต้องการเทสีก่อน → ถ้าอยู่คนละ column ให้ใช้ custom formula is

`=H4=TRUE`  หรือจะใส่แค่ `=H4` ก็ได้เหมือนกัน

---

## HOMEWORK 1 เทสีทั้ง ROW

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/49f49697-c860-4787-9e86-a7fd77790e08/Untitled.png)

เราต้อง lock column ด้วย `$` เช่น `$H` เพราะเวลา column ขยับไปทางขวา สูตรมันจะขยับตามไปด้วย 

นี่เป็นเหตุผลว่าทำไมเวลาเราจะ format แค่ column เดียว 

จึงใส่สูตร `=H4` เฉยๆ (ใส่ค่าแค่ =cell บน) มันจึงวิ่งลงได้เวลาเรา ☑️ ลงมาเรื่อยๆ

ไม่จำเป็นต้อง `=TRUE` ก็ได้ เพราะค่า Default มันเป็น TRUE อยู่แล้ว 

---

## **Function Query ใน Google Sheets**

ลำดับการเขียนสำคัญมาก

`select` → `limit` → `label` 

`contains` เป็น case sensitive และมีเฉพาะใน Google SQL

`LIKE`= pattern matching

---

## HOMEWORK 2 อ่าน Google Query language

Google พัฒนา SQL ขึ้นมาเองทำให้บาง Operation ไม่เหมือนกับ Standard SQL

[Query Language Reference (Version 0.7)  |  Charts  |  Google for Developers](https://developers.google.com/chart/interactive/docs/querylanguage)

**Query Language Reference (Version 0.7)**

**Introduction**

- บางครั้ง data ที่นำมาใช้ไม่ match กับ Visualizatoins ที่เราต้องการจะ present
- Query ช่วยแก้ปัญหานั้นได้
- syntax ของมัน คล้ายๆกับ SQL

**Using the Query Language**

- JavaScript Code
- Parameter in the data source URL
    - You must use the ID, not the label เช่น `select A, sum(B), group by A`

**Language Clauses**

- All clauses are optional.
- Clauses are separated by spaces.
- The order of the clauses must be as follows

| Clause | Usage |
| --- | --- |
| https://developers.google.com/chart/interactive/docs/querylanguage#Select | Selects which columns to return, and in what order. If omitted, all of the table's columns are returned, in their default order. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Where | Returns only rows that match a condition. If omitted, all rows are returned.
- contains
- starts with
- ends with
- matches 
- like %, _ |
| https://developers.google.com/chart/interactive/docs/querylanguage#Group_By | Aggregates values across rows. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Pivot | Transforms distinct values in columns into new columns. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Order_By | Sorts rows by values in columns. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Limit | Limits the number of returned rows. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Offset | Skips a given number of first rows. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Label | Sets column labels. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Format | Formats the values in certain columns using given formatting patterns. |
| https://developers.google.com/chart/interactive/docs/querylanguage#Options | Sets additional options. |

ใน SQL function filter `where` จะ Run ก่อน `select`

**Aggregation Functions**

- Aggregation functions can be used in `select`, `order by`, `label`, `format` clauses.
- They *cannot* appear in `where`, `group by`, `pivot`, `limit`, `offset`, or `options` clauses.
- `AVG()`
- `MAX()`
- `MIN()`
- `SUM()`
- `COUNT()`

**Note:** Aggregation functions can only take a column identifier as an argument:

**Scalar Functions**

Scalar functions can be used in any of the following clauses: `[select](https://developers.google.com/chart/interactive/docs/querylanguage#Select)`, `[where](https://developers.google.com/chart/interactive/docs/querylanguage#Where)`, `[group by](https://developers.google.com/chart/interactive/docs/querylanguage#Group_By)`, `[pivot](https://developers.google.com/chart/interactive/docs/querylanguage#Pivot)`, `[order by](https://developers.google.com/chart/interactive/docs/querylanguage#Order_By)`, `[label](https://developers.google.com/chart/interactive/docs/querylanguage#Label),` and `[format](https://developers.google.com/chart/interactive/docs/querylanguage#Format)`.

- `year()`
- `month()`
- `day()`
- `upper()`
- `lower()`

---

## HOMEWORK 3 เขียน dynamic query ทำ dropdown from range

TIPS: เขียน Query อันแรกให้ได้ก่อนแล้วค่อยๆ ถอดมันมาเป็น Dropdown list

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/d47c6759-d506-4646-9b92-62dc69f75a23/Untitled.png)

<aside>
💡 `&` ใช้เชื่อม text

`and` ใช้เพิ่มเงื่อนไขของ function เดิม

</aside>

---

## VLOOK UP, XLOOKUP

vlookup = vertical look up

=VLOOKUP(keyที่จะเอาไปใช้หา, data_range, indexของcolumnที่ต้องการค่า, FALSE) 

FALSE = EXACT MATCH

=**xlookup(key**ที่จะเอาไปใช้หา, lookup_range, dataที่ต้องการ, missing value**)**

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/9119974a-d3f8-4e1f-a2a3-5dd5bfe4f9f9/Untitled.png)

---

## HOMEWORK 4 vlookup sheet 11 ดึงตาราง 2 อันล่าง ขึ้นมารวมกับอันบน

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/6f5acb2f-d00d-44d6-be19-ba6e91bedd7e/Untitled.png)

สามารถเลือก column ที่จะดึงมาได้ ถ้าใช้ `=ArrayFormula(VLOOKUP(search_key,range,{2,3,4,5},FALSE))`

ต้องเป็น `ArrayFormula` เท่านั้น จึงจะกำหนด `{ }` ได้  VLOOKUP เฉยๆทำไม่ได้ 

---

## TRIM()

data → data cleanup

=TRIM() ลบช่องว่างหน้าหลังคำในเซลล์ ถ้ามีช่องว่างตรงกลางจะลบเหลือช่องเดียว

---

## HOMEWORK 5 sheet 14 convert thaidate to english date

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/efbd0845-777c-4d52-b3a1-04a8fcff1da0/Untitled.png)

<aside>
💡 ถ้าเกิด case ที่มี error ให้ใช้ XLOOKUP ทำงานง่ายกว่า VLOOKUP

</aside>

---

## Regular expression

> start with **power** end with **money**
> 

=REGEXEXTRACT()

1. **`.`** (dot): Matches any single character except a newline.
2. `*`: Matches zero or more occurrences of the preceding character or group.
3. **`+`**: Matches one or more occurrences of the preceding character or group.
4. **`?`**: Matches zero or one occurrence of the preceding character or group.
5. **`|`** (pipe): Acts as an OR operator, allowing you to match either of two expressions. For example, **`A|B`** matches either "A" or "B".
6. **`[]`**: Defines a character class. For example, **`[aeiou]`** matches any vowel.
7. **`[^]`**: A negated character class. For example, **`[^0-9]`** matches any character that is not a digit.
8. **`^`**: Matches the start of a string.
9. **`$`**: Matches the end of a string.
10. **`\d`**: Matches any digit (equivalent to **`[0-9]`**).
11. **`\w`**: Matches any word character (equivalent to **`[A-Za-z0-9_]`**).
12. **`\s`**: Matches any whitespace character (spaces, tabs, line breaks).
13. **`\b`**: Matches a word boundary. For example, **`\bword\b`** matches the whole word "word" within a string.
14. **`()`**: Groups together characters or subexpressions.
15. **`?`** and **`+?`**: Make the **``** and **`+`** quantifiers non-greedy, meaning they match the shortest possible string instead of the longest.
16. **`{}`**: Specifies a specific number of occurrences. For example, **`a{3}`** matches "aaa".
17. **`(?i)`**: Enables case-insensitive matching.
18. **`(?m)`**: Enables multi-line matching, making **`^`** and **`$`** match the start and end of each line.
19. **`(?s)`**: Allows **`.`** to match newline characters.
20. **`(?x)`**: Enables "extended" mode, which ignores whitespace and allows comments within the regular expression.
21. **`\1`**, **`\2`**, etc.: Backreferences to captured groups. For example, **`(\d)\1`** matches any digit repeated twice.
22. `\.` .

---

## HOMEWORK 6 sheet16 **Project - ID Card Parser**

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/a676fefd-ac96-4ab3-9865-24953ee98ff5/Untitled.png)

---

<aside>
💡 เลือกใช้เครื่องมือให้เหมาะสมกับงาน

</aside>

---

## Google Translate

[Language support  |  Cloud Translation  |  Google Cloud](https://cloud.google.com/translate/docs/languages)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/7f646984-b4c6-4adf-8b81-a761cb10dadd/Untitled.png)

---

## Named Function

การบ้านเปลี่ยน c เป็น F

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/8be6d159-1cb9-4f04-acdd-d11a8c5d9465/cb559246-55d7-4d88-bc69-15cd1c3e5d70/Untitled.png)

---

## LAMBDA Function

=LAMBDA(name, formula_expression)

ใช้คู่กับ =BYCOL(data_range,LAMBDA)

---

## HOMEWORK 7

1. อธิบายวิธีการสร้าง Named Function
สร้าง Function ไว้ใช้เอง
    
    Data → Named Function → Add New Function → Function Name → Formula definition → Argument placeholders → Formula Definition → Next → Done 
    
2. VLOOKUP vs. XLOOKUP ใช้ต่างกันยังไง อธิบายสั้นๆ ชอบสูตรไหนมากกว่ากัน
    
    =VLOOKUP(search_key, range, index, FALSE) ใน google sheet ดีงหลายcolumnพร้อมกันได้โดยใข้ {}
    
    =XLOOKUP(search_key, lookup_range, result_range, [missing_value]) 
    ถ้าจะทำเร็วๆชอบ XLOOKUP เพราะใส่ค่าง่ายกว่า และมี missing value ไม่ต้องทำ IFERROR()
    
3. อธิบาย 5 clauses พื้นฐานของ `=QUERY()` เช่น select where group by order by pivot label limit etc.
- select ใช้เลือก column
- where ใช้ filter
- group by ใช้ จัดกลุ่ม
- order by ใช้ sort
- pivot มันคือการทำ aggregation และ group by ในแนวนอน โดยไม่ดึง column header มา
- label ใช้ เปลี่ยนชื่อหัว column มีเฉพาะใน google sheets
- limit ใช้ กำหนด row ของข้อมูลที่เราดึงมา
4. Regular Expression คืออะไร ยกตัวอย่าง syntax สั้นๆซัก 2-3 อัน
คือ การทำ pattern matching 
**`.`** match any character
**`^`**T เริ่มต้นด้วย “T”
y**`$`** ลงท้ายด้วย “y”
