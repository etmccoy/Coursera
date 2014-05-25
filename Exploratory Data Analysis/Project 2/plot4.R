plot4 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$year <- as.factor(NEI$year)
  SCC <- readRDS("Source_Classification_Code.rds")
  coal <- grep("Coal", SCC$SCC.Level.Three)
  coal_data <- SCC[coal,]
  merged_coal_data <- merge(coal_data, NEI, by.x = "SCC", by.y = "SCC")
  dat <- aggregate(Emissions ~ year, data = merged_coal_data, FUN = sum)
  png(file="plot4.png")
  barplot(dat$Emissions, names = dat$year)
  title("Total Emissions Output from Coal Combustion-Related Sources")
  graphics.off()
  
}