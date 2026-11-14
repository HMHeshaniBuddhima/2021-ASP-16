
# Exploratory Data Analysis (EDA)



# 1. Log2 transformation of TPM data

log2_tpm <- log2(tpm_matrix + 1)


# 2. Create colours for sample groups

group_colors <- ifelse(
  sample_info$group == "COVID-19",
  "red",
  "blue"
)


# 3. Boxplot of gene expression distributions

png(
  "figures/01_expression_boxplot.png",
  width = 1200,
  height = 800
)

boxplot(
  log2_tpm,
  las = 2,
  outline = FALSE,
  col = group_colors,
  main = "Gene Expression Distribution Across Samples",
  ylab = "Log2(TPM + 1)",
  xlab = "Samples",
  cex.axis = 0.5
)

legend(
  "topright",
  legend = c("COVID-19", "Non-COVID-19"),
  fill = c("red", "blue")
)

dev.off()


# 4. Calculate gene expression variance

gene_variances <- apply(
  log2_tpm,
  1,
  var
)


# 5. Select the 500 most variable genes

top_variable_genes <- order(
  gene_variances,
  decreasing = TRUE
)[1:500]


# 6. Perform PCA using the selected genes

pca_result <- prcomp(
  t(log2_tpm[top_variable_genes, ]),
  center = TRUE,
  scale. = FALSE
)


# 7. Calculate percentage of variance explained

variance_explained <- (
  pca_result$sdev^2 /
    sum(pca_result$sdev^2)
) * 100


# 8. Save PCA plot

png(
  "figures/02_pca_plot.png",
  width = 1000,
  height = 800
)

plot(
  pca_result$x[, 1],
  pca_result$x[, 2],
  col = group_colors,
  pch = 19,
  xlab = paste0(
    "PC1 (",
    round(variance_explained[1], 2),
    "%)"
  ),
  ylab = paste0(
    "PC2 (",
    round(variance_explained[2], 2),
    "%)"
  ),
  main = "PCA Using Top 500 Variable Genes"
)

legend(
  "topright",
  legend = c("COVID-19", "Non-COVID-19"),
  col = c("red", "blue"),
  pch = 19
)

dev.off()


# 9. Display PCA variance information

variance_explained[1:2]


# 10. Check whether output files were created

file.exists("figures/01_expression_boxplot.png")

file.exists("figures/02_pca_plot.png")

