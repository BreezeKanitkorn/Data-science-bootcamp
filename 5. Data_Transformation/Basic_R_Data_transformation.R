## Basic transformation by use IMDB file.

## Install package only 1 times 
install.packages("dplyr") 

## load package
library(dplyr)

##read csv file into Rstudio
imdb<-read.csv("imdb.csv", stringsAsFactors = FALSE) # stringASFactor = faslse ทำให้ตัวอักษาเป็นtypeเดิมไม่เป็น factor
View(imdb)

##review data structure *ต้อง load library(dplyr) ก่อนใช้ function glimpse นะถึงใช้ได้
glimpse(imdb)

##print head and tail of data
head(imdb,10)
tail(imdb,10)

##show name column
names(imdb)

##select coulumn
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1, 5)

select(imdb, movie_name = MOVIE_NAME , release_year=YEAR) #change column name


## pipe operator
imdb %>% select(movie_name = MOVIE_NAME , release_year=YEAR) #Result same as above

imdb %>% 
  select(movie_name = MOVIE_NAME , release_year=YEAR) %>% 
  head(10) #but can use reult for orther function

## filter data
filter(imdb, SCORE >= 9.0)

imdb %>% filter(SCORE >= 9.0) ## Better to use PIPE function because flexible

names(imdb) <- tolower(names(imdb)) ## change column name to lower. It's easy to type.(Dont need push shift all time)

## select & filter 
imdb %>% 
  select(movie_name, year, score) %>%
  filter(score >=9 & year > 2000)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score ==8.8 | score == 8.3 | score == 9.0)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))  ## use in operator(%in%) instead

mtcars %>%
  filter(between(hp, 100, 200)) %>%

## filter string columns
imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(genre == "Drama")  ## หาได้ เเค่ genre =Drama แบบexactly 

grepl("Drama", imdb$genre) ## การหาว่า drama อยู่ตรงไหนบ้างใน genre

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))  ##หาได้ทั้งหมดในgenre ที่มี Drama


imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("King", imdb$movie_name))  ## grepl() is sensitive case "King" != "king"

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("king", imdb$movie_name))

## create new column : mutate()
imdb %>%
  select(movie_name, score, length)%>%
  mutate(score_group = if_else(score >=9 ,"High Rating","Low Rating" ),
         length_group = if_else(length >=120,"Long Film","Short Film"))

imdb %>%
  select(movie_name, score)%>%
  mutate(score_group = score + 0.1) %>%
  head(10)

imdb %>%
  select(movie_name, score)%>%
  mutate(score = score + 0.1) %>%  # เขียนทับตัวเดิมได้ด้วย
  head(10)

## Arrange data

imdb %>% 
  arrange(length) %>% ## ascending order (A->Z)
  head(10)

imdb %>% 
  arrange(desc(length)) %>% ## descending order (Z->A)
  head(10)

imdb %>%
  arrange(rating, desc(length)) ## Arrange 2 data (1st is rating then desc length)


## summarise and group_by
imdb %>% 
  filter(rating != "") %>% ##filter blank(NULL)  data in rating
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n =n(),
            sum_length = sum(length))

## join data

favorite_film <- data.frame (id = c(5, 10, 25, 30, 98))

favorite_film %>%
  inner_join(imdb, by = c("id" = "no"))

## write csv file (export result)

imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year >2000)

## export file
write.csv(imdb_prep, "imdb_prep.csv", row.names =  FALSE)


##write.csv() เป็น based R function นะครับ ไม่จำเป็นต้องโหลด library อะไรเพิ่ม แต่ถ้าใครอยากใช้ฟังก์ชันใหม่ๆอย่าง write_csv() ต้องโหลด library readr ก่อนนะครับ
##จริงๆผลที่ได้ไม่ต่างกันเลย แต่ write_csv() หรือ read_csv() ที่อยู่ใน readr จะทำงานได้เร็วกว่านิดนึง และมีพฤติกรรมที่ไม่แปลกเหมือน based R functions เก่าๆ
##Tip - วิธีสังเกตว่า functions ไหนเป็น based R เก่า หรือ modern R ให้ดูที่ตัว . ได้เลย ชื่อฟังก์ชันใหม่ๆจะใช้ _ แทน . หมดแล้ว (เขียนแบบ snake case เช่น hello_world() เป็นต้น)

