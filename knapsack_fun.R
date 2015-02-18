# set working directory as wanted
# ####################################################
setwd("C:\\infosecwork")

# remove the file needs to create
# ####################################################
file.remove("app_table.txt")

# read data from file
# ####################################################
mydata = read.csv("11-13-20091.csv")
g_range = range(0,mydata$kw)
unique_mydata <- unique(mydata$kw)

# plot a graph that for aggregated data
# ####################################################
plot(mydata$kw, type="o", col="blue", ylim=g_range,axes=FALSE, ann=FALSE) 
axis(1, at=unique (mydata$time):unique (mydata$time),lab=c(mydata$time))
axis(2, las=1, at=0:max(mydata$kw) )
title(main="Graph", col.main="red", font.main=4)

# appl <<- c('a','b','c','d','e','f')

# Knapsack funtion where we input
# ####################################################
work.solution <- local (
function (target) {
  ind <<- c(2.15, 2.75, 3.35, 3.55, 4.20, 5.80)
  r <- 2L
  repeat {
	c <- gtools::combinations(length(ind), r=r, v=ind, repeats.allowed=FALSE)
	s <- rowSums(c)
	if ( all(s > target) ) {
	  print("No solution found")
	  break
	}
	x <- which( abs(s-target) < 1e-4 )
	if ( length(x) > 0L ) {
	  cat("Solution found: ", c[x,], "\n")
	  d <<- c[x,]
	  break
	}
	r <- r + 1L
  }
})

# Looping to find out what is on/off 
# ###################################################
for (i in 1:length(mydata$kw))
{
work.solution(mydata$kw[i])
print(mydata$time[i])
print (d)
print (length(d))
print(ind)
on <- c(0,0,0,0,0,0)

	for (j in 1:length(d))
	{
	if ((d[j] %in% ind))
	{
	on[match (d[j],ind)]  <- d[j]
	}
	}
	# row <- append(on,mydata$time)
	write(on, file = "app_table.txt",
      ncolumns = 6,
      append = TRUE, sep = " ")
}

# Read back from file created with knapsack allocated data and plots the graph
mydata1 = read.table("app_table.txt")
lines(mydata1$V1, type="s", pch=22, lty=2, col="red") 
lines(mydata1$V2, type="s", pch=22, lty=2, col="yellow") 
lines(mydata1$V3, type="s", pch=22, lty=2, col="black") 
lines(mydata1$V4, type="s", pch=22, lty=2, col="green") 
lines(mydata1$V5, type="s", pch=22, lty=2, col="purple") 
lines(mydata1$V6, type="s", pch=22, lty=2, col="violet") 

title(xlab="TIME", col.lab=rgb(0,0.5,0))
title(ylab="KW Consumption", col.lab=rgb(0,0.5,0))

