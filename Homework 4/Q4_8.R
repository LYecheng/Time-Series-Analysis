sunspotz <- read.csv("datasets/sunspotz_series.txt")
s.per = spec.pgram(sunspotz, taper=0.3, log='no')
n = 459

abline(v=1/23,lty=2,col=2)
abline(v= 0.005,lty=2,col=2)

s.per$spec[1/23*n]
s.per$spec[0.005*n]

U=qchisq(0.025,2)
L=qchisq(0.975,2)

l1=2*s.per$spec[0.005*n]/L;
u1=2*s.per$spec[0.005*n]/U;
cat('lower bound is',l1,'and upper bound is',u1,'\n');

l2=2*s.per$spec[1/23*n]/L;
u2=2*s.per$spec[1/23*n]/U;
cat('lower bound is',l2,'and upper bound is',u2,'\n');

# It is observed that the highest peak is at the frequency 1/23 and 0.005, which indicates cycle of 23 and 200. 