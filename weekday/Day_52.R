# Solution exercises String Manipulation
# from https://www.r-bloggers.com/string-manipulation-exercises/

# Exercise 1
novel <- readLines("http://www.r-exercises.com/wp-content/uploads/2016/11/gambler.txt")
noquote(novel)

# Exercise 2
length(novel)

# Exercise 3
nchar(novel)

# Exercise 4
cat(paste(novel, collapse = '\n'))

# Exercise 5
cat(toupper(novel), file="gambler-output.txt")

# Exercise 6
chartr("at", "AT", novel)

# Exercise 7
'lucky' %in% novel

# Exercise 8
x <- paste(novel, collapse = '\n')
y <- strsplit(x, split = ' ')
length(y[[1]])

# Exercise 9
sum(y[[1]] == 'money')

# Exercise 10
n <- scan(n=2)
sprintf("%.2f / %.2f = %.2f", n[1], n[2], n[1]/n[2])

# Solution exercises Hacking Strings with stringi
# from https://www.r-exercises.com/2017/07/28/hacking-strings-with-stringi/

# Exercise 1
library(stringi)

# Exercise 1
c1 <- "a quick brown fox jumps over a lazy dog"
c2 <- "a quick brown fox jump over a lazy dog"
stri_compare(c1,c2)
c1 %s<=% c2
c1 %s==% c2
c1 %s!=% c2
c1 %s>% c2
c1 %stri>=% c2

# Exercise 2
stri_count_words(c(c1,c2))

# Exercise 3
stri_extract_all_words(c(c1,c2))

# Exercise 4
genius <- c("Godel","Hilbert","Cantor","Gauss", "Fermet","Gauss")
genius[stri_duplicated(genius)]

# Exercise 5
stri_length(genius)

# Exercise 6
Genius1 <- c("Godel","Hilbert","Cantor","Gauss", "Gödel", "Fermet","Gauss")
stri_trans_general(Genius1, "Latin-ASCII")

# Exercise 7
#“A-B_C-D_E-F_G-H_I-J_K-L_M-N_O-P_Q-R_S-T_U-V_W-X_Y-Z_”
stri_join(LETTERS,separators = c("-","_"),collapse = "")

# Exercise 8
stri_locate_first_words(c1)
stri_locate_last_words(c1)

# Exercise 9
pun <- "A statistician can have his head in an oven and his feet in ice, and he will say that on the average he feels fine"
stri_replace_all_fixed(pun, c('statistician', 'average'), c('mathematician', 'median'), vectorize_all = F)

# Exercise 10
x <- "I AM SAM. I AM SAM. SAM I AM"
stri_replace_last_fixed(x, 'SAM', 'ADAM')