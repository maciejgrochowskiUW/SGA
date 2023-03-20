setwd("~/SGA_Maciek_2019")

data <- read.csv("summary_SGA.csv")

pdf("SGA_cid1.pdf", 5,5)

par(mfrow=c(1,1))

plot(data$X20190627_CID1_c2_Interaction, data$X20190628_CID1_c2_Interaction,
    pch = 16,
    cex = 0.7,
    col = "darkgrey",
    main = "SGA cid1",
    xlab = expression(italic(Delta)~italic(cid1)~interaction~score~REP1),
    ylab = expression(italic(Delta)~italic(cid1)~interaction~score~REP2)
)

abline(h = -0.3, v = -0.3, col = "black", lty = 2)

red_cid1 <- subset(data,data$X20190627_CID1_c2_Interaction < -0.3 & data$X20190628_CID1_c2_Interaction < -0.3)
#red_cid1 <- merge(as.data.frame(cid1_common_hits), data, by = 1)
points(red_cid1$X20190627_CID1_c2_Interaction, red_cid1$X20190628_CID1_c2_Interaction,
     pch = 16,
     cex = 0.7,
     col = "red"
)

dev.off()
