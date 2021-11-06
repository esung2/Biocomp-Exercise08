setwd("~/Desktop/r-novice-inflammation/Biocomp-Exercise08/")
list.files()
data <- read.table(file="UWvMSU_1-22-13.txt", header=TRUE, sep="")
data
str(data)
head(data)
?plot
plot(data)
#graph is cumulative score as a function of time in the game
#create data frame or matrix with cumulative score for each team whenever each team scores

UWSum=0
MSUSum=0
for(i in 1:nrow(data)){
  if(data$team[i]=="UW"){
    UWSum=UWSum + data$score[i] 
  }else{
    MSUSum=MSUSum + data$score[i]  
  }
}
UWSum #Total score by the end of the game
MSUSum #Total score by the end of the game

#Question 2
print("I'm thinking of a number between 1 and 100")
