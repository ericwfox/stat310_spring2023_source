nhanes <- readRDS(url("https://ericwfox.github.io/data/nhanes.rds"))

nhanes_m <- subset(nhanes, Gender == "male")

pdf("figure/height_hist_norm.pdf", width= 5, height = 4)
par(mar = c(4.5, 2, 2, 2))
hist(nhanes_m$Height, freq = FALSE, xlab = "Male Height (cm)", 
     ylab = "", yaxt = "n", main = "")
x <- seq(150, 200, 0.1)
y <- dnorm(x, mean=mean(nhanes_m$Height), sd=sd(nhanes_m$Height))
lines(x, y, col = "red", lwd = 2)
dev.off()

# N(3, 10)
pdf("figure/norm1.pdf",width=5,height=4)
par(mar=c(3, 2, 2, 2))
x <- seq(0, 20, by=0.1)
y <- dnorm(x, mean=10, sd=3)
plot(x, y, xlab="", ylab="", yaxt = "n", type = "l")
lines(x,y)
dev.off()

# two normals 
pdf("figure/norm2.pdf",width=5,height=4)
par(mar = c(3, 2, 2, 2))
x <- seq(0, 35, by=0.01)
y1 <-  dnorm(x, mean = 10, sd = 3)
y2 <- dnorm(x, mean = 20, sd = 5)
plot(x, y1, xlab="", ylab="", type = "l", 
     xlim = c(0, 35), ylim = c(0, 0.15), yaxt = "n", lty = 1)
lines(x, y2, lty=2)
legend("topright", 
       c(expression(paste("N(", mu, "=10", ", ", sigma, "=3)")), 
         expression(paste("N(", mu, "=20", ", ", sigma, "=5)" ))), 
       lty = c(1,2))
dev.off()


