saltemp <- read.csv("datasets/saltemp.txt")
s.per = spec.pgram(saltemp, taper=0.1, log='no')
n = 63

abline(v=0.062,lty=2,col=2)
abline(v= 0.39,lty=2,col=2)

s.per$spec[0.062*n]
s.per$spec[0.39*n]

U=qchisq(0.025,2)
L=qchisq(0.975,2)

l1=2*s.per$spec[0.062*n]/L;
u1=2*s.per$spec[0.062*n]/U;
cat('lower bound is',l1,'and upper bound is',u1,'\n');

l2=2*s.per$spec[0.39*n]/L;
u2=2*s.per$spec[0.39*n]/U;
cat('lower bound is',l2,'and upper bound is',u2,'\n');

# It is observed that the highest peak is at the frequency 0.062 and 0.39, which indicates cycle of 23 and 2.56. 