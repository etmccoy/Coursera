plot3 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$year <- as.factor(NEI$year)
  NEI$type <- as.factor(NEI$type)
  g <- ggplot(NEI, aes(year, Emissions)) + geom_bar(stat = "identity") + facet_grid(.~type, scales = "free")
  png(file = "plot3.png")
  print(g)
  dev.off()
}