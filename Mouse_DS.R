# File: Mouse_DS.R
# Auth: u.niazi@imperial.ac.uk
# Date: 13/07/2015
# Desc: Extract 2000 bp downstream sequences from each gene into a fasta file

library(rtracklayer)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
oTxdb = TxDb.Mmusculus.UCSC.mm10.knownGene
library(BSgenome.Mmusculus.UCSC.mm10)
oBSgenome = BSgenome.Mmusculus.UCSC.mm10
library(Biostrings)

# extract the genes
oGRgene = genes(oTxdb)

# shift 2000 bp downstream to get downstream sequences
oGRdownstream = flank(oGRgene, width = 2000, start = F)

# how many downstream regions overlap with next gene
f = overlapsAny(oGRdownstream, oGRgene)
oGRdownstream = oGRdownstream[!f]

# sort the genes
oGRdownstream = sort(oGRdownstream)

seq = getSeq(oBSgenome, oGRdownstream)

dir.create('Results_scripts', showWarnings = F)
Biostrings::writeXStringSet(seq, 'Results_scripts/downstream_mm10.fasta', format='fasta')
