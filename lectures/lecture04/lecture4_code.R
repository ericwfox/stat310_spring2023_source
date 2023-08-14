library(ggplot2)
nhanes = readRDS(url("https://ericwfox.github.io/data/nhanes.rds"))

# tables and bar plots
table(nhanes$HealthGen)

pdf("figure/barplot_healthgen.pdf", width = 5, height = 3.5)
par(mar = c(4, 4, 1, 1))
barplot(table(nhanes$HealthGen), xlab = "General Health", ylab = "Count")
dev.off()

# relative frequency table
dim(nhanes)
round(table(nhanes$HealthGen) / 1500, 3)

# contingency table
table(nhanes$PhysActive, nhanes$HealthGen)
addmargins(table(nhanes$PhysActive, nhanes$HealthGen))

# row proportions
round(prop.table(table(nhanes$PhysActive, nhanes$HealthGen), margin = 1), 3)

# column proportions
round(prop.table(table(nhanes$PhysActive, nhanes$HealthGen), margin = 2), 3)

# stacked bar plot
ggplot(data = nhanes) +
  geom_bar(aes(x=HealthGen, fill=PhysActive))
ggsave("figure/stacked_barplot.pdf", width = 4.5, height = 3)

# side-by-side bar plot
ggplot(data = nhanes) +
  geom_bar(aes(x=HealthGen, fill=PhysActive), position = "dodge")
ggsave("figure/sidebyside_barplot.pdf", width = 4.5, height = 3)

# standardized bar plot
ggplot(data = nhanes) +
  geom_bar(aes(x=HealthGen, fill=PhysActive), position = "fill") +
  ylab("proportion")
ggsave("figure/standardized_barplot.pdf", width = 4.5, height = 3)

# mosaic plot

pdf("figure/mosaic.pdf", width = 5, height = 3.5)
par(mar = c(4, 4, 3, 1))
plot(table(nhanes$HealthGen, nhanes$PhysActive),
     xlab = "HealthGen",
     ylab = "PhysActive",
     main = "")
dev.off()
