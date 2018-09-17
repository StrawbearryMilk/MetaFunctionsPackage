#' Meta Regression Function
#' 
#' Computes unmoderated meta regression of a subset 
#' @param subdata Subset of data
#' @param meta.data Meta object of the subdata
#' @export 

metaregTCB <- function(meta.data){

	if (length(meta.data$TE) == 1)
	{
		print("Cannot perform regression: Only one study")
	}

	else
	{
	return(metareg(x = meta.data, ~1))
	}
}

#need to adjust this if we decide to take moderators into account