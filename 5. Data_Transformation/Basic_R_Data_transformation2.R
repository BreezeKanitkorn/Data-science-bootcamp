##Install package as below
install.packages("tidyverse")
library(tidyverse)

## data.frame VS tibble
df_tibble <- tibble( id = 1:3, name = c("toy", "jisoo", "lisa")) 
df <- data.frame( id = 1:3, name = c("toy", "jisoo", "lisa"))

#convert data.frame to tibble
mtcars_tibble <- tibble(mtcars)

mtcars_tibble #Tip - ถ้าอยากจะ print tibble มากกว่า 10 แถว ให้ใช้ฟังก์ชัน print(mtcars_tibble, n=20) กำหนดจำนวนแถวที่จะ print ได้ที่ parameter n
print(mtcars_tibble,n=20)

## sample_n() สุ่มจำนวน rows ตามที่เราต้องการ หรือ sample_frac() สุ่มเป็น % ได้ i.e. frac ย่อมาจากคำว่า fraction
sample_n(mtcars, size=5)


set.seed(42)  # run พร้อมด้านล่าง จะlock ผลลัพธ์เหมือนเดิมทุกครั้งเปลี่ยนเลขผลเปลี่ยน
sample_n(mtcars, size=5)

sample_frac(mtcars, size=0.2) # sample_frac สามารถกำหนดไซต์ได้ 0.2 = 20% -> สุ่มตัวอย่างจำนวน20%
sample_frac(mtcars, size=0.5, replace = T ) #เติมreplace = T หมายถึง ผมลัพธ์สามารซ้ำอันเดิมได้

## slice() ใช้ดึง rows ที่เราต้องการจาก dataframe / tibble

slice(mtcars, 1:5)

mtcars %>%   #same result as above use pipe(%>%) instead
  slice(1:5)

mtcars %>% 
  slice(6:10)

mtcars %>% 
  slice(c(1,3,5))

mtcars %>% 
  slice(sample(nrow(mtcars),10))
