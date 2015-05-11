# Name: heatmap_2.R
# Auth: u.niazi@imperial.ac.uk
# Date: 6/5/15
# Desc: create heatmaps from the count matrix of 2 columns

# libraries
if (!require(NMF)) stop('R package NMF needs to be installed.')

dfDat = read.csv(file.choose(), header=T, row.names=1)

mCounts = as.matrix(dfDat)
mCounts = log(mCounts+0.1)
hc = hclust(dist(mCounts), method = 'ward.D')
plot(hc)
# cut the tree at desired point, or number of clusters
c = cutree(hc, 3)
# write csv file 
dir.create('Results', showWarnings = F)
dfCl = data.frame(rna=hc$labels, cluster=c)
write.csv(dfCl, file='Results/clusters.csv')
lab = as.factor(c)

# draw the heatmap
dir.create('Figures', showWarnings = F)
svg('Figures/heatmap.svg')
aheatmap(mCounts, color=c('blue', 'black', 'red'), breaks=0, scale='none', Rowv = as.dendrogram(hc),
         annRow=lab, annColors=NA, Colv=NA)
dev.off(dev.cur())