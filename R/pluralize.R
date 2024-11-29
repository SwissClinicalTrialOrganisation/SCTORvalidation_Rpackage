pluralize_has <- function(n){
  if(n == 0) out <- "have"
  if(n == 1) out <- "has"
  if(n > 1)  out <- "have"
  return(out)
}
pluralize_is <- function(n){
  if(n == 0) out <- "are"
  if(n == 1) out <- "is"
  if(n > 1)  out <- "are"
  return(out)
}
pluralize_was <- function(n){
  if(n == 0) out <- "were"
  if(n == 1) out <- "was"
  if(n > 1)  out <- "were"
  return(out)
}
