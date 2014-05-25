plot5 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  balt <- NEI[NEI$fips == "24510",]
  balt$year <- as.factor(balt$year)
  options(scipen=999)
  SCC <- readRDS("Source_Classification_Code.rds")
  on_road <- grep("On-Road", SCC$EI.Sector)
  on_road_data <- SCC[on_road,]
  mord <- merge(on_road_data, balt, by.x = "SCC", by.y = "SCC")
  dat <- aggregate(Emissions ~ year, data = mord, FUN = sum)
  png(file="plot5.png")
  barplot(dat$Emissions, names = dat$year)
  title("Total Emissions Output from Motor Vehicle-Related Sources \nin Baltimore City")
  graphics.off()
  
  
  
}