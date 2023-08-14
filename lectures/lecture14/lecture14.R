profsalary = read.csv("https://ericwfox.github.io/data/profsalary.csv")

lm1 = lm(Salary ~ Experience, data = profsalary)
plot(Salary ~ Experience, data = profsalary, 
       xlab = "Years of Experience", ylab = "Salary")
abline(lm1)

lm2 = lm(Salary ~ Experience + I(Experience^2), data=profsalary)
summary(lm2)

library(ggplot2)

ggplot(profsalary, aes(x = Experience, y = Salary)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se=F) +
  xlab("Years of Experience") + ylab("Salary")