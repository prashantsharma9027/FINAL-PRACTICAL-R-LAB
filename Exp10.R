# Load necessary libraries
library(tidyverse)

# Scenario 1: One-way ANOVA
group1 <- c(30, 35, 40, 45, 50)
group2 <- c(25, 30, 35, 40, 45)
group3 <- c(20, 25, 30, 35, 40)

# Create a data frame with groups and their labels
data1 <- data.frame(
  value = c(group1, group2, group3),
  group = factor(rep(c("Group1", "Group2", "Group3"), each = 5))
)

# Perform one-way ANOVA
one_way_anova_result <- aov(value ~ group, data = data1)

# Scenario 2: Two-way ANOVA
data2 <- data.frame(
  value = c(group1, group2, group3),
  factor1 = factor(rep(c("A", "B", "C"), each = 5)),  # Adjusted to match the total length
  factor2 = factor(rep(c("X", "Y"), length.out = 15))  # Adjusted to match the total length
)

# Perform two-way ANOVA
two_way_anova_result <- aov(value ~ factor1 * factor2, data = data2)

# Print results
cat("Scenario 1: One-way ANOVA\n")
print(summary(one_way_anova_result))

cat("\nScenario 2: Two-way ANOVA\n")
print(summary(two_way_anova_result))
