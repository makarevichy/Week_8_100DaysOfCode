# Solution exercises Hacking strings with stringr
# from https://www.r-exercises.com/2017/07/14/hacking-strings-with-stringr/
library(stringr)
library(babynames)

# Exercise 1
x <- "I AM SAM. I AM SAM. SAM I AM"
y <- "THAT SAM-I-AM! THAT SAM-I-AM! I DO NOT LIKE THAT SAM-I-AM!"
z <- "DO WOULD YOU LIKE GREEN EGGS AND HAM?"
str_c(x, y, z, sep = '. ')

# Exercise 2
str_c(x, y, z, NA, sep = '. ')
paste(c(x,y,z,NA),collapse = ". ")

# Exercise 3
str_length(babynames$name)

# Exercise 4
x <- 'Yuriy Makarevich'
substr(x, 2, 7)
str_sub(x, 2)
str_sub(x, -1)
str_sub(x, -5)

# Exercise 5
x <- rownames(mtcars)
x[str_detect(x, pattern = 'Merc')]
str_subset(x, pattern = "Merc")

# Exrcise 6
sum(str_count(x, 'e'))

# Exercise 7
j <- "The_quick_brown_fox_jumps_over_the_lazy_dog"
str_split(j, "_")

# Exercise 8
str_split(j, "_", n = 2)

# Exercise 9
str_replace(j, '_', '-')
str_replace_all(j, '_', '-')

# Exercise 10
na_string_vec <- c ("The_quick_brown_fox_jumps_over_the_lazy_dog", NA)
str_replace_na(na_string_vec)

# Solution exercises More string Hacking with Regex and Rebus
# from https://www.r-exercises.com/2017/08/11/more-string-hacking-with-regex-and-rebus/
library(stringi)
library(rebus)

# Exercise 1
x <- c("stringer","stringi","rebus","redbus")
stri_subset(x, regex = START %R% 'st')

# Exercise 2
stri_subset(x, regex = 'bus' %R% END)

# Exercise 3
m <- c("aba","aca","abba","accdda")
stri_subset(m, regex = 'a' %R% ANY_CHAR %R% 'a') 

# Exercise 4
y <- c("brain","brawn","rain","train")
stri_subset(y, regex = 'br' %R% any_char(1, hi = Inf) %R% 'n')

# Exercise 5
stri_subset(y, regex = or('br', 'tr'))

# Exercise 6
l <- c("Canada","america","france")
stri_subset(l, regex = char_class('Cm'))
stri_subset(l, regex = '[C, m]')

# Exercise 7
str_extract('123abc', one_or_more(DIGIT))

# Exercise 8
vow <- c("blue","sue","CLUE","TRUE")
str_match(vow, one_or_more(char_class("aeiouAEIOU")))

# Exercise 9
str_match(vow,one_or_more(negated_char_class("aeiouAEIOU")))

# Exercise 10
vow1 <- c("blue","sue","CLUE","TRUE","aue")
stri_subset(vow1, regex = exactly(one_or_more(char_class("aeiouAEIOU"))))
