advertising_data <- read.csv("data/Advertising.csv")

Sales_over_TV <- lm(Sales ~ TV, data = advertising_data)
Sales_over_Radio <- lm(Sales ~ Radio, data = advertising_data)
Sales_over_Newspaper <- lm(Sales ~ Newspaper, data = advertising_data)

multi_reg <- lm(Sales ~ TV + Radio + Newspaper, data = advertising_data)
multi_reg_sum<-summary(multi_reg)

save(Sales_over_TV,Sales_over_Radio,Sales_over_Newspaper,
     multi_reg, multi_reg_sum, file = "data/regression.RData")

png(file = "images/scatterplot-tv-sales.png")
plot(advertising_data$TV, advertising_data$Sales, pch = 19, col = 'blue',
     main = "Scatterplot of Sales over TV advertising budgets ")
abline(Sales_over_TV)
dev.off()

png(file = "images/scatterplot-radio-sales.png")
plot(advertising_data$Radio, advertising_data$Sales, pch = 19, col = 'blue',
     main = "Scatterplot of Sales over Radio advertising budgets")
abline(Sales_over_Radio)
dev.off()

png(file = "images/scatterplot-newspaper-sales.png")
plot(advertising_data$Radio, advertising_data$Sales, pch = 19, col ='blue',
     main = "Scatterplot of Sales over Newspaper advertising budgets")
abline(Sales_over_Newspaper)
dev.off()

png(file = "images/residual-plot.png")
plot(multi_reg, which = 1)
dev.off()

png(file = "images/normal-qq-plot.png")
plot(multi_reg, which = 2)
dev.off()

png(file = "images/scale-location-plot.png")
plot(multi_reg, which = 3)
dev.off()
