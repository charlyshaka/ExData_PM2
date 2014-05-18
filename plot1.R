# Coursera Exploratory Data Analysis 5/18/14
# Course Project 2 - Plot 1
# Assignment at
# https://class.coursera.org/exdata-002/human_grading/view/courses/972082/assessments/4/submissions
# Data file from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# See download_data.R

# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read the data file
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Only using dates 2007-02-01 and 2007-02-02, lines 66638-70957
# NAs represented by ?
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',
                   na.strings="?", nrows=71000, stringsAsFactors=FALSE)
str(data)

# Convert date and time strings to R Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time),
                                            format = "%d/%m/%Y %H:%M:%S"))

# Restrict data to 2007-02-01 and 2007-02-02
# library(zoo) # Very useful for time series data
# window(data)
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") &
                 DateTime < as.POSIXlt("2007-02-03"))

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")

dev.copy(png, "plot1.png")
dev.off()
