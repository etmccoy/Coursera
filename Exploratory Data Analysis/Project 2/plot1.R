plot1 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$year <- as.factor(NEI$year)
  options(scipen=999)
  dat <- aggregate(Emissions ~ year, data = NEI, FUN = sum)
  png(file="plot1.png")
  barplot(dat$Emissions, names = dat$year)
  title("Total Emissions Output")
  graphics.off()
  
}