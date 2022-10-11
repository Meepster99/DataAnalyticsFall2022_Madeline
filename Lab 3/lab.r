


library(rstudioapi)
library(hash)
library(class)
library(ggplot2)

#rm(list = ls())
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))



set.seed(12345)

par(mar = rep(0.2,4))

data <- matrix(rnorm(400), nrow=40)
image(1:10, 1:40,t(data)[,nrow(data):1])

