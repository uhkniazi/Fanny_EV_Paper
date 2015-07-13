# Fanny_EV_Paper/Mouse_DS
Script for extracting mouse mm10 genome data

# Mouse_DS.R
Uses the bioconductor annotation and genome packages TxDb.Mmusculus.UCSC.mm10.knownGene and BSgenome.Mmusculus.UCSC.mm10 to extract
the known genes. Extracts the 2000 bp downstream from each gene, removes those regions that overlap with the next gene. Extracts the
sequences for those regions, and exports them into a fasta file. All IDS are UCSC/ENTEREZ gene ids.

