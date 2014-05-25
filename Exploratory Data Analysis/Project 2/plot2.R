plot2 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  balt <- NEI[NEI$fips == "24510",]
  balt$year <- as.factor(balt$year)
  options(scipen=999)
  dat <- aggregate(Emissions ~ year, data = balt, FUN = sum)
  png(file="plot2.png")
  barplot(dat$Emissions, names = dat$year)
  title("Total Emissions Output in Baltimore")
  graphics.off()
  
  
}