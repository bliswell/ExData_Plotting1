#plot1.R
#reads in the data and makes plot to make plot1.png

read_data <- function(file = 'household_power_consumption.txt',start_date = "2007-02-01" , stop_date = "2007-02-03"){
        print('Reading Data')
        data <-read.table(file,header = TRUE,sep = ';',na.strings = '?',stringsAsFactors = FALSE)
        
        #data$Date <- strptime(data$Date,'%d/%m/%y')
        print('Converting date to Date')
        data$Date <- strptime(paste(data$Date,data$Time), format = '%d/%m/%Y %H:%M',tz = "EST")#as.Date(data$Date,'%d/%m/%Y')
        print('Subsetting Data')
        data <- subset(data,Date >= start_date  & Date < stop_date)
        
}

data <- read_data()
#open the file
png('plot3.png')

print('Making a Plot')
#hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
with(data, plot(Date,Sub_metering_1,type = "n",ylab="Global Active Power (kilowatts)"))
with(data, lines(Date,Sub_metering_1,lwd = 1,lty = 1))
with(data, lines(Date,Sub_metering_2,lwd = 1,lty = 1,col = 'red'))
with(data, lines(Date,Sub_metering_3,lwd = 1,lty = 1,col = 'blue'))

legend(median(data$Date),30, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1, cex=0.8)
#close the file
dev.off()




