# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("/Users/sandipsharma/Downloads/College_Work/8th sem/dataset.csv")

# Simple Random Sampling
srs_sample <- data %>% sample_n(size = 100, replace = TRUE)
mean_srs <- mean(srs_sample$variable_of_interest)

# Stratified Sampling
strata <- data %>% group_by(stratum_variable) %>% slice_sample(n = 50, replace = TRUE)
stratified_sample <- ungroup(strata)
mean_stratified <- mean(stratified_sample$variable_of_interest)

# Cluster Sampling
clusters <- unique(data$cluster_variable)
cluster_sample <- data %>% filter(cluster_variable %in% sample(clusters, size = 2, replace = FALSE))
mean_cluster <- mean(cluster_sample$variable_of_interest)

# Create a data frame for plotting
sampling_means <- data.frame(
  Sampling_Method = c("Simple Random Sampling", "Stratified Sampling", "Cluster Sampling"),
  Mean = c(mean_srs, mean_stratified, mean_cluster)
)

# Plotting
ggplot(sampling_means, aes(x = Sampling_Method, y = Mean, fill = Sampling_Method)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = round(Mean, 2)), vjust = -0.3, size = 3.5) +  # Add mean labels
  labs(title = "Mean Comparison by Sampling Method", y = "Mean") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability
