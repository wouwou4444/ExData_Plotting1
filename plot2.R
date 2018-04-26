#### Assignment JH Course 4 - week 1

setwd(dir = "d:/machine-learning/Johns_Hopkins/course4/week1/")

if (! file.exists("./data")) {
  dir.create("./data")
}

file.exists("./data")
setwd(dir = "./data/")

urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "./household_power_consumption.zip"

download.file(urlFile, destfile = destFile)
unzip(destFile)
list.files()

hpc_data <- read.table(file = "./household_power_consumption.txt", 
                       header = TRUE,
                       na.strings = "?",
                       sep = ";")
object.size(hpc_data)

# strptime(head(hpc_data$Time),format = "%H:%M:%S")
# strptime(head(hpc_data$Date),format = "%d/%m/%Y")
hpc_data$date_time <- (paste(sep = " ", hpc_data$Date, hpc_data$Time))

hpc_data$date_time <- strptime(hpc_data$date_time, format = "%d/%m/%Y %H:%M:%S")
hpc <- hpc_data[hpc_data$Date == "1/2/2007" | hpc_data$Date == "2/2/2007",]
nrow(hpc)


### plot 2
dev.copy(png, file = "plot2.png")
par(mfrow = c(1, 1))
plot(hpc$date_time, hpc$Global_active_power, type = "l", xlab ="" , ylab = "Global Active Power(kilowatts)")
dev.off()
