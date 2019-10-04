b11 <- read.csv(file.choose())
b220 <- read.csv(file.choose())
b340 <- read.csv(file.choose())
summary(b340)
#############################
?par
## add extra space to right margin of plot within frame
par(mar=c(5,5,5,5) + 0.4)

## Plot first set of data and draw its axis
plot(b340$Cycle_Index, b340$Discharge_Capacity, pch=16, axes=FALSE, xlim = c(0,730), ylim=c(0.8,1.1), xlab="", ylab="", 
     type="l",col="black", main="Batch 3")
axis(2, ylim=c(0.8,1.1),col="black",las=1)  ## las=1 makes horizontal labels
mtext("Discharge Capacity",side=2,line=2.5)
box()

## Allow a second plot on the same graph
par(new=TRUE)

## Plot the second plot and put axis scale on right
plot(b340$Cycle_Index, b340$Temperature, pch=15,  xlab="", ylab="", ylim=c(33,37), 
     axes=FALSE, type="l", col="red")
## a little farther out (line=4) to make room for labels
mtext("Temperature",side=4,col="red",line=4) 
axis(4, ylim=c(33,37), col="red",col.axis="red",las=1)

## Draw the time axis
axis(1,pretty(range(b11$Cycle_Index),10))
mtext("Cycle Index",side=1,col="black",line=2.5)  

