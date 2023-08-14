library(openintro)
library(tidyverse)

set.seed(100)
gpa <- satgpa %>%
  select(hs_gpa, fy_gpa) %>%
  sample_n(150)

pdf("figure/gpa_scatter1.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
plot(fy_gpa ~ hs_gpa, data = gpa, cex = 0.75,
     xlab = "High School GPA", 
     ylab = "First Year College GPA")
dev.off()

lm1 <- lm(fy_gpa ~ hs_gpa, data = gpa)
summary(lm1)
round(coef(lm1), 3)
abline(lm1)

pdf("figure/gpa_scatter_line.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
plot(fy_gpa ~ hs_gpa, data = gpa, cex = 0.75,
     xlab = "High School GPA", 
     ylab = "First Year College GPA")
abline(lm1, lwd = 1.5)
dev.off()

which.max(resid(lm1))
predict(lm1)[100]
max(resid(lm1))
gpa[100, ]
pdf("figure/gpa_scatter_resid.pdf", width = 5, height = 4)
par(mar = c(4.5, 4.5, 2, 2))
plot(fy_gpa ~ hs_gpa, data = gpa, cex = 0.75,
     xlab = "High School GPA", 
     ylab = "First Year College GPA", col = "darkgray")
abline(lm1, lwd=1.5)
lines(x=c(2.7,2.7), y=c(2.13,3.4), col = "red", lwd=1.5)
dev.off()


round(mean(gpa$hs_gpa), 3)
round(mean(gpa$fy_gpa), 2)
round(sd(gpa$hs_gpa), 3)
round(sd(gpa$fy_gpa), 3)
round(cor(gpa$fy_gpa, gpa$hs_gpa), 3)




