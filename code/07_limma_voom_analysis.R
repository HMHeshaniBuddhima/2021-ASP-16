
# Limma-Voom Differential Gene Expression Analysis


# 1. Load required packages
library(edgeR)
library(limma)

# 2. Prepare the sample groups
group <- factor(
  sample_info$group,
  levels = c("Non-COVID-19", "COVID-19")
)

# 3. Create the design matrix
design <- model.matrix(~ group)

# 4. Create a DGEList using expected counts
dge <- DGEList(
  counts = count_matrix,
  group = group
)

# 5. Check the data
dim(dge$counts)
head(dge$samples)



# 6. Filter lowly expressed genes
keep_genes <- filterByExpr(
  dge,
  design = design
)

dge <- dge[keep_genes, , keep.lib.sizes = FALSE]

# 7. Normalize the data using TMM
dge <- calcNormFactors(
  dge,
  method = "TMM"
)

# 8. Check the number of genes after filtering
cat("Genes before filtering:", nrow(count_matrix), "\n")
cat("Genes after filtering:", nrow(dge$counts), "\n")

# 9. Check normalization factors
head(dge$samples)




# 10. Apply voom transformation
v <- voom(
  dge,
  design = design,
  plot = TRUE
)

# 11. Check transformed expression data
dim(v$E)

# 12. Display the first few expression values
v$E[1:5, 1:5]




dim(v$E)

v$E[1:5, 1:5]



# 13. Fit the linear model
fit <- lmFit(v, design)

# 14. Apply empirical Bayes moderation
fit <- eBayes(fit, robust = TRUE)

# 15. Extract differential expression results
de_results_voom <- topTable(
  fit,
  coef = "groupCOVID-19",
  number = Inf,
  adjust.method = "BH",
  sort.by = "P"
)

# 16. Display the top 10 genes
head(de_results_voom, 10)

# 17. Identify significant genes
significant_genes_voom <- de_results_voom[
  de_results_voom$adj.P.Val < 0.05 &
    abs(de_results_voom$logFC) > 1,
]

# 18. Count significant genes
nrow(significant_genes_voom)


head(de_results_voom, 10)
nrow(significant_genes_voom)



# 19. Count upregulated genes
upregulated_genes <- significant_genes_voom[
  significant_genes_voom$logFC > 1,
]

# 20. Count downregulated genes
downregulated_genes <- significant_genes_voom[
  significant_genes_voom$logFC < -1,
]

# 21. Display gene counts
cat("Upregulated genes:",
    nrow(upregulated_genes), "\n")

cat("Downregulated genes:",
    nrow(downregulated_genes), "\n")

# 22. Save differential expression results
write.csv(
  de_results_voom,
  "results/limma_voom_all_results.csv"
)

write.csv(
  significant_genes_voom,
  "results/limma_voom_significant_genes.csv"
)

write.csv(
  upregulated_genes,
  "results/upregulated_genes.csv"
)

write.csv(
  downregulated_genes,
  "results/downregulated_genes.csv"
)




# 23. Create volcano plot

volcano_data <- de_results_voom

volcano_data$Significance <- "Not Significant"

volcano_data$Significance[
  volcano_data$adj.P.Val < 0.05 &
    volcano_data$logFC > 1
] <- "Upregulated"

volcano_data$Significance[
  volcano_data$adj.P.Val < 0.05 &
    volcano_data$logFC < -1
] <- "Downregulated"

# Save volcano plot
png(
  "figures/03_volcano_plot.png",
  width = 1200,
  height = 900
)

plot(
  volcano_data$logFC,
  -log10(volcano_data$adj.P.Val),
  col = ifelse(
    volcano_data$Significance == "Upregulated",
    "red",
    ifelse(
      volcano_data$Significance == "Downregulated",
      "blue",
      "grey"
    )
  ),
  pch = 20,
  cex = 0.6,
  xlab = "Log2 Fold Change",
  ylab = "-Log10 Adjusted P-value",
  main = "Volcano Plot of Differentially Expressed Genes"
)

abline(v = c(-1, 1), lty = 2)
abline(h = -log10(0.05), lty = 2)

legend(
  "topright",
  legend = c(
    "Upregulated",
    "Downregulated",
    "Not Significant"
  ),
  col = c("red", "blue", "grey"),
  pch = 20
)

dev.off()

# Check whether plot was saved
file.exists("figures/03_volcano_plot.png")



# Select the top 20 significant genes
top_genes <- rownames(de_results_voom)[1:20]

# Extract expression values
heatmap_data <- v$E[top_genes, ]

# Create sample annotation
annotation <- data.frame(
  Group = sample_info$group
)

rownames(annotation) <- sample_info$sample





# Load pheatmap package
library(pheatmap)

# Select the top 20 significant genes
top_genes <- rownames(de_results_voom)[1:20]

# Extract expression values
heatmap_data <- v$E[top_genes, ]

# Create sample annotation
annotation <- data.frame(
  Group = sample_info$group
)

rownames(annotation) <- sample_info$sample

# Create and save heatmap
pheatmap(
  heatmap_data,
  scale = "row",
  annotation_col = annotation,
  clustering_method = "complete",
  show_colnames = FALSE,
  show_rownames = TRUE,
  border_color = NA,
  color = colorRampPalette(
    c("navy", "white", "firebrick3")
  )(100),
  main = "Top 20 Differentially Expressed Genes",
  filename = "figures/04_gene_expression_heatmap.png",
  width = 10,
  height = 8
)

# Check whether heatmap was saved
file.exists("figures/04_gene_expression_heatmap.png")







