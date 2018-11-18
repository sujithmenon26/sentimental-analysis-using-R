# getting youtube data
library(vosonSML)
#google developer API key
apikey <- "AIzaSyD8PPoyeEQofawj08ty5ZTDPChhKmzkilo"
key <- AuthenticateWithYoutubeAPI("apikey")
#collect data using youtube videoID
video <- c("jPmV3j1dAv4", "ATaMq62fXno")
ydata <- CollectDataYoutube(video, key, writeToFile = FALSE)

#or using an already exiting datasetdata <- read.csv(file.choose(), header = TRUE)
data <- read.csv(file.choose(), header = TRUE)
str(data)
#sentiment analysis
library("syuzhet")
comments <- iconv(data$Comment, to = 'utf-8' )
s <- get_nrc_sentiment(comments)
head(s)
# create row neutral
s$neutral <- ifelse(s$negative+s$positive==0,1,0)
head(s)
comments[3]
#bar plot
barplot(100*colSums(s)/sum(s), las =2, col = rainbow(10), ylab = "percentage", main = "sentiment scores for youtube comments"  )

