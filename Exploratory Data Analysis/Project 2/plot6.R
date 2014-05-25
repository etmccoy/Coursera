plot6 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  balt <- NEI[NEI$fips == "24510",]
  la <- NEI[NEI$fips ==  "06037",]
  balt$year <- as.factor(balt$year)
  balt$fips <- as.factor(balt$fips)
  la$year <- as.factor(la$year)
  la$fips <- as.factor(la$fips)
  options(scipen=999)
  SCC <- readRDS("Source_Classification_Code.rds")
  on_road <- grep("On-Road", SCC$EI.Sector)
  on_road_data <- SCC[on_road,]
  balt_mord <- merge(on_road_data, balt, by.x = "SCC", by.y = "SCC")
  balt_dat <- aggregate(Emissions ~ year, data = balt_mord, FUN = sum)
  la_mord <- merge(on_road_data, la, by.x = "SCC", by.y = "SCC")
  la_dat <- aggregate(Emissions ~ year, data = la_mord, FUN = sum)
  dat <- cbind(la_dat$Emissions, balt_dat$Emissions)
  png(file="plot6.png")
  par(mfrow = c(1,2))
  barplot(balt_dat$Emissions, names = balt_dat$year, sub = "Emissions from Motor Vehicle-Related \nSources in Baltimore City", cex.names = .8)
  barplot(la_dat$Emissions, names = la_dat$year, sub = "Emissions from Motor Vehicle-Related \nSources in Los Angeles", cex.names = .8)
  graphics.off()
  
  
  
}