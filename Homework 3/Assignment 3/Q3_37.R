# code for Q3.37 in R

data = read.table("datasets/unemp_series.txt")
acf2(data)
acf2(diff(data), 12)

sarima(data, 2, 1, 0, 0, 1, 1, 12) # fit model
sarima.for(data, 12, 2, 1, 0, 0, 1, 1, 12) # forcast
