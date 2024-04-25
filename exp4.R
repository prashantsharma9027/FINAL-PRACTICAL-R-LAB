# Load required libraries
library(readr)

# Import the dataset
Mall_Customers <- read.csv("/Users/sandipsharma/Downloads/Mall_Customers.csv")

# Explore the structure of the dataset
str(Mall_Customers)
# Display the first few rows
head(Mall_Customers)
# Summarize basic statistics for numerical variables
summary(Mall_Customers)

# Data Manipulations
# Subset the data for customers above 30 years old
subset_data <- Mall_Customers[Mall_Customers$Age > 30, ]
# Create a new variable by doubling the Age
Mall_Customers$new_variable <- Mall_Customers$Age * 2
# Filter the data for customers with a Spending Score of 99
filtered_data <- subset(Mall_Customers, Spending.Score..1.100. == 99)

# Descriptive Statistics
# Calculate mean, median, and standard deviation for Age
mean_value <- mean(Mall_Customers$Age)
median_value <- median(Mall_Customers$Age)
sd_value <- sd(Mall_Customers$Age)
# Print Descriptive Statistics for Age
cat("Mean Age:", mean_value, "\n")
cat("Median Age:", median_value, "\n")
cat("Standard Deviation Age:", sd_value, "\n")

# Tabulate frequencies for categorical variables (replace "Gender" with the actual column name)
table(Mall_Customers$Gender)

# Visualization
# Create a histogram for Age
hist(Mall_Customers$Age, main = "Distribution of Age", xlab = "Age", ylab = "Frequency", col = "pink")
# Create a bar plot for Spending Scores
barplot(table(Mall_Customers$Spending.Score..1.100.), 
        main = "Frequency of Spending Scores", xlab = "Spending Score", ylab = "Frequency", col = "aquamarine")
