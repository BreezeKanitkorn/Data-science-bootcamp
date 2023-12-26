##PLease see all detailed in notion as below link..
##https://www.notion.so/breeze-ks/R-Data-Transformation-58f0aaa56aef423e9dafe503845d8e9a

##Analysis Flights (Data frame 300K records) 
## install package
install.packages(c("tidyverse", "glue", "RSQlite", "RPostgreSQL", "lubridate"))

## load library
library(nycflights13)
library(tidyverse) # dplyr
library(glue)
library(lubridate)

## Data
data("flights")
data("airlines")
#Q1: Top 10 highest minute delays(dep_delay+ arr_delay) flight in Oct 2013  
#remark : all data in flights is 2013 (dont need to filter "year")   

Q1 <- flights %>%
  filter(month == 10)%>% 
  mutate( minute_delay = dep_delay + arr_delay) %>%
  inner_join(airlines)%>%
  select(carrier, airline_name = name, tailnum ,month , minute_delay )%>%
  arrange( desc(minute_delay))%>%
  head(10)

View(Q1)

## Q2: Top 10 destination 
data(airports) #load data for join destination name

Q2<- flights %>%
  group_by(dest) %>%
  summarise(quantity = n()) %>%
  arrange(desc(quantity)) %>%
  left_join(airports, by = c("dest"= "faa")) %>%
  select( dest_id = dest, dest_name = name, quantity)%>%
  head(10)

View(Q2)

## Q3: Which months of the year have the most flights?

Q3 <- flights %>%
      count(month) %>%
      arrange(desc(n)) 

View(Q3)

##Q4: Top 5 manufacturers in 2013

Q4<- flights %>%
  inner_join(planes, by = "tailnum") %>%
  group_by(manufacturer)%>%
  summarise(quantity = n())%>%
  arrange(desc(quantity)) %>%
  head(10)

View(Q4)

##Q5: Summarise mean, min ,max , n of delay group by manufacturers 

Q5 <- flights %>%
  mutate( delay = dep_delay + arr_delay) %>%
  inner_join( planes, by = "tailnum") %>%
  group_by(manufacturer)%>%
  summarise(avg_delay = mean(delay,na.rm = T),
            min_delay = min(delay,na.rm = T),
            max_delay = max(delay,na.rm = T),
            n = n()) %>%
  arrange(desc(avg_delay)) 


View(Q5)


