library(openintro)
library(tidyverse)

set.seed(100)
gpa <- satgpa %>%
  select(hs_gpa, fy_gpa) %>%
  sample_n(150)

lm1 <- lm(fy_gpa ~ hs_gpa, data = gpa)
summary(lm1)

pdf("figure/gpa_resid.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
plot(gpa$hs_gpa, resid(lm1), cex = 0.9, 
     xlab = "High School GPA", ylab = "Residuals")
abline(h = 0)
dev.off()

pdf("figure/hist_resid.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
hist(resid(lm1), xlab = "Residuals", main = "")
dev.off()

set.seed(100)
x = rnorm(100)
y = rnorm(100)

lm0 <- lm(y ~ x)
summary(lm0)

pdf("figure/scatter_slope_zero.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
plot(x, y)
abline(lm0)
dev.off()


