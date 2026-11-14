
#Import COVID-19 Gene Expression Data

# Import TPM expression data
tpm_data <- read.delim(
  gzfile("data/GSE157103_genes.tpm.tsv.gz"),
  header = TRUE,
  sep = "\t",
  check.names = FALSE
)

# Import Expected Counts data
count_data <- read.delim(
  gzfile("data/GSE157103_genes.ec.tsv.gz"),
  header = TRUE,
  sep = "\t",
  check.names = FALSE
)

# Display first 6 rows of TPM data
head(tpm_data)

# Display first 6 rows of Count data
head(count_data)

# Check dimensions of both datasets
dim(tpm_data)
dim(count_data)

# Check column names
colnames(tpm_data)

# Check structure of TPM data
str(tpm_data)






#Explore the dataset

# Display first 10 column names
head(colnames(tpm_data), 10)

# Display last 10 column names
tail(colnames(tpm_data), 10)

# Display first 6 rows and first 6 columns
head(tpm_data[, 1:6])

# Check the first column name
colnames(tpm_data)[1]

# Check whether missing values exist
sum(is.na(tpm_data))

# Check dataset dimensions
dim(tpm_data)

