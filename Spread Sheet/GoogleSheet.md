## Exercise file

Google sheet101
https://docs.google.com/spreadsheets/d/1C7HsdkzTgWLHgd5Lr4jAuLWivG8Cg0DDaYJt-Lz_bPM/edit?usp=drive_link

Google sheet102
https://docs.google.com/spreadsheets/d/1_SLVfLV-szKjcyJlnGkIm2JrcMorIOMileb8w33QOq4/edit?usp=drive_link

Main_Spreadsheet _Google Sheets + HW 
https://docs.google.com/spreadsheets/d/1W1HkrXjpfJxxmyzNZULyqJ4eSV9B-rApjzItX7myc4I/edit?usp=drive_link

Basic Pivot
https://docs.google.com/spreadsheets/d/1W1HkrXjpfJxxmyzNZULyqJ4eSV9B-rApjzItX7myc4I/edit?usp=drive_link

To Do app 
https://docs.google.com/spreadsheets/d/19sfvV_yzn63xh7IoLyXZA4WwPYXhyodg_CTyUBNPy6Q/edit?usp=drive_link

---

## Intro to Google Spread Sheets

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

## HW 1 เทสีทั้ง ROW

เราต้อง lock column ด้วย `$` เช่น `$H` เพราะเวลา column ขยับไปทางขวา สูตรมันจะขยับตามไปด้วย 

นี่เป็นเหตุผลว่าทำไมเวลาเราจะ format แค่ column เดียว 

จึงใส่สูตร `=H4` เฉยๆ (ใส่ค่าแค่ =cell บน) มันจึงวิ่งลงได้เวลาเรา ☑️ ลงมาเรื่อยๆ

ไม่จำเป็นต้อง `=TRUE` ก็ได้ เพราะค่า Default มันเป็น TRUE อยู่แล้ว 

---

## HW 2 อ่าน Google Query language

---

## HW 3 เขียน dynamic query ทำ dropdown from range

TIPS: เขียน Query อันแรกให้ได้ก่อนแล้วค่อยๆ ถอดมันมาเป็น Dropdown list


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


---

## HW 4 vlookup sheet 11 ดึงตาราง 2 อันล่าง ขึ้นมารวมกับอันบน


สามารถเลือก column ที่จะดึงมาได้ ถ้าใช้ `=ArrayFormula(VLOOKUP(search_key,range,{2,3,4,5},FALSE))`

ต้องเป็น `ArrayFormula` เท่านั้น จึงจะกำหนด `{ }` ได้  VLOOKUP เฉยๆทำไม่ได้ 

---

## TRIM()

data → data cleanup

=TRIM() ลบช่องว่างหน้าหลังคำในเซลล์ ถ้ามีช่องว่างตรงกลางจะลบเหลือช่องเดียว

---

## HW 5 sheet 14 convert thaidate to english date



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

## HW6 sheet16 **Project - ID Card Parser**


---

<aside>
💡 เลือกใช้เครื่องมือให้เหมาะสมกับงาน

</aside>

---

## Google Translate


---

## HW 7Named Function

การบ้านเปลี่ยน c เป็น F



4. Regular Expression คืออะไร ยกตัวอย่าง syntax สั้นๆซัก 2-3 อัน
คือ การทำ pattern matching 
**`.`** match any character
**`^`**T เริ่มต้นด้วย “T”
y**`$`** ลงท้ายด้วย “y”
