# Name: heatmap.R
# Auth: u.niazi@imperial.ac.uk
# Date: 6/5/15
# Desc: create heatmaps from the count matrix

# libraries
if (!require(NMF)) stop('R package NMF needs to be installed.')

dfDat = read.csv(file.choose(), header=T, row.names=1)

# scale the data across the rows
mCounts = t(dfDat)
# split the data into 2 groups
g1 = mCounts[1:3,]
g2 = mCounts[4:6,]
# take the means of the groups
g1 = colMeans(g1)
g2 = colMeans(g2)
# sd of the genes
s = apply(mCounts, 2, sd)
# mean of the genes
m = colMeans(mCounts)
# join the 2 groups
mCounts = rbind(g1, g2)
rownames(mCounts) = c('Enr', 'Dep')

# scale the data by Mean and SD
mCounts = sweep(mCounts, 2, STATS = m, FUN = '-')
mCounts = sweep(mCounts, 2, STATS = s, FUN = '/')

mCounts = t(mCounts)

hc = hclust(dist(mCounts))
plot(hc)
# cut the tree at desired point, or number of clusters
c = cutree(hc, 3)
lab = as.factor(c)

# threshhold the values
mCounts[mCounts < -3] = -3
mCounts[mCounts > 3] = 3
# draw the heatmap
dir.create('Figures', showWarnings = F)
svg('Figures/heatmap.svg')
aheatmap(mCounts, color=c('blue', 'black', 'red'), breaks=0, scale='none', Rowv = as.dendrogram(hc),
         annRow=lab, annColors=NA, Colv=NA)
dev.off(dev.cur())