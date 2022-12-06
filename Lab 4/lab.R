
require(rpart)
require(party)
library(tree)
library(rpart)

library(rattle)
library(rpart.plot)
library(RColorBrewer)


rm(list = ls())

data("Titanic")

summary(Titanic)

str(Titanic)


test <- ctree(Class ~ Sex + Age + Survived, data=Titanic)
#plot(test)
#text(test)


test2 <- rpart(Survived ~ ., data = Titanic, method="class", minsplit=2, minbucket=1)
#test2 <- rpart(Survived ~ Sex + Age, data = test)
plot(test2, cex=0.8)
text(test2, cex=0.7)

#plot(test2)
#text(test2)

fancyRpartPlot(test2, cex=0.8)

survivedTree <- ctree(Survived ~ . , data = Titanic)
plot(survivedTree)
print(survivedTree)

titanicDist <- dist(Titanicx, method = 'euclidean')
survivedClust <- hclust(titanicDist, method = "complete")
plot(survivedClust)



