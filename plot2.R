con<-read.csv2("household_power_consumption.txt")
library(dplyr)
data<-tbl_df(con)
rm(con)
data1<-mutate(data,Date=as.character(Date))
data2<-filter(data1,Date=="1/2/2007"|Date=="2/2/2007")
library(lubridate)
t<-paste(data2$Date,as.character(data2$Time),sep=" ")
x<-as.numeric(as.character(data2$Global_active_power))
data3<-mutate(data2,Time=dmy_hms(t),Global_active_power=x)
windows()
par("mfrow"=c(1,2))
plot(data3$Time,data3$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()