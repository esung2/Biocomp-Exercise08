#Question 1 
#Loading data
data <- read.table(file="UWvMSU_1-22-13.txt", header=TRUE, sep="")
data

#create data frame or matrix with cumulative score for each team whenever each team scores
#empty matrix to store cumulative score of each team
UW <- matrix(nrow=nrow(data[data$team=="UW",])+1, ncol=2)
MSU <- matrix(nrow=nrow(data[data$team=="MSU",])+1, ncol=2)
UW[1,1:2] <- 0
MSU[1,1:2] <- 0

UWrow <- 2 #starting at 2 because we already filled row 1
MSUrow <- 2
UWScore <- 0
MSUScore <- 0

#For loop - creating matrix that records cumulative score for each team over time
for(i in 1:nrow(data)){
  if(data$team[i]=="UW"){
  UW[UWrow,1] <- data$time[i]
  UWScore <- UWScore + data$score[i]
  UW[UWrow,2] <- UWScore
  UWrow <- UWrow + 1 # "+1" indicates for subsequent row
  }else{
  MSU[MSUrow,1] <- data$time[i]
  MSUScore <- MSUScore + data$score[i]
  MSU[MSUrow,2] <- MSUScore
  MSUrow <- MSUrow + 1 # "+1" indicates for subsequent row  
  }
} #end i loop

#Making the plot: graph is cumulative score as a function of time in the game
UWplot <- plot(UW[,1], UW[,2], type='l')
lines(MSU[,1], MSU[,2])

#Question 2
#Number the game is thinking of
randomNum <- sample(1:100, 1)

#User input:
print("Welcome to Guess My Number.")
guess <- as.integer(readline("I'm thinking of a number 1-100... "))

#For loop: Game
for (i in 1:10){
  if(guess < randomNum){
    print("Higher")
    if(i<10){
      guess <- as.integer(readline("Try again: "))
    }
    if (i==10){
      print("Game over. You have used all 10 guesses.")
    }
  }else if(guess > randomNum){
    print("Lower")
    if(i<10){
      guess <- as.integer(readline("Try again: "))
    }
    if (i==10){
      print("Game over. You have used all 10 guesses.")
    }
  }else if (guess==randomNum){
    print("Correct!")
    break
  }
}

