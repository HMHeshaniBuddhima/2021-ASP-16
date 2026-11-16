# Differential Gene Expression Analysis of COVID-19 and Non-COVID-19 Patients Using R

## 1. Abstract

This project analyses gene expression data to identify differences between COVID-19 patients and Non-COVID-19 patients. The dataset was obtained from the NCBI Gene Expression Omnibus (GEO) under accession number GSE157103. It contains 126 samples, including 100 COVID-19 samples and 26 Non-COVID-19 samples. Data preparation, quality checking and exploratory data analysis were performed using R. The limma-voom method was used for differential gene expression analysis. After filtering low-expression genes, 13,612 genes were included in the analysis. A total of 898 significant differentially expressed genes were identified, including 484 upregulated genes and 414 downregulated genes. Different plots were also created to present the results.

## 2. Introduction

Gene expression analysis is useful for understanding how genes behave under different biological conditions. It helps researchers identify genes that show changes in expression between different groups of samples.

COVID-19 can affect different biological processes in the human body. Studying gene expression data can help identify genes that show different expression patterns in COVID-19 patients compared with other patient groups.

The aim of this project is to identify differentially expressed genes between COVID-19 patients and Non-COVID-19 patients using R programming.

The main objective is to find genes with significant differences in expression between the two groups. The analysis also aims to present these differences using suitable statistical methods and visualizations.

## 3. Data

### 3.1 Data Source

The gene expression dataset was obtained from the NCBI Gene Expression Omnibus (GEO).

- **GEO Accession Number:** GSE157103
- **Database:** NCBI Gene Expression Omnibus
- **Dataset Link:** https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE157103

### 3.2 Dataset Description

The dataset contains gene expression information from 126 samples.

| Sample Group | Number of Samples |
|---|---:|
| COVID-19 | 100 |
| Non-COVID-19 | 26 |
| Total | 126 |

The original expression matrices contain 19,472 genes and 126 samples.

Two expression data files were used:

- `GSE157103_genes.ec.tsv.gz` – RSEM expected counts.
- `GSE157103_genes.tpm.tsv.gz` – Transcripts Per Million (TPM) values.

The expected count data was used for the main limma-voom analysis, while TPM values were used for exploratory analysis.

**Note:** The Non-COVID-19 group contains patients with other illnesses. Therefore, these samples are not considered healthy controls.

### 3.3 Ethical and Data Considerations

The dataset was obtained from the publicly available NCBI GEO database. This project uses the available gene expression data for academic analysis. No direct personal identification information is included in the project analysis.

The original GEO record should be consulted for the study's consent, ethics and data-use information.

## 4. Methods

The analysis was carried out using R and Bioconductor packages. The following steps were performed.

### 4.1 Data Download and Import

The gene expression dataset was downloaded from NCBI GEO. The count and TPM files were imported into R for further analysis.

### 4.2 Data Preparation

The expression matrices and sample information were prepared for analysis. Samples were grouped into COVID-19 and Non-COVID-19 groups.

### 4.3 Data Quality Checking

Data quality checks were performed to identify possible problems in the dataset.

The following checks were carried out:

- Dataset dimensions.
- Missing values.
- Duplicate gene names.
- Consistency of gene and sample names.

No missing values or duplicate gene names were found in the expression matrices.

### 4.4 Exploratory Data Analysis

Exploratory Data Analysis (EDA) was performed to understand the expression patterns in the dataset.

The following visualizations were created:

- Boxplot to examine gene expression distributions.
- Principal Component Analysis (PCA) plot to explore sample variation and grouping patterns.

### 4.5 Differential Gene Expression Analysis

The limma-voom method was used to identify differentially expressed genes between the two sample groups.

The main steps included:

1. Creating a DGEList object using the edgeR package.
2. Filtering genes with low expression using `filterByExpr()`.
3. Performing TMM normalization.
4. Applying the voom transformation.
5. Fitting a linear model using `lmFit()`.
6. Applying empirical Bayes moderation using `eBayes()`.
7. Adjusting p-values using the Benjamini-Hochberg method.

Genes were considered significant when they met both of the following conditions:

- Adjusted p-value < 0.05.
- Absolute log2 fold change > 1.

Positive log2 fold change values indicate higher expression in the COVID-19 group, while negative values indicate lower expression compared with the Non-COVID-19 group.

### 4.6 R Packages Used

| Package | Purpose |
|---|---|
| edgeR | Expression data filtering and normalization |
| limma | Linear modelling and differential expression analysis |
| pheatmap | Creating the gene expression heatmap |
| ggplot2 | Creating data visualizations |

Other R functions and packages were also used for data import, preparation and exploratory analysis.

## 5. Results

### 5.1 Data Quality Results

The original expression matrices contained 19,472 genes and 126 samples.

The quality checks showed:

- Missing values: 0
- Duplicate gene names: 0
- Total samples: 126

### 5.2 Exploratory Data Analysis

The boxplot was used to examine the distribution of gene expression values.

The PCA plot showed the variation between samples. The first principal component (PC1) explained approximately 22.34% of the variation, while the second principal component (PC2) explained approximately 18.73%.

Together, PC1 and PC2 explained approximately 41.07% of the total variation.

### 5.3 Differential Expression Results

After filtering low-expression genes, 13,612 genes remained for further analysis.

The limma-voom analysis identified 898 significant differentially expressed genes.

| Result | Number of Genes |
|---|---:|
| Genes before filtering | 19,472 |
| Genes after filtering | 13,612 |
| Significant genes | 898 |
| Upregulated genes | 484 |
| Downregulated genes | 414 |

The results showed that 484 genes had higher expression and 414 genes had lower expression in the COVID-19 group compared with the Non-COVID-19 group, based on the selected significance criteria.

### 5.4 Visualizations

The following figures were created as part of the analysis:

1. `01_expression_boxplot.png` – Gene expression distribution.
2. `02_pca_plot.png` – Principal Component Analysis.
3. `03_volcano_plot.png` – Differential expression results.
4. `04_gene_expression_heatmap.png` – Expression patterns of the top 20 significant genes.

All figures are available in the `figures/` folder.

## 6. Discussion

The analysis identified 898 significant differentially expressed genes between COVID-19 patients and Non-COVID-19 patients.

Among these genes, 484 were upregulated and 414 were downregulated in the COVID-19 group. These results show differences in gene expression patterns between the two groups.

The volcano plot provides an overview of the significant genes based on their fold changes and adjusted p-values. The heatmap helps to observe the expression patterns of selected significant genes across the samples.

However, this analysis has some limitations. The statistical model used in this project mainly compares the two sample groups. Other factors such as age, sex, disease severity and other clinical conditions were not included as adjustment variables.

Therefore, the results show associations in gene expression between the groups and do not prove that COVID-19 directly caused these changes.

## 7. Conclusion and Future Work

This project used R to perform differential gene expression analysis on the GSE157103 dataset.

The limma-voom method identified 898 significant differentially expressed genes between COVID-19 and Non-COVID-19 patient groups.

The project also demonstrated the use of data quality checking, exploratory data analysis and visualization techniques in bioinformatics.

In future work, additional clinical information could be included in the statistical model. The identified genes could also be studied further using functional enrichment and pathway analysis.

## 8. Reproducibility

### 8.1 Requirements

The project was developed using R and RStudio.

The main R packages used were:

- edgeR
- limma
- pheatmap
- ggplot2

### 8.2 Running the Project

1. Clone or download this GitHub repository.
2. Open `COVID19_Gene_Expression_Analysis.Rproj` using RStudio.
3. Make sure the required R packages are installed.
4. Run the R scripts in the following order:

```text
01_download_dataset.R
02_import_dataset.R
03_prepare_data.R
04_quality_checks.R
05_exploratory_data_analysis.R
06_differential_expression_analysis.R
07_limma_voom_analysis.R
```

5. Check the generated figures in the `figures/` folder.
6. Check the analysis results in the `results/` folder.

Package versions and R session information can be checked using:

```r
sessionInfo()
```

## 9. References

1. NCBI Gene Expression Omnibus (GEO). GSE157103 dataset. https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE157103

2. R Core Team. R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing. https://www.r-project.org/

3. Ritchie, M. E., et al. (2015). limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research, 43(7), e47. https://doi.org/10.1093/nar/gkv007

4. Robinson, M. D., McCarthy, D. J., & Smyth, G. K. (2010). edgeR: a Bioconductor package for differential expression analysis of digital gene expression data. Bioinformatics, 26(1), 139–140. https://doi.org/10.1093/bioinformatics/btp616

5. Kolde, R. (2019). pheatmap: Pretty Heatmaps. R package. https://CRAN.R-project.org/package=pheatmap

6. Wickham, H. ggplot2: Elegant Graphics for Data Analysis. https://ggplot2.tidyverse.org/

---

**Project:** Differential Gene Expression Analysis of COVID-19 and Non-COVID-19 Patients Using R

