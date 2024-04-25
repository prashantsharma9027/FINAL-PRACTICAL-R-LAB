# Load necessary libraries
library(tidyverse)

# Scenario 1: t-test for comparing means
group1 <- c(25, 30, 28, 35, 32)
group2 <- c(20, 22, 18, 25, 28)
t_test_result <- t.test(group1, group2)
cat("Scenario 1: t-test for comparing means\n")
print(t_test_result)

# Scenario 2: Z-test for proportions
successes <- 20
total_trials <- 50
prop_test_result <- prop.test(successes, total_trials, alternative = "two.sided")
cat("\nScenario 2: Z-test for proportions\n")
print(prop_test_result)

# Scenario 3: Chi-Square test for independence
data <- matrix(c(30, 20, 15, 25), nrow = 2, byrow = TRUE)
chi_square_result <- chisq.test(data)
cat("\nScenario 3: Chi-Square test for independence\n")
print(chi_square_result)
