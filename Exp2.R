# Data 
data <-c(32,36,36,37,39,41,45,46,48,50)

range_value <- range(data)

qdev_value <- IQR(data)/2
variance_value <- var(data)
sd_value <- sd(data)

# Create a boxplot for the dataset
boxplot(data, main = "Boxplot of the Dataset", col = "grey", border = "black")

# Add text annotations for each measure of dispersion
text(1, max(data) - 1, paste("                          Range: ", diff(range_value)), col = "red")
text(1, max(data) - 3, paste("                                       Quartile Deviation: ", qdev_value), col = "blue")
text(1, max(data) - 15, paste("Standard Deviation: ", sd_value), col = "green")
text(1, max(data) - 17, paste("                 Variance: ", variance_value), col = "purple")