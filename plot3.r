#Importing data
setwd("C:/Users/User/Desktop/R/R/ExData_Plotting1")
getwd()


p1<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
summary(p1)

#=== converting time and date in right formate

dt<-paste(p1$Date,p1$Time)
dt<-strptime(dt,"%d/%m/%Y %H:%M:%S")
p1<-data.frame(p1,dt)

d<-strptime(p1$Date,"%d/%m/%Y")
p1<-data.frame(p1,d)
head(p1)

#=== making subset for 2007-02-01 and 2007-02-02
p1_1days<-subset(p1,d>="2007-02-01")
p1_2d<-subset(p1_1days,d<="2007-02-02")

#======

##Plot 3
png(file = "plot3.png",width=480,height=480,units="px",bg = "transparent") 

with(p1_2d, plot(dt,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(p1_2d,points(dt,Sub_metering_1,col="black",type="l"))
with(p1_2d,points(dt,Sub_metering_2,col="red",type="l"))
with(p1_2d,points(dt,Sub_metering_3,col="blue",type="l"))     
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() ## Don't forget to close the PNG device!

