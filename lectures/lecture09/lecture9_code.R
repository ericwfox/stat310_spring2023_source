# load salary data
Salaries <- readRDS(url("https://ericwfox.github.io/data/Salaries.rds"))
length(Salaries)

# population mean 
mu = mean(Salaries)
mu

# population standard deviation 
sigma = sd(Salaries)
sigma

# population distribution 
pdf("figure/salary_dist.pdf", width = 6, height = 4)
par(mar = c(4.5, 4, 1, 1))
hist(Salaries, xlab = "Salary (in thousands)", main = "")
dev.off()

set.seed(99)
# take random samples samples
samp1 = sample(Salaries, size = 50)
mean(samp1)
sd(samp1)

samp2 = sample(Salaries, size = 50)
mean(samp2)

set.seed(310)
xbars = replicate(10000, {
  samp = sample(Salaries, size = 50)
  mean(samp)
})


pdf("figure/sampling_dist.pdf", width = 6, height = 4)
par(mar = c(4.5, 4, 1, 1))
# make histogram of sampling distribution
hist(xbars, xlab = "Sample mean salary (in thousands)", main = "")
# plot vertical line at population mean
abline(v = mu, col = "red", lwd = 2)
dev.off()

sd(xbars)
sigma / sqrt(50)

# Example ------------
library(tidyverse)

set.seed(310)
gss_tv <- gss_cat %>% 
  select(year, tvhours) %>%
  filter(year == 2014) %>% 
  drop_na() %>% 
  sample_n(300) 
  
length(gss_tv$tvhours)
mean(gss_tv$tvhours)


library(NHANES)
set.seed(310)
sleephrs <- NHANES$SleepHrsNight[!is.na(NHANES$SleepHrsNight)]
sleephrs_samp <- sample(sleephrs, size = 40)
summary(sleephrs_samp)
sd(sleephrs_samp)

pdf("figure/sleep_hist.pdf", width = 5, height = 3.5)
par(mar = c(4.5, 4, 1, 1))
hist(sleephrs_samp, xlab = "Number of Hours of Sleep", 
     main = "", cex.lab = 1.2)
dev.off()

# Checking the conditions
# case when CI is not valid

pdf("figure/hist1.pdf", width = 5, height = 3.5)
set.seed(310)
x <- rexp(15, rate = 1/60)
par(mar = c(3, 4, 1, 1))
hist(x, breaks = 10, xlab = "", main = "")
dev.off()


pdf("figure/hist2.pdf", width = 5, height = 3.5)
set.seed(123)
x <- rnorm(20, mean = 40, sd = 10)
par(mar = c(3, 4, 1, 1))
hist(x, breaks = 5, xlab = "", main = "")
dev.off()



pdf("figure/hist3.pdf", width = 5, height = 3.5)
set.seed(999)
cdc <- readRDS(url("https://ericwfox.github.io/data/cdc.rds"))
weight <- cdc$weight[!is.na(cdc$weight)]
weight_samp <- sample(weight, size = 200)
par(mar = c(3, 4, 1, 1))
hist(weight_samp, xlab = "", main = "")
dev.off()



