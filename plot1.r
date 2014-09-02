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
##Plot 1
png(file = "plot1.png",width=480,height=480,units="px",bg = "transparent") 
par(mfrow = c(1, 1))
hist(p1_2d$Global_active_power, main="Global Active Power",xlab="Golabal Active Power (Killowatts)",col="red")
dev.off()