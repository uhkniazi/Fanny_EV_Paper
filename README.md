# Fanny_EV_Paper
Scripts for analysis of Schisto EV data

# heatmap.R
Reads the data frame with n rows and 6 columns (where columns 1 to 3 are group 1 and 4 to 6 are group 2). Splits the data into
2 groups, and takes the means of each group. Uses the standard deviation and mean for each gene (across 6 samples) to scale
the data by Mean and SD (data-mean / sd). Uses hclust to draw distance matrix and divides it into 3 groups. Uses aheatmap function
to create a svg file with the heatmap figure. 

# heatmap_2.R
Similar to previous script, but uses the pre-processed 2 column matrix. Only takes log of
the data, creates eucledian distance matrix, ward.d dendogram, and aheatmap function to
create the heatmap. Suggested changes include, choosing colours of choice and thresholding the
expression values.

# ratios.R
fisher odds ratio tests for chromosomal distributions of Secrted vs non-secrted miRNAs

