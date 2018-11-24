tran_mat <- matrix(c(3/4,1/4,1/6,5/6),nrow = 2,byrow = T)

library(expm)

stable_tran <- tran_mat%^%100

initial_state1 <- c(.5,.5)

initial_state2 <- c(0.2,0.8)

####### Both values are same hence it means that for markov in long run the initial state doesnt matter

print(initial_state1 %*% stable_tran)

print(initial_state2 %*% stable_tran)
####

mat <- matrix(c(0.8,0.15,0.05,0.4,0.5,0.1,0.1,0.3,0.6),nrow=3,byrow = T)

init <- c(0,0,1)

init %*% mat %*% mat

####### expected number of balls left which are black; m white, n black

expected <- function(m,n){
  container <- c(rep("w",m),rep("b",n))
  while(sum(container == "w") > 0){
    index <- sample(1:length(container),1)
    container <- container[-index]
  }
  return(sum(container=="b"))
}

end_simulate <- function(simulate,m,n){
  count_black <- c(rep(0,simulate))
  for(i in 1:simulate){
    count_black[i] <- expected(m,n)
  }
  return(list(count_black,sum(count_black)/length(count_black)))
}

result_container <- end_simulate(100000,m=2,n=4)

counts <- result_container[[1]]

probability <- result_container[[2]]

prob_0 <- sum(counts == 0)/length(counts)
prob_1 <- sum(counts == 1)/length(counts)
prob_2 <- sum(counts == 2)/length(counts)
prob_3 <- sum(counts == 3)/length(counts)
prob_4 <- sum(counts == 4)/length(counts)


