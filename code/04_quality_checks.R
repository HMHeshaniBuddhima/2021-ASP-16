
# Data Quality Checking

# 1. Check dataset dimensions
dim(tpm_matrix)
dim(count_matrix)

# 2. Check missing values
sum(is.na(tpm_matrix))
sum(is.na(count_matrix))

# 3. Check duplicate gene names
sum(duplicated(rownames(tpm_matrix)))
sum(duplicated(rownames(count_matrix)))

# 4. Check zero values in TPM data
sum(tpm_matrix == 0)

# 5. Check TPM expression values
summary(as.vector(tpm_matrix))

# 6. Check total expression per sample
summary(colSums(tpm_matrix))

# 7. Check count data values
summary(as.vector(count_matrix))

# 8. Check whether count values are integers
all(count_matrix == round(count_matrix))

# 9. Check sample groups
table(sample_info$group)
