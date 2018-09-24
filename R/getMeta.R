#' Meta Coefficients Function
#'
#' This function analyzes a dataset to create a meta object
#' @param subdata Subset of data
#' @param task.variables Vector of strings, default is a function of the subset of data
#' @export


getMeta <- function(subdata, task.variables){
  prepData <- cbind(subdata[c(1,2,3)],task.variables,subdata[4:ncol(subdata)]) #preparing data for metacont function
  
  metaF <- metacont(n.e = nT, mean.e = Mean_Post_T, sd.e = SD_Post_T,
                    n.c = nC, mean.c = Mean_Post_C, sd.c = SD_Post_C,
                    comb.fixed = FALSE, studlab = task.variables, data = prepData, sm = "SMD",method.smd = "Hedges")
  return(metaF)
}
#		subdata (atsu) [subdata comes from rows, so get rows first and call on it here
