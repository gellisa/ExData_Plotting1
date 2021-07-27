plot2<-function(){
  #read the data household_power_consumption.txt
  data <- read.table("./household_power_consumption.txt", header=T,sep =";",na.strings = "?")
  #create col with date and time merged together
  FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
  data<-cbind(data,FullTimeDate)
  #change the data class
  data$Date <- as.Date(data$Date,format="%d/%m/%Y")
  
  #subset the data
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  
  #generate plot of global active
  png("plot2.png", width=480, height=480)
  with(data,plot(FullTimeDate,Global_active_power,type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
}