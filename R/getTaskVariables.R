#' Get Task Variables
#' 
#' This function extracts the task and variable columns from a dataset, and combines the two into a new vector
#' @param subdata The subset of data have task variables extracted from
#' @export

getTaskVariables <- function(subdata){

	task.variable <- paste(subdata$Task, subdata$Variable, sep = " - ")

	return(task.variable) #Object that will be called on later
}