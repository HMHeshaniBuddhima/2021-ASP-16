
# Prepare sample information

# Get sample names
sample_names <- colnames(tpm_data)[-1]

# Identify sample groups
group <- ifelse(
  grepl("^C[0-9]+$", sample_names),
  "COVID-19",
  "Non-COVID-19"
)

# Create sample information
sample_info <- data.frame(
  sample = sample_names,
  group = group
)

# Display sample information
head(sample_info)

# Count samples in each group
table(sample_info$group)







#  Prepare expression matrices

# Create TPM matrix
tpm_matrix <- as.matrix(tpm_data[, -1])
storage.mode(tpm_matrix) <- "numeric"

# Set gene names as row names
rownames(tpm_matrix) <- tpm_data[[1]]

# Create count matrix
count_matrix <- as.matrix(count_data[, -1])
storage.mode(count_matrix) <- "numeric"

# Set gene names as row names
rownames(count_matrix) <- count_data[[1]]

# Check dimensions
dim(tpm_matrix)
dim(count_matrix)

# Check whether gene names match
identical(rownames(tpm_matrix), rownames(count_matrix))

# Check whether sample names match
identical(colnames(tpm_matrix), colnames(count_matrix))
