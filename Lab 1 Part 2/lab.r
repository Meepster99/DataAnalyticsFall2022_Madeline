 
library(rstudioapi)
library(hash)
library(class)
library(ggplot2)

#rm(list = ls())
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))

if(!exists("dataLoaded")) {

  allData <- read.csv(paste(getwd(), "/2010EPI_data.csv", sep=""))
  write.table(allData, "temp.csv", sep=",", row.names = FALSE, col.names = FALSE, quote=FALSE)
  allData <- read.csv(paste(getwd(), "/temp.csv", sep=""))
  

  dataLoaded = TRUE
}


jpeg("ecdf EPI.jpg")
plot(ecdf(allData$EPI), do.points=FALSE, verticals=TRUE)
dev.off()


jpeg("qqplot EPI vs DALY.jpg")
qqplot(allData$EPI, allData$DALY)
dev.off()

jpeg("boxplot EPI vs DALY.jpg")
boxplot(allData$EPI, allData$DALY)
dev.off()

jpeg("boxplot of EPI, ENVHEALTH, ECOSYSTEM, DALY, AIR_H, WATER_H, AIR_E, WATER_E, BIODIVERSITY.jpg")
boxplot(allData$EPI, allData$ENVHEALTH, allData$ECOSYSTEM, allData$DALY, allData$AIR_H, allData$WATER_H, allData$AIR_E, allData$WATER_E, allData$BIODIVERSITY)
dev.off()
