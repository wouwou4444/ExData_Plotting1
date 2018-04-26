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


### plot 3
dev.copy(png, file = "plot3.png")

par(mfrow = c(1, 1))
plot(hpc$date_time, hpc$Sub_metering_1, type = "l", xlab = "",ylab = "Energy submetering")
lines(hpc$date_time, hpc$Sub_metering_2, col = "red")
lines(hpc$date_time, hpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, seg.len = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
