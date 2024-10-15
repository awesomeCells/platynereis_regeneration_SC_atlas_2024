# Single Cell RNAseq Data Processing of Platynereis Posterior Regeneration
Code for processing the single cell data associated with:

**Molecular profiles, sources and lineage restrictions of stem cells in an annelid regeneration model**

Alexander W. Stockinger, Leonie Adelmann, Martin Fahrenberger, Christine Ruta, B. Duygu Özpolat, Nadja Milivojev, Guillaume Balavoine, Florian Raible

Regeneration of missing body parts can be observed in diverse animal phyla, but it remains unclear to which extent these capacities rely on shared or divergent principles. Research into this question requires detailed knowledge about the involved molecular and cellular principles in suitable reference models. By combining single-cell RNA sequencing and mosaic transgenesis in the marine annelid Platynereis dumerilii, we map cellular profiles and lineage restrictions during posterior regeneration. Our data reveal cell-type specific injury responses, re-expression of positional identity factors, and the re-emergence of stem cell signatures in multiple cell populations. Epidermis and mesodermal coelomic tissue produce distinct putative posterior stem cells (PSCs) in the emerging blastema. A novel mosaic transgenesis strategy reveals both developmental compartments and lineage restrictions during regenerative growth. Our work supports the notion that posterior regeneration involves dedifferentiation, and reveals molecular and mechanistic parallels between annelid and vertebrate regeneration.Competing Interest StatementThe authors have declared no competing interest.

bioRxiv 
https://dx.doi.org/10.1101/2024.07.09.602635

## How to use this code
The code can either be used to re-run the entire analysis pipeline (download raw sequencing data, see below, then follow files in order) or to generate plots or perform additional analyses on the processed file.
Most of it is written in R-markdown and best used in RStudio.
Packages and versions used can be found in the manuscript methods section.

## Processing steps
### 1. Mapping reads with cellranger
`01_cellranger.sh`

Raw reads (see below) were mapped against a custom Cellranger (10X genomics, v7.0.1) reference generated from the Platynereis draft genome (Genbank ID: GCA_026936325.1, annotation version v021)

### 2. Seurat preprocessing
`02_seurat_preprocessing.Rmd`

Cellranger output files generated in 1. are imported to R and processed as seurat objects. After outlier removal, all objects are then merged and the merged object is processed as one dataset.
Includes dimensionality reduction and population clustering.

### 3. Additional Seurat processing
`03_sc_additional_processing.Rmd`

Perform log-transformation for better visualisations, and sub-cluster and re-process two clusters of interest.

### 4. Find marker genes
`04_find_cluster_markers.Rmd`

Use this to compare gene expression levels between clusters to identify those genes unique to one cluster (markergenes).

### 5. Single Cell stats calculation
`05_singlecell_stats.Rmd`

Testing whether UMIs per cell are significantly higher at later stages of regeneration.

### 6. Cytotrace
`06_cytotrace.Rmd`

Calculates "cell differentiation potential" as proxy for identifying less differentiated (i.e. more stem-like) cells. 
See https://cytotrace.stanford.edu for reference and code.

### 7. Doublet Prediction
`07_doublet_prediction.Rmd`

Cell doublets are common technical artifacts in single cell sequencing experiments. Here I run code to predict cells that are likely doublets, using DoubletFinder (https://github.com/chris-mcginnis-ucsf/DoubletFinder).

### 8. Bulk vs. Single Cell comparison
`08_bulk_sc_comparison.Rmd`

As quality check, I compared bulk and single cell transcriptome time series.

### 9. Generating Plots
`09_plotting.Rmd`

Contains the code to generate the plots used in the manuscript.
Either run steps 1-8 before, or directly download the already processed seurat object (see below) to the data directory to use this code.

## Data and References

### data directory
`data/`

contains smaller annotation files and example gene tables for plotting. 
Add downloaded files (see below) to this directory.

### Data depository
Single cell sequencing data (raw): `NCBI SRA PRJNA1060254`
-> `data/matrix_files/0hpa_A/filtered_feature_bc_matrix` etc (for importing in `01_cellranger.sh`). 

Processed single cell data (result of the code in this project): `NCBI GEO GSE277281`
->  `data/scd.RDS`

### References
1. Stockinger, A. W., Adelmann, L., Fahrenberger, M., Ruta, C., Özpolat, B. D., Milivojev, N., Balavoine, G. & Raible, F. Molecular profiles, sources and lineage restrictions of stem cells in an annelid regeneration model. bioRxiv 2024.07.09.602635 doi:10.1101/2024.07.09.602635
2. Stuart, T. & Satija, R. Integrative single-cell analysis. Nat. Rev. Genet. 20, 257–272 (2019).
3. Steger, J., Cole, A. G., Denner, A., Lebedeva, T., Genikhovich, G., Ries, A., Reischl, R., Taudes, E., Lassnig, M. & Technau, U. Single-cell transcriptomics identifies conserved regulators of neuroglandular lineages. Cell Rep. 40, 111370 (2022).
4. Gulati, G. S., Sikandar, S. S., Wesche, D. J., Manjunath, A., Bharadwaj, A., Berger, M. J., Ilagan, F., Kuo, A. H., Hsieh, R. W., Cai, S., Zabala, M., Scheeren, F. A., Lobo, N. A., Qian, D., Yu, F. B., Dirbas, F. M., Clarke, M. F. & Newman, A. M. Single-cell transcriptional diversity is a hallmark of developmental potential. Science 367, 405–411 (2020).
5. McGinnis, C. S., Murrow, L. M. & Gartner, Z. J. DoubletFinder: Doublet Detection in Single-Cell RNA Sequencing Data Using Artificial Nearest Neighbors. Cell Syst. 8, 329-337.e4 (2019).
  
  

  
