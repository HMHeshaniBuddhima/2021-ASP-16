# COVID-19 Gene Expression Analysis Using R

## About This Project

This project is about analysing gene expression data from COVID-19 patients and Non-COVID-19 patients using R.

The main aim is to find genes that have different expression levels between these two groups.

The analysis was carried out using R and different Bioconductor packages.

## Dataset Information

- Dataset ID: GSE157103
- Data source: NCBI GEO database
- COVID-19 samples: 100
- Non-COVID-19 samples: 26
- Total samples: 126
- Total genes: 19,472

**Note:** The Non-COVID-19 group includes patients with other illnesses. They are not healthy controls.

## Tools Used

- R
- RStudio
- edgeR
- limma
- pheatmap
- ggplot2

## Steps Performed

The following steps were carried out in this project:

1. Downloaded the gene expression dataset.
2. Imported the dataset into R.
3. Prepared the expression data and sample information.
4. Checked the quality of the data.
5. Performed exploratory data analysis.
6. Performed differential gene expression analysis using limma-voom.
7. Created graphs to present the analysis results.

## Results

The dataset initially contained 19,472 genes.

After removing genes with low expression levels, 13,612 genes remained for further analysis.

The limma-voom analysis identified 898 significant differentially expressed genes.

- Upregulated genes: 484
- Downregulated genes: 414

The analysis used the following criteria:

- Adjusted p-value < 0.05
- Absolute log2 fold change > 1

## Figures

The following graphs were created:

- Gene expression boxplot
- PCA plot
- Volcano plot
- Gene expression heatmap

## Project Folder Structure

```text
COVID19_Gene_Expression_Analysis/
│
├── data/
├── code/
├── figures/
├── results/
├── COVID19_Gene_Expression_Analysis.Rproj
└── README.md
```

## Data Source

NCBI Gene Expression Omnibus (GEO)

https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE157103

