daneCID1 <- data [ which(data$X20190627_CID1_c2_Interaction < -0.3
                                 & data$X20190628_CID1_c2_Interaction < -0.3), -c(8:15)]
daneCID16 <- data [ which(data$X20190627_CID16_c2_Interaction < -0.3
                         & data$X20190628_CID16_c2_Interaction < -0.3), -c(8:15)]
daneDIS32 <- data [ which(data$X20190627_DIS32_c2_Interaction < -0.3
                          & data$X20190628_DIS32_c2_Interaction < -0.3), -c(8:15)]
daneCID1poz <- data [ which(data$X20190627_CID1_c2_Interaction > 0.2
                     & data$X20190628_CID1_c2_Interaction > 0.2), ]
daneCID16poz <- data [ which(data$X20190627_CID16_c2_Interaction > 0.2
                          & data$X20190628_CID16_c2_Interaction > 0.2), -c(8:15)]
daneDIS32poz <- data [ which(data$X20190627_DIS32_c2_Interaction > 0.2
                          & data$X20190628_DIS32_c2_Interaction > 0.2), -c(8:15)]
print(colnames(data))
 write.csv(daneCID16[,1], "listaCID16.csv")
 write.csv(daneCID1[,1], "listaCID1.csv")
 write.csv(daneDIS32[,1], "listaDIS32.csv")
 write.csv(data[,1:2], "listagenow.csv")
#dobarplot <- c(nrow(daneCID1), nrow(daneCID16), nrow(daneDIS32), nrow(daneCID1poz), nrow(daneCID16poz), nrow(daneDIS32poz))
dobarplot1 <- c(66, 20, 3, 0, 2, 4)
dobarplot2 <- c("CID1", "CID16", "DIS32", "CID1", "CID16", "DIS32")
dobarplot3 <- c("negatywne", "negatywne", "negatywne", "pozytywne", "pozytywne", "pozytywne")
dobarplot4 <- data.frame(dobarplot1, dobarplot2, dobarplot3)
dobarplot4 <- as.data.frame(dobarplot4)
colnames(dobarplot4) <- c("interakcje", "szczep", "rodzaj")



library(ggplot2)
# Grouped
pdf(file = "baplotzSGA.pdf", 3,3)
ggplot(dobarplot4, aes(fill=szczep, y=interakcje, x=rodzaj)) + 
  geom_bar(position="dodge", stat="identity") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"))
dev.off()


vennD=Venn(SetNames = c("CID1", "Samp2","Samp3"), Weight=c(`100`=x,`010`=x,`110`=x,`001`=x,`101`=x,`011`=x,`111`=x))
vennDiagram(daneCID1[1], daneCID16[1], daneDIS32[1])