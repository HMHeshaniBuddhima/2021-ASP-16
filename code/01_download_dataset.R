
# Step 2: Check downloaded dataset files

# List all files inside the data folder
list.files("data")

# Check whether both files exist
file.exists("data/GSE157103_genes.ec.tsv.gz")

file.exists("data/GSE157103_genes.tpm.tsv.gz")

# Check file sizes
file.info("data/GSE157103_genes.ec.tsv.gz")

file.info("data/GSE157103_genes.tpm.tsv.gz")


# Check whether both files exist
file.exists("data/GSE157103_genes.ec.tsv.gz")
file.exists("data/GSE157103_genes.tpm.tsv.gz")

# Check file sizes in MB
file.info("data/GSE157103_genes.ec.tsv.gz")$size / 1024^2

file.info("data/GSE157103_genes.tpm.tsv.gz")$size / 1024^2

# Check whether files are valid gzip files
readBin("data/GSE157103_genes.ec.tsv.gz", "raw", n = 2)

readBin("data/GSE157103_genes.tpm.tsv.gz", "raw", n = 2)