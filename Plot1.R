plot1<-function(){
  #read the data household_power_consumption.txt
  data <- read.table("./household_power_consumption.txt", header=T,sep =";",na.strings = "?")
  #change the data class
  data$Date <- as.Date(data$Date,format="%d/%m/%Y")
  #data$Global_active_power <- as.numeric(data$Global_active_power)
  
  #subset the data
  data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
  
  #generate histogram of global active
  png("plot1.png", width=480, height=480)
  hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  dev.off()
}