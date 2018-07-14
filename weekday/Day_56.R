# Solution exercises Functional Programming With Purrr
# from https://www.r-exercises.com/2018/01/12/functional-programming-with-purrr-exercises-part-1/
library(purrr)

# Exercise 1
map(mtcars, mean)

# Exercise 2
map_dbl(mtcars, mean)

# Exercise 3
map_dbl(mtcars, mean, trim = 0.1)

# Exercise 4
mtcars %>% 
  split(.$cyl) %>% 
  map(length)

# Exercise 5
mtcars %>% 
  split(.$cyl) %>% 
  map_df(~map(. ,mean))

# Exercise 6
mtcars %>% 
  split(.$cyl) %>% 
  map(~lm(qsec ~ hp, data = .))

# Exercise 6
mtcars %>% 
  split(.$cyl) %>% 
  map(~lm(qsec ~ hp, data = .)) %>% 
  map(summary) %>% 
  map("coefficients")

# Exercise 8
pred <- mtcars %>% 
  split(.$cyl) %>% 
  map(~lm(qsec ~ hp, data = .)) %>% 
  map2(list(mtcars), ~predict(.x, .y))

# Exercise 9
pred %>%
  iwalk(~hist(.x, main = paste('Histogram for',.y, 'cylinders'), xlab = 'Predicted qsec'))

# Exercise 10
pred %>% 
  pmap_dbl(sum)/3

# Solution exercises Functional Programming With Purrr part 2
# from https://www.r-exercises.com/2018/01/12/functional-programming-with-purrr-exercises-part-2/

# Exercise 1
1:10 %>% 
  accumulate(`*`)

# Exercise 2
list(letter = letters, number = 1:10) %>%
  cross_df

# Exercise 3
list1 <- list('a', data.frame(1:10), TRUE, 1, letters, 153)
list1 %>% 
  detect_index(is.numeric)

# Exercise 4
list1 %>% 
  every(is.atomic)

# Exercise 5
list1 %>% 
  keep(is.atomic)

# Exercise 6
list1 %>% 
  has_element('b')

# Exercise 7
list1 %>% 
  map(safely(log)) %>% 
  transpose()

# Exercise 8
list2 <- list(rnorm, runif, rcauchy)
list2 %>%
  invoke_map(10)

# Exercise 9
rerun(5, runif(10))

# Exercise 10
rerun(5, runif(10)) %>%
  flatten_dbl()
