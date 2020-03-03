

# Vectors ----

vec_num <- c(1, 5, 6, 3)
print(vec_num)

vec_char <- c('apple', 'banana', 'mandarin', 'melon')
print(vec_char)

vec_logi_gt5 <- vec_num >= 5
print(vec_logi_gt5)

vec_logi_apple <- vec_char == 'apple'
print(vec_logi_apple)

# paste charcater vectors
vec_char2 <- paste(c('red', 'yellow', 'orange', 'green'), vec_char)
print(vec_char2)

# names
names(vec_num) <- vec_char
print(vec_num)

# Dataframes ----

dat_fruit <- data.frame(name = vec_char, count = vec_num)
print(dat_fruit)

print(nrow(dat_fruit))
print(ncol(dat_fruit))

# subset
dat_fruit_sub <- subset(dat_fruit, count >= 5)
print(dat_fruit_sub)
print(nrow(dat_fruit_sub))
print(ncol(dat_fruit_sub))

# Matrices ----

mat <- matrix(c(1, 3, 6, 8, 3, 5, 2, 7), nrow = 2)
mat

# colnames
colnames(mat) <- vec_char
mat

# rownames
rownames(mat) <- c('bag1', 'bag2') 
mat

dim(mat)

# subset
print(mat['bag1', ])
print(mat[, 'banana'])

# rowsums and colsums
print(rowSums(mat))
print(colSums(mat))

