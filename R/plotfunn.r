#' Funnel Plot Generator
#'
#' This function creates an interactive funnel plot with a meta object
#' @param meta.data Meta object corresponding to the source
#' @export
plotfunn <- function(meta.data){  #modified version of post by user: jsakaluk
										#https://stats.stackexchange.com/questions/5195/how-to-draw-funnel-plot-using-ggplot2-in-r
	beta.est = meta.data$TE.random#0.0892, the beta coeff
	beta.se = meta.data$seTE.random#0.0035, beta std

	#Store a vector of values that spans the range from 0
	#to the max value of impression (standard error) in your dataset.
	#Make the increment (the final value) small enough (I choose 0.001)
	#to ensure your whole range of data is captured
	se.seq=seq(0, max(meta.data$seTE), 0.001)

	#Compute vectors of the lower-limit and upper limit values for
	#the 95% CI region
	ll95 = beta.est-(1.96*se.seq)
	ul95 = beta.est+(1.96*se.seq)


	#And finally, calculate the confidence interval for your meta-analytic estimate
	meanll95 = beta.est-(1.96*beta.se)
	meanul95 = beta.est+(1.96*beta.se)

	#Put all calculated values into one data frame
	#You might get a warning about '...row names were found from a short variable...'
	#You can ignore it.
	df.CI = data.frame(ll95, ul95, se.seq, beta.est, meanll95, meanul95)

	dt = data.frame(cbind(meta.data$TE,meta.data$seTE))

	#Draw Plot
	fp = ggplot(aes(x = meta.data$TE.random, y = meta.data$seTE.random), data = dt) + #originally aes(x = se, y = Zr), data = dat
	  geom_point(aes(x = meta.data$TE, y = meta.data$seTE), data = dt, shape = 1) +
	  xlab('SMD') + ylab('Standard Error')+
	  geom_line(aes(x = ll95, y = se.seq), linetype = 'dashed', data = df.CI) +
	  geom_line(aes(x = ul95, y = se.seq), linetype = 'dashed', data = df.CI) +
	  geom_segment(aes(x = meanll95, y = min(se.seq), xend = meanll95, yend = max(se.seq)), linetype='dotted', data=df.CI) +
	  geom_segment(aes(x = meanul95, y = min(se.seq), xend = meanul95, yend = max(se.seq)), linetype='dotted', data=df.CI) +
	  scale_y_reverse()+
	  scale_x_continuous(breaks=seq(-3,3,1))+
	  #coord_flip()+ #turning this one off
	  theme_bw()
	ggplotly(fp)
}
