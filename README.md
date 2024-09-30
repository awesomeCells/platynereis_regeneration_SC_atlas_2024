# Single Cell RNAseq Data Processing of Platynereis Posterior Regeneration
Code for processing the single cell data associated with:

**Molecular profiles, sources and lineage restrictions of stem cells in an annelid regeneration model**

Alexander W. Stockinger, Leonie Adelmann, Martin Fahrenberger, Christine Ruta, B. Duygu Özpolat, Nadja Milivojev, Guillaume Balavoine, Florian Raible

Regeneration of missing body parts can be observed in diverse animal phyla, but it remains unclear to which extent these capacities rely on shared or divergent principles. Research into this question requires detailed knowledge about the involved molecular and cellular principles in suitable reference models. By combining single-cell RNA sequencing and mosaic transgenesis in the marine annelid Platynereis dumerilii, we map cellular profiles and lineage restrictions during posterior regeneration. Our data reveal cell-type specific injury responses, re-expression of positional identity factors, and the re-emergence of stem cell signatures in multiple cell populations. Epidermis and mesodermal coelomic tissue produce distinct putative posterior stem cells (PSCs) in the emerging blastema. A novel mosaic transgenesis strategy reveals both developmental compartments and lineage restrictions during regenerative growth. Our work supports the notion that posterior regeneration involves dedifferentiation, and reveals molecular and mechanistic parallels between annelid and vertebrate regeneration.Competing Interest StatementThe authors have declared no competing interest.

bioRxiv 
https://dx.doi.org/10.1101/2024.07.09.602635

## Processing steps
### 1. Mapping reads with cellranger (01_cellranger.sh)
Raw reads (see below) were mapped against a custom Cellranger (10X genomics, v7.0.1) reference generated from the Platynereis draft genome (Genbank ID: GCA_026936325.1, annotation version v021)

### 2. Seurat preprocessing (02_seurat_preprocessing.Rmd)
Cellranger output files generated in 1. are imported to R and processed as seurat objects. After outlier removal, all objects are then merged and the merged object is processed as one dataset.
Includes dimensionality reduction and population clustering.

### 3. Additional Seurat processing (03_sc_additional_processing.Rmd)
Perform log-transformation for better visualisations, and sub-cluster and re-process two clusters of interest.

## Sources and References
Single cell sequencing data (raw): NCBI SRA PRJNA1060254
Single cell sequencing data (processed seurat object, basically the result of the code of this project): NCBI GEO GSE277281
