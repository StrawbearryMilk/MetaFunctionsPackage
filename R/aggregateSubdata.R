#' Data Aggregation Function
#'
#' This function aggregates a subset of data based on its corresponding meta object
#' This will be called upon later for funnel plot creation
#' @param subdata Subset of data
#' @param meta.data meta object created by function which will be passed as the default argument
#' @export

aggregateSubdata <- function(subdata, meta.data = getMeta1(subdata)){
	study <- paste(subdata$Author, ", ", subdata$Year, sep="")
	agg <- update(meta.data, byvar = study, bylab = "Study")
	agg <- metabind(agg, pooled = "random")
	return(agg)
	}
