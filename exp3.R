theoretical_probabilities <- rep(1/2, 2)

set.seed(222)  # Set seed for reproducibility
simulated_rolls <- sample(1:2, size = 100, replace = TRUE)

empirical_probabilities <- table(simulated_rolls) / length(simulated_rolls)

barplot(theoretical_probabilities, names.arg = 1:2, ylim = c(0, 1), col = "blue", main = "Theoretical Probabilities")
barplot(empirical_probabilities, names.arg = 1:2, ylim = c(0, 1), col = "red", main = "Empirical Probabilities")

difference <- abs(theoretical_probabilities - empirical_probabilities)

cat("Absolute Difference between Theoretical and Empirical Probabilities:\n")
print(difference)