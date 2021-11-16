pick_letter <- function() {
  return(sample(LETTERS,1))
}

library(parallel)

not_parallel <- function() {
  a <- c(NA, 100000)
  start <- Sys.time()
  a <- lapply(1:100000, pick_letter)
  end <- Sys.time()
  return(end - start)
}

in_parallel <- function() {
  detectCores()
  no_cores <- detectCores() - 1
  cl <- makeCluster(no_cores)

  b <- c(NA, 100000)
  start <- Sys.time()
  b <- parLapply(cl, 1:100000, pick_letter)
  end <- Sys.time()
  return(end - start)
}

