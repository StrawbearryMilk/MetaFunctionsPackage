#' Effect Size Computer
#'
#' This function computes the effect sizes of a data set, subsetting by type
#' @param subdata The subset of data to be used to obtain these two tables from
#' @export

getES <- function(subdata){
  res <- mes(m.1 = subdata$Mean_Post_T, m.2 = subdata$Mean_Post_C, sd.1 = subdata$SD_Post_T, sd.2 = subdata$SD_Post_C,
             n.1 = subdata$nT, n.2 = subdata$nC, id = as.numeric(subdata$ID), data = subdata)
  eff.size <- cbind(subdata, res[,c(13,14,15,16)])
  #print(res)
  eff.size
}
