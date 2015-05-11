# Name: ratios.R
# Auth: u.niazi@imperial.ac.uk
# Date: 6/5/15
# Desc: fisher odds ratio tests for miRNA distribution

# data import
dfDat = read.csv(file.choose(), header=T, row.names=1)

mDat = as.matrix(dfDat)

for(i in 1:nrow(mDat)) {
  r1 = mDat[i,]
  r2 = colSums(mDat[-i,])
  m = rbind(r1, r2)
  rownames(m) = c(rownames(mDat)[i], 'Others')
  print('Data')
  print(m)
  print(fisher.test(m))
}