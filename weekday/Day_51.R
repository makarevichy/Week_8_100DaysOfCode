# Solution exercises Parsing Dates and Time – Part 1
# from https://www.r-exercises.com/2018/03/28/parsing-date-and-time-exercise-1/
library(anytime)
library(lubridate)

# Exercise 1
mar_22_2018 <- c("mar-22-2018","2018/03/22", "2018-03-22","22 mar 2018")
anytime(mar_22_2018)

# Exercise 2
anytime(mar_22_2018, asUTC = T)

# Exercise 3
as.POSIXct('2018-03-22 12:30:00')

# Exercise 4
as.POSIXct("2018-03-22 12:30:00","Europe/London")

# Exercise 5
ymd('2018-mar-22')

# Exercise 6
dmy('22-mar-2018')

# Exercise 7
mdy('mar-22-2018')

# Exercise 8
dym('18/2018/4')

mdy('1/21/18')

# Solution exercises Parsing Dates and Time – Part 2
# from https://www.r-bloggers.com/parsing-dates-and-time-part-2-exercises/

# Exercise 1
dt <- "Apr, 11th 2018 17:00"
mdy_hm(dt)

# Exercise 2
dt <- "2018/04/11 17:00"
ymd_hm(dt)

# Exercise 3
dt <- "11.4.2018 17"
mdy_h(dt)

# Exercise 4
dt <- "Wed apr 11th 2018 at 7pm"
parse_date_time(dt, orders = "amdyIp")

# Exercise 5
parse_date_time("110 2018", orders = "jy")

# Exercise 6
parse_date_time(c('1 2018', '3 2018'), orders = 'qY')

# Exercise 7
parse_date_time('10th week of 2018', orders = 'WY')

# Solution exercises Parsing Dates and Time – Part 3
# from https://www.r-exercises.com/2018/04/25/parsing-dates-and-time-part-3-exercises/

# Exercise 1
today()
now(tzone = 'Europe/Moscow')

# Exercise 2
x <- "11 th april 2012"
y <- "April 24th 2018 11:59:59"
difftime(mdy_hms(y), dmy(x), units = 'weeks')

# Exercise 3
difftime(now(), dmy(x), units = 'hours')

# Exercise 4
x <- "11 th april 2018 11.30.00"
dmy_hms(x) + days()

# Exercise 5
dmy_hms(x)+hours(100)

# Exercise 6
dmy_hms(x) - weeks(3)

# Exercise 7
dmy_hms(x) - years(10)
dmy_hms(x) - dyears(10)