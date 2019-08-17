## understanding the *apply family

source("utils.R")

## apply() : matrix --> vector

print("--- apply data ---")
m <- matrix(c(1,0,1,1,0,
              1,1,1,1,0,
              1,0,0,1,1,
              0,1,1,1,0), nrow = 4)
print(m)

print("--- apply output ---")
v1 <- apply(m, MARGIN = 1, copymay, d=3)
print(v1)
v2 <- apply(m, MARGIN = 2, copymay, d=4)
print(v2)

## lapply : list --> list (also works on dataframes and vectors)
print("--- apply data ---")
lst <- list(1:3, c(1, 6, 100), seq(1, 3, 0.5))
print(lst)

print("--- apply output ---")
lst1 <- lapply(lst, median)
print(lst1)
lst2 <- lapply(lst, "+", 2)
print(lst2)
lst3 <- lapply(lst, "*", 1000)
print(lst3)

## sapply (SIMPLE apply: list --> vector
print("--- sapply data ---")
lst <- list((1:3), c(1, 6, 100), seq(1, 3, 0.5))
print(lst)

print("--- sapply output ---")
lst1 <- sapply(lst, median)
print(lst1)
lst2 <- sapply(lst, "+", 2)  # same output as lapply
print(lst2)
lst3 <- sapply(lst, "*", 1000)  # same output as lapply
print(lst3)


## tapply: vector (+factor) --> vector
print("--- tapply data ---")
salary <- sample(1000 * c(35, 42, 50, 57, 63, 72, 107, 167), size=10, replace=TRUE)
fact <- list(gender=c(rep("M", 5), rep("F", 5)),
             eye_color=rep(c("blue", "brown"), 5))
print(data.frame(list(salary=salary, gender=fact["gender"], eye_color=fact["eye_color"])))
print("--- tapply output ---")
tab <- tapply(salary, INDEX=fact, FUN=mean)
print(tab)


## mapply (MULTIVARIATE apply): vectorizes functions that are by itself are not vectorized

outp <- mapply(rep, 1:3, 5)
print(outp)








