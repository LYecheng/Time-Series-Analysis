# code for Q3.10 in R

data = read.table("datasets/cmort_series.txt")
fit = ar.ols(data,order.max=2,demean= F, intercept=T)
fit$var.pred

pre = predict(fit, b.ahead=4)
upper = pre$pred + 1.96*pre$se
lower = pre$pred - 1.96*pre$se

ts.plot(data, re$pred, col=1:@, xlim=c(1979,1980))
lines(upper, lty=2, col=3)
lines(lower, lty=2, col=3)
cbind(lower, upper)

