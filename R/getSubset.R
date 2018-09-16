#' Row extracting function
#'
#' This function extracts rows corresponding to a String variable and creates a subset
#' @param type The type of data to be subsetted
#' @param data The dataset to be used, default name is data
#' @keywords subset
#' @export

getSubset <- function(type.v, data = data){
	rows <- which(data$Type == type.v)
	subdata <- data[rows,]
	return(subdata)
}
