#' Meta Regression Function
#' 
#' Computes unmoderated meta regression of a subset 
#' @param subdata Subset of data
#' @param meta.data Meta object of the subdata
#' @export 

metaregTCB <- function(subdata, meta.data){

	if (length(subdata$TE) == 1)
	{
		print("Cannot perform regression: Only one study")
	}

	else
	{
	return(metareg(x = meta.data, ~1))
	}
}

###ASSUMING I will be using formula ~1 ONLY
###THEREFORE I can just use the already made meta object
###ORIG:
#drop <- which(is.na(atsu.c$Num_Session) | is.na(atsu.c$Treat_Duration_Hour) | is.na(atsu.c$Home_Duration_Hour))
#atsu2 <- atsu.c[-drop,]
#meta.atsu2 <- metacont(n.e = nT, mean.e = Mean_Post_T, sd.e = SD_Post_T, 
#                    n.c = nC, mean.c = Mean_Post_C, sd.c = SD_Post_C,
#                    studlab = atsu.task.variable, data = atsu2, sm = "SMD",method.smd = "Hedges")
#metareg(x = meta.atsu2, ~1)