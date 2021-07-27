plot3<-function(){
  #read the data household_power_consumption.txt
  data <- read.table("./household_power_consumption.txt", header=T,sep =";",na.strings = "?")
  #create col with date and time merged together
  FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
  data<-cbind(data,FullTimeDate)
  #change the data class
  data$Date <- as.Date(data$Date,format="%d/%m/%Y")
  
  #subset the data
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  
  #generate plots
  png("plot3.png", width=480, height=480)
  with(data,plot(FullTimeDate,Sub_metering_1,type="l", xlab="Day", ylab="Energy sub metering"))
  lines(data$FullTimeDate,data$Sub_metering_2,type="l", col= "red")
  lines(data$FullTimeDate,data$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()
}