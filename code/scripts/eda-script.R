advertising <- read.csv("data/Advertising.csv")

# Summaries
tv <- summary(advertising$TV)
radio <- summary(advertising$Radio)
newspaper <- summary(advertising$Newspaper)
sales <- summary(advertising$Sales)

summaries <- matrix(ncol = 6, nrow = 4)
summaries[1,] <- tv
summaries[2,] <- radio
summaries[3,] <- newspaper
summaries[4,] <- sales
rownames(summaries) <- c('TV', 'Radio', 'Newspaper','Sales')
colnames(summaries) <- names(tv)

# Compute matrix of correlations and save
cor_matrix <- cor(advertising[2:5])
save(cor_matrix, file = "data/correlation-matrix.RData")

# Write to eda-output
sink(file = "data/eda-output.txt")
writeLines("Summary Statistics")
summaries
cat("Correlation Matrix \n\n", file = "data/eda-output.txt", append = TRUE)
write.table(cor_matrix, file ="data/eda-output.txt", append = TRUE, sep = " ")
sink()


#Histograms
png(file = "images/histogram-tv.png")
hist(advertising$TV, main = "Histogram of TV advertising budgets")
dev.off()

png(file = "images/histogram-radio.png")
hist(advertising$TV, main = "Histogram of Radio advertising budgets")
dev.off()

png(file = "images/histogram-newspaper.png")
hist(advertising$Sales, main = "Histogram of Newspaper advertising budgets")
dev.off()

png(file = "images/histogram-sales.png")
hist(advertising$Sales, main = "Histogram of Sales")
dev.off()

png(file = "images/histogram-sales.png")
pairs(advertising, main = "Scatterplot matrix of advertising data")
dev.off()
