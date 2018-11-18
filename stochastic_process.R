tran_mat <- matrix(c(3/4,1/4,1/6,5/6),nrow = 2,byrow = T)

library(expm)

stable_tran <- tran_mat%^%100

initial_state1 <- c(.5,.5)

initial_state2 <- c(0.2,0.8)

####### Both values are same hence it means that for markov in long run the initial state doesnt matter

print(initial_state1 %*% stable_tran)

print(initial_state2 %*% stable_tran)
