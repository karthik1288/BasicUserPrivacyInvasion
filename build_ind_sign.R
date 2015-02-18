setwd("C:\\infosecwork")
mydata = read.csv("11-13-2009")
g_range = range(0,mydata$kw)
plot(mydata$kw, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)

unique_mydata <- unique(mydata$kw)
plot(unique_mydata, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE)  