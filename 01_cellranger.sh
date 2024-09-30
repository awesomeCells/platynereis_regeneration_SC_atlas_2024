#!/bin/bash

# generate reference file from pdu genome (annotation v021)
cellranger mkref --genome=pdu_genome_2022 --fasta=pdumv021_genome.fa --genes=pdumv021_agat.gtf

# generate expression matrix from 10x chromium processed single cell sequencing data

# first replicate (br.A)
cellranger count \
--id=blastema_12_hpa \
--fastqs=10x_files_regen/175735 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=blastema_24_hpa \
--fastqs=10x_files_regen/175736 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=blastema_48_hpa \
--fastqs=10x_files_regen/175737 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=blastema_72_hpa \
--fastqs=10x_files_regen/175738 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=trunk \
--fastqs=10x_files_regen/175734 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000

# second replicate (br.B)
cellranger count \
--id=c_24hpa \
--fastqs=$FASTQS/208433 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=c_48hpa \
--fastqs=$FASTQS/208434 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=c_72hpa \
--fastqs=$FASTQS/208435 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 

cellranger count \
--id=c_trunk \
--fastqs=$FASTQS/208436 \
--transcriptome=cellranger_reference/pdu_genome_2022 \
--expect-cells=10000 