## Question 1


# Reading it in
my_data <- read.delim("Desktop/Biocomp-Exercise08/UWvMSU_1-22-13.txt")


# creating all the columns
my_data$UW_point <- vector(mode="numeric", length=nrow(my_data))
my_data$MSU_point <- vector(mode="numeric", length=nrow(my_data))
my_data$UW_TOTAL <- vector(mode="numeric", length=nrow(my_data))
my_data$MSU_TOTAL <- vector(mode="numeric", length=nrow(my_data))


# filling up the two columns that I will use to find the scores
for (i in 1:nrow(my_data)){
  if(my_data$team[i] == "MSU"){
    my_data$MSU_point[i] = my_data$score[i]
    my_data$UW_point[i] = 0
  }
  else{
    my_data$UW_point[i] = my_data$score[i]
  }
}



# finding out the scores at certain points in time
for(i in 1:nrow(my_data)){
  my_data$UW_TOTAL[i] = sum((my_data$UW_point)[1:i])
  my_data$MSU_TOTAL[i] = sum((my_data$MSU_point)[1:i])
}


# getting rid of the unnecessary columns
my_data <- my_data[,c(1,6,7)]

 

## plotting
ggplot(data =my_data, aes(x=time))+
  geom_line(aes(y= UW_TOTAL, color ="UW"), size=1.3) +
  geom_line(aes(y= MSU_TOTAL, color ="MSU"),size=1.3)+ 
  ylab("Score")+
  xlab("Time") 


### Question 2


tries <- 10
a <- seq(1, 100,1)
my_magic_number <- sample(a, 1)

print("I'm thinking of a number 1-100...")
guess <- as.integer(readline("Guess the number "))


while(guess !=my_magic_number & tries !=0){
  if(guess > my_magic_number){
    print("lower")
    tries = tries -1
    guess = as.integer(readline("Try again, but you might be running out of your guesses soon:"))
  }
  if(guess < my_magic_number){
    print("higher")
    tries = tries -1
    guess = as.integer(readline("Try again, but you might be running out of your guesses soon:"))
  }
  if(guess == my_magic_number){
    print("correct!")
  }
}






















