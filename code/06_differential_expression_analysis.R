
# Differential Gene Expression Analysis

# 1. Log2 transformation
log2_tpm <- log2(tpm_matrix + 1)

# 2. Convert group into a factor
group <- factor(
  sample_info$group,
  levels = c("Non-COVID-19", "COVID-19")
)

# 3. Create design matrix
design <- model.matrix(~ group)

# 4. Display design matrix
head(design)

# 5. Check dimensions
dim(log2_tpm)
dim(design)

head(design)

dim(log2_tpm)

dim(design)




# 6. Fit the linear model
fit <- lmFit(log2_tpm, design)

# 7. Apply empirical Bayes moderation
fit <- eBayes(fit, trend = TRUE, robust = TRUE)

# 8. Extract differential expression results
de_results <- topTable(
  fit,
  coef = "groupCOVID-19",
  number = Inf,
  adjust.method = "BH",
  sort.by = "P"
)

# 9. Display the top 10 differentially expressed genes
head(de_results, 10)

# 10. Count significantly differentially expressed genes
significant_genes <- de_results[
  de_results$adj.P.Val < 0.05 &
    abs(de_results$logFC) > 1,
]

nrow(significant_genes)

# 11. Save results
if (!dir.exists("results")) {
  dir.create("results")
}

write.csv(
  de_results,
  "results/differential_expression_results.csv",
  row.names = TRUE
)

write.csv(
  significant_genes,
  "results/significant_genes.csv",
  row.names = TRUE
)



head(de_results, 10)

nrow(significant_genes)
