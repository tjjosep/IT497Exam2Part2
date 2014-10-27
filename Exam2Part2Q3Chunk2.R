library(RCurl)
library(foreign)
library(ggplot2)
url <- "https://raw.githubusercontent.com/jrwolf/IT497/master/fitstats.csv"
df1 <- getURL(url);
df1 <- read.csv(textConnection(df1), stringsAsFactors=F);
df1 <- sapply(df1,gsub,pattern="RT @JennMamaBear: ",replacement="", fixed = TRUE) 
df2 <- data.frame(df1)

df2$Date <- as.Date(df2$Date)
df2$Steps <- gsub(",", "", df2$Steps)
df2$Steps <- as.numeric(df2$Steps)
df2$Miles  <- gsub(",", "", df2$Miles)
df2$Miles  <- as.numeric(df2$Miles)
dg2<- ggplot(df2, aes(x=Miles, y=Steps)) +
  geom_point(shape=1) + theme_bw(base_size = 8) + ggtitle("Fitbit Miles per Steps");