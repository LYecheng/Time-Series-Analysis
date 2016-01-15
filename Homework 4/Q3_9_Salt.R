salt <- read.csv("datasets/salt.txt")
s.per = spec.pgram(salt, taper=0.3, log='no')
n = 63

abline(v=0.062,lty=2,col=2)
abline(v= 0.11,lty=2,col=2)

s.per$spec[0.062*n]
s.per$spec[0.11*n]

U=qchisq(0.025,2)
L=qchisq(0.975,2)

l1=2*s.per$spec[0.062*n]/L;
u1=2*s.per$spec[0.062*n]/U;
cat('lower bound is',l1,'and upper bound is',u1,'\n');

l2=2*s.per$spec[0.11*n]/L;
u2=2*s.per$spec[0.11*n]/U;
cat('lower bound is',l2,'and upper bound is',u2,'\n');

# It is observed that the highest peak is at the frequency 0.062 and 0.11, which indicates cycle of 16 and 9. 