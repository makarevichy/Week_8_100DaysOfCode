# Solution exercises K-Means Clustering in R
# from https://www.r-bloggers.com/k-means-clustering-in-r-exercises/

# Exercise 1
set.seed(1)
nam_kl <- kmeans(iris[ ,grepl('Sepal', names(iris))], centers = 3)
cl <- nam_kl$cluster

# Exercise 2
prop.table(table(cl, iris$Species))

# Exercise 3
df_iris <- data.frame(iris, clust = cl)
head(df_iris)
plot(iris[ ,1], iris[ ,2], pch = df_iris$clust, col = df_iris$Species)

# Exercise 4
nam_kl <- kmeans(iris[ ,grepl('Sepal|Petal', names(iris))], centers = 3)
df_iris <- data.frame(iris, clust = nam_kl$cluster)
table(nam_kl$cluster, iris$Species) # the result was better
plot(iris[ ,1], iris[ ,2], pch = df_iris$clust, col = df_iris$Species)

# Exercise 5
df_iris$Petal.Width <- df_iris$Petal.Width * 2
nam_kl <- kmeans(df_iris[ ,grepl('Sepal|Petal', names(df_iris))], centers = 3)
df_iris$clust <- nam_kl$cluster
table(df_iris$clust, iris$Species) # the result was better

# Exercise 6
head(df_iris)
df_iris6 <- scale(df_iris[ ,1:4])
nam_kl <- kmeans(df_iris6, centers = 3)
cl6 <- nam_kl$cluster

df_6 <- scale(iris[, -5])
nam_kl6 <- kmeans(df_6, centers = 3)
cl6a <- nam_kl6$cluster
table(cl6, cl6a)

# Exercise 7
titanic <- read.csv(file.choose())
titanic$Sex <- ifelse(titanic$Sex == "male", 1L, 0L)
titanic$Pclass <- ifelse(titanic$Pclass == 3, 1L, 0L)

titanic_stn <- scale(titanic[, c("Sex", "SibSp", "Parch", "Fare")])
titanic_km <- kmeans(titanic_stn, 4)

# Exercise 8
titanic_km$centers

# Exercise 9
x <- 2:20
result <- lapply(x, function(k) kmeans(titanic_stn, k, nstart=20))

# Exercise 10
res <- lapply(result, function(x) x[["betweenss"]] / x[["totss"]])
plot(x, res, type = "b", xlab = "n_clusters", ylab = "betweenSS / totalSS")