# 3.36 code in R

acf = ARMAacf(ar=c(rep(0,11),0.8),ma=0.5,lag.max=50)
plot(acf,type="h",xlab="lag",main="ACF of ARMA(0,1)x(1,0)_12")
abline(h=0)