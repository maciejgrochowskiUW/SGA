setwd("~/BAHLER_PROJECT/SGA/SGA_reviews")
###########################################################################
# I am importing data-sets that I wil be checking against my list of genes
# df - different categories of unknown genes
# slim - set of 53 go-slim categories plus unknown
# hits - gene-list of interest
###########################################################################

df <- read.table("unknown_categories.txt", sep = "\t", header = T)
slim <- read.table("GO_slims.txt", sep = "\t", header = T, blank.lines.skip = TRUE)
hits <- read.table("EMM_vs_YES.txt", sep = "\t", header = T)
hits <- as.data.frame(red_cid1[,2])
colnames(hits) <- "gene"

###########################################################################
# Now I will check how many genes from different slim categories I can find in 
# my list of genes.
###########################################################################

# first I create empty data frame where i will write the results
res.data <- data.frame(category = colnames(slim), number_in_hits = rep(0,54))

# next the loop that will write the results into the data.frame

for (col_number in c(1:length(colnames(slim)))) {
  dat <- merge(slim[,col_number], hits$gene, by = 1)
  res.data[col_number,2] <- length(dat[,1])
  rm(dat)
}

# now I can sort by most abundant categories in my sample

res.data <- res.data[order(-res.data$number_in_hits),]

######################################################################################
# and visualise in the bar_plot
######################################################################################

# first set up how many hits in category treshold you want to apply
treshold <- 6
df2 <- subset(res.data, res.data[,2] >= treshold)
colors_number <- length(df2[,1])
require(RColorBrewer)
# create palette with desired number of colours based on RColorBrewer existing palettes - max 12 colours)
getPalette = colorRampPalette(brewer.pal(6, "Blues"))

dat <- read.csv("SGA_cid1_res_GO.csv")
dat <- dat[order(dat[,2]),]

pdf("GO_categories.pdf", 10,7)
par(las=2)
par(mar=c(5,30,4,3))
par(cex.axis = 1.3)
barplot (rev(df2[,2]), 
         names.arg = rev(df2[,1]),
         xlab = "number of genes in GO-slim category",
         cex.lab = 1.3,
         col = getPalette(6),
         horiz=TRUE)

dev.off()

################################################################################################
# or as pie chart
# the code was mostly taken from here: https://www.displayr.com/how-to-make-a-pie-chart-in-r/
################################################################################################


library(ggplot2)

pie <- ggplot(df2, aes(x="", y=df2[,2], fill=category)) + geom_bar(stat="identity", width=1) 

pie <- pie + coord_polar("y", start=0) 

pie <- pie + scale_fill_manual(values = getPalette(15), guide = guide_legend(reverse = TRUE))

pie = pie + labs(x = NULL, y = NULL, fill = NULL, title = "GO_slim categories")

pie <- pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust = 0.5, color = "#666666"))
           
pie






