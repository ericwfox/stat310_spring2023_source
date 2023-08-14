### useful r commands measures of position
x <- c(68, 76, 66, 63, 70, 66, 71, 71, 64, 71)
summary(x) 
mean(x)
median(x)
min(x)
max(x)
sort(x)

### affect of outlier
x <- c(62, 63, 64, 66, 72, 1000)
mean(x)
median(x)

### temperature
x = c(72, 67, 73, 81, 75)
mean(x)
sd(x)
(5/9)*(73.6-32)
(5/9)*(73-32)

### compute sd
x = c(2, 5, 10, 15, 18)
var(x)
sd(x)

### use r measures of variation
x <- c(68, 76, 66, 63, 70, 66, 71, 71, 64, 71)
var(x)
sd(x)
max(x)-min(x) #range
IQR(x)


### comparing standard deviations
x1 = c(100, 99, 98, 50, 2, 1, 0); sd(x1)
x2 = c(53, 52, 51, 50, 49, 48, 47); sd(x2)
x3 = c(51, 51, 51, 50, 49, 49, 49); sd(x3)
mean(x1)
mean(x2)
mean(x3)


### box plot
set.seed(10)
x = round(rexp(11, 0.05))
boxplot(x)
x <- c(0, 18, 15, 32, 5, 22, 47, 15, 26, 13, 9)
summary(x)

pdf("boxplot1.pdf", width=2.5, height=4)
par(mar = c(1, 3, 1, 1))
boxplot(x)
dev.off()


### shapes of distributions
pdf("figure/shapes.pdf", width=7, height=5)
par(mfrow = c(2,3), mar = c(3, 2, 2, 2))
set.seed(1)
x = rnorm(200)
hist(x, main = "Symmetric, Normal", 
     xlab = "", xaxt = "n", yaxt = "n", ylab = "")

x = runif(1000)
hist(x, main = "Symmetric, Uniform", breaks = 5,
     xlab = "", xaxt = "n", yaxt = "n", ylab = "")

x = c(rnorm(100, mean = 5), rnorm(100, mean = 10))
hist(x, main = "Bimodal", 
     xlab = "", xaxt = "n", yaxt = "n", ylab = "")

x = rexp(200, 1)
hist(x, main = "Right Skewed", 
     xlab = "", xaxt = "n", yaxt = "n", ylab = "")

x = -1*rexp(200, 1) + 7
hist(x, main = "Left Skewed", 
     xlab = "", xaxt = "n", yaxt = "n", ylab = "")
dev.off()





### symmetric, skewed right, and skewed left distributions
### compare mean and median
pdf("figure/distributions.pdf", width=7, height=2.5)
par(mfrow = c(1, 3), mar=c(1, 1, 3, 1))
# symmetric, normal
grd <- seq(-4, 4, by=0.01)
y <- dnorm(grd)
plot(grd, y, type = "l", xaxt="n", yaxt="n", 
     xlab="", ylab="", main="Symmetric")
# skewed right
grd <- seq(0, 15, by=0.01)
y <- dchisq(grd, df=5)
plot(grd, y, type = "l", xaxt="n", yaxt="n", 
     xlab="", ylab="", main="Right Skewed ")
# skewed left
grd <- seq(0, 15, by=0.01)
y <- dchisq(grd, df=5)
plot(-1*grd, y, type = "l", xaxt="n", yaxt="n", 
     xlab="", ylab="", main="Left Skewed")
dev.off()



### Example: Histogram 
library(Stat2Data)
library(tidyverse)
library(xtable)
data(Election16)
head(Election16)

states <- Election16 %>% 
  select(State, Income, BA) %>% 
  mutate(Income = Income / 1000)

xtable(states)

pdf("figure/hist_income.pdf", width = 5, height = 4)
par(mar = c(5, 4, 2, 1))
hist(states$Income, xlab = "Per Capita Income (in $1000's)", main = "")
dev.off()

h1 <- hist(states$Income)
h1$breaks
h1$counts

### Example: Scatter Plot
pdf("figure/scatter_income_college.pdf", width = 5, height = 4)
par(mar = c(5, 5, 1, 1))
plot(Income ~ BA, data = states,
     xlab = "Percent of Population with a College Education",
     ylab = "Per Capita Income (in $1,000's)")
dev.off()


