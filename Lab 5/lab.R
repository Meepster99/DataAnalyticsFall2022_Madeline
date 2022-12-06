


#Reading Assignment:
#Creating a confusion matrix using cvms package in R.
#Install these Libraries: cvms , tibble
#library(cvms)
#library(tibble)
#During todays Lab: Work on the examples listed in this
#reading assignment.
#https://cran.rproject.org/web/packages/cvms/vignettes/Creating_a_confusion_matrix.html

library(cvms)

library(tibble)



set.seed(1)



d_binomial <- tibble("target" = rbinom(100, 1, 0.7), "prediction" = rbinom(100, 1, 0.6))

basic_table <- table(d_binomial)

cfm <- as_tibble(basic_table)

plot_confusion_matrix(cfm, 
                      target_col = "target", 
                      prediction_col = "prediction",
                      counts_col = "n")

