# code for Q3_21 in R

ans = matrix(0, 10, 3)

for(i in 1:10){
	sim = arima.sim(list(order=c(1, 0, 1), ar=0.9, ma=0.5, sd=1), n=200)
	fit = arima(sim, order=c(1,0,1), include.mean=F)
	ans[i, 1:2]=fit$coef # AR & MA coefficients
	ans[i, 3]=sqrt(fit$sigma2) # sigma
}

ans