
library(rstudioapi)

rm(list = ls())
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))


# Exercises – getting data in


EPI_data <- read.csv(paste(getwd(), "/2010EPI_data.csv", sep=""))


generateGraphs <- function(name) {
  
  
  
  t = match(c(name), EPI_data[1,])
  data <- as.numeric(EPI_data[t][-1,])
  
  # # Exercise 1: exploring the distribution
   
  summary(data)
  fivenum(data, na.rm=TRUE)
  stem(data)
  
  jpeg(sprintf("Histogram of %s 1.jpg", name))
  hist1 = hist(data)
  dev.off()
  
  jpeg(sprintf("Histogram of %s 2.jpg", name))
  
  
  #a = max(30., min(EPI, na.rm = TRUE)-2.1)
  #b = min(95., max(EPI, na.rm = TRUE)+2.1)
  
  a = min(data, na.rm = TRUE)-2.1
  b = max(data, na.rm = TRUE)+2.1
  
  
  print(a)
  print(b)
  
  hist2 = hist(data, seq(a, b, 1.0), prob=TRUE)
  lines(density(data, na.rm=TRUE,bw=1.))
  rug(data)
  
  dev.off()
  
  # Exercise 1: fitting a distribution 
  
  jpeg(sprintf("Distribution of %s 1.jpg", name))
  
  plot(ecdf(data), do.points=FALSE, verticals=TRUE) 
  
  dev.off()
  
  jpeg(sprintf("Quantile-Quantile of %s 1.jpg", name))
  
  par(pty="s")
  qqnorm(data); qqline(data)
  
  dev.off()
  
  
  jpeg(sprintf("Quantile-Quantile of %s 2.jpg", name))
  
  x <- seq(30, 95, 1)
  qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for tdsn")
  qqline(x)
  
  dev.off()
}

generateGraphs("EPI")
generateGraphs("ENVHEALTH")
generateGraphs("ECOSYSTEM")
generateGraphs("DALY")
generateGraphs("AIR_H")
generateGraphs("WATER_H")
generateGraphs("AIR_E")
generateGraphs("WATER_E")
generateGraphs("BIODIVERSITY")

t = match(c("Landlock"), EPI_data[1,])
Landlock <- as.numeric(EPI_data[t][-1,])

t = match(c("EPI"), EPI_data[1,])
EPI <- as.numeric(EPI_data[t][-1,])

#EPILand<-EPI[!Landlock]
EPILand<-EPI[!EPI %in% Landlock]
ELand <- EPILand[!is.na(EPILand)]

jpeg(sprintf("Exercise 2 part 1.jpg"))
hist(ELand)
dev.off()

jpeg(sprintf("Exercise 2 part 2.jpg"))
hist(ELand, seq(30., 95., 1.0), prob=TRUE)
dev.off()

